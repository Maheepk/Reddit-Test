//
//  RedditDetailViewController.swift
//  Reddit-Test
//
//  Created by Maheep on 27/06/19.
//  Copyright © 2019 Maheep. All rights reserved.
//

import UIKit

class RedditDetailViewController: UIViewController {
    
    @IBOutlet weak var detailDescLabel : UILabel!
    
    @IBOutlet weak var imageView : UIImageView!
    
    var redditViewModel : RedditViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadLabels()
    }
    
    // LoadLabels to set values for Artist Name and Movie Price and Genre Name.
    
    private func loadLabels() {
        
        if let _redditViewModel = redditViewModel {
     
            self.title = _redditViewModel.title
            
            detailDescLabel.text = _redditViewModel.selftext
            imageView.sd_setImage(with: URL(string: _redditViewModel.thumbnail), completed: nil)
            
        }
    }
}
