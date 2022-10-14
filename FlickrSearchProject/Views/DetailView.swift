//
//  DetailView.swift
//  FlickrSearchProject
//
//  Created by WillC on 10/14/22.
//
import SwiftUI

struct DetailView: View {
    let item: Item
    
    var body: some View {
        VStack(alignment: .leading) {
            ImageCardView(item: item, showMore: true)
            Spacer()
        }
        .navigationTitle(item.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: Item())
    }
}
