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
        VStack {
            Text(planet.rawValue)
                .font(.title)
                .padding(.top, 20)

            PlanetSceneView(scene: SCNScene(named: "\(planet.rawValue).usdz"))
                .frame(width: 200, height: 200)
                .scaledToFit()
                .padding(.bottom, 50)

            Text(planet.about)
                .padding()
        }
        .navigationBarTitle(planet.rawValue, displayMode: .inline)
    }
}

struct PlanetsAreaMobile: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.black, Color.black]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)

                VStack {
                    Text("Planets")
                        .monospaced()
                        .font(.system(size: 35, weight: .bold))
                        .padding(.top, 50)
                        .foregroundColor(.white)

                    ScrollView(.vertical) {

                        Text("Explore and learn more about the 9 planets in our solar system.")
                            .foregroundColor(.white)
                            .padding(.bottom, 40)
                            .padding(.top, 30)
                            .font(.system(size: 20, weight: .bold))

                        ForEach(Planets.allCases, id: \.self) { planet in
                            NavigationLink(destination: PlanetDetailView(planet: planet)) {
                                VStack {
                                    Text(planet.rawValue)
                                        .font(.title)
                                        .padding(.top, 20)
                                        .foregroundColor(.white)

                                    PlanetSceneView(scene: SCNScene(named: "\(planet.rawValue).usdz"))
                                        .frame(width: 200, height: 200)
                                        .scaledToFit()
                                        .padding(.bottom, 50)

                                    Text(planet.about)
                                        .padding()
                                        .foregroundColor(.white)
                                }
                            }
                        }
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

