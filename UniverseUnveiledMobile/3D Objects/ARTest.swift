//
//  ARTest.swift
//  UniverseUnveiledMobile
//
//  Created by Given Mahlangu on 2024/03/13.
//

import SwiftUI
import RealityKit

struct ARTest: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
            
            Image("galaxynight")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            ARViewContainer()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        let jupiterModel = try! Entity.load(named: "Jupiter.usdz")
        let anchor = AnchorEntity(world: [0, 0, -1])
        anchor.addChild(jupiterModel)
        
        arView.scene.anchors.append(anchor)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

#if DEBUG
struct ARTest_Previews: PreviewProvider {
    static var previews: some View {
        ARTest()
    }
}
#endif
