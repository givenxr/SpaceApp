//
//  Mars.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2024/01/11.
//

import SwiftUI
import SceneKit
import RealityKit

struct Mars: View {
@Environment(\.presentationMode) var presentationMode
@State private var isHovered = false
    var planet: Planets = .Mars
    @Environment(\.colorScheme) var colorScheme

var body: some View {
    ZStack {
        // Your background and other UI elements here

        VStack {
//            HStack {
//                Button {
//                    presentationMode.wrappedValue.dismiss()
//                } label: {
//                    HStack {
//                        Image(systemName: "chevron.left")
//                            .foregroundColor(.white)
//                            .font(.title)
//                        if isHovered {
//                            Text("Back")
//                                .foregroundColor(.white)
//                                .font(.system(size: 16))
//                                .padding(.leading, 5)
//                        }
//                    }
//                    .onHover { hovering in
//                        withAnimation {
//                            isHovered = hovering
//                        }
//                    }
//                }
//                .padding(.leading, 20)
//                .padding(.top, 20)
//
//                Spacer()
//            }

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
                            
                            
                            //.padding(.leading, 40)
                        
                    }
                    Divider()

                    Text("Mars Facts")
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
                        Text("for the Roman god of war")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .padding(.bottom, 20)
                        //Text("_________________________")
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Diameter")
                            .bold()
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        Text("4,217 miles (6,787 km) ")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        //Divider()
                            .padding(.bottom, 20)
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Surface Gravity")
                            .bold()
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        Text("3.71 m/s²")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .padding(.bottom, 20)
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Orbit")
                            .bold()
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        Text("687 Earth days")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .padding(.bottom, 20)
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Day")
                            .bold()
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        Text("24 hours, 37 minutes")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .padding(.bottom, 20)
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Number of moons")
                            .bold()
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        Text("2")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .padding(.bottom, 20)
                    }
                    
                    Text("Information")
                        .monospaced()
                        .font(.system(size: 40, weight: .bold))
                        .padding(.top, 50)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .padding(.bottom, 30)
                    
                    Text("Mars is the fourth planet from the sun. It is a cold, desert-like planet covered in iron oxide dust that gives the planet its signature red hue. Mars shares similarities with Earth: It is rocky, has mountains, valleys and canyons, and storm systems ranging from localized tornado-like dust devils to planet-engulfing dust storms. \n \n Substantial scientific evidence suggests that Mars at one point billions of years ago was a much warmer, wetter world, rivers and maybe even oceans existed. Although Mars' atmosphere is too thin for liquid water to exist on the surface for any length of time, remnants of that wetter Mars still exist today. Sheets of water ice the size of California lie beneath Mars' surface, and at both poles are ice caps made in part of frozen water.  \n\n Scientists also think ancient Mars would have had the conditions to support life like bacteria and other microbes. Hope that signs of this past life — and the possibility of even current lifeforms — may exist on the Red Planet has driven numerous Mars missions and the Red Planet is now one of the most explored planets in the solar system. ").foregroundColor(colorScheme == .dark ? .white : .black)
                    

                }
                .padding()
                
            }
        }
    }
//    .background(Color.black.edgesIgnoringSafeArea(.all))
//    .onAppear {
//        // Additional setup if needed when the view appears
//    }
}
}
#Preview {
    Mars()
}
