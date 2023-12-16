//
//  NavigationToAreas.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2023/12/16.
//

import SwiftUI

struct NavigationToAreas: View {
    var body: some View {
        

        GeometryReader { geometry in
        VStack{
            
        Text("Welcome To Universe Unveiled")
                .monospaced()
                .font(.system(size: 50, weight: .bold))
                .padding(.top, 250)
                .padding(.bottom, 100)
                .padding(.leading, 20)
            
            HStack(spacing: 25){
                ForEach(Area.allCases){ area in
                    NavigationLink{
                        
                       if area == Area.Planets{
                            PlanetView()
                        }
                       else  if area == Area.Earth{
                           EarthArea()
                        }
                        else if area == Area.Galaxy{
                            GalaxyArea()
                        }
                        else if area == Area.Equipment{
                            EquipmentArea()
                        }
                        
                        Spacer()
                        
                        
                    } label: {
                        Label( area.name, systemImage: "chevron.right")
                            .textCase(.uppercase)
                            .monospaced()
                            .font(.title)
                            
                            
                    }
                    .controlSize(.extraLarge)
                    
                }
            }
            
            
        }
        
               }.background(
                Image("galaxynight")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                   )
}
}

#Preview {
    NavigationToAreas()
}
