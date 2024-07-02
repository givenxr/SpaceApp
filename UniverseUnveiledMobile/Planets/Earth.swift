//
//  Earth.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2024/01/11.
//

//
//  Earth.swift
//  SpaceApp
//
//  Created by [Your Name] on [Current Date]
//

import SwiftUI
import SceneKit
import RealityKit

struct Earth: View {
    @Environment(\.colorScheme) var colorScheme
    var planet: Planets = .Earth

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
                                .fill(RadialGradient(gradient: Gradient(colors: [.blue, .green, .black]), center: .center, startRadius: 5, endRadius: 150))
                        )
                        .shadow(color: .blue.opacity(0.5), radius: 20, x: 0, y: 0)
                    
                    InfoSection(title: "About Earth", content: planet.about)
                    
                    EarthFactsGrid()
                    
                    InfoSection(title: "Detailed Information", content: detailedInfo)
                    
                    EarthExplorationSection()
                }
                .padding()
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
    
    var detailedInfo: String {
        """
        Earth is the third planet from the Sun and the only astronomical object known to harbor life. About 29.2% of Earth's surface is land consisting of continents and islands. The remaining 70.8% is covered with water, mostly by oceans, seas, gulfs, and other salt-water bodies, but also by lakes, rivers, and other fresh water, which together constitute the hydrosphere.

        Earth's atmosphere consists mostly of nitrogen and oxygen. Much of Earth's surface is covered by water, and much of Earth's polar regions are covered by ice. The planet's outer layer is divided into several rigid tectonic plates that migrate across the surface over many millions of years.

        Earth's interior remains active with a solid iron inner core, a liquid outer core that generates Earth's magnetic field, and a convecting mantle that drives plate tectonics. Earth has one natural satellite, the Moon, which orbits Earth at an average distance of 384,400 km (238,900 mi).
        """
    }
}

struct EarthFactsGrid: View {
    let facts: [(String, String)] = [
        ("Name Meaning", "The ground"),
        ("Diameter", "7,926 miles (12,742 km)"),
        ("Surface Gravity", "9.8 m/s²"),
        ("Orbit", "365.25 days"),
        ("Day", "24 hours"),
        ("Moons", "1 (Luna)"),
        ("Avg. Temperature", "15°C (59°F)"),
        ("Atmosphere", "Nitrogen, oxygen")
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

struct EarthExplorationSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Earth Observation Highlights")
                .font(.custom("SpaceGrotesk-Bold", size: 30))
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 10) {
                ExplorationItem(
                    title: "Landsat Program (1972-present)",
                    description: "Series of Earth-observing satellite missions jointly managed by NASA and USGS."
                )
                ExplorationItem(
                    title: "International Space Station (1998-present)",
                    description: "Continuously occupied orbiting laboratory providing unique views and research opportunities."
                )
                ExplorationItem(
                    title: "Earth Observing System (1999-present)",
                    description: "NASA's coordinated series of satellites for long-term global observations of the land surface, biosphere, atmosphere, and oceans."
                )
                ExplorationItem(
                    title: "Copernicus Programme (2014-present)",
                    description: "European Union's Earth observation program, providing accurate, timely and easily accessible information."
                )
            }
        }
        .padding()
        .background(Color.blue.opacity(0.2))
        .cornerRadius(15)
    }
}

#Preview {
    Earth()
}
