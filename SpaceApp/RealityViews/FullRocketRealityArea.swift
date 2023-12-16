//
//  FullRocketRealityArea.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2023/12/20.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct FullRocketRealityArea: View {
    var body: some View {
        RealityView{content in
            guard let entity = try? await Entity(named: "Rocket", in: realityKitContentBundle) else { fatalError("Unable to load scene model")
            }
            content.add(entity)
        }
    }
}

#Preview {
    FullRocketRealityArea()
        .environment(ViewModel())
}
