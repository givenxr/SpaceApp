/*import SwiftUI
import RealityKit
import ARKit

struct EarthAreaMobile: View {
    @State private var isShowingAR = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Text("Discover the wonders of our home planet, Earth. It is the only known inhabitable planet for humans, providing the perfect conditions for life.")
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding(.bottom, 40)
                    .padding(.top, 30)
                    .font(.system(size: 20, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
            }
            .padding()
        
            HStack {
                Text("Earth, our celestial oasis, is a vibrant blue gem in the cosmos. With diverse ecosystems, vast oceans, and a life-sustaining atmosphere, it orbits the sun, accompanied by its faithful companion, the Moon, illuminating the night sky.\n\nThe Moon, Earth's only natural satellite, plays a vital role in our planet's dynamics. Its gravitational forces shape ocean tides, stabilize Earth's rotation, and contribute to climate stability. The Moon's presence has significant ecological benefits, influencing biodiversity and providing optimal conditions for life to flourish.")
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding(.horizontal, 5)
            }
            .padding()
            
            Button(action: {
                isShowingAR.toggle()
            }) {
                Text("Show in AR")
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)
            .sheet(isPresented: $isShowingAR, content: {
                SLAMARViewContainer(modelName: "Earth")
            })
            
            Text("WATER")
                .monospaced()
                .font(.system(size: 30, weight: .bold))
                .padding(.top, 50)
                .padding(.bottom, 10)
                .foregroundColor(colorScheme == .dark ? .white : .black)
            
            VStack {
                Image("water")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .padding(.horizontal, 20)
                
                Text("Known as the 'Blue Marble,' Earth showcases a beautiful blue appearance from outer space, mainly because of its oceans that cover about 70% of the surface. These oceans, like the Pacific, Atlantic, Indian, Southern, and Arctic, create the striking blue color we see. They're not just a visual wonder; they're crucial for life. \n\nUnderneath the surface, the oceans host a variety of life, from tiny creatures to large marine animals. Besides being home to diverse species, the oceans help control the Earth's climate. The way they move, their temperatures, and the life they hold all work together to influence the weather and maintain a balance that supports life on our planet. So, when we look at the 'Blue Marble,' it's more than just a pretty sight – it's a reflection of the vibrant life and interconnected systems that make Earth a special place.")
                    .padding(.horizontal, 15)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
            }
            .padding(.horizontal, 5)
            
            Text("Diverse Ecosystems")
                .monospaced()
                .font(.system(size: 30, weight: .bold))
                .padding(.top, 50)
                .padding(.bottom, 10)
                .foregroundColor(colorScheme == .dark ? .white : .black)
            
            VStack {
                Text("Known as the 'Blue Marble,' Earth showcases a beautiful blue appearance from outer space, mainly because of its oceans that cover about 70% of the surface. These oceans, like the Pacific, Atlantic, Indian, Southern, and Arctic, create the striking blue color we see. They're not just a visual wonder; they're crucial for life. \n\nUnderneath the surface, the oceans host a variety of life, from tiny creatures to large marine animals. Besides being home to diverse species, the oceans help control the Earth's climate. The way they move, their temperatures, and the life they hold all work together to influence the weather and maintain a balance that supports life on our planet. So, when we look at the 'Blue Marble,' it's more than just a pretty sight – it's a reflection of the vibrant life and interconnected systems that make Earth a special place.")
                    .padding(.horizontal, 15)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                
                Image("biodiversity")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .padding(.trailing, 20)
            }
            .padding(.horizontal, 5)
            
            Text("Population")
                .monospaced()
                .font(.system(size: 30, weight: .bold))
                .padding(.top, 50)
                .padding(.bottom, 10)
                .foregroundColor(colorScheme == .dark ? .white : .black)
            
            VStack {
                Text("Known as the 'Blue Marble,' Earth showcases a beautiful blue appearance from outer space, mainly because of its oceans that cover about 70% of the surface. These oceans, like the Pacific, Atlantic, Indian, Southern, and Arctic, create the striking blue color we see. They're not just a visual wonder; they're crucial for life. \n\nUnderneath the surface, the oceans host a variety of life, from tiny creatures to large marine animals. Besides being home to diverse species, the oceans help control the Earth's climate. The way they move, their temperatures, and the life they hold all work together to influence the weather and maintain a balance that supports life on our planet. So, when we look at the 'Blue Marble,' it's more than just a pretty sight – it's a reflection of the vibrant life and interconnected systems that make Earth a special place.")
                    .padding(.horizontal, 15)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                
                Image("Population2")
                    .resizable()
                    .frame(width: 320, height: 300)
                    .padding(.trailing, 20)
            }
            .padding(.horizontal, 5)
        }
    }
}

struct SLAMARViewContainer: UIViewRepresentable {
    @Environment(\.presentationMode) var presentationMode
    let modelName: String
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        // Configure the AR session for plane detection
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        arView.session.run(config, options: [])
        
        arView.setupGestures()
        context.coordinator.setupARView(arView: arView, modelName: modelName)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator {
        func setupARView(arView: ARView, modelName: String) {
            do {
                let modelEntity = try ModelEntity.loadModel(named: modelName + ".usdz")
                modelEntity.generateCollisionShapes(recursive: true)
                arView.installGestures([.translation, .rotation, .scale], for: modelEntity)
                
                let anchor = AnchorEntity(world: [0, 0, 0])
                anchor.addChild(modelEntity)
                arView.scene.addAnchor(anchor)
                
                print("Model loaded and added to anchor")
            } catch {
                print("Failed to load the model:", error)
            }
        }
    }
}

extension ARView {
    func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: self)
        if self.entity(at: location) != nil {
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
    EarthAreaMobile()
}
*/

import SwiftUI
import RealityKit
import ARKit

struct EarthAreaMobile: View {
    @State private var isShowingAR = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Text("Discover the wonders of our home planet, Earth. It is the only known inhabitable planet for humans, providing the perfect conditions for life.")
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding(.bottom, 40)
                    .padding(.top, 30)
                    .font(fontForDevice(sizeForiPhone: 20, sizeForiPad: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
            }
            .padding()
        
            HStack {
                Text("Earth, our celestial oasis, is a vibrant blue gem in the cosmos. With diverse ecosystems, vast oceans, and a life-sustaining atmosphere, it orbits the sun, accompanied by its faithful companion, the Moon, illuminating the night sky.\n\nThe Moon, Earth's only natural satellite, plays a vital role in our planet's dynamics. Its gravitational forces shape ocean tides, stabilize Earth's rotation, and contribute to climate stability. The Moon's presence has significant ecological benefits, influencing biodiversity and providing optimal conditions for life to flourish.")
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding(.horizontal, 5)
                    .font(fontForDevice(sizeForiPhone: 14, sizeForiPad: 18, weight: .regular))
            }
            .padding()
            
            Button(action: {
                isShowingAR.toggle()
            }) {
                Text("Show in AR")
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)
            .frame(width: buttonWidthForDevice(), height: buttonHeightForDevice())
            .sheet(isPresented: $isShowingAR, content: {
                SLAMARViewContainer(modelName: "Earth")
            })
            
            Text("WATER")
                .monospaced()
                .font(fontForDevice(sizeForiPhone: 30, sizeForiPad: 40, weight: .bold))
                .padding(.top, 50)
                .padding(.bottom, 10)
                .foregroundColor(colorScheme == .dark ? .white : .black)
            
            VStack {
                Image("water")
                    .resizable()
                    .frame(width: imageWidthForDevice(), height: imageHeightForDevice())
                    .padding(.horizontal, 20)
                
                Text("Known as the 'Blue Marble,' Earth showcases a beautiful blue appearance from outer space, mainly because of its oceans that cover about 70% of the surface...")
                    .padding(.horizontal, 15)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .font(fontForDevice(sizeForiPhone: 14, sizeForiPad: 18, weight: .regular))
            }
            .padding(.horizontal, 5)
            
            Text("Diverse Ecosystems")
                .monospaced()
                .font(fontForDevice(sizeForiPhone: 30, sizeForiPad: 40, weight: .bold))
                .padding(.top, 50)
                .padding(.bottom, 10)
                .foregroundColor(colorScheme == .dark ? .white : .black)
            
            VStack {
                Text("Known as the 'Blue Marble,' Earth showcases a beautiful blue appearance from outer space, mainly because of its oceans that cover about 70% of the surface...")
                    .padding(.horizontal, 15)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .font(fontForDevice(sizeForiPhone: 14, sizeForiPad: 18, weight: .regular))
                
                Image("biodiversity")
                    .resizable()
                    .frame(width: imageWidthForDevice(), height: imageHeightForDevice())
                    .padding(.trailing, 20)
            }
            .padding(.horizontal, 5)
            
            Text("Population")
                .monospaced()
                .font(fontForDevice(sizeForiPhone: 30, sizeForiPad: 40, weight: .bold))
                .padding(.top, 50)
                .padding(.bottom, 10)
                .foregroundColor(colorScheme == .dark ? .white : .black)
            
            VStack {
                Text("Known as the 'Blue Marble,' Earth showcases a beautiful blue appearance from outer space, mainly because of its oceans that cover about 70% of the surface...")
                    .padding(.horizontal, 15)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .font(fontForDevice(sizeForiPhone: 14, sizeForiPad: 18, weight: .regular))
                
                Image("Population2")
                    .resizable()
                    .frame(width: imageWidthForDevice(), height: imageHeightForDevice())
                    .padding(.trailing, 20)
            }
            .padding(.horizontal, 5)
        }
    }
    
    func fontForDevice(sizeForiPhone: CGFloat, sizeForiPad: CGFloat, weight: Font.Weight) -> Font {
        return UIDevice.current.userInterfaceIdiom == .pad ? .system(size: sizeForiPad, weight: weight) : .system(size: sizeForiPhone, weight: weight)
    }

    func buttonWidthForDevice() -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == .pad ? 300 : 200
    }

    func buttonHeightForDevice() -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == .pad ? 75 : 50
    }

    func imageWidthForDevice() -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == .pad ? 400 : 300
    }

    func imageHeightForDevice() -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == .pad ? 400 : 300
    }
}

struct SLAMARViewContainer: UIViewRepresentable {
    @Environment(\.presentationMode) var presentationMode
    let modelName: String
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        // Configure the AR session for plane detection
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        arView.session.run(config, options: [])
        
        arView.setupGestures()
        context.coordinator.setupARView(arView: arView, modelName: modelName)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator {
        func setupARView(arView: ARView, modelName: String) {
            do {
                let modelEntity = try ModelEntity.loadModel(named: modelName + ".usdz")
                modelEntity.generateCollisionShapes(recursive: true)
                arView.installGestures([.translation, .rotation, .scale], for: modelEntity)
                
                let anchor = AnchorEntity(world: [0, 0, 0])
                anchor.addChild(modelEntity)
                arView.scene.addAnchor(anchor)
                
                print("Model loaded and added to anchor")
            } catch {
                print("Failed to load the model:", error)
            }
        }
    }
}

extension ARView {
    func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: self)
        if self.entity(at: location) != nil {
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
    EarthAreaMobile()
}
