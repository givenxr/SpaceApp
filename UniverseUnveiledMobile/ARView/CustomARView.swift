//
//  CustomARView.swift
//  UniverseUnveiledMobile
//
//  Created by Given Mahlangu on 2024/03/14.
//

import ARKit
import SwiftUI
import RealityKit

class CustomARView: ARView {
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    
    dynamic required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // This is the init that we will actually use
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
        
        placeJupiter()
    }
    
    func configurationExamples() {
        // Tracks the device relative to its environment
        let configuration = ARWorldTrackingConfiguration()
        session.run(configuration)
        
        // Not supported in all regions, tracks w.r.t. global coordinates
        let _ = ARGeoTrackingConfiguration()
        
        // Tracks faces in the scene
        let _ = ARFaceTrackingConfiguration()
        
        // Tracks bodies in the scene
        let _ = ARBodyTrackingConfiguration()
    }
    
    func anchorExamples() {
        // Attach anchors at specific coordinates in the iPhone-centered coordinate system
        let coordinateAnchor = AnchorEntity(world: .zero)
        
        // Attach anchors to detected planes (this works best on devices with a LIDAR sensor)
//        let _ = AnchorEntity(plane: .horizontal)
//        let _ = AnchorEntity(plane: .vertical)
        
        // Attach anchors to tracked body parts, such as the face
        let _ = AnchorEntity(.face)
        
        // Attach anchors to tracked images, such as markers or visual codes
        let _ = AnchorEntity(.image(group: "group", name: "name"))
        
        // Add an anchor to the scene
        scene.addAnchor(coordinateAnchor)
    }
    
    func entityExamples() {
        // Load an entity from a USDZ file (in this case, "Jupiter")
        let jupiterEntity = try? Entity.load(named: "Jupiter")
        
        if let jupiterEntity = jupiterEntity {
            let anchor = AnchorEntity()
            anchor.addChild(jupiterEntity)
            scene.addAnchor(anchor)
        }
    }
    
    func placeJupiter() {
        entityExamples()
    }
}

