//
//  VideoTableViewCell.swift
//  youtube-app
//
//  Created by Romeno Wenogk Fernando on 22/07/2020.
//  Copyright © 2020 Romeno Wenogk Fernando. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v : Video) {
        self.video = v;
        
        guard self.video != nil else {
            return;
        }
        
        self.titleLabel.text = v.title;
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, h:mm a, MMM d, yyyy"
        
        self.dateLabel.text = df.string(from: v.published)
        
        guard v.thumbnail != "" else {
            return;
        }
        
        if(CacheManager.cache[v.thumbnail] == nil) {
            let url = URL(string: v.thumbnail);
            
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: url!) { (data, response, error) in
                if error == nil && data != nil {
                    
                    if(url!.absoluteString != v.thumbnail) {
                        return;
                    }
                    CacheManager.cache[v.thumbnail] = data!;
                    print("just cached \(v.title)")
                    let image = UIImage(data: data!)
                    
                    DispatchQueue.main.async {
                        self.thumbnailImageView.image = image;
                    }
                }
            }
            
            dataTask.resume();
        } else {
            print("retrieving cached: \(v.title)")
            let image = UIImage(data: CacheManager.cache[v.thumbnail]!)
            self.thumbnailImageView.image = image;
        }
        
    }

}
