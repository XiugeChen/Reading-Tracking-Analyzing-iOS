//
//  PrelabRunViewController.swift
//  Reading_Tracking_Analyzing_iOS
//
//  Created by Xiuge Chen on 3/9/20.
//  Copyright © 2020 Xiuge Chen. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class PrelabRunViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate {
    
    var fileURL: URL?
    
    // display dots and collect gaze data
    @IBOutlet var cont_btn: UIButton!
    
    let X_POS: Array<Float> = [0.1, 0.9, 0.5, 0.1, 0.9]
    let Y_POS: Array<Float> = [0.1, 0.1, 0.5, 0.9, 0.9]
    
    var mSamples: Array<Array<(x: Int, y: Int)>> = [[], [], [], [], []]
    var mIsRecord: Bool = false

    var mTimer: Timer?
    var mScreenWidth: Int = 0
    var mScreenHeight: Int = 0
    var mNumDots: Int = 0
    var mCurrentCircle: CircleView?
    
    // gaze tracking
    @IBOutlet var sceneView: ARSCNView!
    
    var faceNode: SCNNode = SCNNode()
    
    var eyeLNode: SCNNode = {
        let geometry = SCNCone(topRadius: 0.005, bottomRadius: 0, height: 0.2)
        geometry.radialSegmentCount = 3
        geometry.firstMaterial?.diffuse.contents = UIColor.blue
        let node = SCNNode()
        node.geometry = geometry
        node.eulerAngles.x = -.pi / 2
        node.position.z = 0.1
        let parentNode = SCNNode()
        parentNode.addChildNode(node)
        return parentNode
    }()
    
    var eyeRNode: SCNNode = {
        let geometry = SCNCone(topRadius: 0.005, bottomRadius: 0, height: 0.2)
        geometry.radialSegmentCount = 3
        geometry.firstMaterial?.diffuse.contents = UIColor.blue
        let node = SCNNode()
        node.geometry = geometry
        node.eulerAngles.x = -.pi / 2
        node.position.z = 0.1
        let parentNode = SCNNode()
        parentNode.addChildNode(node)
        return parentNode
    }()
    
    var lookAtTargetEyeLNode: SCNNode = SCNNode()
    var lookAtTargetEyeRNode: SCNNode = SCNNode()
    
    // actual physical size of iPhone 11 screen
    var phoneScreenSize = CGSize(width: 0.0757, height: 0.1509)
    
    // actual point size of screen
    var phoneScreenPointSize: CGSize? = nil
    
    var virtualPhoneNode: SCNNode = SCNNode()
    
    var virtualScreenNode: SCNNode = {
        
        let screenGeometry = SCNPlane(width: 1, height: 1)
        screenGeometry.firstMaterial?.isDoubleSided = true
        screenGeometry.firstMaterial?.diffuse.contents = UIColor.green
        
        return SCNNode(geometry: screenGeometry)
    }()
    
    var eyeLookAtPositionXs: [CGFloat] = []
    
    var eyeLookAtPositionYs: [CGFloat] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get screen size
        let screenSize = UIScreen.main.bounds
        phoneScreenPointSize = CGSize(width: screenSize.width, height: screenSize.height)
        
        cont_btn.isHidden = true
        
        let mScreenSize = UIScreen.main.bounds
        
        mScreenWidth = Int(mScreenSize.maxX)
        mScreenHeight = Int(mScreenSize.maxY)
        
        mTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(timerTicked), userInfo: nil, repeats: true)
        
        sceneView.layer.cornerRadius = 28
        // Set the view's delegate
        sceneView.delegate = self
        sceneView.session.delegate = self
        sceneView.automaticallyUpdatesLighting = true
        
        // Setup Scenegraph
        sceneView.scene.rootNode.addChildNode(faceNode)
        sceneView.scene.rootNode.addChildNode(virtualPhoneNode)
        sceneView.isHidden = true
        virtualPhoneNode.addChildNode(virtualScreenNode)
        faceNode.addChildNode(eyeLNode)
        faceNode.addChildNode(eyeRNode)
        eyeLNode.addChildNode(lookAtTargetEyeLNode)
        eyeRNode.addChildNode(lookAtTargetEyeRNode)
        
        // Set LookAtTargetEye at 2 meters away from the center of eyeballs to create segment vector
        lookAtTargetEyeLNode.position.z = 2
        lookAtTargetEyeRNode.position.z = 2
        
        // data file to write
        let currentTime = CACurrentMediaTime();
        let file = String(format: "%f.txt", currentTime)

        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

            self.fileURL = dir.appendingPathComponent(file)
            
            print("Init file url to be:", self.fileURL!)
            
            let text = "#Data-Calibration\n#Format:\n#Data,time,actualX,actualY,x,y\n"
            
            do {
                try text.write(to: fileURL!, atomically: true, encoding: .utf8)
            }
            catch {
                print("[Error]: Write to file failed, file:", self.fileURL!)
            }
        }
    }
    
    @objc func timerTicked() {
        if (mNumDots >= X_POS.count) {
            mTimer?.invalidate()
            
            drawResult()
        }
        else {
            let x = Int(Float(mScreenWidth) * X_POS[mNumDots])
            let y = Int(Float(mScreenHeight) * Y_POS[mNumDots])
            
            mCurrentCircle?.removeFromSuperview()
            
            let circleView = CircleView(frame: CGRect(x: x, y: y, width: 25, height: 25))
            circleView.setColor(color: "red")
            view.addSubview(circleView)
            mCurrentCircle = circleView
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.mIsRecord = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.mIsRecord = false
                self.mNumDots += 1
            }
        }
    }
    
    func drawResult() {
        // draw cali points
        for i in 0...3 {
            let x = Int(Float(mScreenWidth) * X_POS[i])
            let y = Int(Float(mScreenHeight) * Y_POS[i])
            
            let circleView = CircleView(frame: CGRect(x: x, y: y, width: 25, height: 25))
            circleView.setColor(color: "red")
            view.addSubview(circleView)
        }
        
        // draw collected samples
        var i = 0
        var result: Array<(x: Int, y: Int)> = [(0, 0), (0, 0), (0, 0), (0, 0), (0, 0)]
        
        for samples in mSamples {
            for sample in samples {
                result[i].x += abs(sample.x - Int(Float(mScreenWidth) * X_POS[i]))
                result[i].y += abs(sample.y - Int(Float(mScreenHeight) * Y_POS[i]))
                
                let circleView = CircleView(frame: CGRect(x: sample.x, y: sample.y, width: 20, height: 20))
                circleView.setColor(color: "blue")
                view.addSubview(circleView)
                
                // write calibration to file
                let text = String(format: "Data,%f,%d,%d,%d,%d\n", CACurrentMediaTime(), Int(Float(mScreenWidth) * X_POS[i]), Int(Float(mScreenHeight) * Y_POS[i]), sample.x, sample.y)
                
                if let fileUpdater = try? FileHandle(forUpdating: self.fileURL!) {
                    fileUpdater.seekToEndOfFile()
                    fileUpdater.write(text.data(using: .utf8)!)
                    fileUpdater.closeFile()
                }
            }
            
            if (samples.count != 0) {
                print("Calibration %d: total points=(%d), avgDiff=(%f, %f)", i, samples.count, result[i].x / samples.count, result[i].y / samples.count)
            }
            
            i += 1
        }
        
        cont_btn.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        guard ARFaceTrackingConfiguration.isSupported else { return }
        let configuration = ARFaceTrackingConfiguration()
        configuration.isLightEstimationEnabled = true
        
        // Run the view's session
        sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        faceNode.transform = node.transform
        guard let faceAnchor = anchor as? ARFaceAnchor else { return }
        
        update(withFaceAnchor: faceAnchor)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        virtualPhoneNode.transform = (sceneView.pointOfView?.transform)!
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        faceNode.transform = node.transform
        guard let faceAnchor = anchor as? ARFaceAnchor else { return }
        update(withFaceAnchor: faceAnchor)
    }
    
    func update(withFaceAnchor anchor: ARFaceAnchor) {
        if (!self.mIsRecord || self.mNumDots >= X_POS.count) {
            return
        }
        
        eyeRNode.simdTransform = anchor.rightEyeTransform
        eyeLNode.simdTransform = anchor.leftEyeTransform
        
        var eyeLLookAt = CGPoint()
        var eyeRLookAt = CGPoint()
        
        let heightCompensation: CGFloat = 312
        
        DispatchQueue.main.async {

            // Perform Hit test using the ray segments that are drawn by the center of the eyeballs to somewhere two meters away at direction of where users look at to the virtual plane that place at the same orientation of the phone screen
            
            let phoneScreenEyeRHitTestResults = self.virtualPhoneNode.hitTestWithSegment(from: self.lookAtTargetEyeRNode.worldPosition, to: self.eyeRNode.worldPosition, options: nil)
            
            let phoneScreenEyeLHitTestResults = self.virtualPhoneNode.hitTestWithSegment(from: self.lookAtTargetEyeLNode.worldPosition, to: self.eyeLNode.worldPosition, options: nil)
            
            for result in phoneScreenEyeRHitTestResults {
                
                eyeRLookAt.x = CGFloat(result.localCoordinates.x) / (self.phoneScreenSize.width / 2.0) * self.phoneScreenPointSize!.width
                
                eyeRLookAt.y = CGFloat(result.localCoordinates.y) / (self.phoneScreenSize.height / 2.0) * self.phoneScreenPointSize!.height + heightCompensation
            }
            
            for result in phoneScreenEyeLHitTestResults {
                
                eyeLLookAt.x = CGFloat(result.localCoordinates.x) / (self.phoneScreenSize.width / 2) * self.phoneScreenPointSize!.width
                
                eyeLLookAt.y = CGFloat(result.localCoordinates.y) / (self.phoneScreenSize.height / 2) * self.phoneScreenPointSize!.height + heightCompensation
            }
            
            // Add the latest position and keep up to 8 recent position to smooth with.
            let smoothThresholdNumber: Int = 8
            self.eyeLookAtPositionXs.append((eyeRLookAt.x + eyeLLookAt.x) / 2)
            self.eyeLookAtPositionYs.append(-(eyeRLookAt.y + eyeLLookAt.y) / 2)
            self.eyeLookAtPositionXs = Array(self.eyeLookAtPositionXs.suffix(smoothThresholdNumber))
            self.eyeLookAtPositionYs = Array(self.eyeLookAtPositionYs.suffix(smoothThresholdNumber))
            
            // weird amplify
            let smoothEyeLookAtPositionX = self.eyeLookAtPositionXs.average! * 3
            let smoothEyeLookAtPositionY = self.eyeLookAtPositionYs.average! * 2.25
            
            // update eye look at labels values
            let x = Int(round(smoothEyeLookAtPositionX + self.phoneScreenPointSize!.width / 2))
            let y = Int(round(smoothEyeLookAtPositionY + self.phoneScreenPointSize!.height / 2))
            
            self.mSamples[self.mNumDots].append((x: x, y: y))
        }
    }
}
