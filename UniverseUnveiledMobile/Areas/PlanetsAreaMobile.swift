//
//  PlanetsArea.swift
//  Universe Unveiled Mobile
//
//  Created by Given Mahlangu on 2024/02/29.
//


import SwiftUI
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
        NavigationView {
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
}

