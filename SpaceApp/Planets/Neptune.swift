//
//  Neptune.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2024/01/11.
//

import SwiftUI
import SceneKit
import RealityKit

struct Neptune: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @State private var isHovered = false
    var planet: Planets = .Neptune

    var body: some View {
        ZStack {
            // Your background and other UI elements here

            VStack {
//                HStack {
//                    Button {
//                        presentationMode.wrappedValue.dismiss()
//                    } label: {
//                        HStack {
//                            Image(systemName: "chevron.left")
//                                .foregroundColor(.white)
//                                .font(.title)
//                            if isHovered {
//                                Text("Back")
//                                    .foregroundColor(.white)
//                                    .font(.system(size: 16))
//                                    .padding(.leading, 5)
//                            }
//                        }
//                        .onHover { hovering in
//                            withAnimation {
//                                isHovered = hovering
//                            }
//                        }
//                    }
//                    .padding(.leading, 20)
//                    .padding(.top, 20)
//
//                    Spacer()
//                }

                ScrollView {
                    Text(planet.planetName)
                        .monospaced()
                        .font(.system(size: 40, weight: .bold))
                        .padding(.top, 30)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                    PlanetSceneView(scene: SCNScene(named: "\(planet.rawValue).usdz"))
                        .frame(width: 300, height: 300)
                        .scaledToFit()
                        .padding(.bottom, 50)
                    
                    VStack(alignment: .leading) {
                        HStack {
                           

                            Text(planet.about)
                                .multilineTextAlignment(.leading) // Adjust alignment if needed
                                .foregroundColor(colorScheme == .dark ? .white : .black) // Change color based on color scheme
                                .frame(maxWidth: .infinity) // Expand to fill the width
                                .padding() // Add padding for better readability
                                .lineSpacing(5) // Adjust line spacing if needed
                                .lineLimit(nil) // Allow unlimited lines
                                .fixedSize(horizontal: false, vertical: true) // Allow vertical
                                
                            
                        }
                        Divider()

                        Text("Neptune Facts")
                            .monospaced()
                            .font(.system(size: 40, weight: .bold))
                            .padding(.top, 50)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .padding(.bottom, 30)
                        
                        
                        // Additional Information
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Name Meaning")
                                .bold()
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            Text("for the Roman god of water")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .padding(.bottom, 20)
                            //Text("_________________________")
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Diameter")
                                .bold()
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            Text("30,775 miles (49,530 km)")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            //Divider()
                                .padding(.bottom, 20)
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Surface Gravity")
                                .bold()
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            Text("11.15 m/s²")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Orbit")
                                .bold()
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            Text("165 Earth years")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Day")
                                .bold()
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            Text("19 Earth hours")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Number of moons")
                                .bold()
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            Text("14")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .padding(.bottom, 20)
                        }
                        
                        Text("Information")
                            .monospaced()
                            .font(.system(size: 40, weight: .bold))
                            .padding(.top, 50)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .padding(.bottom, 30)
                        
                        Text("Neptune is the eighth planet from the sun and is on average the coldest planet in the solar system. The average temperature of Neptune at the top of the clouds is minus 346 degrees Fahrenheit (minus 210 degrees Celsius). \n \n Neptune is approximately the same size as Uranus and is known for its supersonic strong winds. The planet is more than 30 times as far from the sun as Earth. \n\n Neptune was the first planet predicted to exist by using math, rather than being visually detected. Irregularities in the orbit of Uranus led French astronomer Alexis Bouvard to suggest some other planet might be exerting a gravitational tug. German astronomer Johann Galle used calculations to help find Neptune in a telescope. Neptune is about 17 times as massive as Earth and has a rocky core.").foregroundColor(colorScheme == .dark ? .white : .black)
                        

                    }
                    .padding()
                    
                }
            }
        }.padding(.leading, 5)
        //.background(Color.black.edgesIgnoringSafeArea(.all))
        .onAppear {
            // Additional setup if needed when the view appears
        }
    }
}

#Preview {
    Neptune()
}
