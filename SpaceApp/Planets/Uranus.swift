//
//  Uranus.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2024/01/11.
//


import SwiftUI
import SceneKit
import RealityKit

struct Uranus: View {
    @Environment(\.colorScheme) var colorScheme
    var planet: Planets = .Uranus

    var body: some View {
        ZStack {
            StarryBackground()
            
            ScrollView {
                VStack(spacing: 30) {
                    Text(planet.planetName)
                        .font(.custom("SpaceGrotesk-Bold", size: 50))
                        .foregroundColor(.white)
                        .padding(.top, 50)
                        .shadow(color: .cyan, radius: 2, x: 0, y: 2)
                    
                    PlanetSceneView(scene: SCNScene(named: "\(planet.rawValue).usdz"))
                        .frame(width: 300, height: 300)
                        .background(
                            Circle()
                                .fill(RadialGradient(gradient: Gradient(colors: [.cyan, .blue, .black]), center: .center, startRadius: 5, endRadius: 150))
                        )
                        .shadow(color: .cyan.opacity(0.5), radius: 20, x: 0, y: 0)
                    
                    InfoSection(title: "About Uranus", content: planet.about)
                    
                    UranusFactsGrid()
                    
                    InfoSection(title: "Detailed Information", content: detailedInfo)
                    
                    UranusExplorationSection()
                }
                .padding()
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
    
    var detailedInfo: String {
        """
        Uranus is the seventh planet from the Sun and the third-largest in the Solar System. It is an ice giant, composed primarily of ices such as water, ammonia, and methane, along with a rocky core. Uranus has the coldest planetary atmosphere in the Solar System, with a minimum temperature of -224°C (-371°F).

        One of Uranus's unique features is its axial tilt of 97.77 degrees, which causes extreme seasons lasting for about 20 years. This means that for nearly a quarter of each Uranian year, the Sun shines directly over each pole, plunging the other half of the planet into a long, dark winter.

        Uranus has a faint planetary ring system and 27 known moons. The planet's blue-green color is the result of methane in its atmosphere, which absorbs red light and reflects blue-green light back into space.
        """
    }
}

struct UranusFactsGrid: View {
    let facts: [(String, String)] = [
        ("Name Meaning", "Greek god of the sky"),
        ("Diameter", "31,518 miles (50,724 km)"),
        ("Surface Gravity", "8.87 m/s²"),
        ("Orbit", "84 Earth years"),
        ("Day", "17 Earth hours"),
        ("Moons", "27"),
        ("Avg. Temperature", "-353°F (-214°C)"),
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
                            .foregroundColor(.cyan)
                        Spacer()
                        Text(fact.1)
                            .font(.custom("SpaceGrotesk-Regular", size: 16))
                            .foregroundColor(.white)
                    }
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.cyan.opacity(0.2))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct UranusExplorationSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Exploration Highlights")
                .font(.custom("SpaceGrotesk-Bold", size: 30))
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 10) {
                ExplorationItem(
                    title: "Voyager 2 (1986)",
                    description: "Only spacecraft to visit Uranus, providing close-up images and data during its flyby."
                )
                ExplorationItem(
                    title: "Hubble Space Telescope",
                    description: "Continues to study Uranus from Earth orbit, observing seasonal changes and auroras."
                )
                ExplorationItem(
                    title: "Future Missions",
                    description: "Various concepts for Uranus orbiters and atmospheric probes are under consideration by space agencies."
                )
            }
        }
        .padding()
        .background(Color.cyan.opacity(0.2))
        .cornerRadius(15)
    }
}

#Preview {
    Uranus()
}
