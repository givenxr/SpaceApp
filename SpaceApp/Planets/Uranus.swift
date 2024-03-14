//
//  Uranus.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2024/01/11.
//

import SwiftUI
import SceneKit
import RealityKit

struct Uranus: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isHovered = false
    var planet: Planets = .Uranus

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

                        Text("Uranus Facts")
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
                            Text("for the personification of heaven in ancient myth")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                            //Text("_________________________")
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Diameter")
                                .bold()
                                .foregroundColor(.white)
                            Text("31,763 miles (51,120 km)")
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
                            Text("84 Earth years")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Day")
                                .bold()
                                .foregroundColor(.white)
                            Text("18 Earth hours")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Number of moons")
                                .bold()
                                .foregroundColor(.white)
                            Text("27")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        }
                        
                        Text("Information")
                            .monospaced()
                            .font(.system(size: 40, weight: .bold))
                            .padding(.top, 50)
                            .foregroundColor(.white)
                            .padding(.bottom, 30)
                        
                        Text("Uranus is the seventh planet from the sun and is a bit of an oddball. \n\n It has clouds made of hydrogen sulfide, the same chemical that makes rotten eggs smell so foul. It rotates from east to west like Venus. But unlike Venus or any other planet, its equator is nearly at right angles to its orbit — it basically orbits on its side.  \n \n Astronomers believe an object twice the size of Earth collided with Uranus roughly 4 billion years ago, causing Uranus to tilt. That tilt causes extreme seasons that last 20-plus years, and the sun beats down on one pole or the other for 84 Earth-years at a time.  \n\n The collision is also thought to have knocked rock and ice into Uranus' orbit. These later became some of the planet's 27 moons. Methane in Uranus' atmosphere gives the planet its blue-green tint. It also has 13 sets of faint rings. \n\n Uranus holds the record for the coldest temperature ever measured in the solar system — minus 371.56 degrees F (minus 224.2 degrees C). The average temperature of Uranus is minus 320 degrees Fahrenheit (-195 degrees Celsius).")
                        

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
    Uranus()
}
