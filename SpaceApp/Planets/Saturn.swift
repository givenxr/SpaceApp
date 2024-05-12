//
//  Saturn.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2024/01/11.
//

import SwiftUI
import SceneKit
import RealityKit

struct Saturn: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @State private var isHovered = false
    var planet: Planets = .Saturn

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
                        .foregroundColor(.white)
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

                        Text("Saturn Facts")
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
                            Text("for Roman god of agriculture")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                            //Text("_________________________")
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Diameter")
                                .bold()
                                .foregroundColor(.white)
                            Text("74,900 miles (120,500 km)")
                                .foregroundColor(.white)
                            //Divider()
                                .padding(.bottom, 20)
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Surface Gravity")
                                .bold()
                                .foregroundColor(.white)
                            Text("10.44 m/s²")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Orbit")
                                .bold()
                                .foregroundColor(.white)
                            Text("29.5 Earth years")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Day")
                                .bold()
                                .foregroundColor(.white)
                            Text("About 10.5 Earth hours")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Number of moons")
                                .bold()
                                .foregroundColor(.white)
                            Text("82 (53 confirmed, 29 provisional)")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        }
                        
                        Text("Information")
                            .monospaced()
                            .font(.system(size: 40, weight: .bold))
                            .padding(.top, 50)
                            .foregroundColor(.white)
                            .padding(.bottom, 30)
                        
                        Text("Saturn is the sixth planet from the sun and is famous for its large and distinct ring system. Though Saturn is not the only planet in the solar system with rings. \n \n When polymath Galileo Galilei first studied Saturn in the early 1600s, he thought it was an object with three parts: a planet and two large moons on either side. Not knowing he was seeing a planet with rings, the stumped astronomer entered a small drawing — a symbol with one large circle and two smaller ones — in his notebook, as a noun in a sentence describing his discovery. More than 40 years later, Christiaan Huygens proposed that they were rings. \n\n The rings are made of ice and rock and scientists are not yet sure how they formed. The gaseous planet is mostly hydrogen and helium and has numerous moons. ").foregroundColor(.white)
                        

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
    Saturn()
}
