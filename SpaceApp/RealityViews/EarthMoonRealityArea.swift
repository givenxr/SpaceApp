//
//  EarthMoonRealityArea.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2023/12/17.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct EarthMoonRealityArea: View {
    var body: some View {
        RealityView { content in
            guard let entity = try? await Entity (named: "Earthmoon", in: realityKitContentBundle) else {
                fatalError("Unable to load model")
            }
            content.add(entity)
        }
    }
}
    #Preview {
        EarthMoonRealityArea()
    }

