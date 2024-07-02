//
//  Pluto.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2024/01/11.
//

//
//  Pluto.swift
//  SpaceApp
//
//  Created by [Your Name] on [Current Date]
//

import SwiftUI
import SceneKit
import RealityKit

struct Pluto: View {
    @Environment(\.colorScheme) var colorScheme
    var planet: Planets = .Pluto

    var body: some View {
        ZStack {
            StarryBackground()
            
            ScrollView {
                VStack(spacing: 30) {
                    Text(planet.planetName)
                        .font(.custom("SpaceGrotesk-Bold", size: 50))
                        .foregroundColor(.white)
                        .padding(.top, 50)
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    
                    PlanetSceneView(scene: SCNScene(named: "\(planet.rawValue).usdz"))
                        .frame(width: 300, height: 300)
                        .background(
                            Circle()
                                .fill(RadialGradient(gradient: Gradient(colors: [.gray, .brown, .black]), center: .center, startRadius: 5, endRadius: 150))
                        )
                        .shadow(color: .gray.opacity(0.5), radius: 20, x: 0, y: 0)
                    
                    InfoSection(title: "About Pluto", content: planet.about)
                    
                    PlutoFactsGrid()
                    
                    InfoSection(title: "Detailed Information", content: detailedInfo)
                    
                    PlutoExplorationSection()
                }
                .padding()
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
    
    var detailedInfo: String {
        """
        Pluto, once considered the ninth planet in our solar system, is now classified as a dwarf planet. It was discovered in 1930 by Clyde Tombaugh and is named after the Roman god of the underworld. Pluto is located in the Kuiper Belt, a region of icy bodies beyond Neptune's orbit.

        Despite its small size, Pluto has five known moons: Charon, Nix, Hydra, Kerberos, and Styx. The largest, Charon, is so massive that Pluto and Charon are sometimes referred to as a double planet system.

        Pluto's surface is composed of a mix of rock and ice, with areas of nitrogen ice, methane ice, and carbon monoxide ice. Its atmosphere expands when it's closer to the Sun and collapses as it moves farther away due to its highly elliptical orbit.
        """
    }
}

struct PlutoFactsGrid: View {
    let facts: [(String, String)] = [
        ("Classification", "Dwarf Planet"),
        ("Diameter", "1,473 miles (2,377 km)"),
        ("Surface Gravity", "0.62 m/s²"),
        ("Orbit", "248 Earth years"),
        ("Day", "6.4 Earth days"),
        ("Moons", "5"),
        ("Avg. Temperature", "-387°F (-232°C)"),
        ("Atmosphere", "Nitrogen, methane, carbon monoxide")
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
                            .foregroundColor(.gray)
                        Spacer()
                        Text(fact.1)
                            .font(.custom("SpaceGrotesk-Regular", size: 16))
                            .foregroundColor(.white)
                    }
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct PlutoExplorationSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Exploration Highlights")
                .font(.custom("SpaceGrotesk-Bold", size: 30))
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 10) {
                ExplorationItem(
                    title: "New Horizons (2015)",
                    description: "First spacecraft to visit Pluto, providing detailed images and data during its flyby."
                )
                ExplorationItem(
                    title: "Hubble Space Telescope",
                    description: "Continues to study Pluto from Earth orbit, providing valuable observations."
                )
                ExplorationItem(
                    title: "Future Missions",
                    description: "Potential future missions to study Pluto and the Kuiper Belt in more detail are under consideration."
                )
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15)
    }
}

#Preview {
    Pluto()
}
