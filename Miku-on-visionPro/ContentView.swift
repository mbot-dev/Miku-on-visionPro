//
//  ContentView.swift
//  mmd-stars
//
//  Created by Kazushi Minagawa on 2023/07/22.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            List {
                Text("Hastune Miku")
                Text("Kagamine Rin")
            }
            .navigationTitle("MMD STARS")
        } detail: {
            VStack {
                RealityView { content, attachments in
                    async let miku = ModelEntity(named: "v211_moko_03")
                    if let model = try? await miku {
                        content.add(model)
                        if let mikuAttachement = attachments.entity(for: "v211_label") {
                            mikuAttachement.position = [0, -0.05, 0]
                            model.addChild(mikuAttachement)
                        }
                    }
                }
                update: { content, attachments in
                    if let model = content.entities.first {
                        model.transform.scale = [0.24, 0.24, 0.24]
                        model.transform.translation = [0, -0.15, 0]
                    }
                }
                attachments: {
                    Text("MMD Model: Koron, Pose: Fujiwara-no-Moko")
                        .tag("v211_label")
                        .font(.largeTitle)
                }
            }
            .navigationTitle("Vision STAR")
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

