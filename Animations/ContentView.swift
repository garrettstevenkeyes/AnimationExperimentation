//
//  ContentView.swift
//  Animations
//
//  Created by Garrett Keyes on 11/16/25.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    @State private var axisX: CGFloat = 0.15
    @State private var axisY: CGFloat = 1.0
    @State private var axisZ: CGFloat = 0.0

    var body: some View {
        Button("Tap Me") {
            Task {
                // Randomize axis a bit each time
                axisX = .random(in: -0.3...0.3)
                axisY = 1.0
                axisZ = .random(in: -0.3...0.3)

                let spins = Int.random(in: 1...4)
                let direction = Bool.random() ? 1.0 : -1.0
                let settle = Double.random(in: 6...14) * (Bool.random() ? 1 : -1)

                // Randomize the animation curve
                let animations: [Animation] = [
                    .spring(response: 0.45, dampingFraction: 0.72),
                    .spring(response: 0.6, dampingFraction: 0.85),
                    .easeInOut(duration: 0.8),
                    .easeOut(duration: 0.65)
                ]
                let chosen = animations.randomElement()!

                withAnimation(chosen) {
                    animationAmount += direction * Double(spins * 360)
                }

                try? await Task.sleep(nanoseconds: 500_000_000)

                withAnimation(.interpolatingSpring(stiffness: 220, damping: 16)) {
                    animationAmount += settle
                }
                withAnimation(.interpolatingSpring(stiffness: 220, damping: 16)) {
                    animationAmount -= settle
                }
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(.degrees(animationAmount),
                          axis: (x: axisX, y: axisY, z: axisZ),
                          perspective: 0.6)
        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 6)
    }
}

#Preview {
    ContentView()
}
