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


import SwiftUI
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
}
