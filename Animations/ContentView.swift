//
//  ContentView.swift
//  Animations
//
//  Created by Garrett Keyes on 11/16/25.
//

import SwiftUI

struct ContentView: View {
    @State private var enabled = false

    var body: some View {
        Button("Tap Me") { enabled.toggle() }
            .frame(width: 200, height: 200)
            .background(enabled ? .blue : .red)
            .foregroundStyle(.white)
            .animation(.default, value: enabled)
            .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
            .animation(.spring(duration: 0.5, bounce: 0.9), value: enabled)
    }
}

#Preview {
    ContentView()
}
