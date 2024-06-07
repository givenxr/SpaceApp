import SwiftUI
import RealityKit
import ARKit

struct ConsoleView: View {
    @State private var isShowingAR = false
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            Text("Console")
                .font(.largeTitle)
                .padding(.top, 50)
                .foregroundColor(colorScheme == .dark ? .white : .black)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                .padding()
                .foregroundColor(colorScheme == .dark ? .white : .black)
            
            Button(action: {
                isShowingAR.toggle()
            }) {
                Text("Show AR")
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $isShowingAR, content: {
                CustomARViewContainer(modelName: "blue_cube")
            })
        }
        .padding()
    }
}

struct CustomARViewContainer: UIViewRepresentable {
    @Environment(\.presentationMode) var presentationMode
    let modelName: String

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        // Configure the AR session for plane detection
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        arView.session.run(config, options: [])
        
        arView.setupCustomGestures()
        context.coordinator.setupARView(arView: arView, modelName: modelName)
        
        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator {
        func setupARView(arView: ARView, modelName: String) {
            // Create a blue cube model
            let boxMesh = MeshResource.generateBox(size: 0.1)
            let blueMaterial = SimpleMaterial(color: .blue, isMetallic: false)
            let modelEntity = ModelEntity(mesh: boxMesh, materials: [blueMaterial])
            
            modelEntity.generateCollisionShapes(recursive: true)
            arView.installGestures([.translation, .rotation, .scale], for: modelEntity)
            
            let anchor = AnchorEntity(world: [0, 0, 0])
            anchor.addChild(modelEntity)
            arView.scene.addAnchor(anchor)
            
            print("Blue cube model created and added to anchor")
        }
    }
}

extension ARView {
    func setupCustomGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCustomTap))
        self.addGestureRecognizer(tapGesture)
    }

    @objc func handleCustomTap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: self)
        if let entity = self.entity(at: location) {
            print("Entity already exists at this location")
            return
        }
        
        let raycastQuery = self.makeRaycastQuery(from: location, allowing: .existingPlaneGeometry, alignment: .any)
        if let raycastResult = self.session.raycast(raycastQuery!).first {
            let anchor = AnchorEntity(world: raycastResult.worldTransform)
            self.scene.addAnchor(anchor)
            print("Anchor added at raycast location")
        } else {
            print("Raycast did not hit any surface")
        }
    }
}

#Preview {
    ConsoleView()
}
