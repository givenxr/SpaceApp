//
//  AreaMobile.swift
//  UniverseUnveiledMobile
//
//  Created by Given Mahlangu on 2024/03/08.
//

import Foundation
enum AreaMobile : String, Identifiable, CaseIterable, Equatable
{
    case Planets, Navigation, Equipment, Earth
    var id : Self{self}
    var name: String{ rawValue.lowercased()}
    
    var title : String {
        switch self {
        case.Planets:
            "Planets"
        case.Navigation:
            " The Nagivation"
        case.Equipment:
            "Equipment"
        case.Earth:
            "Earth"
        }
    }
}
