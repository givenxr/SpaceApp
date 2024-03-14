//
//  Pluto.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2024/01/11.
//

import SwiftUI
import SceneKit
import RealityKit

struct Pluto: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isHovered = false
    var planet: Planets = .Mercury

    var body: some View {
        ZStack {
            // Your background and other UI elements here

            VStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.title)
                            if isHovered {
                                Text("Back")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                                    .padding(.leading, 5)
                            }
                        }
                        .onHover { hovering in
                            withAnimation {
                                isHovered = hovering
                            }
                        }
                    }
                    .padding(.leading, 20)
                    .padding(.top, 20)

                    Spacer()
                }

                ScrollView {
                    Text(planet.planetName)
                        .monospaced()
                        .font(.system(size: 40, weight: .bold))
                        .padding(.top, 30)
                        .foregroundColor(.white)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            PlanetSceneView(scene: SCNScene(named: "\(planet.rawValue).usdz"))
                                .frame(width: 200, height: 200)
                                .scaledToFit()
                                .padding(.bottom, 50)

                            Text(planet.about)
                                .padding(.trailing, 30)
                                .foregroundColor(.white)
                                
                                //.padding(.leading, 40)
                            
                        }
                        Divider()

                        Text("Pluto Facts")
                            .monospaced()
                            .font(.system(size: 40, weight: .bold))
                            .padding(.top, 50)
                            .foregroundColor(.white)
                            .padding(.bottom, 30)
                        
                        
                        // Additional Information
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Name Meaning")
                                .bold()
                                .foregroundColor(.white)
                            Text("or the Roman god of the underworld, Hades")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                            //Text("_________________________")
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Diameter")
                                .bold()
                                .foregroundColor(.white)
                            Text("1,430 miles (2,301 km)")
                                .foregroundColor(.white)
                            //Divider()
                                .padding(.bottom, 20)
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Surface Gravity")
                                .bold()
                                .foregroundColor(.white)
                            Text("0.62 m/s²")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Orbit")
                                .bold()
                                .foregroundColor(.white)
                            Text("248 Earth years")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Day")
                                .bold()
                                .foregroundColor(.white)
                            Text("6.4 Earth days")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Number of moons")
                                .bold()
                                .foregroundColor(.white)
                            Text("5")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        }
                        
                        Text("Information")
                            .monospaced()
                            .font(.system(size: 40, weight: .bold))
                            .padding(.top, 50)
                            .foregroundColor(.white)
                            .padding(.bottom, 30)
                        
                        Text("Pluto was once the ninth planet from the sun and is unlike any other planet in the solar system.  \n \n Pluto was once the ninth planet from the sun and is unlike any other planet in the solar system.  \n\n It is smaller than Earth's moon; its orbit is highly elliptical, falling inside Neptune's orbit at some points and far beyond it at others; and Pluto's orbit doesn't fall on the same plane as all the other planets — instead, it orbits 17.1 degrees above or below, taking 288 years to complete a single orbit according to ESA. \n\n From 1979 until early 1999, Pluto had been the eighth planet from the sun. Then, on Feb. 11, 1999, it crossed Neptune's path and once again became the solar system's most distant planet — until it was redefined as a dwarf planet. It's a cold, rocky world with a tenuous atmosphere. \n\n Scientists thought it might be nothing more than a hunk of rock on the outskirts of the solar system. But when NASA's New Horizons mission performed history's first flyby of the Pluto system on July 14, 2015, it transformed scientists' view of Pluto. \n\n Pluto is a very active ice world that's covered in glaciers, mountains of ice water, icy dunes and possibly even cryovolcanoes that erupt icy lava made of water, methane or ammonia.")
                         

                    }
                    .padding()
                    
                }
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .onAppear {
            // Additional setup if needed when the view appears
        }
    }
}

#Preview {
    Pluto()
}
