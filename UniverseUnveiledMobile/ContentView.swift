//
//  ContentView.swift
//  UniverseUnveiledMobile
//
//  Created by Given Mahlangu on 2024/02/27.
//

import SwiftUI
//import RealityKitContent
import RealityKit

/*struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Image("galaxynight").resizable()
            
        }
    }
}*/

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            VStack {
                // Top section with an image
                Image("galaxynight")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300) // Adjust the height as needed
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        Text("Welcome to \n Universe Unveiled")
                            .font (.system(size: 40, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                            .offset(y: -50)
                    )
                
                // Button Section
                VStack {
                    HStack{
                        NavigationLink(destination: PlanetsAreaMobile().navigationBarHidden(true)) {
                            Text("Planets")
                                .frame(width: 150, height: 150)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: EarthAreaMobile().navigationBarHidden(true)) {
                            Text("Earth")
                                .frame(width: 150, height: 150)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    
                    HStack{
                        NavigationLink(destination: GalaxyAreaMobile().navigationBarHidden(true)) {
                            Text("Galaxy")
                                .frame(width: 150, height: 150)
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: EquipmentAreaMobile().navigationBarHidden(true)) {
                            Text("Equipment")
                                .frame(width: 150, height: 150)
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .navigationBarBackButtonHidden(true) // Hide back button
            
        }
    }
}


#Preview {
    ContentView()
}
