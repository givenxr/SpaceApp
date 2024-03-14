//
//  Venus.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2024/01/11.
//
import SwiftUI
import SceneKit
import RealityKit

struct Venus: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isHovered = false
    var planet: Planets = .Venus
    
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

                        Text("Venus Facts")
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
                            Text("for the Roman goddess of love and beauty")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                            //Text("_________________________")
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Diameter")
                                .bold()
                                .foregroundColor(.white)
                            Text("7,521 miles (12,104 km)")
                                .foregroundColor(.white)
                            //Divider()
                                .padding(.bottom, 20)
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Surface Gravity")
                                .bold()
                                .foregroundColor(.white)
                            Text("8.87 m/s²")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Orbit")
                                .bold()
                                .foregroundColor(.white)
                            Text("225 Earth days")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Day")
                                .bold()
                                .foregroundColor(.white)
                            Text("241 Earth days")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Number of moons")
                                .bold()
                                .foregroundColor(.white)
                            Text("0")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        }
                        
                        Text("Information")
                            .monospaced()
                            .font(.system(size: 40, weight: .bold))
                            .padding(.top, 50)
                            .foregroundColor(.white)
                            .padding(.bottom, 30)
                        
                        Text("Venus is the second planet from the sun and is the hottest planet in the solar system. Its thick atmosphere is extremely toxic and composed of sulfuric acid clouds, the planet is an extreme example of the greenhouse effect.  \n \nThe average temperature on Venus' surface is 900 F (465 C). At 92 bar, the pressure at the surface would crush and kill you. And oddly, Venus spins slowly from east to west, the opposite direction of most of the other planets. \n\n Venus is sometimes referred to as Earth's twin as they are similar in size and radar images beneath its atmosphere reveal numerous mountains and volcanoes. But beyond that, the planets could not be more different.  \n\n The Greeks believed Venus was two different objects — one in the morning sky and another in the evening. Because it is often brighter than any other object in the sky, Venus has generated many UFO reports.  ")
                        

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
    Venus()
}
