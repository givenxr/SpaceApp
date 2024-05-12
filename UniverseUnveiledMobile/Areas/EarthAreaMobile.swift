//
//  EarthAreaMobile.swift
//  UniverseUnveiledMobile
//
//  Created by Given Mahlangu on 2024/03/08.
//

//
//  EarthArea.swift
//  Universe Unveiled Mobile
//
//  Created by Given Mahlangu on 2024/02/29.
//

import SwiftUI
import RealityKit
//import RealityKitContent

struct EarthAreaMobile: View {
    @State private var isShowingAR = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
    ScrollView {
        VStack(spacing: 0) {
            // Background image with overlaying text
           /* Image("galaxypic1")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 100)
                                .overlay(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.black, .clear
                                                                   ]),
                                        startPoint: .bottom,
                                        endPoint: .top
                                    )
                                    .frame(height: 250)
                                    .offset(y: 200) // Adjust the offset as needed
                                    )*/

            // Gap
            Spacer().frame(height: 20)

            // Title "Information"
            /*Text("EARTH")
                //.font(.title)
                .monospaced()
                .font(.system(size: 30, weight: .bold))
                .padding(.top, 50)
                .foregroundColor(.white)*/
            
            
            
            Text("Discover the wonders of our home planet, Earth. It is the only known inhabitable planet for humans, providing the perfect conditions for life.")
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .padding(.bottom, 40)
                .padding(.top, 30)
                .font(.system(size: 20, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 10)
                


            // 3D elements
           /* HStack(spacing: 20) {
                Model3D(named: "Earth", bundle: realityKitContentBundle)
                    .frame(width: 500, height: 300)
                    .scaledToFit()
                    .padding(.top,20)
                    .rotationEffect(.degrees(AnimatedRotation()))

                Model3D(named: "Pluto", bundle: realityKitContentBundle)
                    .frame(width: 500, height: 500)
                    .scaledToFit()*/
            }
            .padding()
        
        HStack{
            Text("Earth, our celestial oasis, is a vibrant blue gem in the cosmos. With diverse ecosystems, vast oceans, and a life-sustaining atmosphere, it orbits the sun, accompanied by its faithful companion, the Moon, illuminating the night sky.\n\nThe Moon, Earth's only natural satellite, plays a vital role in our planet's dynamics. Its gravitational forces shape ocean tides, stabilize Earth's rotation, and contribute to climate stability. The Moon's presence has significant ecological benefits, influencing biodiversity and providing optimal conditions for life to flourish.")
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .padding(.horizontal, 5)
               
            
            
            
            
            /*HStack(spacing: 20) {
                Model3D(named: "Earthmoon", bundle: realityKitContentBundle)
                    .frame(width: 400, height: 200)
                    .scaledToFit()
                    .padding(.top,20)
                    .padding(.bottom,20)
        }.padding(.bottom, 50)*/
        
            

                /*Model3D(named: "Pluto", bundle: realityKitContentBundle)
                    .frame(width: 500, height: 500)
                    .scaledToFit()*/
            }
            .padding()
        Button(action: {
                           isShowingAR.toggle()
                       }) {
                           Text("Show in AR")
                               .foregroundColor(colorScheme == .dark ? .white : .black)
                               .padding()
                               .background(Color.blue)
                               .cornerRadius(10)
                       }
                       .padding(.bottom, 20)
                       .sheet(isPresented: $isShowingAR, content: {
                           ARViewContainer()
                       })
        
        Text("WATER")
            //.font(.title)
            .monospaced()
            .font(.system(size: 30, weight: .bold))
            .padding(.top, 50)
            .padding(.bottom, 10)
            .foregroundColor(colorScheme == .dark ? .white : .black)
        
        VStack{
            Image("water")
                .resizable()
                .frame(width: 300, height: 300)
                .padding(.horizontal, 20)
            
            Text("Known as the 'Blue Marble,' Earth showcases a beautiful blue appearance from outer space, mainly because of its oceans that cover about 70% of the surface. These oceans, like the Pacific, Atlantic, Indian, Southern, and Arctic, create the striking blue color we see. They're not just a visual wonder; they're crucial for life. \n\nUnderneath the surface, the oceans host a variety of life, from tiny creatures to large marine animals. Besides being home to diverse species, the oceans help control the Earth's climate. The way they move, their temperatures, and the life they hold all work together to influence the weather and maintain a balance that supports life on our planet. So, when we look at the 'Blue Marble,' it's more than just a pretty sight – it's a reflection of the vibrant life and interconnected systems that make Earth a special place.")
                    .padding(.horizontal, 15)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
            
        }.padding(.horizontal, 5)
        Text("Diverse Ecosystems")
            //.font(.title)
            .monospaced()
            .font(.system(size: 30, weight: .bold))
            .padding(.top, 50)
            .padding(.bottom, 10)
            .foregroundColor(colorScheme == .dark ? .white : .black)
        VStack{
            Text("Known as the 'Blue Marble,' Earth showcases a beautiful blue appearance from outer space, mainly because of its oceans that cover about 70% of the surface. These oceans, like the Pacific, Atlantic, Indian, Southern, and Arctic, create the striking blue color we see. They're not just a visual wonder; they're crucial for life. \n\nUnderneath the surface, the oceans host a variety of life, from tiny creatures to large marine animals. Besides being home to diverse species, the oceans help control the Earth's climate. The way they move, their temperatures, and the life they hold all work together to influence the weather and maintain a balance that supports life on our planet. So, when we look at the 'Blue Marble,' it's more than just a pretty sight – it's a reflection of the vibrant life and interconnected systems that make Earth a special place.")
                    .padding(.horizontal, 15)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
            
            Image("biodiversity")
                .resizable()
                .frame(width: 300, height: 300)
                .padding(.trailing, 20)
            
            
        }.padding(.horizontal, 5)
        Text("Population")
            //.font(.title)
            .monospaced()
            .font(.system(size: 30, weight: .bold))
            .padding(.top, 50)
            .padding(.bottom, 10)
            .foregroundColor(colorScheme == .dark ? .white : .black)
        VStack{
            Text("Known as the 'Blue Marble,' Earth showcases a beautiful blue appearance from outer space, mainly because of its oceans that cover about 70% of the surface. These oceans, like the Pacific, Atlantic, Indian, Southern, and Arctic, create the striking blue color we see. They're not just a visual wonder; they're crucial for life. \n\nUnderneath the surface, the oceans host a variety of life, from tiny creatures to large marine animals. Besides being home to diverse species, the oceans help control the Earth's climate. The way they move, their temperatures, and the life they hold all work together to influence the weather and maintain a balance that supports life on our planet. So, when we look at the 'Blue Marble,' it's more than just a pretty sight – it's a reflection of the vibrant life and interconnected systems that make Earth a special place.")
                    .padding(.horizontal, 15)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
            
            Image("Population2")
                .resizable()
                .frame(width: 320, height: 300)
                .padding(.trailing, 20)
            
            
        }.padding(.horizontal, 5)
        
            /*Text("Earth and the Moon share a unique cosmic connection, dancing in a gravitational embrace that shapes the very fabric of our existence. Earth, our planetary home, is accompanied by one moon, a celestial partner in the vastness of space. This lunar companion influences our world in profound ways, orchestrating the ebb and flow of tides with its gravitational pull. The Moon's phases, from crescent to full, paint the night sky with a mesmerizing celestial ballet, inspiring poets, scientists, and dreamers throughout history. Beyond its poetic influence, the Moon plays a crucial role in stabilizing Earth's axial tilt, ensuring the consistency of our seasons. As humanity continues to explore space, the Moon remains a stepping stone, a beacon that beckons us to reach for the stars. This dynamic interplay between Earth and its solitary moon unfolds in an ongoing cosmic saga, inviting us to gaze upward and ponder the wonders of our celestial partnership")
                .foregroundColor(.white)
                .padding(15)
                .frame(width: 900, height: 400)
                .padding(.top, 20)
                .font(.system(size: 25))*/
        }//.background(Color.black.edgesIgnoringSafeArea(.all))
    }
    /*.background(
        Image("galaxynight2")
            .resizable()
            .scaledToFill()
    ).edgesIgnoringSafeArea(.all)*/
}




func AnimatedRotation() -> Double {
    withAnimation(Animation.linear(duration: 10).repeatForever(autoreverses: false)) {
        return 360
    }
}




#Preview {
    EarthAreaMobile()
}
