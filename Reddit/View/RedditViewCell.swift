//
//  RedditViewCell.swift
//  Reddit
//
//  Created by Maheep on 27/06/19.
//  Copyright © 2019 Maheep. All rights reserved.
//

import Foundation
import SDWebImage

class RedditViewCell: UITableViewCell {
    
    @IBOutlet weak var previewImage : UIImageView!
    
    @IBOutlet weak var titleLabel : UILabel!
    
    // Setup Cell for Track View Model
    
    var redditViewModel : RedditViewModel?
    
    func setupCell(_ redditViewModel : RedditViewModel?, indexPath : IndexPath , completionBlock : @escaping ((Int)-> ()))  {
        
        self.tag = indexPath.row
        
        if let _redditViewModel = redditViewModel {
            
            self.titleLabel.text = _redditViewModel.title
            
            self.previewImage.sd_setImage(with: URL(string: _redditViewModel.thumbnail), placeholderImage: nil, options: SDWebImageOptions.continueInBackground, context: nil, progress: nil) { (image, error, type, url) in
                completionBlock(self.tag)
            }
        }
        
    }
    
}
