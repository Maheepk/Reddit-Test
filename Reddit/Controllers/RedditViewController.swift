//
//  RedditViewController.swift
//  Reddit
//
//  Created by Maheep on 26/06/19.
//  Copyright © 2019 Maheep. All rights reserved.
//

import UIKit

class RedditViewController: UIViewController {

    @IBOutlet weak var tableView : UITableView!
    
    var redditViewModel : RedditViewModel!
    
    // KSegueDetailScreen 
    private let KSegueDetailScreen = "gotoDetailScreen"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupViewModel()
    }

    func setupViewModel() {
        redditViewModel = RedditViewModel(self)
        
    }

    // Preparing to Next Screen and Sending View Model to Next Detail Screen.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == KSegueDetailScreen, let redditDetailsVC = segue.destination as? RedditDetailViewController, let indexPath = self.tableView.indexPathForSelectedRow {
            
            redditDetailsVC.redditViewModel = redditViewModel.redditViewModel[indexPath.row]
        }
    }
}

extension RedditViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return redditViewModel?.redditViewModel.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RedditCellIdentifier", for: indexPath) as! RedditViewCell        
        cell.setupCell(redditViewModel?.redditViewModel[indexPath.row], indexPath: indexPath) { tag in
            tableView.reloadRows(at: [IndexPath.init(row: tag, section: 0)], with: UITableView.RowAnimation.automatic)
        }
        
        return cell

    }

}



extension RedditViewController : RedditViewModelDelegate {
    
    func redditData(_ viewModel: RedditViewModel?) {
                
        self.tableView.reloadData()
    }
    
    func redditDataGetError(_ error: Error?) {
        
        // Got an Error..
        print(error)
    }
}
