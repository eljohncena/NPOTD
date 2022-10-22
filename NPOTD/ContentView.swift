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
        
        NavigationView {
            VStack {
                NavigationLink(destination: PhotoView(photo: manager) ) {
                    manager.imageView
                        .resizable()
                        .scaledToFit()
                }
                    .navigationTitle(manager.title).font(.title)
                    .navigationBarTitleDisplayMode(.inline)
                Text(manager.copyright)

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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
