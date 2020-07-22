//
//  ViewController.swift
//  youtube-app
//
//  Created by Romeno Wenogk Fernando on 21/07/2020.
//  Copyright © 2020 Romeno Wenogk Fernando. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {

    
    var model = Model();
    
    @IBOutlet weak var tableView: UITableView!
    
    var videos = [Video]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //set itself as the datasource and delegate
        tableView.dataSource = self;
        tableView.delegate = self;
        model.delegate = self;
        model.getVideos();
    }
    
    // MARK: - Model Delegate Methods
    func videosFetched(_ videos: [Video]) {
        self.videos = videos;
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    // MARK: - Table View Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("video count: \(videos.count)")
        return videos.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        cell.setCell(self.videos[indexPath.row])
        //let title = self.videos[indexPath.row].title;
        
       // cell.textLabel?.text = title;
        //configure the cell with data
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //do nothing for now
    }


}

