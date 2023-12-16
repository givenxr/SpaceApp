//
//  Tester.swift
//  SpaceApp
//
//  Created by Given Mahlangu on 2024/01/12.
//

import SwiftUI

struct Tester: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Hello World")
                .font(.largeTitle)
            YouTubeView(videoID: "DxVmeVf0Wwg")
                .frame(width: 300, height: 200)
        }
    }
}

#Preview {
    Tester()
}



