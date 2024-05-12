import SwiftUI
import SceneKit
import RealityKit

struct Mercurry: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @State private var isHovered = false
    var planet: Planets = .Mercury

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
                                
                            
                        }
                        Divider()

                        Text("Mercury Facts")
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
                            Text("for the messenger of the Roman gods")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .padding(.bottom, 20)
                            //Text("_________________________")
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Diameter")
                                .bold()
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            Text("3,031 miles (4,878 km)")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            //Divider()
                                .padding(.bottom, 20)
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Surface Gravity")
                                .bold()
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            Text("3.7 m/s²")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Orbit")
                                .bold()
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            Text("88 Earth days")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Day")
                                .bold()
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            Text("58.6 Earth days")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Number of moons")
                                .bold()
                                .foregroundColor(.white)
                            Text("0")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .padding(.bottom, 20)
                        }
                        
                        Text("Information")
                            .monospaced()
                            .font(.system(size: 40, weight: .bold))
                            .padding(.top, 50)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .padding(.bottom, 30)
                        
                        Text("Mercury is the closest planet to the sun and the smallest planet in the solar system — it is only a little larger than Earth's moon. Mercury zips around the sun in only 88 days and because it is so close to our star (about two-fifths the distance between Earth and the sun). \n \nMercury experiences dramatic changes in its day and night temperatures. Mercury temperatures can reach a scorching 840 F (450 C) in the day, which is hot enough to melt lead. Meanwhile, on the night side, temperatures drop to minus 290 F (minus 180 C). \n\nMercury's atmosphere is very thin and primarily composed of oxygen, sodium, hydrogen, helium and potassium. Because the atmosphere is so thin it cannot incoming meteors, its surface is therefore pockmarked with craters, just like our moon. \n\nOver its four-year mission, NASA's MESSENGER spacecraft revealed incredible discoveries that challenged astronomers' expectations. Among those findings was the discovery of water ice and frozen organic compounds at Mercury's north pole and that volcanism played a major role in shaping the planet's surface. ").foregroundColor(colorScheme == .dark ? .white : .black)
                            .padding(.horizontal, 5)
                        

                    }
                    .padding()
                    
                }
            }
        }
        //.background(Color.black.edgesIgnoringSafeArea(.all))
        .padding(.leading, 5)
        .onAppear {
            // Additional setup if needed when the view appears
        }
    }
}

#Preview {
    Mercurry()
}
