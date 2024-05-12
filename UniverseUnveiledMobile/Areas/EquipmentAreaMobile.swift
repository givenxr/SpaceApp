//
//  EquipmentAreaMobile.swift
//  UniverseUnveiledMobile
//
//  Created by Given Mahlangu on 2024/03/08.
//


import SwiftUI
import WebKit
import RealityKit

struct EquipmentAreaMobile: View {
    /*@Environment(ViewModel.self) private var model
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace*/
    @State private var isARPresentedCapsule = false // State variable for Capsule AR view
    @State private var isARPresentedRocket = false // State variable for Rocket AR view
    @Environment(\.colorScheme) var colorScheme

    
    var body: some View {
        //@Bindable var model = model
        @Environment(\.colorScheme) var colorScheme
        
        
        ScrollView{
            Text("Space Exploration \n Equipment")
                .monospaced()
                .font(.system(size: 30, weight: .bold))
                .padding(.top, 50)
                .multilineTextAlignment(.center)
                //.foregroundColor(colorScheme == .dark ? .white : .black)
            
            VStack {
                
                VStack{
                    Text("DRAGON")
                        .monospaced()
                        .font(.system(size: 30, weight: .bold))
                        .padding(.top, 50)
                        //.foregroundColor(colorScheme == .dark ? .white : .black)
                    Text("SENDING HUMANS AND CARGO INTO SPACE")
                        //.foregroundColor(colorScheme == .dark ? .white : .black)
                        .padding(.bottom, 50)
                        
                    VStack{
                        
                        Text("The Dragon spacecraft is capable of carrying up to 7 passengers to and from Earth orbit, and beyond. It is the only spacecraft currently flying that is capable of returning significant amounts of cargo to Earth, and is the first private spacecraft to take humans to the space station. \n\nThe Dragon spacecraft is equipped with 16 Draco thrusters used to orient the spacecraft during the mission, including apogee/perigee maneuvers, orbit adjustment and attitude control. Each Draco thruster is capable of generating 90 pounds of force in the vacuum of space.")
                            //.foregroundColor(colorScheme == .dark ? .white : .black)
                        
                        /*EquipmentCard(isShowing: $model.isShowingRocketCapsule, toggleTitle: "Rocket Capsule", imageName: "Capsule") {
                            openWindow(id: model.capsuleRealityAreaId)
                        } dismissCard: {
                            dismissWindow(id: model.capsuleRealityAreaId)
                        }.padding(.trailing, 30)
                        .padding(.top, 30)*/
                        
                    }.padding(.leading, 30)
                    .padding(.trailing, 30)

                    
                    
                    
                    Text("View the Crew Dragon Interior")
                        .monospaced()
                        .font(.system(size: 20, weight: .bold))
                        .padding(.bottom, 30)
                        .padding(.top, 30)
                        //.foregroundColor(colorScheme == .dark ? .white : .black)
                    
                    YouTubeView(videoID: "78ATfCaBn6E").frame(width: 360, height: 500)
                    // Button to show Earth in AR
                    Button(action: {
                                    isARPresentedCapsule.toggle()
                                }) {
                                    Text("Show Capsule in AR")
                                        .frame(width: 200, height: 50)
                                        .background(Color.blue)
                                        .foregroundColor(colorScheme == .dark ? .white : .black)
                                        .cornerRadius(10)
                                        .padding()
                                }
                                .sheet(isPresented: $isARPresentedCapsule, content: {
                                    ARViewContainer1(modelName: "Capsule")
                                })


                    
                    Divider()
                    
                    Text("FALCON 9")
                        .monospaced()
                        .font(.system(size: 30, weight: .bold))
                        .padding(.top, 50)
                        //.foregroundColor(colorScheme == .dark ? .white : .black)
                    
                    Text("FIRST ORBITAL CLASS ROCKET CAPABLE OF REFLIGHT")
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 30)
                        //.foregroundColor(colorScheme == .dark ? .white : .black)
                    
                    VStack{
                        Image("galaxynight")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 250, height: 250)
                        
                        Text("Falcon 9 is a reusable, two-stage rocket designed and manufactured by SpaceX for the reliable and safe transport of people and payloads into Earth orbit and beyond. Falcon 9 is the world’s first orbital class reusable rocket. Reusability allows SpaceX to refly the most expensive parts of the rocket, which in turn drives down the cost of space access.")
                            .padding(.leading, 30)
                            .padding(.trailing, 50)
                            //.foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    VStack{
                        Text("The Falcon 9 rocket is powered by the Merlin rocket engines. The Falcon 9 typically has nine Merlin engines in its first stage and a single Merlin Vacuum engine in its second stage. These engines run on rocket-grade kerosene (RP-1) and liquid oxygen (LOX) propellants. \n\nThe Merlin engines are known for their efficiency and reliability, contributing to the success of the Falcon 9 as a versatile and reusable launch vehicle. SpaceX has been actively working on improving and evolving its rocket technology, and the Falcon 9 is an important part of their family of launch vehicles.")
                            .padding(.leading, 30)
                            .padding(.trailing, 50)
                            //.foregroundColor(colorScheme == .dark ? .white : .black)
                        
                       /* EquipmentCard(isShowing: $model.isShowingFullRocket, toggleTitle: "Rocket (Full Immersive)", imageName: "Rocket") {
                            await openImmersiveSpace(id: model.fullRocketRealityArea)
                        } dismissCard: {
                            await dismissImmersiveSpace()
                        }.padding(.trailing, 30)
                         .padding(.top, 30)*/
            
                        
                        
                        }
                    
                    Text("View the Crew Dragon Interior")
                        .monospaced()
                        .font(.system(size: 20, weight: .bold))
                        .padding(.top, 50)
                        .padding(.bottom, 30)
                        //.foregroundColor(colorScheme == .dark ? .white : .black)
                    
                    YouTubeView(videoID: "Z4TXCZG_NEY").frame(width: 360, height: 500)
                }
                
                Button(action: {
                                isARPresentedRocket.toggle()
                            }) {
                                Text("Show Rocket in AR")
                                    .frame(width: 200, height: 50)
                                    .background(Color.blue)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                    .cornerRadius(10)
                                    .padding()
                            }
                            .sheet(isPresented: $isARPresentedRocket, content: {
                                ARViewContainer1(modelName: "Rocket")
                            })

                
              
                
                
                
                /*EquipmentCard(isShowing: $model.isShowingMixedRocket, toggleTitle: "Rocket (Mixed Immersive Space)", imageName: "equipment-mixedrocket") {
                    await openImmersiveSpace(id: model.mixedRocketRealityArea)
                } dismissCard: {
                    await dismissImmersiveSpace()
                }*/
            }
        }/*.background(Color.black.edgesIgnoringSafeArea(.all))
        .background(
            Image("galaxynight2")
                .resizable()
                .scaledToFill()
            )*/

    }
}

struct YouTubeView: UIViewRepresentable {
    var videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)")
        uiView.load(URLRequest(url: youtubeURL!))
    }
}

struct ARViewContainer1: View {
    @Environment(\.presentationMode) var presentationMode
    let modelName: String // Add modelName property
    
    var body: some View {
        @Environment(\.colorScheme) var colorScheme

        ZStack {
            ARViewRepresentable1(modelName: modelName) // Pass modelName to ARViewRepresentable1
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
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .padding()
                    }
                }
            }
        }
    }
}

struct ARViewRepresentable1: UIViewRepresentable {
    let modelName: String // Add modelName property
    
    init(modelName: String) { // Initialize modelName
        self.modelName = modelName
    }
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)

        do {
            // Load the model based on modelName
            let modelEntity = try ModelEntity.loadModel(named: modelName + ".usdz")

            // Add the model to the scene
            let anchor = AnchorEntity(world: [0, -2, -2]) // Place the model slightly in front of the camera
            anchor.addChild(modelEntity)
            arView.scene.anchors.append(anchor)
        } catch {
            // Handle the error
            print("Failed to load the model:", error)
        }

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
}




#Preview {
    EquipmentAreaMobile()
}
