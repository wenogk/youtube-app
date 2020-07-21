//
//  Model.swift
//  youtube-app
//
//  Created by Romeno Wenogk Fernando on 21/07/2020.
//  Copyright © 2020 Romeno Wenogk Fernando. All rights reserved.
//

import Foundation

class Model {
    
    func getVideos() {
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return;
        }
        
        let session = URLSession.shared;
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error != nil || data == nil{
                return
            }
            //print(data)
        }
        
        dataTask.resume()
    }
}
