//
//  ContentView.swift
//  Animations
//
//  Created by Garrett Keyes on 11/16/25.
//

import SwiftUI

struct ContentView: View {
    @State private var letters = Array("Swift Testing")
    @State private var enabled: Bool = false
    @State private var dragAmount = CGSize.zero

    var body: some View {
        HStack(spacing:0){
            ForEach(0..<letters.count, id: \.self) {num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        dragAmount = .zero
                        enabled.toggle()
                    }
        )
    }
}

#Preview {
    ContentView()
}
