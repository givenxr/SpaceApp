//
//  Mars.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2024/01/11.
//

//
//  Mars.swift
//  SpaceApp
//
//  Created by [Your Name] on [Current Date]
//

import SwiftUI
import SceneKit
import RealityKit

struct Mars: View {
    @Environment(\.colorScheme) var colorScheme
    var planet: Planets = .Mars

    var body: some View {
        ZStack {
            StarryBackground()
            
            ScrollView {
                VStack(spacing: 30) {
                    Text(planet.planetName)
                        .font(.custom("SpaceGrotesk-Bold", size: 50))
                        .foregroundColor(.white)
                        .padding(.top, 50)
                        .shadow(color: .red, radius: 2, x: 0, y: 2)
                    
                    PlanetSceneView(scene: SCNScene(named: "\(planet.rawValue).usdz"))
                        .frame(width: 300, height: 300)
                        .background(
                            Circle()
                                .fill(RadialGradient(gradient: Gradient(colors: [.red, .orange, .black]), center: .center, startRadius: 5, endRadius: 150))
                        )
                        .shadow(color: .red.opacity(0.5), radius: 20, x: 0, y: 0)
                    
                    InfoSection(title: "About Mars", content: planet.about)
                    
                    MarsFactsGrid()
                    
                    InfoSection(title: "Detailed Information", content: detailedInfo)
                    
                    MarsExplorationSection()
                }
                .padding()
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
    
    var detailedInfo: String {
        """
        Mars is often called the Red Planet due to its reddish appearance, caused by iron oxide (rust) on its surface. It is home to both the highest mountain and the deepest, longest canyon in the Solar System: Olympus Mons and Valles Marineris, respectively.

        Mars has two small, irregularly shaped moons: Phobos and Deimos. The planet has a thin atmosphere, consisting mainly of carbon dioxide, and it has polar ice caps composed of water ice and dry ice (frozen carbon dioxide).

        Evidence suggests that Mars once had significant amounts of water on its surface, and some water in the form of ice still exists in the polar caps and under the Martian surface. The possibility of past or present microbial life on Mars remains an open question and is a subject of significant interest in astrobiology.
        """
    }
}

struct MarsFactsGrid: View {
    let facts: [(String, String)] = [
        ("Name Meaning", "Roman god of war"),
        ("Diameter", "4,212 miles (6,779 km)"),
        ("Surface Gravity", "3.71 m/s²"),
        ("Orbit", "687 Earth days"),
        ("Day", "24.6 Earth hours"),
        ("Moons", "2 (Phobos and Deimos)"),
        ("Avg. Temperature", "-63°C (-81°F)"),
        ("Atmosphere", "CO2, nitrogen, argon")
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
                            .foregroundColor(.red)
                        Spacer()
                        Text(fact.1)
                            .font(.custom("SpaceGrotesk-Regular", size: 16))
                            .foregroundColor(.white)
                    }
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red.opacity(0.2))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct MarsExplorationSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Exploration Highlights")
                .font(.custom("SpaceGrotesk-Bold", size: 30))
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 10) {
                ExplorationItem(
                    title: "Mariner 4 (1964)",
                    description: "First successful flyby, providing the first close-up images of the Martian surface."
                )
                ExplorationItem(
                    title: "Viking 1 & 2 (1976)",
                    description: "First successful landings on Mars, conducting experiments to search for signs of life."
                )
                ExplorationItem(
                    title: "Mars Pathfinder (1997)",
                    description: "Landed the first rover, Sojourner, on Mars."
                )
                ExplorationItem(
                    title: "Mars Exploration Rovers (2004)",
                    description: "Spirit and Opportunity rovers greatly expanded our understanding of Martian geology."
                )
                ExplorationItem(
                    title: "Curiosity Rover (2012-present)",
                    description: "Ongoing mission studying Martian climate, geology, and potential for past life."
                )
                ExplorationItem(
                    title: "Perseverance Rover (2021-present)",
                    description: "Latest rover, searching for signs of ancient microbial life and collecting samples for future return to Earth."
                )
            }
        }
        .padding()
        .background(Color.red.opacity(0.2))
        .cornerRadius(15)
    }
}

#Preview {
    Mars()
}
