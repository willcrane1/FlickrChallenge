//
//  MoreInfoView.swift
//  FlickrSearchProject
//
//  Created by WillC on 10/14/22.
//

import SwiftUI

struct ImageCardView: View {
    let item: Item
    var showMore = false
    
    var body: some View {
        VStack {
            if showMore {
                MoreInfoView(moreInfoData: item.moreInfoData)
            } else {
                Text(item.title)
                    .font(.headline)
                    .accessibilityAddTraits(.isHeader)
            }
            let url = URL(string: item.imageURL)
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
            } placeholder: {
                ProgressView()
            }
        }
        .padding()
        .foregroundColor(.red)
    }
}

struct ImageCardView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCardView(item: Item())
    }
}
