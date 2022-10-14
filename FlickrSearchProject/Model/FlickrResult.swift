//
//  FlickrResult.swift
//  FlickrSearchProject
//
//  Created by WillC on 10/14/22.
//

import Foundation

struct FlickrResult: Decodable {
    let items: [Item]
}

struct Item: Decodable, Identifiable {
    
    let id = UUID()
    let title: String
    let imageURL: String
    let description: String
    let author: String
    let authorFixed: String
    let imageWidth: String
    let imageHeight: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case media
        case description
        case author
        
    }
    
    enum ImageKeys: String, CodingKey {
        case m
    }
    
    init(from decoder: Decoder) throws {
        
        let itemContainer = try decoder.container(keyedBy: CodingKeys.self)
        let imageContainer = try itemContainer.nestedContainer(keyedBy: ImageKeys.self, forKey: .media)
        
        title = try itemContainer.decode(String.self, forKey: .title)
        description = try itemContainer.decode(String.self, forKey: .description)
        author = try itemContainer.decode(String.self, forKey: .author)

        imageURL = try imageContainer.decode(String.self, forKey: .m)
        
        imageWidth = description.parse(for: "width=")
        imageHeight = description.parse(for: "height=")
        authorFixed = author.parse(for: "(")
    }
    
}

extension Item {
    struct MoreInfoData {
        var authorFixed: String = ""
        var imageWidth: String = ""
        var imageHeight: String = ""
    }
    
    var moreInfoData: MoreInfoData {
        MoreInfoData(authorFixed: authorFixed, imageWidth: imageWidth, imageHeight: imageHeight)
    }
}

/// For previews
extension Item {
    init() {
        title = ""
        imageURL = ""
        description = ""
        author = ""
        authorFixed = ""
        imageWidth = ""
        imageHeight = ""
    }
}
