//
//  ContentView.swift
//  NPOTD
//
//  Created by John Chavez on 10/15/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var manager = ViewController()
    
    var body: some View {
        VStack {
            VStack {
                Text(manager.title)
                    .font(.title)
                    .fontWeight(.bold)
                manager.imageView
                    .resizable()
                .scaledToFit()

            }
            ScrollView {
                Text(manager.description)
            }
            .task {
                await manager.startProcess()
                }
            }
        .padding(.horizontal, 10.0)
        }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
