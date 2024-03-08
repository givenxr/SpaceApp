//
//  PlanetArea.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2023/12/16.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct PlanetArea: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.black, Color.clear]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Planets")
                    .monospaced()
                    .font(.system(size: 40, weight: .bold))
                    .padding(.top, 50)
                    .foregroundColor(.white)
                
                /*Text("Explore and learn about the 9 planets in our solar system.")
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                    .padding(.top, 30)
                    .font(.system(size: 20, weight: .bold))*/
                
                ScrollView {
                    /*Text("Planets")
                        .monospaced()
                        .font(.system(size: 40, weight: .bold))
                        .padding(.top, 50)
                        .foregroundColor(.white)*/
                    Text("Explore and learn about the 9 planets in our solar system.")
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                        .padding(.top, 30)
                        .font(.system(size: 20, weight: .bold))
                    
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 16) {
                        ForEach(Planets.allCases) { planets in
                            VStack(alignment: .leading, spacing: 8) {
                                Model3D(named: planets.planetName, bundle: realityKitContentBundle)
                                    .frame(width: 100, height: 100)
                                    .scaledToFit()
                                    .padding(.bottom, 50)
                                
                                
                                Text(planets.rawValue.capitalized)
                                    .font(.system(size: 32, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 20)
                                
                                Text(planets.about)
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
        }
        
        
        
        
        
    }
}


/*struct PlanetArea: View {
    var body: some View {
        Text("Planets")
            .monospaced()
            .font(.system(size: 40, weight: .bold))
            .padding(.top, 150)
        
        Text("Explore and learn about the 9 planets in our solar system.")
                    .foregroundColor(.white)
                    .padding()
                    .font(.system(size: 20, weight: .bold))
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 16) {
                ForEach(Planets.allCases) { planets in
                    VStack(alignment: .leading, spacing: 8) {
                        Model3D(named: planets.planetName, bundle: realityKitContentBundle)
                                            //.resizable()
                            .frame(width: 100, height: 100)
                            .scaledToFit()
                        
                        
                        Text(planets.rawValue.capitalized)
                            .font(.system(size: 32, weight: .bold))
                        
                        Text(planets.about)
                            .font(.system(size: 20))
                    }
                    .padding(15)
                    .frame( minWidth: 180, minHeight: 200)
                    .glassBackgroundEffect()
                }
            }
            .padding(20)
        }
    }
}*/
    
        /*Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        HStack{
            ForEach(Planets.allCases){ planets in
                VStack(alignment: .leading) {
                    Image("planets-\(planets.planetName)")
                        .resizable()
                    /*Model3D(named: "planets-\(planets.rawValue)", bundle: realityKitContentBundle)*/
                                                //.resizable()
                                                .frame(width: 100, height: 100) // Adjust size as needed
                                                //.scaledToFit()
                                                //.padding(5)
                    
                    Text(planets.name)
                        .font(.system(size: 22, weight: .bold))
                    Text(planets.about)
                        .font(.system(size: 20))
                }
            }
        }
    }
}*/

#Preview {
    PlanetArea()
}
