//
//  ContentView.swift
//  NPOTD
//
//  Created by John Chavez on 10/15/22.
//

import SwiftUI

struct ContentView: View {
     let photoInfoController = PhotoInfoController()
     @State var title = "Loading"
     @State var imageView = Image(systemName: "photo.on.rectangle")
     @State var description = "..."
     @State var copyright = ""

    var body: some View {
        VStack {
            VStack {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                imageView
                    .resizable()
                .scaledToFit()

            }
            ScrollView {
                Text(description)
            }
            .task {
                await startProcess()
                }
            }
        .padding(.horizontal, 10.0)
        }
    
    func startProcess() async {
        do{
            let photoInfo = try await photoInfoController.fetchPhotoinfo()
            await updateUI(with: photoInfo)
        }
        catch{
            updateUI(with: error)
        }
    }

    func updateUI(with photoInfo: PhotoInfo) async {
        do {
            let image = try await photoInfoController.fetchImage(from: photoInfo.url)
            title = photoInfo.title
            imageView = Image(uiImage: image)
            description = photoInfo.description
            copyright = photoInfo.copyright ?? ""
        }
        catch {
            updateUI(with: error)
        }
    }

    func updateUI(with error: Error) {
        title = "Error fetching information"
        imageView = Image(systemName: "exclamationmark.octogon")
        description = error.localizedDescription
        copyright = ""
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
