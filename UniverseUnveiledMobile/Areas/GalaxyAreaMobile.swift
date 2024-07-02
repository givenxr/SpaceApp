//
//  GalaxyAreaMobile.swift
//  UniverseUnveiledMobile
//
//  Created by Given Mahlangu on 2024/03/08.
//


/*import SwiftUI
import RealityKit
//import RealityKitContent

struct GalaxyAreaMobile: View {
    /*@Environment(ViewModel.self) private var model
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace */
    
    var body: some View {
       // @Bindable var model = model
        
        ScrollView {
            VStack(spacing: 0) {
                // Background image with overlaying text
                
                /*Image("galaxypic5")
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
               // Spacer().frame(height: 20)

                // Title "Information"
                Text("THE MILKYWAY GALAXY")
                    //.font(.title)
                    .monospaced()
                    .font(.system(size: 30, weight: .bold))
                    .padding(.top, 50)
                    .foregroundColor(.white)
                
                
                Text("Home to billions of stars and celestial wonders, its spiral arms reveal clusters and cosmic mysteries.  The Milky Way, a vast spiral galaxy, graces our night sky with a river of stars. Our Sun is a mere spark within this cosmic metropolis, inviting us to contemplate the ancient light of distant stars and explore the boundless wonders of our cosmic heritage.")
                    .foregroundColor(.white)
                    .padding(20)
                    .font(.system(size: 15))
                    

                HStack{
                    // Paragraph with Lorem Ipsum placeholder
                    Text("Beneath the captivating canvas of the Milky Way lies a cosmic spectacle, a swirling sea of stars, planets, and celestial wonders. Our galaxy, a vast spiral of breathtaking beauty, is home to an estimated 100 to 400 billion stars, each with its own unique story. Among these stars, our Sun resides as an unassuming member, accompanied by a retinue of planets, including Earth, our cherished abode. The Milky Way's spiral arms, adorned with stellar nurseries and cosmic clouds, birth new stars and planetary systems in a perpetual dance of creation.")
                        .foregroundColor(.white)
                        .padding(25)
                        //.frame(width: 900, height: 230)
                        //.padding(.bottom, 20)
                        .font(.system(size: 15))
                    
                    /*EquipmentCard(isShowing: $model.isShowingFullGalaxy, toggleTitle: "Solar System", imageName: "galaxypic1") {
                        await  openImmersiveSpace(id: model.galaxyAreaView)
                    } dismissCard: {
                       await dismissImmersiveSpace()
                    }.padding(.trailing, 30)*/
                    
                    
                }.padding(30)
                
                        
                
                /*HStack(spacing: 20) {
                    Model3D(named: "solarsystem", bundle: realityKitContentBundle)
                        .frame(width: 100, height: 100)
                        .scaledToFit()
                        .padding(.top,20)
                        
                        
                }*/
                
                Text("Fun fact: It would take us about 100,000 years to traverse the Milky Way from one end to the other at the speed of light! As we peer into this celestial expanse, we witness the grandeur of our galactic neighborhood, a testament to the boundless wonders that unfold in the cosmic tapestry above.")
                    .foregroundColor(.white)
                    .padding(20)
                    .font(.system(size: 15))
                
                Image("galaxynight")
                            .resizable()
                            //.scaledToFill()
                            .frame(height: 400)
                
                Text("Earth and the Moon share a unique cosmic connection, dancing in a gravitational embrace that shapes the very fabric of our existence. Earth, our planetary home, is accompanied by one moon, a celestial partner in the vastness of space. This lunar companion influences our world in profound ways, orchestrating the ebb and flow of tides with its gravitational pull. The Moon's phases, from crescent to full, paint the night sky with a mesmerizing celestial ballet, inspiring poets, scientists, and dreamers throughout history. Beyond its poetic influence, the Moon plays a crucial role in stabilizing Earth's axial tilt, ensuring the consistency of our seasons. As humanity continues to explore space, the Moon remains a stepping stone, a beacon that beckons us to reach for the stars. This dynamic interplay between Earth and its solitary moon unfolds in an ongoing cosmic saga, inviting us to gaze upward and ponder the wonders of our celestial partnership")
                    .foregroundColor(.white)
                    .padding(30)
                    .font(.system(size: 15))
                    
                
                /*EquipmentCard(isShowing: $model.isShowingFullGalaxy, toggleTitle: "Solar System", imageName: "galaxypic1") {
                    await  openImmersiveSpace(id: model.galaxyAreaView)
                } dismissCard: {
                   await dismissImmersiveSpace()
                }.padding(.trailing, 30)
                .padding(.top, 30)*/
                
               /*EquipmentCard(isShowing: $model.isShowingFullRocket, toggleTitle: "Rocket (Full Immersive)", imageName: "Rocket") {
                    await openImmersiveSpace(id: model.fullRocketRealityArea)
                } dismissCard: {
                    await dismissImmersiveSpace()
                }.padding(.trailing, 30)
                 .padding(.top, 30)*/
                
                
                
            }
        }.background(Color.black.edgesIgnoringSafeArea(.all))
        /*.background(
            Image("galaxynight2")
                .resizable()
                .scaledToFill()
        ).edgesIgnoringSafeArea(.all)*/
    }
}

#Preview {
    GalaxyAreaMobile()
}*/


/*import SwiftUI
import RealityKit

struct GalaxyAreaMobile: View {
    @State private var isARPresented = false
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
       
        ScrollView {
            VStack(spacing: 0) {
                // Existing content...
                // Title "Information"
                Text("THE MILKYWAY GALAXY")
                    //.font(.title)
                    .monospaced()
                    .font(.system(size: 30, weight: .bold))
                    .padding(.top, 50)
                    .foregroundColor(.white)
                
                
                Text("Home to billions of stars and celestial wonders, its spiral arms reveal clusters and cosmic mysteries.  The Milky Way, a vast spiral galaxy, graces our night sky with a river of stars. Our Sun is a mere spark within this cosmic metropolis, inviting us to contemplate the ancient light of distant stars and explore the boundless wonders of our cosmic heritage.")
                    .padding(.horizontal, 5)
                    .padding()
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    

                HStack{
                    // Paragraph with Lorem Ipsum placeholder
                    Text("Beneath the captivating canvas of the Milky Way lies a cosmic spectacle, a swirling sea of stars, planets, and celestial wonders. Our galaxy, a vast spiral of breathtaking beauty, is home to an estimated 100 to 400 billion stars, each with its own unique story. Among these stars, our Sun resides as an unassuming member, accompanied by a retinue of planets, including Earth, our cherished abode. The Milky Way's spiral arms, adorned with stellar nurseries and cosmic clouds, birth new stars and planetary systems in a perpetual dance of creation.")
                        .padding(.horizontal, 5)
                        .padding()
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                    
                    
                    
                    /*EquipmentCard(isShowing: $model.isShowingFullGalaxy, toggleTitle: "Solar System", imageName: "galaxypic1") {
                        await  openImmersiveSpace(id: model.galaxyAreaView)
                    } dismissCard: {
                       await dismissImmersiveSpace()
                    }.padding(.trailing, 30)*/
                    
                    
                }.padding(30)
                // Button to show Earth in AR
                Button(action: {
                    isARPresented.toggle()
                }) {
                    Text("Show in AR")
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
                .sheet(isPresented: $isARPresented, content: {
                    ARViewContainer()
                })
                
                        
                
                /*HStack(spacing: 20) {
                    Model3D(named: "solarsystem", bundle: realityKitContentBundle)
                        .frame(width: 100, height: 100)
                        .scaledToFit()
                        .padding(.top,20)
                        
                        
                }*/
                
                Text("Fun fact: It would take us about 100,000 years to traverse the Milky Way from one end to the other at the speed of light! As we peer into this celestial expanse, we witness the grandeur of our galactic neighborhood, a testament to the boundless wonders that unfold in the cosmic tapestry above.")
                    .padding(.horizontal, 5)
                    .padding()
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                
                Image("galaxynight")
                            .resizable()
                            //.scaledToFill()
                            .frame(height: 400)
                
                Text("Earth and the Moon share a unique cosmic connection, dancing in a gravitational embrace that shapes the very fabric of our existence. Earth, our planetary home, is accompanied by one moon, a celestial partner in the vastness of space. This lunar companion influences our world in profound ways, orchestrating the ebb and flow of tides with its gravitational pull. The Moon's phases, from crescent to full, paint the night sky with a mesmerizing celestial ballet, inspiring poets, scientists, and dreamers throughout history. Beyond its poetic influence, the Moon plays a crucial role in stabilizing Earth's axial tilt, ensuring the consistency of our seasons. As humanity continues to explore space, the Moon remains a stepping stone, a beacon that beckons us to reach for the stars. This dynamic interplay between Earth and its solitary moon unfolds in an ongoing cosmic saga, inviting us to gaze upward and ponder the wonders of our celestial partnership")
                    .padding(.horizontal, 5)
                    .padding()
                    .foregroundColor(colorScheme == .dark ? .white : .black)

                
            }
        }
        //.background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct ARViewContainer: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            ARViewRepresentable()
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.down.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .padding()
                    }
                }
            }
        }
    }
}


struct ARViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)

        do {
            // Load the Earth model
            let earthModel = try ModelEntity.loadModel(named: "SolarSystem.usdz")

            // Add the Earth model to the scene
            let anchor = AnchorEntity(world: [0, -2, -2]) // Place the Earth slightly in front of the camera
            anchor.addChild(earthModel)
            arView.scene.anchors.append(anchor)
        } catch {
            // Handle the error
            print("Failed to load the Earth model:", error)
        }

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
}

struct GalaxyAreaMobile_Previews: PreviewProvider {
    static var previews: some View {
        GalaxyAreaMobile()
    }
} */


import SwiftUI
import RealityKit
import ARKit

struct GalaxyAreaMobile: View {
    @State private var isARPresented = false
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedFact = 0
    
    let galaxyFacts = [
        "The Milky Way is estimated to contain 100-400 billion stars.",
        "Our galaxy is approximately 100,000 light-years in diameter.",
        "The Milky Way is moving through space at approximately 600 km/s.",
        "There may be up to 400 billion planets in our galaxy.",
        "The center of our galaxy contains a supermassive black hole named Sagittarius A*.",
        "The Milky Way is part of the Local Group, a collection of about 54 galaxies.",
        "Our galaxy completes one rotation every 225-250 million years."
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Title
                Text("THE MILKY WAY GALAXY")
                    .font(.custom("SpaceGrotesk-Bold", size: fontSizeForDevice(sizeForiPhone: 30, sizeForiPad: 50)))
                    .foregroundColor(.white)
                    .padding(.top, 50)
                    .shadow(color: .blue, radius: 2, x: 0, y: 2)
                
                // Galaxy Image Placeholder
                Image(systemName: "sparkles")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(15)
                
                // Introduction
                Text("Our cosmic home, a vast spiral of stars, gas, and dust, spinning through the universe.")
                    .padding(.horizontal)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .font(.custom("SpaceGrotesk-Regular", size: fontSizeForDevice(sizeForiPhone: 16, sizeForiPad: 22)))
                    .multilineTextAlignment(.center)

                // Main description
                Text("The Milky Way is a barred spiral galaxy, one of billions in the observable universe. Its name comes from its appearance as a milky band of light in the night sky, formed from stars that cannot be individually distinguished by the naked eye. Our galaxy consists of a thick disk of stars orbiting a central bulge, all surrounded by a vast halo of dark matter.")
                    .padding()
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .font(.custom("SpaceGrotesk-Regular", size: fontSizeForDevice(sizeForiPhone: 14, sizeForiPad: 20)))
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(10)

                // AR Button
                Button(action: {
                    isARPresented.toggle()
                }) {
                    HStack {
                        Image(systemName: "arkit")
                        Text("Explore Galaxy in AR")
                    }
                    .frame(width: buttonWidthForDevice(), height: buttonHeightForDevice())
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(color: .blue.opacity(0.5), radius: 5, x: 0, y: 5)
                }
                .sheet(isPresented: $isARPresented, content: {
                    ARViewContainer()
                })
                
                // Galaxy facts carousel
                VStack {
                    Text("Galactic Facts")
                        .font(.custom("SpaceGrotesk-Bold", size: fontSizeForDevice(sizeForiPhone: 18, sizeForiPad: 24)))
                        .foregroundColor(.white)
                        .padding(.top)
                    
                    TabView(selection: $selectedFact) {
                        ForEach(0..<galaxyFacts.count, id: \.self) { index in
                            Text(galaxyFacts[index])
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(10)
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .frame(height: 150)
                }
                .background(Color.black.opacity(0.7))
                .cornerRadius(15)
                .padding()
                
                // Galactic Structure Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Galactic Structure")
                        .font(.custom("SpaceGrotesk-Bold", size: fontSizeForDevice(sizeForiPhone: 18, sizeForiPad: 24)))
                        .foregroundColor(.white)
                    
                    Text("• Spiral Arms: The Milky Way has several major spiral arms, including the Orion Arm where our Solar System is located.")
                    Text("• Galactic Bulge: A dense concentration of stars at the galaxy's center.")
                    Text("• Galactic Halo: A spherical region surrounding the galactic disk, containing globular clusters and dark matter.")
                    Text("• Supermassive Black Hole: At the very center, Sagittarius A* with a mass of about 4 million suns.")
                }
                .padding()
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .font(.custom("SpaceGrotesk-Regular", size: fontSizeForDevice(sizeForiPhone: 14, sizeForiPad: 20)))
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
                
                // Milky Way Visualization Placeholder
                Rectangle()
                    .fill(Color.blue.opacity(0.2))
                    .frame(height: imageHeightForDevice())
                    .overlay(
                        Text("Milky Way Visualization")
                            .foregroundColor(.white)
                            .font(.custom("SpaceGrotesk-Bold", size: 20))
                    )
                    .cornerRadius(15)
                    .padding()
                
                // Additional information
                Text("Our Solar System is located about 27,000 light-years from the Galactic Center, on the inner edge of the Orion Arm. We complete one orbit around the galactic center every 225-250 million years, a period known as a Galactic Year.")
                    .padding()
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .font(.custom("SpaceGrotesk-Regular", size: fontSizeForDevice(sizeForiPhone: 14, sizeForiPad: 20)))
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(10)
            }
            .padding(.bottom, 50)
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.black, .blue.opacity(0.8), .black.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
        )
    }
    
    // Helper functions
    func fontSizeForDevice(sizeForiPhone: CGFloat, sizeForiPad: CGFloat) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == .pad ? sizeForiPad : sizeForiPhone
    }

    func buttonWidthForDevice() -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == .pad ? 300 : 200
    }

    func buttonHeightForDevice() -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == .pad ? 75 : 50
    }

    func imageHeightForDevice() -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == .pad ? 600 : 400
    }
}

// Galaxy SVG
struct GalaxySVG: View {
    var body: some View {
        Image(systemName: "sparkles")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

// ARViewContainer
struct ARViewContainer: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            ARViewRepresentable()
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.down.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .padding()
                    }
                }
            }
        }
    }
}

// ARViewRepresentable
struct ARViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)

        do {
            // Load the Earth model
            let earthModel = try ModelEntity.loadModel(named: "SolarSystem.usdz")

            // Add the Earth model to the scene
            let anchor = AnchorEntity(world: [0, -2, -2]) // Place the Earth slightly in front of the camera
            anchor.addChild(earthModel)
            arView.scene.anchors.append(anchor)
        } catch {
            // Handle the error
            print("Failed to load the Earth model:", error)
        }

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
}

struct GalaxyAreaMobile_Previews: PreviewProvider {
    static var previews: some View {
        GalaxyAreaMobile()
    }
}
