//
//  Neptune.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2024/01/11.
//

import SwiftUI
import SceneKit
import RealityKit

struct Neptune: View {
    @Environment(\.colorScheme) var colorScheme
    var planet: Planets = .Neptune

    var body: some View {
        ZStack {
            StarryBackground()
            
            ScrollView {
                VStack(spacing: 30) {
                    Text(planet.planetName)
                        .font(.custom("SpaceGrotesk-Bold", size: 50))
                        .foregroundColor(.white)
                        .padding(.top, 50)
                        .shadow(color: .blue, radius: 2, x: 0, y: 2)
                    
                    PlanetSceneView(scene: SCNScene(named: "\(planet.rawValue).usdz"))
                        .frame(width: 300, height: 300)
                        .background(
                            Circle()
                                .fill(RadialGradient(gradient: Gradient(colors: [.blue, .cyan, .black]), center: .center, startRadius: 5, endRadius: 150))
                        )
                        .shadow(color: .blue.opacity(0.5), radius: 20, x: 0, y: 0)
                    
                    InfoSection(title: "About Neptune", content: planet.about)
                    
                    NeptuneFactsGrid()
                    
                    InfoSection(title: "Detailed Information", content: detailedInfo)
                    
                    NeptuneExplorationSection()
                }
                .padding()
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
    
    var detailedInfo: String {
        """
        Neptune is the eighth planet from the sun and is on average the coldest planet in the solar system. The average temperature of Neptune at the top of the clouds is minus 346 degrees Fahrenheit (minus 210 degrees Celsius).

        Neptune is approximately the same size as Uranus and is known for its supersonic strong winds. The planet is more than 30 times as far from the sun as Earth.

        Neptune was the first planet predicted to exist by using math, rather than being visually detected. Irregularities in the orbit of Uranus led French astronomer Alexis Bouvard to suggest some other planet might be exerting a gravitational tug. German astronomer Johann Galle used calculations to help find Neptune in a telescope. Neptune is about 17 times as massive as Earth and has a rocky core.
        """
    }
}

struct NeptuneFactsGrid: View {
    let facts: [(String, String)] = [
        ("Name Meaning", "Roman god of water"),
        ("Diameter", "30,775 miles (49,530 km)"),
        ("Surface Gravity", "11.15 m/s²"),
        ("Orbit", "165 Earth years"),
        ("Day", "19 Earth hours"),
        ("Moons", "14"),
        ("Avg. Temperature", "-346°F (-210°C)"),
        ("Atmosphere", "Hydrogen, helium, methane")
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(facts, id: \.0) { fact in
                    VStack(alignment: .leading, spacing: 5) {
                        Text(fact.0)
                            .font(.custom("SpaceGrotesk-Bold", size: 18))
                            .foregroundColor(.blue)
                        Spacer()
                        Text(fact.1)
                            .font(.custom("SpaceGrotesk-Regular", size: 16))
                            .foregroundColor(.white)
                    }
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct NeptuneExplorationSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Exploration Highlights")
                .font(.custom("SpaceGrotesk-Bold", size: 30))
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 10) {
                ExplorationItem(
                    title: "Voyager 2 (1989)",
                    description: "First and only spacecraft to visit Neptune, providing detailed images and data."
                )
                ExplorationItem(
                    title: "Hubble Space Telescope",
                    description: "Continues to study Neptune from Earth orbit, observing its dynamic atmosphere and moons."
                )
                ExplorationItem(
                    title: "Future Missions",
                    description: "Various concepts for Neptune orbiters and atmospheric probes are under consideration by space agencies."
                )
            }
        }
        .padding()
        .background(Color.blue.opacity(0.2))
        .cornerRadius(15)
    }
}

#Preview {
    Neptune()
}
