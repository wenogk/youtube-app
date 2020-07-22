//
//  Video.swift
//  youtube-app
//
//  Created by Romeno Wenogk Fernando on 21/07/2020.
//  Copyright © 2020 Romeno Wenogk Fernando. All rights reserved.
//

import Foundation

struct Video : Decodable {
    
    var videoId = "";
    var title = "";
    var description = "";
    var thumbnail = "";
    var published = Date()
    
    enum CodingKeys : String, CodingKey {
        case published = "publishedAt"
        case title
        case description
        case url
        case videoId
        case snippet
        case thumbnails
        case high
        case resourceId
    }
    
    init(from decoder : Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self);
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        let thumbnailsContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailsContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try  highContainer.decode(String.self, forKey: .url)
        
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
        
    }
}

