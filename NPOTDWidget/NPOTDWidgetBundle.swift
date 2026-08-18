//
//  NPOTDWidgetBundle.swift
//  NPOTDWidget
//
//  Created by John Chavez on 9/1/23.
//

import WidgetKit
import SwiftUI

@main
struct NPOTDWidgetBundle: WidgetBundle {
    var body: some Widget {
        NPOTDWidget()
        NPOTDWidgetLiveActivity()
    }
}
