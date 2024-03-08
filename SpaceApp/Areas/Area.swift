//
//  Area.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2023/12/16.
//

import Foundation

enum Area : String, Identifiable, CaseIterable, Equatable
{
    case Planets, Galaxy, Earth, Equipment
    var id : Self{self}
    var name: String{ rawValue.lowercased()}
    
    var title : String {
        switch self {
        case.Planets:
            " Planets"
        case.Galaxy:
            " The Milkyway Galaxy"
        case.Earth:
            "Earth"
        
        case.Equipment:
            "Equipment"
        }
    }
}
