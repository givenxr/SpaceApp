import SwiftUI
import WebKit
import RealityKit
import ARKit
import FocusEntity

struct EquipmentAreaMobile: View {
    @State private var isARPresentedCapsule = false
    @State private var isARPresentedRocket = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            Text("Space Exploration \n Equipment")
                .monospaced()
                .font(fontForDevice(sizeForiPhone: 30, sizeForiPad: 50))
                .padding(.top, 50)
                .multilineTextAlignment(.center)
            
            VStack {
                VStack {
                    Text("DRAGON")
                        .monospaced()
                        .font(fontForDevice(sizeForiPhone: 30, sizeForiPad: 50))
                        .padding(.top, 50)
                    Text("SENDING HUMANS AND CARGO INTO SPACE")
                        .padding(.bottom, 50)
                    
                    VStack {
                        Text("The Dragon spacecraft is capable of carrying up to 7 passengers to and from Earth orbit, and beyond...")
                            .padding(.leading, 30)
                            .padding(.trailing, 30)
                            .font(fontForDevice(sizeForiPhone: 14, sizeForiPad: 20))
                        
                        Text("View the Crew Dragon Interior")
                            .monospaced()
                            .font(fontForDevice(sizeForiPhone: 20, sizeForiPad: 30))
                            .padding(.bottom, 30)
                            .padding(.top, 30)
                        
                        YouTubeView(videoID: "78ATfCaBn6E")
                            .frame(width: frameWidthForDevice(), height: frameHeightForDevice())
                        
                        Button(action: {
                            isARPresentedCapsule.toggle()
                        }) {
                            Text("Show Capsule in AR")
                                .frame(width: buttonWidthForDevice(), height: buttonHeightForDevice())
                                .background(Color.blue)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .cornerRadius(10)
                                .padding()
                        }
                        .sheet(isPresented: $isARPresentedCapsule) {
                            ARViewContainer1(modelName: "Capsule")
                        }
                        
                        Divider()
                        
                        Text("FALCON 9")
                            .monospaced()
                            .font(fontForDevice(sizeForiPhone: 30, sizeForiPad: 50))
                            .padding(.top, 50)
                        
                        Text("FIRST ORBITAL CLASS ROCKET CAPABLE OF REFLIGHT")
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 30)
                        
                        VStack {
                            Image("galaxynight")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: imageWidthForDevice(), height: imageHeightForDevice())
                            
                            Text("Falcon 9 is a reusable, two-stage rocket designed and manufactured by SpaceX...")
                                .padding(.leading, 30)
                                .padding(.trailing, 50)
                                .font(fontForDevice(sizeForiPhone: 14, sizeForiPad: 20))
                            
                            Text("View the Falcon 9 rocket")
                                .monospaced()
                                .font(fontForDevice(sizeForiPhone: 20, sizeForiPad: 30))
                                .padding(.top, 50)
                                .padding(.bottom, 30)
                            
                            YouTubeView(videoID: "Z4TXCZG_NEY")
                                .frame(width: frameWidthForDevice(), height: frameHeightForDevice())
                        }
                        
                        Button(action: {
                            isARPresentedRocket.toggle()
                        }) {
                            Text("Show Rocket in AR")
                                .frame(width: buttonWidthForDevice(), height: buttonHeightForDevice())
                                .background(Color.blue)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .cornerRadius(10)
                                .padding()
                        }
                        .sheet(isPresented: $isARPresentedRocket) {
                            ARViewContainer1(modelName: "Rocket")
                        }
                    }
                }
            }
        }
    }

    func fontForDevice(sizeForiPhone: CGFloat, sizeForiPad: CGFloat) -> Font {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return .system(size: sizeForiPad)
        } else {
            return .system(size: sizeForiPhone)
        }
    }

    func frameWidthForDevice() -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == .pad ? 720 : 360
    }

    func frameHeightForDevice() -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == .pad ? 1000 : 500
    }

    func buttonWidthForDevice() -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == .pad ? 400 : 200
    }

    func buttonHeightForDevice() -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == .pad ? 100 : 50
    }

    func imageWidthForDevice() -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == .pad ? 500 : 250
    }

    func imageHeightForDevice() -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == .pad ? 500 : 250
    }
}

struct YouTubeView: UIViewRepresentable {
    var videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)")
        uiView.load(URLRequest(url: youtubeURL!))
    }
}

struct ARViewContainer1: View {
    @Environment(\.presentationMode) var presentationMode
    let modelName: String
    
    var body: some View {
        ZStack {
            ARViewRepresentable1(modelName: modelName)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.down.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .padding()
                    }
                }
            }
        }
    }
}

struct ARViewRepresentable1: UIViewRepresentable {
    let modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(modelName: modelName)
    }
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        arView.setupARSession()
        arView.setupCustomGestures(coordinator: context.coordinator)
        context.coordinator.setupFocusEntity(arView: arView)
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    class Coordinator: NSObject {
        var modelEntity: ModelEntity?
        let modelName: String
        var focusEntity: FocusEntity?
        
        init(modelName: String) {
            self.modelName = modelName
        }
        
        func setupFocusEntity(arView: ARView) {
            focusEntity = FocusEntity(on: arView, style: .classic(color: .yellow))
        }
        
        @objc func handleCustomTap(_ sender: UITapGestureRecognizer) {
            guard let arView = sender.view as? ARView else { return }
            let location = sender.location(in: arView)
            
            if let result = arView.hitTest(location, types: .existingPlaneUsingExtent).first {
                let anchor = AnchorEntity(world: result.worldTransform)
                
                if let modelEntity = modelEntity {
                    modelEntity.removeFromParent()
                }
                
                // Ensure the entity is correctly loaded and cast to ModelEntity
                do {
                    if let entity = try? Entity.loadModel(named: modelName + ".usdz") {
                        guard let modelEntity = entity as? ModelEntity else {
                            print("Loaded entity is not a ModelEntity")
                            return
                        }
                        self.modelEntity = modelEntity
                        modelEntity.generateCollisionShapes(recursive: true)
                        arView.installGestures([.translation, .rotation, .scale], for: modelEntity)
                        anchor.addChild(modelEntity)
                        arView.scene.addAnchor(anchor)
                    }
                } catch {
                    print("Failed to load the model: \(error)")
                }
            }
        }
        
        @objc func handlePinch(_ sender: UIPinchGestureRecognizer) {
            guard let arView = sender.view as? ARView else { return }
            let location = sender.location(in: arView)
            
            if sender.state == .changed {
                if let entity = arView.entity(at: location) as? ModelEntity {
                    let pinchScaleX = Float(sender.scale) * entity.scale.x
                    let pinchScaleY = Float(sender.scale) * entity.scale.y
                    let pinchScaleZ = Float(sender.scale) * entity.scale.z
                    entity.scale = [pinchScaleX, pinchScaleY, pinchScaleZ]
                    sender.scale = 1
                }
            }
        }
        
        @objc func handlePan(_ sender: UIPanGestureRecognizer) {
            guard let arView = sender.view as? ARView else { return }
            let location = sender.location(in: arView)
            
            if sender.state == .changed {
                let translation = sender.translation(in: arView)
                if let entity = arView.entity(at: location) as? ModelEntity {
                    let currentPosition = entity.position
                    entity.position = [currentPosition.x + Float(translation.x) * 0.001, currentPosition.y, currentPosition.z + Float(translation.y) * 0.001]
                    sender.setTranslation(.zero, in: arView)
                }
            }
        }
    }
}

extension ARView {
    func setupARSession() {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        session.run(config, options: [])
    }

    func setupCustomGestures(coordinator: ARViewRepresentable1.Coordinator) {
        let tapGesture = UITapGestureRecognizer(target: coordinator, action: #selector(coordinator.handleCustomTap(_:)))
        addGestureRecognizer(tapGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: coordinator, action: #selector(coordinator.handlePinch(_:)))
        addGestureRecognizer(pinchGesture)
        
        let panGesture = UIPanGestureRecognizer(target: coordinator, action: #selector(coordinator.handlePan(_:)))
        addGestureRecognizer(panGesture)
    }
}

#Preview {
    EquipmentAreaMobile()
}

