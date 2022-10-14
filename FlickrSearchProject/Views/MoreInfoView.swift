//
//  ImageInfoView.swift
//  FlickrSearchProject
//
//  Created by WillC on 10/14/22.
//

import SwiftUI

struct MoreInfoView: View {
    let moreInfoData: Item.MoreInfoData
    
    var body: some View {
        VStack {
            Text("Width: \(moreInfoData.imageWidth)")
            Text("Height: \(moreInfoData.imageHeight)")
            Text("Author: \(moreInfoData.authorFixed)")
        }
    }
}

struct ImageInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MoreInfoView(moreInfoData: Item().moreInfoData)
    }
}
