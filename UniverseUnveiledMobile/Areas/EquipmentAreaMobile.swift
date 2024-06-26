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
        ZStack {
            // Animated starry background
            StarryBackground()
            
            ScrollView {
                VStack(spacing: 30) {
                    // Title
                    Text("Space Exploration\nEquipment")
                        .font(.custom("SpaceGrotesk-Bold", size: fontSizeForDevice(sizeForiPhone: 36, sizeForiPad: 56)))
                        .foregroundColor(.white)
                        .padding(.top, 50)
                        .multilineTextAlignment(.center)
                        .shadow(color: .blue, radius: 2, x: 0, y: 2)
                    
                    // Dragon section
                    SpaceEquipmentSection(
                        title: "DRAGON",
                        subtitle: "SENDING HUMANS AND CARGO INTO SPACE",
                        description: "The Dragon spacecraft is capable of carrying up to 7 passengers to and from Earth orbit, and beyond. It's the only spacecraft currently flying that's capable of returning significant amounts of cargo to Earth.",
                        videoID: "78ATfCaBn6E",
                        arButtonText: "Show Capsule in AR",
                        isARPresented: $isARPresentedCapsule,
                        modelName: "Capsule"
                    )
                    
                    // Falcon 9 section
                    SpaceEquipmentSection(
                        title: "FALCON 9",
                        subtitle: "FIRST ORBITAL CLASS ROCKET CAPABLE OF REFLIGHT",
                        description: "Falcon 9 is a reusable, two-stage rocket designed and manufactured by SpaceX for the reliable and safe transport of people and payloads into Earth orbit and beyond.",
                        videoID: "Z4TXCZG_NEY",
                        arButtonText: "Show Rocket in AR",
                        isARPresented: $isARPresentedRocket,
                        modelName: "Rocket"
                    )
                    
                    // Fun facts section
                    FunFactsCarousel()
                }
                .padding()
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
    
    func fontSizeForDevice(sizeForiPhone: CGFloat, sizeForiPad: CGFloat) -> CGFloat {
        UIDevice.current.userInterfaceIdiom == .pad ? sizeForiPad : sizeForiPhone
    }
}

struct SpaceEquipmentSection: View {
    let title: String
    let subtitle: String
    let description: String
    let videoID: String
    let arButtonText: String
    @Binding var isARPresented: Bool
    let modelName: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.custom("SpaceGrotesk-Bold", size: 30))
                .foregroundColor(.white)
            
            Text(subtitle)
                .font(.custom("SpaceGrotesk-Regular", size: 16))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            Text(description)
                .font(.custom("SpaceGrotesk-Regular", size: 16))
                .foregroundColor(.white)
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
            
            YouTubeView(videoID: videoID)
                .frame(height: 250)
                .cornerRadius(15)
                .shadow(color: .blue.opacity(0.5), radius: 10)
            
            Button(action: {
                isARPresented.toggle()
            }) {
                HStack {
                    Image(systemName: "arkit")
                    Text(arButtonText)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: .blue.opacity(0.5), radius: 5)
            }
            .sheet(isPresented: $isARPresented) {
                ARViewContainer1(modelName: modelName)
            }
        }
        .padding()
        .background(Color.black.opacity(0.7))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue.opacity(0.5), lineWidth: 2)
        )
    }
}

struct FunFactsCarousel: View {
    let facts = [
        "The Dragon capsule can carry up to 7 astronauts.",
        "Falcon 9 has completed over 100 successful launches.",
        "SpaceX's Starship is designed for interplanetary travel.",
        "The Dragon spacecraft is the first private spacecraft to dock with the ISS.",
        "Falcon 9's first stage is designed to be reused up to 10 times."
    ]
    
    var body: some View {
        VStack {
            Text("Fun Facts")
                .font(.custom("SpaceGrotesk-Bold", size: 24))
                .foregroundColor(.white)
                .padding(.top, 10)
            
            TabView {
                ForEach(facts, id: \.self) { fact in
                    Text(fact)
                        .font(.custom("SpaceGrotesk-Regular", size: 16))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(10)
                        .padding()
                }
            }
            .frame(height: 150)
            .tabViewStyle(PageTabViewStyle())
        }
        .background(Color.black.opacity(0.7))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue.opacity(0.5), lineWidth: 2)
        )
    }
}

struct StarryBackground: View {
    let starCount = 100
    
    var body: some View {
        GeometryReader { geometry in
            ForEach(0..<starCount, id: \.self) { _ in
                Circle()
                    .fill(Color.white)
                    .frame(width: CGFloat.random(in: 1...3))
                    .position(
                        x: CGFloat.random(in: 0...geometry.size.width),
                        y: CGFloat.random(in: 0...geometry.size.height)
                    )
                    .opacity(Double.random(in: 0.1...1.0))
                    .animation(
                        Animation.easeInOut(duration: Double.random(in: 1...3))
                            .repeatForever(autoreverses: true),
                        value: UUID()
                    )
            }
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.black, .blue.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
        )
    }
}

// YouTubeView, ARViewContainer1, ARViewRepresentable1, and extensions remain unchanged

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

