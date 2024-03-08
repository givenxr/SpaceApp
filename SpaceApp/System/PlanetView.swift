//
//  PlanetView.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2024/01/11.
//
import SwiftUI
import RealityKit
import RealityKitContent

// PlanetArea.swift

import SwiftUI

struct PlanetView: View {
    @State private var selectedPlanet: Planets?

    var body: some View {
        ZStack {
            // Your background and other UI elements here

            ScrollView {
                Text("PLANETS")
                    //.font(.title)
                    .monospaced()
                    .font(.system(size: 30, weight: .bold))
                    .padding(.top, 50)
                    .foregroundColor(.white)
                
                
                
                Text("Explore and learn about the 9 planets in our solar system.")
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                    .padding(.top, 30)
                    //.frame(width: 900 , height: 150)
                    .font(.system(size: 20, weight: .bold))
                
                LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 16) {
                    ForEach(Planets.allCases) { planet in
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
                        .padding(15)
                        .frame(minWidth: 180, maxWidth: .infinity, idealHeight: 400)
                        .glassBackgroundEffect()
                    }
                }
                .padding(20)
            }
        }
        .fullScreenCover(item: $selectedPlanet) { planet in
            // Create a separate view for each planet, e.g., MercuryArea, VenusArea, etc.
            switch planet {
            case .Mercury: Mercurry()
            // Add cases for other planets
            case .Venus: Venus()
               // <#code#>
            case .Earth: Earth()
               // <#code#>
            case .Mars: Mars()
                //<#code#>
            case .Jupiter: Jupiter()
               // <#code#>
            case .Saturn: Saturn()
               // <#code#>
            case .Uranus: Uranus()
               // <#code#>
            case .Neptune: Neptune()
                //<#code#>
            case .Pluto: Pluto()
                //<#code#>
            }
        }
    }
}


#Preview {
    PlanetView()
}
