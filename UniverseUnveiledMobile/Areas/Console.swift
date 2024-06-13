import SwiftUI
import RealityKit
import ARKit
import FocusEntity

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
                CustomARViewContainer()
            })
        }
        .padding()
    }
}

struct CustomARViewContainer: UIViewRepresentable {
    @Environment(\.presentationMode) var presentationMode

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        // Configure the AR session for plane detection
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        arView.session.run(config, options: [])
        
        context.coordinator.setupARView(arView: arView)
        context.coordinator.setupFocusEntity(for: arView)
        
        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject {
        var focusEntity: FocusEntity?
        var modelEntity: ModelEntity?
        
        func setupARView(arView: ARView) {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCustomTap))
            arView.addGestureRecognizer(tapGesture)
            
            arView.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: #selector(handlePinch)))
            arView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
        }
        
        func setupFocusEntity(for arView: ARView) {
            focusEntity = FocusEntity(on: arView, style: .classic(color: .yellow))
        }

        @objc func handleCustomTap(_ sender: UITapGestureRecognizer) {
            guard let arView = sender.view as? ARView else { return }
            let location = sender.location(in: arView)
            
            // Debug: Log tap location
            print("Tap location: \(location)")
            
            if let result = arView.hitTest(location, types: .existingPlaneUsingExtent).first {
                let anchor = AnchorEntity(world: result.worldTransform)
                
                // Remove existing model entity if present
                if let modelEntity = modelEntity {
                    modelEntity.removeFromParent()
                }
                
                // Load the SolarSystem USDZ model
                do {
                    let modelEntity = try ModelEntity.loadModel(named: "SolarSystem")
                    self.modelEntity = modelEntity
                    modelEntity.generateCollisionShapes(recursive: true)
                    anchor.addChild(modelEntity)
                    arView.scene.addAnchor(anchor)
                    
                    // Debug: Log successful loading and placement
                    print("Successfully loaded and placed the SolarSystem model")
                } catch {
                    // Debug: Log model loading failure
                    print("Failed to load the SolarSystem model: \(error)")
                }
            } else {
                // Debug: Log if no hit test result
                print("No hit test result")
            }
        }
        
        @objc func handlePinch(_ sender: UIPinchGestureRecognizer) {
            guard let arView = sender.view as? ARView else { return }
            let scale = sender.scale
            
            if let modelEntity = modelEntity {
                if sender.state == .changed {
                    modelEntity.scale *= SIMD3<Float>(repeating: Float(scale))
                    sender.scale = 1.0
                }
            }
        }

        @objc func handlePan(_ sender: UIPanGestureRecognizer) {
            guard let arView = sender.view as? ARView else { return }
            let translation = sender.translation(in: arView)
            
            if let modelEntity = modelEntity {
                let currentPosition = modelEntity.position
                if sender.state == .changed {
                    modelEntity.position = currentPosition + [Float(translation.x) * 0.001, 0, Float(translation.y) * 0.001]
                    sender.setTranslation(.zero, in: arView)
                }
            }
        }
    }
}

// ARCoachingOverlayView extension for better plane detection guidance
extension ARView {
    func addCoaching() {
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.session = self.session
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.goal = .anyPlane
        self.addSubview(coachingOverlay)
    }
}

#Preview {
    ConsoleView()
}
