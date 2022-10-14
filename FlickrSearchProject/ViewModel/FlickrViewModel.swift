//
//  FlickrViewModel.swift
//  FlickrSearchProject
//
//  Created by WillC on 10/14/22.
//

import Foundation

class FlickrViewModel: ObservableObject {
    @Published var results = [Item]()
    @Published var isFetching = false
    @Published var searchText = ""
    
    func fetchData() async {
        
        guard let url = URL(string: "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=2&tags=\(searchText)") else {
            print("ERROR: BAD URL")
            return
        }
        
        do {
            isFetching = true
            
            let(data, response) = try await URLSession.shared.data(from: url)
            
            let decoded = try JSONDecoder().decode(FlickrResult.self, from: data)
            if let resp = response as? HTTPURLResponse, resp.statusCode >= 300 {
                print("ERROR: BAD STATUS CODE")
            }
            DispatchQueue.main.async {
                self.results = decoded.items
                self.isFetching = false
            }
            
        } catch {
            print("ERROR: FAILED TO DECODE DATA: \(error)")
            DispatchQueue.main.async {
                self.isFetching = false
            }
        }
    }
}
