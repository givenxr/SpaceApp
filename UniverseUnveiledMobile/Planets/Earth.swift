//
//  Earth.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2024/01/11.
//

import SwiftUI
//import RealityKitContent
import RealityKit
import SceneKit

struct Earth: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isHovered = false
    var planet: Planets = .Earth

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
                        .foregroundColor(.black)
                    
                    PlanetSceneView(scene: SCNScene(named: "\(planet.rawValue).usdz"))
                        .frame(width: 200, height: 200)
                        .scaledToFit()
                        .padding(.bottom, 50)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            

                            Text(planet.about)
                                .padding(.trailing, 30)
                                .foregroundColor(.black)
                                
                                //.padding(.leading, 40)
                            
                        }
                        Divider()

                        Text("Earth Facts")
                            .monospaced()
                            .font(.system(size: 40, weight: .bold))
                            .padding(.top, 50)
                            .foregroundColor(.black)
                            .padding(.bottom, 30)
                        
                        
                        // Additional Information
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Name Meaning")
                                .bold()
                                .foregroundColor(.black)
                            Text("Originates from 'Die Erde' the German word for 'the ground'")
                                .foregroundColor(.black)
                                .padding(.bottom, 20)
                            //Text("_________________________")
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Diameter")
                                .bold()
                                .foregroundColor(.black)
                            Text("7,926 miles (12,760 km)")
                                .foregroundColor(.black)
                            //Divider()
                                .padding(.bottom, 20)
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Surface Gravity")
                                .bold()
                                .foregroundColor(.black)
                            Text("9.807 m/s²")
                                .foregroundColor(.black)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Orbit")
                                .bold()
                                .foregroundColor(.black)
                            Text("365.24 days")
                                .foregroundColor(.black)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Day")
                                .bold()
                                .foregroundColor(.black)
                            Text("23 hours, 56 minutes")
                                .foregroundColor(.black)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Number of moons")
                                .bold()
                                .foregroundColor(.black)
                            Text("1")
                                .foregroundColor(.black)
                                .padding(.bottom, 20)
                        }
                        
                        Text("Information")
                            .monospaced()
                            .font(.system(size: 40, weight: .bold))
                            .padding(.top, 50)
                            .foregroundColor(.black)
                            .padding(.bottom, 30)
                        
                        Text("Earth, our home planet, is the third planet from the sun. It is a water world with two-thirds of the planet covered by water. Earth's atmosphere is rich in nitrogen and oxygen and it is the only world known to harbor life. \n \n Earth rotates on its axis at 1,532 feet per second (467 meters per second) — slightly more than 1,000 mph (1,600 kph) — at the equator. The planet zips around the sun at more than 18 miles per second (29 km per second).")
                        

                    }
                    .padding()
                    
                }
            }
        }
        
        .onAppear {
            // Additional setup if needed when the view appears
        }
    }
}

#Preview {
    Earth()
}

