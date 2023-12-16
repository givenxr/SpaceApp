//
//  EquipmentArea.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2023/12/20.
//

/* import SwiftUI
import RealityKit
import RealityKitContent

struct EquipmentArea: View {
    
    @Environment (ViewModel.self) private var model
    
    @Environment(\.openWindow) private var openWindow
    @Environment (\.dismissWindow) private var dismissWindow
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment (\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    
    var body: some View {
        @Bindable var model = model
        Text("This is the equipment used to explore space")
            .foregroundColor(.white)
            .padding(.bottom, 40)
            .padding(.top, 30)
            .font(.system(size: 20, weight: .bold))
        
        HStack{
            VStack{
                
                Image("Capsule")
                    .resizable()
                    .frame(width:300, height: 300)
                    .padding(20)
                
                /*Model3D(named: "Milkyway")
                 //s.resizable()
                 .frame(width: 100, height: 100)
                 .scaledToFit()*/
                
                Toggle(model.isShowingRocketCapsule ? "Hide Rocket Capsule(Volumetric)" : "Show Rocket Capsule (Volumetric)", isOn : $model.isShowingRocketCapsule)
                    .onChange(of: model.isShowingRocketCapsule){
                        _,isShowing in if isShowing{
                            //openwindow vol
                            //openWindow()
                        }
                        else
                        {
                            //dismiss vol
                        }
                    }
                    .toggleStyle(.button)
                    .padding(25)
            }.glassBackgroundEffect()
                
                VStack{
                    Image("Rocket")
                        .resizable()
                        .frame(width:300, height: 300)
                        .padding(20)
                    
                    Toggle(model.isShowingFullRocket ? "Hide Full Rocket (Full Immersed)" : "Show Full Rocket  (Full immersed)", isOn : $model.isShowingFullRocket)
                        .onChange(of: model.isShowingFullRocket){
                            _,isShowing in if isShowing{
                                //openwindow vol
                            }
                            else
                            {
                                //dismiss vol
                            }
                        }
                        .toggleStyle(.button)
                        .padding(25)
                }
                .glassBackgroundEffect()
            }
            
        }
    }



#Preview {
    EquipmentArea()
        .environment(ViewModel())
} */

//
//  EquipmentArea.swift
//  Inspiration4
//
//  Created by Dilmer Valecillos on 9/16/23.
//

import SwiftUI
import WebKit

struct EquipmentArea: View {
    @Environment(ViewModel.self) private var model
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    var body: some View {
        @Bindable var model = model
        
        ScrollView{
            Text("Space Exploration Equipment")
                .monospaced()
                .font(.system(size: 40, weight: .bold))
                .padding(.top, 50)
                .foregroundColor(.white)
            
            HStack {
                
                VStack{
                    Text("DRAGON")
                        .monospaced()
                        .font(.system(size: 30, weight: .bold))
                        .padding(.top, 50)
                        .foregroundColor(.white)
                    Text("SENDING HUMANS AND CARGO INTO SPACE")
                        
                    HStack{
                        
                        Text("The Dragon spacecraft is capable of carrying up to 7 passengers to and from Earth orbit, and beyond. It is the only spacecraft currently flying that is capable of returning significant amounts of cargo to Earth, and is the first private spacecraft to take humans to the space station. \n\nThe Dragon spacecraft is equipped with 16 Draco thrusters used to orient the spacecraft during the mission, including apogee/perigee maneuvers, orbit adjustment and attitude control. Each Draco thruster is capable of generating 90 pounds of force in the vacuum of space.")
                            .padding(.leading, 30)
                            .padding(.trailing, 30)
                        
                        EquipmentCard(isShowing: $model.isShowingRocketCapsule, toggleTitle: "Rocket Capsule", imageName: "Capsule") {
                            openWindow(id: model.capsuleRealityAreaId)
                        } dismissCard: {
                            dismissWindow(id: model.capsuleRealityAreaId)
                        }.padding(.trailing, 30)
                        .padding(.top, 30)
                    }
                    
                    
                    
                    Text("View the Crew Dragon Interior")
                        .monospaced()
                        .font(.system(size: 20, weight: .bold))
                        .padding(.bottom, 30)
                        .padding(.top, 30)
                        .foregroundColor(.white)
                    YouTubeView(videoID: "https://youtu.be/78ATfCaBn6E").frame(width: 800, height: 500)
                    
                    Divider()
                    
                    Text("FALCON 9")
                        .monospaced()
                        .font(.system(size: 30, weight: .bold))
                        .padding(.top, 50)
                        .foregroundColor(.white)
                    
                    Text("FIRST ORBITAL CLASS ROCKET CAPABLE OF REFLIGHT")
                        .padding(.bottom, 30)
                    
                    HStack{
                        Image("Falcon2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 250, height: 250)
                        
                        Text("Falcon 9 is a reusable, two-stage rocket designed and manufactured by SpaceX for the reliable and safe transport of people and payloads into Earth orbit and beyond. Falcon 9 is the world’s first orbital class reusable rocket. Reusability allows SpaceX to refly the most expensive parts of the rocket, which in turn drives down the cost of space access.")
                            .padding(.leading, 30)
                            .padding(.trailing, 50)
                    }
                    HStack{
                        Text("The Falcon 9 rocket is powered by the Merlin rocket engines. The Falcon 9 typically has nine Merlin engines in its first stage and a single Merlin Vacuum engine in its second stage. These engines run on rocket-grade kerosene (RP-1) and liquid oxygen (LOX) propellants. \n\nThe Merlin engines are known for their efficiency and reliability, contributing to the success of the Falcon 9 as a versatile and reusable launch vehicle. SpaceX has been actively working on improving and evolving its rocket technology, and the Falcon 9 is an important part of their family of launch vehicles.")
                            .padding(.leading, 30)
                            .padding(.trailing, 50)
                        
                        EquipmentCard(isShowing: $model.isShowingFullRocket, toggleTitle: "Rocket (Full Immersive)", imageName: "Rocket") {
                            await openImmersiveSpace(id: model.fullRocketRealityArea)
                        } dismissCard: {
                            await dismissImmersiveSpace()
                        }.padding(.trailing, 30)
                         .padding(.top, 30)
            
                        
                        
                        }
                    
                    Text("View the Crew Dragon Interior")
                        .monospaced()
                        .font(.system(size: 20, weight: .bold))
                        .padding(.top, 50)
                        .padding(.bottom, 30)
                        .foregroundColor(.white)
                    
                    YouTubeView(videoID: "https://youtu.be/Z4TXCZG_NEY").frame(width: 800, height: 500)
                }
                
              
                
                
                
                /*EquipmentCard(isShowing: $model.isShowingMixedRocket, toggleTitle: "Rocket (Mixed Immersive Space)", imageName: "equipment-mixedrocket") {
                    await openImmersiveSpace(id: model.mixedRocketRealityArea)
                } dismissCard: {
                    await dismissImmersiveSpace()
                }*/
            }
        }
        .background(
            Image("galaxynight2")
                .resizable()
                .scaledToFill()
            )
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

#Preview {
    EquipmentArea()
        .environment(ViewModel())
}
