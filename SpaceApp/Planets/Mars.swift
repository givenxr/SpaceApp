//
//  Mars.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2024/01/11.
//

import SwiftUI
import RealityKitContent
import RealityKit

struct Mars: View {
@Environment(\.presentationMode) var presentationMode
@State private var isHovered = false
var planet: Planets = .Mars

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
                        Model3D(named: planet.planetName, bundle: realityKitContentBundle)
                             { model in model
                                     .resizable()
                                     .aspectRatio(contentMode: .fit)
                                     .scaleEffect(0.4)
                                     .phaseAnimator([false, true]) { Planet, threeDYRotate in
                                    Planet
                                        .rotation3DEffect(.degrees(threeDYRotate ? 0 : 1 * 200), axis: (x: 0, y: 1, z: 0))
                                } animation: { threeDYRotate in
                                        .linear(duration: 30).repeatForever(autoreverses: false)
                                }
                        } placeholder: {
                            ProgressView()
                        }.padding(.leading, 40)

                        Text(planet.about)
                            .padding(.trailing, 30)
                            .foregroundColor(.white)
                            
                            //.padding(.leading, 40)
                        
                    }
                    Divider()

                    Text("Mars Facts")
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
                        Text("for the Roman god of war")
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        //Text("_________________________")
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Diameter")
                            .bold()
                            .foregroundColor(.white)
                        Text("4,217 miles (6,787 km) ")
                            .foregroundColor(.white)
                        //Divider()
                            .padding(.bottom, 20)
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Surface Gravity")
                            .bold()
                            .foregroundColor(.white)
                        Text("3.71 m/s²")
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Orbit")
                            .bold()
                            .foregroundColor(.white)
                        Text("687 Earth days")
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Day")
                            .bold()
                            .foregroundColor(.white)
                        Text("24 hours, 37 minutes")
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Number of moons")
                            .bold()
                            .foregroundColor(.white)
                        Text("2")
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                    }
                    
                    Text("Information")
                        .monospaced()
                        .font(.system(size: 40, weight: .bold))
                        .padding(.top, 50)
                        .foregroundColor(.white)
                        .padding(.bottom, 30)
                    
                    Text("Mars is the fourth planet from the sun. It is a cold, desert-like planet covered in iron oxide dust that gives the planet its signature red hue. Mars shares similarities with Earth: It is rocky, has mountains, valleys and canyons, and storm systems ranging from localized tornado-like dust devils to planet-engulfing dust storms. \n \n Substantial scientific evidence suggests that Mars at one point billions of years ago was a much warmer, wetter world, rivers and maybe even oceans existed. Although Mars' atmosphere is too thin for liquid water to exist on the surface for any length of time, remnants of that wetter Mars still exist today. Sheets of water ice the size of California lie beneath Mars' surface, and at both poles are ice caps made in part of frozen water.  \n\n Scientists also think ancient Mars would have had the conditions to support life like bacteria and other microbes. Hope that signs of this past life — and the possibility of even current lifeforms — may exist on the Red Planet has driven numerous Mars missions and the Red Planet is now one of the most explored planets in the solar system. ")
                    

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
    Mars()
}
