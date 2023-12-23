//
//  ContentView.swift
//  Link
//
//  Created by Reza Esfandiari on 12/23/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Link("Go to Google", destination: URL(string: "https://google.com")!).buttonStyle(.borderless)
        Link("Call To Action", destination: URL(string: "tel:911")!).buttonStyle(.bordered).buttonBorderShape(.roundedRectangle).controlSize(.regular)
        Link("Send An Email", destination: URL(string: "mailto:google@gmail.com")!).buttonStyle(.borderedProminent).buttonBorderShape(.capsule).controlSize(.large).tint(.pink)
        Link("My Academy", destination: URL(string: "https://myacademy.com")!).buttonStyle(.plain).padding().border(.primary,width: 2)
        Link(destination: URL(string: "https://www.apple.com")!) {
            HStack(spacing:16){
                Image(systemName: "apple.logo")
                Text("Apple Strore")
            }.font(.largeTitle).foregroundColor(.white).padding().padding(.horizontal).background(Capsule().fill(Color.blue))
        }
    }
}

#Preview {
    ContentView()
}
