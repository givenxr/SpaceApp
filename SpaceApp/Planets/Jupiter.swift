//
//  Jupiter.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2024/01/11.
//

import SwiftUI
import SceneKit
import RealityKit

struct Jupiter: View {
    @Environment(\.colorScheme) var colorScheme
    var planet: Planets = .Jupiter

    var body: some View {
        ZStack {
            StarryBackground()
            
            ScrollView {
                VStack(spacing: 30) {
                    Text(planet.planetName)
                        .font(.custom("SpaceGrotesk-Bold", size: 50))
                        .foregroundColor(.white)
                        .padding(.top, 50)
                        .shadow(color: .orange, radius: 2, x: 0, y: 2)
                    
                    PlanetSceneView(scene: SCNScene(named: "\(planet.rawValue).usdz"))
                        .frame(width: 300, height: 300)
                        .background(
                            Circle()
                                .fill(RadialGradient(gradient: Gradient(colors: [.orange, .red, .brown]), center: .center, startRadius: 5, endRadius: 150))
                        )
                        .shadow(color: .orange.opacity(0.5), radius: 20, x: 0, y: 0)
                    
                    InfoSection(title: "About Jupiter", content: planet.about)
                    
                    JupiterFactsGrid()
                    
                    InfoSection(title: "Detailed Information", content: detailedInfo)
                    
                    JupiterExplorationSection()
                }
                .padding()
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
    
    var detailedInfo: String {
        """
        Jupiter is the fifth planet from the sun and the largest planet in the solar system. The gas giant is more than twice as massive as all the other planets combined, according to NASA.

        Its swirling clouds are colorful due to different types of trace gases including ammonia ice, ammonium hydrosulfide crystals as well as water ice and vapor.

        A famous feature in its swirling clouds is Jupiter's Great Red Spot, a giant storm more than 10,000 miles wide, first observed in 1831 by amateur astronomer Samuel Heinrich Schwabe. It has raged at more than 400 mph for the last 150 years, at least.

        Jupiter has a strong magnetic field, and with 75 moons, including the largest moon in the solar system, Ganymede.
        """
    }
}

struct JupiterFactsGrid: View {
    let facts: [(String, String)] = [
        ("Name Meaning", "King of the Roman gods"),
        ("Diameter", "86,881 miles (139,822 km)"),
        ("Surface Gravity", "24.79 m/s²"),
        ("Orbit", "11.9 Earth years"),
        ("Day", "9.8 Earth hours"),
        ("Moons", "79 (53 confirmed, 26 provisional)"),
        ("Avg. Temperature", "-145°C (-234°F)"),
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
                            .foregroundColor(.orange)
                        Spacer()
                        Text(fact.1)
                            .font(.custom("SpaceGrotesk-Regular", size: 16))
                            .foregroundColor(.white)
                    }
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange.opacity(0.2))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct JupiterExplorationSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Exploration Highlights")
                .font(.custom("SpaceGrotesk-Bold", size: 30))
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 10) {
                ExplorationItem(
                    title: "Pioneer 10 & 11 (1973-1974)",
                    description: "First spacecraft to fly by Jupiter, providing close-up images and data."
                )
                ExplorationItem(
                    title: "Voyager 1 & 2 (1979)",
                    description: "Conducted extensive studies of Jupiter, its moons, and ring system."
                )
                ExplorationItem(
                    title: "Galileo (1995-2003)",
                    description: "First spacecraft to orbit Jupiter, studied the planet and its moons in detail."
                )
                ExplorationItem(
                    title: "Juno (2016-present)",
                    description: "Currently studying Jupiter's composition, gravity field, magnetic field, and polar magnetosphere."
                )
            }
        }
        .padding()
        .background(Color.orange.opacity(0.2))
        .cornerRadius(15)
    }
}

struct JupiterExplorationItem: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.custom("SpaceGrotesk-Bold", size: 18))
                .foregroundColor(.orange)
            Text(description)
                .font(.custom("SpaceGrotesk-Regular", size: 16))
                .foregroundColor(.white.opacity(0.8))
        }
    }
}

#Preview {
    Jupiter()
}
