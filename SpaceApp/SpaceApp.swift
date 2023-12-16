//
//  SpaceAppApp.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2023/12/16.
//

import SwiftUI

@main
struct SpaceApp: App {
       @State private var model = ViewModel()
       var body: some Scene {
            WindowGroup {
                Areas().environment(model)
            }
    
            WindowGroup(id: "CapsuleRealityArea") {
                CapsuleRealityArea()
                    .environment(model)
            }
            .windowStyle(.volumetric)
            .defaultSize(width:0.6, height: 0.6, depth:0.6, in: .meters)
    
            ImmersiveSpace(id: "FullRocketRealityArea"){
                FullRocketRealityArea()
                    .environment(model)
            }.immersionStyle(selection: .constant(.full), in: .full)
           
           ImmersiveSpace(id: "GalaxyAreaView"){
               GalaxyAreaView()
                   .environment(model)
           }.immersionStyle(selection: .constant(.full), in: .full)
    
    
        }
    }
           
           
    /*WindowGroup {
        ContentView()
    }
    
    WindowGroup(id: WindowDestination.myModelView1) {
        MyModelView()
    }
//           WindowGroup(id: WindowDestination.myModelView2) {
//               MyModelView2()
//           }
//        WindowGroup(id: "MyView3") {
//            MyView3()
//        }

//    ImmersiveSpace(id: "ImmersiveSpace") {
//        ImmersiveView()
//    }
}
}


struct WindowDestination {
static let myModelView1 = "myModelView1"
static let myModelView2 = "myModelView2"
static let myModelView3 = "myModelView3"
}
*/
