//
//  Testing.swift
//  UniverseUnveiledMobile
//
//  Created by Given Mahlangu on 2024/03/08.
//

import SwiftUI
import SceneKit
import RealityKit

struct Testing: View {
    var body: some View {
        ScrollView(.vertical) {
            ForEach(Planets.allCases, id: \.self) { planet in
                VStack {
                    Text(planet.rawValue)
                        .font(.title)
                        .padding(.top, 20)

                    InteractiveSceneView(scene: SCNScene(named: "\(planet.rawValue).usdz"))
                        .frame(width: 200, height: 200)
                        .scaledToFit()
                        .padding(.bottom, 50)

                    Text(planet.about)
                        .padding()
                }
            }
        }
    }
}

struct InteractiveSceneView: UIViewRepresentable {
    var scene: SCNScene?

    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        sceneView.scene = scene
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true // Enables user interaction (rotation, scaling)
        sceneView.backgroundColor = .clear
        return sceneView
    }

    func updateUIView(_ uiView: SCNView, context: Context) {}
}

struct Testing_Previews: PreviewProvider {
    static var previews: some View {
        Testing()
    }
}

