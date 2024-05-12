//
//  ARTest.swift
//  UniverseUnveiledMobile
//
//  Created by Given Mahlangu on 2024/03/13.
//
import SwiftUI
import ARKit

struct ARTest: View {
    /*@State private var isShowingJupiter = false
    @State private var scale: CGFloat = 1
    @State private var rotation: Double = 0
    
    var body: some View {
        VStack {
            Button(action: {
                self.isShowingJupiter = true
            }) {
                Text("woza")
            }
            .sheet(isPresented: $isShowingJupiter) {
                JupiterView(scale: self.$scale, rotation: self.$rotation)
            }
        }
    }
}

struct JupiterView: UIViewRepresentable {
    @Binding var scale: CGFloat
    @Binding var rotation: Double
    
    func makeUIView(context: Context) -> ARSCNView {
        let sceneView = ARSCNView()
        sceneView.scene = SCNScene(named: "Jupiter.usdz")!
        sceneView.autoenablesDefaultLighting = true
        sceneView.showsStatistics = true
        sceneView.allowsCameraControl = true
        sceneView.delegate = context.coordinator
        return sceneView
    }
    
    func updateUIView(_ uiView: ARSCNView, context: Context) {
        let node = uiView.scene.rootNode.childNode(withName: "Jupiter", recursively: true)
        node?.scale = SCNVector3(x: Float(scale), y: Float(scale), z: Float(scale))
        node?.eulerAngles = SCNVector3(x: 0, y: Float(rotation), z: 0)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, ARSCNViewDelegate {
        var parent: JupiterView
        
        init(_ parent: JupiterView) {
            self.parent = parent
        }
        
        func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
            guard let sceneView = renderer as? ARSCNView else { return }
            let node = sceneView.scene.rootNode.childNode(withName: "Jupiter", recursively: true)
            node?.scale = SCNVector3(x: Float(parent.scale), y: Float(parent.scale), z: Float(parent.scale))
            node?.eulerAngles = SCNVector3(x: 0, y: Float(parent.rotation), z: 0)
        }
     }*/var body: some View {
         CustomARViewRepresentable()
             .ignoresSafeArea()
     }
    
    
}

struct ARTest_Previews: PreviewProvider {
    static var previews: some View {
        ARTest()
    }
}
