//
//  Planets.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2023/12/16.
//

import Foundation

enum Planets: String, Identifiable, CaseIterable, Equatable
{
    case  Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus,  Neptune, Pluto
    var id : Self {self}
    var name: String{ rawValue.lowercased()}
    
    var planetName: String {
        switch self {
        case.Mercury:
            "mercury"
        case.Venus:
            "Venus"
        case.Earth:
            "Earth"
        case.Mars:
            "Mars"
        case.Jupiter:
            "Jupiter"
        case.Saturn:
            "Saturn"
        case.Uranus:
            "Uranus"
        case.Neptune:
            "Neptune"
        case.Pluto:
            "Pluto"
        }
    }
    
    var about: String {
        switch self {
        case.Mercury:
            "Mercury is the first planet from the Sun and the smallest in the Solar System. It is a terrestrial planet with a heavily cratered surface due to overlapping impact events. These features are well preserved since the planet has no geological activity and an extremely tenuous atmosphere called an exosphere. "
        case.Venus:
            "Venus is the second planet from the Sun. It is a rocky planet with the densest atmosphere of all the rocky bodies in the Solar System, and the only one with a mass and size that is close to that of its orbital neighbour Earth."
        case.Earth:
            "Earth is the third planet from the Sun and the only astronomical object known to harbor life. This is enabled by Earth being a water world, the only one in the Solar System sustaining liquid surface water. Almost all of Earth's water is contained in its global ocean, covering 70.8% of Earth's crust."
        case.Mars:
            "Mars is the fourth planet and the furthest terrestrial planet from the Sun. The reddish color of its surface is due to finely grained iron(III) oxide dust in the soil, giving it the nickname 'the Red Planet'. Mars's radius is second smallest among the planets in the Solar System at 3,389.5 km."
        case.Jupiter:
            "Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than two and a half times that of all the other planets in the Solar System combined, and slightly less than one one-thousandth the mass of the Sun."
        case.Saturn:
            "Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius of about nine-and-a-half times that of Earth. It has only one-eighth the average density of Earth, but is over 95 times more massive."
        case.Uranus:
            "Uranus is the seventh planet from the Sun. It is a gaseous cyan-coloured ice giant. Most of the planet is made of water, ammonia, and methane in a supercritical phase of matter, which in astronomy is called 'ice' or volatiles."
        case.Neptune:
            "Neptune is the eighth and farthest planet from the Sun. It is the fourth-largest planet in the Solar System by diameter, the third-most-massive planet, and the densest giant planet. It is 17 times the mass of Earth, and slightly more massive than its near-twin Uranus."
        case.Pluto:
            "Pluto (minor-planet designation: 134340 Pluto) is a dwarf planet in the Kuiper belt, a ring of bodies beyond the orbit of Neptune. It is the ninth-largest and tenth-most-massive known object to directly orbit the Sun. "
        }
    }
}
