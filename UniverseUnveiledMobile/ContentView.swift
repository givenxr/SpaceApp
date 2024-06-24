//
//  ContentView.swift
//  UniverseUnveiledMobile
//
//  Created by Given Mahlangu on 2024/02/27.
//


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
    let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Animated star background
                StarFieldView()
                
                ScrollView {
                    VStack(spacing: 20) {
                        // Top section with an image
                        Image("galaxynight")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay(
                                VStack {
                                    Text("Welcome to")
                                        .font(.system(size: 30, weight: .bold, design: .rounded))
                                    Text("Universe Unveiled")
                                        .font(.system(size: 40, weight: .bold, design: .rounded))
                                }
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.black.opacity(0.6))
                                .cornerRadius(15)
                            )
                            .shadow(color: .purple.opacity(0.3), radius: 10, x: 0, y: 5)
                        
                        // Button Section
                        LazyVGrid(columns: gridItems, spacing: 20) {
                            NavigationButton(title: "Planets", color: .blue, destination: PlanetsAreaMobile())
                            NavigationButton(title: "Earth", color: .green, destination: EarthAreaMobile())
                            NavigationButton(title: "Galaxy", color: .orange, destination: GalaxyAreaMobile())
                            NavigationButton(title: "Equipment", color: .red, destination: EquipmentAreaMobile())
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                }
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}

struct NavigationButton<Destination: View>: View {
    let title: String
    let color: Color
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination:
            destination
                .navigationBarTitle(title, displayMode: .inline)
                .navigationBarBackButtonHidden(false)
        ) {
            VStack {
                Image(systemName: iconName)
                    .font(.system(size: 40))
                Text(title)
                    .font(.headline)
            }
            .frame(minWidth: 150, minHeight: 150)
            .background(
                LinearGradient(gradient: Gradient(colors: [color, color.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .foregroundColor(.white)
            .cornerRadius(20)
            .shadow(color: color.opacity(0.5), radius: 5, x: 0, y: 3)
        }
    }
    
    var iconName: String {
        switch title {
        case "Planets": return "globe"
        case "Earth": return "leafy.green"
        case "Galaxy": return "sparkles"
        case "Equipment": return "camera"
        default: return "star"
        }
    }
}

// StarFieldView and Star structs remain unchanged

struct StarFieldView: View {
    @State private var stars: [Star] = []
    
    var body: some View {
        GeometryReader { geometry in
            ForEach(stars) { star in
                Circle()
                    .fill(Color.white)
                    .frame(width: star.size, height: star.size)
                    .position(star.position)
                    .opacity(star.opacity)
            }
        }
        .onAppear {
            createStars()
        }
    }
    
    func createStars() {
        for _ in 0..<100 {
            stars.append(Star())
        }
    }
}

struct Star: Identifiable {
    let id = UUID()
    let size: CGFloat = CGFloat.random(in: 1...3)
    let position = CGPoint(x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                           y: CGFloat.random(in: 0...UIScreen.main.bounds.height))
    let opacity = Double.random(in: 0.2...1)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
