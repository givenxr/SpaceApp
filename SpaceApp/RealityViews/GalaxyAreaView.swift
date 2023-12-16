//
//  GalaxyAreaView.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2024/01/19.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct GalaxyAreaView: View {
    var body: some View {
        RealityView{content in
            guard let entity = try? await Entity(named: "solarsystem", in: realityKitContentBundle) else { fatalError("Unable to load scene model")
            }
            content.add(entity)
        }
    }
}

#Preview {
    GalaxyAreaView()
    .environment(ViewModel())
}
