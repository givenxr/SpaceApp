//
//  PlanetsTab.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2024/01/11.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct PlanetsTab: View {
    @State private var selectedItem: String? = nil
    @State private var showImmersiveSpace = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        NavigationView {
            List(selection: $selectedItem) {
                NavigationLink("Mercury", destination: MercuryInfo())
                    .tag("Mercury")
            }
            .navigationTitle("Planets")
        }
    }

    func MercuryInfo() -> some View {
        return ScrollView{
            Text("Mercury")
                .monospaced()
                .font(.system(size: 40, weight: .bold))
                .padding(.top, 50)
                .foregroundColor(.white)
            
            HStack{
                
                Model3D(named: "Mercury", bundle: realityKitContentBundle)
                    .padding(.bottom, 50)
                    .padding(.trailing, 30)
                    .padding(.leading, 30)
                    
                
                Text("Mercury is the first planet from the Sun and the smallest in the Solar System. It is a terrestrial planet with a heavily cratered surface due to overlapping impact events. These features are well preserved since the planet has no geological activity and an extremely tenuous atmosphere called an exosphere.")
                    .padding(.trailing, 20)
            }
            
            VStack {
                Text("Information")
                Text("Explore the planets in our solar system.")
                if showImmersiveSpace {
                    Model3D(named: "Mercury", bundle: realityKitContentBundle)
                        .padding(.bottom, 50)
                }
            }
        }
    }

    /*func contentForPlanetsAndMoons() -> some View {
        VStack {
            Text("Planets + Moons")
            Text("Discover both planets and their moons in our cosmic neighborhood.")
            if showImmersiveSpace {
                // Include immersive content for Planets + Moons
            }
            Toggle("Show ImmersiveSpace", isOn: $showImmersiveSpace)
                .toggleStyle(.button)
                .padding(.top, 50)
        }
    }

    func contentForMilkyWayGalaxy() -> some View {
        VStack {
            Text("Milky Way Galaxy")
            Text("Learn about the Milky Way, our home galaxy.")
            if showImmersiveSpace {
                // Include immersive content for Milky Way Galaxy
            }
            Toggle("Show ImmersiveSpace", isOn: $showImmersiveSpace)
                .toggleStyle(.button)
                .padding(.top, 50)
        }
    }

    func contentForTheBlackhole() -> some View {
        VStack {
            Text("The Blackhole")
            Text("Dive into the mysterious world of black holes.")
            if showImmersiveSpace {
                // Include immersive content for The Blackhole
            }
            Toggle("Show ImmersiveSpace", isOn: $showImmersiveSpace)
                .toggleStyle(.button)
                .padding(.top, 50)
        }
    }*/
}


#Preview {
    PlanetsTab()
}
