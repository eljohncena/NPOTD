//
//  ViewController.swift
//  NPOTD
//
//  Created by John Chavez on 10/15/22.
//

import Foundation
import SwiftUI

class ViewController: ObservableObject {

    let photoInfoController = PhotoInfoController()
    
    @Published var title = ""
    @Published var imageView = Image(systemName: "photo.on.rectangle")
    @Published var description = "Retreiving Info..."
    @Published var copyright = ""

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
        title = "Error fetching image"
        imageView = Image(systemName: "exclamationmark.octogon")
        description = error.localizedDescription
        copyright = ""
    }

}
