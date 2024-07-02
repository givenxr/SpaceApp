//
//  Saturn.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2024/01/11.
//

//
//  Saturn.swift
//  SpaceApp
//
//  Created by [Your Name] on [Current Date]
//

import SwiftUI
import SceneKit
import RealityKit

struct Saturn: View {
    @Environment(\.colorScheme) var colorScheme
    var planet: Planets = .Saturn

    var body: some View {
        ZStack {
            StarryBackground()
            
            ScrollView {
                VStack(spacing: 30) {
                    Text(planet.planetName)
                        .font(.custom("SpaceGrotesk-Bold", size: 50))
                        .foregroundColor(.white)
                        .padding(.top, 50)
                        .shadow(color: .yellow, radius: 2, x: 0, y: 2)
                    
                    PlanetSceneView(scene: SCNScene(named: "\(planet.rawValue).usdz"))
                        .frame(width: 300, height: 300)
                        .background(
                            Circle()
                                .fill(RadialGradient(gradient: Gradient(colors: [.yellow, .orange, .black]), center: .center, startRadius: 5, endRadius: 150))
                        )
                        .shadow(color: .yellow.opacity(0.5), radius: 20, x: 0, y: 0)
                    
                    InfoSection(title: "About Saturn", content: planet.about)
                    
                    SaturnFactsGrid()
                    
                    InfoSection(title: "Detailed Information", content: detailedInfo)
                    
                    SaturnExplorationSection()
                }
                .padding()
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
    
    var detailedInfo: String {
        """
        Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius about nine times that of Earth. It has only one-eighth the average density of Earth; however, with its larger volume, Saturn is over 95 times more massive.

        Saturn's most famous feature is its prominent ring system, which is composed mainly of ice particles, with a smaller amount of rocky debris and dust. At least 82 moons are known to orbit Saturn, of which 53 are officially named; this does not include the hundreds of moonlets in its rings.

        Titan, Saturn's largest moon and the second-largest in the Solar System, is larger than the planet Mercury, although less massive, and is the only moon in the Solar System to have a substantial atmosphere.
        """
    }
}

struct SaturnFactsGrid: View {
    let facts: [(String, String)] = [
        ("Name Meaning", "Roman god of agriculture"),
        ("Diameter", "72,367 miles (116,464 km)"),
        ("Surface Gravity", "10.44 m/s²"),
        ("Orbit", "29.5 Earth years"),
        ("Day", "10.7 Earth hours"),
        ("Moons", "82 (confirmed)"),
        ("Avg. Temperature", "-288°F (-178°C)"),
        ("Atmosphere", "Hydrogen, helium")
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
                            .foregroundColor(.yellow)
                        Spacer()
                        Text(fact.1)
                            .font(.custom("SpaceGrotesk-Regular", size: 16))
                            .foregroundColor(.white)
                    }
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.yellow.opacity(0.2))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct SaturnExplorationSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Exploration Highlights")
                .font(.custom("SpaceGrotesk-Bold", size: 30))
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 10) {
                ExplorationItem(
                    title: "Pioneer 11 (1979)",
                    description: "First spacecraft to fly by Saturn, providing the first close-up images."
                )
                ExplorationItem(
                    title: "Voyager 1 & 2 (1980-1981)",
                    description: "Conducted flybys, providing detailed images and discoveries about Saturn's rings and moons."
                )
                ExplorationItem(
                    title: "Cassini-Huygens (2004-2017)",
                    description: "Orbited Saturn for 13 years, providing unprecedented data and images of the planet, its rings, and moons."
                )
            }
        }
        .padding()
        .background(Color.yellow.opacity(0.2))
        .cornerRadius(15)
    }
}

#Preview {
    Saturn()
}
