import SwiftUI
import RealityKitContent
import RealityKit

struct Mercurry: View {
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
                            Text("for the messenger of the Roman gods")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                            //Text("_________________________")
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Diameter")
                                .bold()
                                .foregroundColor(.white)
                            Text("3,031 miles (4,878 km)")
                                .foregroundColor(.white)
                            //Divider()
                                .padding(.bottom, 20)
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Surface Gravity")
                                .bold()
                                .foregroundColor(.white)
                            Text("3.7 m/s²")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Orbit")
                                .bold()
                                .foregroundColor(.white)
                            Text("88 Earth days")
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Day")
                                .bold()
                                .foregroundColor(.white)
                            Text("58.6 Earth days")
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
                        
                        Text("Mercury is the closest planet to the sun and the smallest planet in the solar system — it is only a little larger than Earth's moon. Mercury zips around the sun in only 88 days and because it is so close to our star (about two-fifths the distance between Earth and the sun). \n \n Mercury experiences dramatic changes in its day and night temperatures. Mercury temperatures can reach a scorching 840 F (450 C) in the day, which is hot enough to melt lead. Meanwhile, on the night side, temperatures drop to minus 290 F (minus 180 C). \n\n Mercury's atmosphere is very thin and primarily composed of oxygen, sodium, hydrogen, helium and potassium. Because the atmosphere is so thin it cannot incoming meteors, its surface is therefore pockmarked with craters, just like our moon. \n\n Over its four-year mission, NASA's MESSENGER spacecraft revealed incredible discoveries that challenged astronomers' expectations. Among those findings was the discovery of water ice and frozen organic compounds at Mercury's north pole and that volcanism played a major role in shaping the planet's surface. ")
                        

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
    Mercurry()
}
