//
//  Jupiter.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2024/01/11.
//

import SwiftUI
import SceneKit
import RealityKit

struct Jupiter: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @State private var isHovered = false
    var planet: Planets = .Jupiter
    
    var body: some View {
        
//        ZStack {
//            LinearGradient(
//                gradient: Gradient(colors: [Color.black, Color.black]),
//                startPoint: .top,
//                endPoint: .bottom
//            ).background(Color.black.edgesIgnoringSafeArea(.all))
            
            ZStack {
                // Your background and other UI elements here
                
                VStack {
//                    HStack {
//                        Button {
//                            presentationMode.wrappedValue.dismiss()
//                        } label: {
//                            HStack {
//                                Image(systemName: "chevron.left")
//                                    .foregroundColor(.white)
//                                    .font(.title)
//                                if isHovered {
//                                    Text("Back")
//                                        .foregroundColor(.white)
//                                        .font(.system(size: 16))
//                                        .padding(.leading, 5)
//                                }
//                            }
//                            .onHover { hovering in
//                                withAnimation {
//                                    isHovered = hovering
//                                }
//                            }
//                        }
//                        .padding(.leading, 20)
//                        .padding(.top, 20)
//                        
//                        Spacer()
//                    }
                    
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
                            
                                
                                
                                Text(planet.about)
                                .multilineTextAlignment(.leading) // Adjust alignment if needed
                                .foregroundColor(colorScheme == .dark ? .white : .black) // Change color based on color scheme
                                .frame(maxWidth: .infinity) // Expand to fill the width
                                .padding() // Add padding for better readability
                                .lineSpacing(5) // Adjust line spacing if needed
                                .lineLimit(nil) // Allow unlimited lines
                                .fixedSize(horizontal: false, vertical: true) // Allow vertical
                                
                                
                            
                            Divider()
                            
                            Text("Jupiter Facts")
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
                                Text("for the ruler of the Roman gods")
                                    .foregroundColor(.white)
                                    .padding(.bottom, 20)
                                //Text("_________________________")
                            }
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Diameter")
                                    .bold()
                                    .foregroundColor(.white)
                                Text("86,881 miles (139,822 km)")
                                    .foregroundColor(.white)
                                //Divider()
                                    .padding(.bottom, 20)
                            }
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Surface Gravity")
                                    .bold()
                                    .foregroundColor(.white)
                                Text("24.79 m/s²")
                                    .foregroundColor(.white)
                                    .padding(.bottom, 20)
                            }
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Orbit")
                                    .bold()
                                    .foregroundColor(.white)
                                Text("11.9 Earth years")
                                    .foregroundColor(.white)
                                    .padding(.bottom, 20)
                            }
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Day")
                                    .bold()
                                    .foregroundColor(.white)
                                Text("9.8 Earth hours")
                                    .foregroundColor(.white)
                                    .padding(.bottom, 20)
                            }
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Number of moons")
                                    .bold()
                                    .foregroundColor(.white)
                                Text("79 (53 confirmed, 26 provisional)")
                                    .foregroundColor(.white)
                                    .padding(.bottom, 20)
                            }
                            
                            Text("Information")
                                .monospaced()
                                .font(.system(size: 40, weight: .bold))
                                .padding(.top, 50)
                                .foregroundColor(.white)
                                .padding(.bottom, 30)
                            
                            Text("Jupiter is the fifth planet from the sun and the largest planet in the solar system. The gas giant is more than twice as massive as all the other planets combined, according to NASA.  \n \n Its swirling clouds are colorful due to different types of trace gases including ammonia ice, ammonium hydrosulfide crystals as well as water ice and vapor.  \n\n A famous feature in its swirling clouds is Jupiter's Great Red Spot, a giant storm more than 10,000 miles wide, first observed in 1831 by amateur astronomer Samuel Heinrich Schwabe. It has raged at more than 400 mph for the last 150 years, at least.  \n\n Jupiter has a strong magnetic field, and with 75 moons, including the largest moon in the solar system, Ganymede.")
                                .foregroundColor(.white)
                            
                            
                        }
                        .padding()
                        
                    }
                }
            }
            .padding(.leading, 5)
            .onAppear {
                // Additional setup if needed when the view appears
            }
        }
    }
        

#Preview {
    Jupiter()
}
