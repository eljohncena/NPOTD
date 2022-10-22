//
//  PhotoView.swift
//  NPOTD
//
//  Created by John Chavez on 10/22/22.
//

import SwiftUI

struct PhotoView: View {
    var photo: ViewController
    var body: some View {
        photo.imageView
            .resizable()
            .scaledToFit()
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(photo: ViewController())
    }
}
