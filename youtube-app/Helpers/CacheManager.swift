//
//  CacheManager.swift
//  youtube-app
//
//  Created by Romeno Wenogk Fernando on 22/07/2020.
//  Copyright © 2020 Romeno Wenogk Fernando. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]();
    
    static func setVideoCache(_ url: String, _ data: Data) {
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        return cache[url]
    }
}
