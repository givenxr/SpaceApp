//
//  ViewModel.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2023/12/16.
//

import Foundation

@Observable
class ViewModel {
    var navigationPath : [Area] = []
    var isShowingRocketCapsule : Bool = false
    var isShowingFullRocket : Bool = false
    var isShowingMixedRocket : Bool = false
    var isShowingFullGalaxy : Bool = false
    
    var capsuleRealityAreaId: String = "CapsuleRealityArea"
    var fullRocketRealityArea: String = "FullRocketRealityArea"
    var mixedRocketRealityArea: String = "MixedRocketRealityArea"
    var galaxyAreaView: String = "GalaxyAreaView"
}
