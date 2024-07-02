//
//  PlanetsArea.swift
//  Universe Unveiled Mobile
//
//  Created by Given Mahlangu on 2024/02/29.
//


/*import SwiftUI
import SceneKit
import RealityKit

struct PlanetSceneView: UIViewRepresentable {
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

struct PlanetDetailView: View {
    var planet: Planets
    

    var body: some View {
        @Environment(\.colorScheme) var colorScheme
        VStack {
            Text(planet.rawValue)
                .font(.system(size: 40, weight: .bold))
                .padding(.top, 20)
                .foregroundColor(colorScheme == .dark ? .white : .black)

            PlanetSceneView(scene: SCNScene(named: "\(planet.rawValue).usdz"))
                .frame(width: 200, height: 200)
                .scaledToFit()
                .padding(.bottom, 50)

            Text(planet.about)
                .padding()
        }//.navigationBarBackButtonHidden(true)
        .navigationBarTitle(planet.rawValue, displayMode: .inline)
        .foregroundColor(colorScheme == .dark ? .white : .black)
    }
}

struct PlanetsAreaMobile: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationStack {
            ZStack {
//                LinearGradient(
//                    gradient: Gradient(colors: [Color.white, Color.black]),
//                    startPoint: .top,
//                    endPoint: .bottom
//                )
//                .edgesIgnoringSafeArea(.all)

                VStack {
//                    Text("Planets")
//                        .monospaced()
//                        .font(.system(size: 35, weight: .bold))
//                        .padding(.top)
//                        .foregroundColor(.white)

                    ScrollView(.vertical) {

                        Text("Explore and learn more about the 9 planets in our solar system.")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .padding(.bottom, 40)
                            .padding(.top, 30)
                            .font(.system(size: 20, weight: .bold))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 10)

                        ForEach(Planets.allCases, id: \.self) { planet in
                            NavigationLink(destination: {
                                switch planet {
                                case .Mercury:
                                    return AnyView(Mercury())
                                case .Venus:
                                    return AnyView(Venus())
                                case .Earth:
                                    return AnyView(Earth())
                                case .Mars:
                                    return AnyView(Mars())
                                case .Jupiter:
                                    return AnyView(Jupiter())
                                case .Saturn:
                                    return AnyView(Saturn())
                                case .Uranus:
                                    return AnyView(Uranus())
                                case .Neptune:
                                    return AnyView(Neptune())
                                case .Pluto:
                                    return AnyView(Pluto())
                                }
                            }()) {
                                VStack {
                                    Text(planet.rawValue)
                                        .font(.system(size: 40, weight: .bold))
                                        .font(.title)
                                        .padding(.top, 20)
                                        .foregroundColor(colorScheme == .dark ? .white : .black)

                                    PlanetSceneView(scene: SCNScene(named: "\(planet.rawValue).usdz"))
                                        .frame(width: 200, height: 200)
                                        .scaledToFit()
                                        .padding(.bottom, 50)

                                    Text(planet.about)
                                        .padding(.horizontal, 5)
                                        .padding()
                                        .foregroundColor(colorScheme == .dark ? .white : .black)
                                }
                            }
                        }//.navigationBarBackButtonHidden(true)

                    }
                }
            }
        }
    }
}

struct PlanetsAreaMobile_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsAreaMobile()
    }
} */


import SwiftUI
import SceneKit
import RealityKit

struct SpaceStar: Identifiable {
    let id = UUID()
    let size: CGFloat
    let position: CGPoint
    let opacity: Double

    init() {
        self.size = CGFloat.random(in: 1...3)
        self.position = CGPoint(x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                                y: CGFloat.random(in: 0...UIScreen.main.bounds.height))
        self.opacity = Double.random(in: 0.2...1)
    }
}

struct SpaceBackgroundView: View {
    let colors: [Color] = [.black, .blue, .indigo]
    @State private var stars: [SpaceStar] = []
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            ForEach(stars) { star in
                Circle()
                    .fill(Color.white)
                    .frame(width: star.size, height: star.size)
                    .position(star.position)
                    .opacity(star.opacity)
            }
        }
        .onAppear {
            createStars()
        }
    }
    
    func createStars() {
        for _ in 0..<200 {
            stars.append(SpaceStar())
        }
    }
}

struct PlanetSceneView: UIViewRepresentable {
    var scene: SCNScene?

    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        sceneView.scene = scene
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
        sceneView.backgroundColor = .clear
        
        // Add slow rotation animation
        if let node = sceneView.scene?.rootNode.childNodes.first {
            let rotation = SCNAction.rotateBy(x: 0, y: CGFloat.pi * 2, z: 0, duration: 20)
            let repeatForever = SCNAction.repeatForever(rotation)
            node.runAction(repeatForever)
        }
        
        return sceneView
    }

    func updateUIView(_ uiView: SCNView, context: Context) {}
}

struct PlanetDetailView: View {
    var planet: Planets

    var body: some View {
        ZStack {
            SpaceBackgroundView()
            
            ScrollView {
                VStack {
                    Text(planet.rawValue)
                        .font(fontForDevice(sizeForiPhone: 40, sizeForiPad: 60, weight: .bold))
                        .padding(.top, 20)
                        .foregroundColor(.white)

                    PlanetSceneView(scene: SCNScene(named: "\(planet.rawValue).usdz"))
                        .frame(width: sceneViewWidthForDevice(), height: sceneViewHeightForDevice())
                        .scaledToFit()
                        .padding(.bottom, 50)

                    Text(planet.about)
                        .padding()
                        .font(fontForDevice(sizeForiPhone: 16, sizeForiPad: 22, weight: .regular))
                        .foregroundColor(.white)
                }
                .padding()
            }
        }
        .navigationBarTitle(planet.rawValue, displayMode: .inline)
    }
}

struct PlanetsAreaMobile: View {
    var body: some View {
        NavigationView {
            ZStack {
                SpaceBackgroundView()
                
                ScrollView(.vertical) {
                    VStack(spacing: 30) {
                        Text("Explore and learn more about the 9 planets in our solar system.")
                            .foregroundColor(.white)
                            .padding(.vertical, 30)
                            .font(fontForDevice(sizeForiPhone: 20, sizeForiPad: 28, weight: .bold))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)

                        ForEach(Planets.allCases, id: \.self) { planet in
                            NavigationLink(destination: {
                                switch planet {
                                case .Mercury:
                                    return AnyView(Mercurry())
                                case .Venus:
                                    return AnyView(Venus())
                                case .Earth:
                                    return AnyView(Earth())
                                case .Mars:
                                    return AnyView(Mars())
                                case .Jupiter:
                                    return AnyView(Jupiter())
                                case .Saturn:
                                    return AnyView(Saturn())
                                case .Uranus:
                                    return AnyView(Uranus())
                                case .Neptune:
                                    return AnyView(Neptune())
                                case .Pluto:
                                    return AnyView(Pluto())
                                }
                            }()) {
                                PlanetCard(planet: planet)
                            }
                        }
                    }
                    .padding()
                }
            }
            //.navigationBarTitle("Planets", displayMode: .large)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct PlanetCard: View {
    var planet: Planets
    
    var body: some View {
        VStack {
            Text(planet.rawValue)
                .font(fontForDevice(sizeForiPhone: 24, sizeForiPad: 32, weight: .bold))
                .foregroundColor(.white)
                .padding(.top, 10)

            PlanetSceneView(scene: SCNScene(named: "\(planet.rawValue).usdz"))
                .frame(width: sceneViewWidthForDevice(), height: sceneViewHeightForDevice())
                .scaledToFit()

            Text(planet.about)
                .lineLimit(3)
                .truncationMode(.tail)
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
                .font(fontForDevice(sizeForiPhone: 14, sizeForiPad: 18, weight: .regular))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .background(Color.black.opacity(0.5))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white.opacity(0.2), lineWidth: 1)
        )
    }
}

// Helper functions remain the same
func fontForDevice(sizeForiPhone: CGFloat, sizeForiPad: CGFloat, weight: Font.Weight) -> Font {
    return UIDevice.current.userInterfaceIdiom == .pad ? .system(size: sizeForiPad, weight: weight) : .system(size: sizeForiPhone, weight: weight)
}

func sceneViewWidthForDevice() -> CGFloat {
    return UIDevice.current.userInterfaceIdiom == .pad ? 300 : 200
}

func sceneViewHeightForDevice() -> CGFloat {
    return UIDevice.current.userInterfaceIdiom == .pad ? 300 : 200
}

struct PlanetsAreaMobile_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsAreaMobile()
    }
}
