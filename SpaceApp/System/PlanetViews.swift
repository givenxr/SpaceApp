//
//  PlanetViews.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2024/02/07.
//

/*import SwiftUI

struct PlanetViews: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}*/


import RealityKit
import RealityKitContent

// PlanetArea.swift

import SwiftUI

struct PlanetViews: View {
    @State private var selectedPlanet: Planets?

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.black, Color.clear]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)

            ScrollView {
                Text("PLANETS")
                    .monospaced()
                    .font(.system(size: 30, weight: .bold))
                    .padding(.top, 50)
                    .foregroundColor(.white)
                
                Text("Embark on a celestial journey! Explore and click on each planet to unravel fascinating details about our solar system.")
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                    .padding(.top, 30)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20, weight: .bold))
                
                LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 16) {
                    showPlanet(Planets.Mercury)
                    showPlanet(Planets.Venus)
                    showPlanet(Planets.Earth)
                }
                .padding(30)
                
                LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 16) {
                    }
                .padding(5)
                
                LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 16) {
                    showPlanet(Planets.Mars)
                    showPlanet(Planets.Saturn)
                    showPlanet(Planets.Jupiter)
                   
                }
                .padding(30)
                
                LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 16) {
                    
                    showPlanet(Planets.Uranus)
                    showPlanet(Planets.Neptune)
                    showPlanet(Planets.Pluto)
                   
                }
                .padding(30)
                
                
                
            }
        }
        .fullScreenCover(item: $selectedPlanet) { planet in
            // Create a separate view for each planet, e.g., MercuryArea, VenusArea, etc.
            switch planet {
            case .Mercury: Mercurry()
            case .Venus: Venus()
            case .Earth: Earth()
            case .Mars: Mars()
            case .Jupiter: Jupiter()
            case .Saturn: Saturn()
            case .Uranus: Uranus()
            case .Neptune: Neptune()
            case .Pluto: Pluto()
            }
        }
    }
    
    func showPlanet(_ planet: Planets) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Button {
                selectedPlanet = planet
            } label: {
                Model3D(named: planet.planetName, bundle: realityKitContentBundle)
                    .frame(width: 100, height: 100)
                    .scaledToFit()
                    .padding(.bottom, 30)
            }
            .buttonStyle(PlainButtonStyle())

            Text(planet.rawValue.capitalized)
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.white)
                .padding(.bottom, 20)

            Text(planet.about)
                .font(.system(size: 20))
                .foregroundColor(.white)
        }
        .padding(20)
        .frame(minWidth: 180, maxWidth: .infinity, idealHeight: 400)
        .glassBackgroundEffect()
    }
}

#Preview {
    PlanetViews()
}
