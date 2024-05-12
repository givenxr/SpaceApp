//
//  CustomARViewRepresentable.swift
//  UniverseUnveiledMobile
//
//  Created by Given Mahlangu on 2024/03/14.
//

import SwiftUI

struct CustomARViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> CustomARView {
        return CustomARView()
    }
    
    func updateUIView(_ uiView: CustomARView, context: Context) { }
}
