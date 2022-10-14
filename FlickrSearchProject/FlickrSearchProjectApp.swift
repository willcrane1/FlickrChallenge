//
//  FlickrSearchProjectApp.swift
//  FlickrSearchProject
//
//  Created by WillC on 10/14/22.
//

import SwiftUI

@main
struct FlickrSearchProjectApp: App {
    let viewModel = FlickrViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(viewModel: viewModel)
            }
        }
    }
}

