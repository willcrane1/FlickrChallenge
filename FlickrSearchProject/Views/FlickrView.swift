//
//  FlickrView.swift
//  FlickrSearchProject
//
//  Created by WillC on 10/14/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: FlickrViewModel
    
    var body: some View {
        ScrollView {
            if viewModel.isFetching {
                ProgressView()
            } else {
                ForEach(viewModel.results) { result in
                    NavigationLink( destination: { DetailView(item: result)}) {
                        ImageCardView(item: result)
                    }
                }
            }
        }
        .searchable(text: $viewModel.searchText)
        .onChange(of: viewModel.searchText) { _ in
            Task {
                await viewModel.fetchData()
            }
        }.navigationTitle("Enter Your Query")
            .cornerRadius(15)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FlickrViewModel()
        ContentView(viewModel: viewModel)
    }
}
