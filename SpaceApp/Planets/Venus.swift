//
//  Venus.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2024/01/11.
//
//
//  Venus.swift
//  SpaceApp
//
//  Created by [Your Name] on [Current Date]
//

import SwiftUI
import SceneKit
import RealityKit

struct Venus: View {
    @Environment(\.colorScheme) var colorScheme
    var planet: Planets = .Venus

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
                                .fill(RadialGradient(gradient: Gradient(colors: [.orange, .yellow, .black]), center: .center, startRadius: 5, endRadius: 150))
                        )
                        .shadow(color: .orange.opacity(0.5), radius: 20, x: 0, y: 0)
                    
                    InfoSection(title: "About Venus", content: planet.about)
                    
                    VenusFactsGrid()
                    
                    InfoSection(title: "Detailed Information", content: detailedInfo)
                    
                    VenusExplorationSection()
                }
                .padding()
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
    
    var detailedInfo: String {
        """
        Venus is often called Earth's twin because of their similar size, mass, proximity to the Sun and bulk composition. However, it is radically different from Earth in many respects.

        It has the densest atmosphere of the four terrestrial planets, consisting of more than 96% carbon dioxide. The atmospheric pressure at the planet's surface is about 92 times the sea level pressure of Earth, or roughly the pressure at 900 m (3,000 ft) underwater on Earth. Venus is by far the hottest planet in the Solar System, with a mean surface temperature of 462°C (864°F), even though Mercury is closer to the Sun.

        Venus is shrouded by an opaque layer of highly reflective clouds of sulfuric acid, preventing its surface from being seen from space in visible light. It may have had water oceans in the past, but these would have vaporized as the temperature rose due to a runaway greenhouse effect.
        """
    }
}

struct VenusFactsGrid: View {
    let facts: [(String, String)] = [
        ("Name Meaning", "Roman goddess of love"),
        ("Diameter", "7,521 miles (12,104 km)"),
        ("Surface Gravity", "8.87 m/s²"),
        ("Orbit", "225 Earth days"),
        ("Day", "243 Earth days"),
        ("Moons", "0"),
        ("Avg. Temperature", "864°F (462°C)"),
        ("Atmosphere", "Carbon dioxide, nitrogen")
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

struct VenusExplorationSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Exploration Highlights")
                .font(.custom("SpaceGrotesk-Bold", size: 30))
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 10) {
                ExplorationItem(
                    title: "Venera Program (1961-1984)",
                    description: "Soviet missions that included the first spacecraft to land on Venus and transmit surface images."
                )
                ExplorationItem(
                    title: "Magellan (1989-1994)",
                    description: "NASA orbiter that mapped 98% of Venus's surface using radar."
                )
                ExplorationItem(
                    title: "Venus Express (2005-2014)",
                    description: "ESA orbiter that studied Venus's atmosphere and surface."
                )
                ExplorationItem(
                    title: "Future Missions",
                    description: "Several missions are planned, including NASA's VERITAS and DAVINCI+ to study Venus's geology and atmosphere."
                )
            }
        }
        .padding()
        .background(Color.orange.opacity(0.2))
        .cornerRadius(15)
    }
}

#Preview {
    Venus()
}
