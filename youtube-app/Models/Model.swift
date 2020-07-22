//
//  Model.swift
//  youtube-app
//
//  Created by Romeno Wenogk Fernando on 21/07/2020.
//  Copyright © 2020 Romeno Wenogk Fernando. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    func videosFetched(_ videos : [Video]);
}

class Model {
    var delegate:ModelDelegate?
    
    func getVideos() {
        var url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return;
        }
        
        let session = URLSession.shared;
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error != nil || data == nil{
                return
            }
            //print(data)
            let decoder = JSONDecoder();
            
            decoder.dateDecodingStrategy = .iso8601;
            do {
                let response = try decoder.decode(Response.self, from: data!)
                
                if(response.items != nil) {
                    self.delegate?.videosFetched(response.items!)
                }
                
                dump(response)
            } catch {
                print("error")
            }
            
        }
        
        dataTask.resume()
    }
}
