//
//  Neptune.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2024/01/11.
//

import SwiftUI
import RealityKitContent
import RealityKit

struct Neptune: View {
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

                        Text("Mercury Facts")
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
                            Text("for the Roman god of water")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                            //Text("_________________________")
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Diameter")
                                .bold()
                                .foregroundColor(.white)
                            Text("30,775 miles (49,530 km)")
                                .foregroundColor(.white)
                            //Divider()
                                .padding(.bottom, 20)
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Surface Gravity")
                                .bold()
                                .foregroundColor(.white)
                            Text("11.15 m/s²")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Orbit")
                                .bold()
                                .foregroundColor(.white)
                            Text("165 Earth years")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Day")
                                .bold()
                                .foregroundColor(.white)
                            Text("19 Earth hours")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Number of moons")
                                .bold()
                                .foregroundColor(.white)
                            Text("14")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        }
                        
                        Text("Information")
                            .monospaced()
                            .font(.system(size: 40, weight: .bold))
                            .padding(.top, 50)
                            .foregroundColor(.white)
                            .padding(.bottom, 30)
                        
                        Text("Neptune is the eighth planet from the sun and is on average the coldest planet in the solar system. The average temperature of Neptune at the top of the clouds is minus 346 degrees Fahrenheit (minus 210 degrees Celsius). \n \n Neptune is approximately the same size as Uranus and is known for its supersonic strong winds. The planet is more than 30 times as far from the sun as Earth. \n\n Neptune was the first planet predicted to exist by using math, rather than being visually detected. Irregularities in the orbit of Uranus led French astronomer Alexis Bouvard to suggest some other planet might be exerting a gravitational tug. German astronomer Johann Galle used calculations to help find Neptune in a telescope. Neptune is about 17 times as massive as Earth and has a rocky core.")
                        

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
    Neptune()
}
