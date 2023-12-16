//
//  SpaceX.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2023/12/20.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct SpaceX: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Background image with overlaying text
                Image("galaxynight1")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 200)
                                    .overlay(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.black, .clear]),
                                            startPoint: .bottom,
                                            endPoint: .top
                                        )
                                        .frame(height: 100)
                                        .offset(y: 100) // Adjust the offset as needed
                                        )

                // Gap
                Spacer().frame(height: 20)

                // Title "Information"
                Text("Information")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()

                // 3D elements
                HStack(spacing: 20) {
                    Model3D(named: "Earth", bundle: realityKitContentBundle)
                        .frame(width: 500, height: 500)
                        .scaledToFit()

                    Model3D(named: "Pluto", bundle: realityKitContentBundle)
                        .frame(width: 500, height: 500)
                        .scaledToFit()
                }
                .padding()

                // Paragraph with Lorem Ipsum placeholder
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                    .foregroundColor(.white)
                    .padding(15)
                    .frame(width: 900, height: 500)
            }
        }.background(
            Image("galaxynight2")
                .resizable()
                .scaledToFill()
        ).edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    SpaceX()
}
