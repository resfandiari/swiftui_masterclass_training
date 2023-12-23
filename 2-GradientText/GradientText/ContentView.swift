//
//  ContentView.swift
//  GradientText
//
//  Created by Reza Esfandiari on 12/23/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("iOS").font(.system(size: 180)).fontWeight(.black).foregroundStyle(.teal.gradient)
        Text("iOS").font(.system(size: 180)).fontWeight(.black).foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple,Color.blue]), startPoint:.topLeading, endPoint: .bottomTrailing))
    }
}

#Preview {
    ContentView()
}
