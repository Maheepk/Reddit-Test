//
//  RedditViewModel.swift
//  Reddit
//
//  Created by Maheep on 27/06/19.
//  Copyright © 2019 Maheep. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
import Reachability
import Alamofire

// Protocol RedditViewModelDelegate for Sending Values to Source Controller.

protocol RedditViewModelDelegate {
    
    func redditData(_ viewModel : RedditViewModel?)
    func redditDataGetError(_ error : Error?)
}

class RedditViewModel {
    
    // Private Track Model
    
    private var redditModel = RedditChildrenDataResponse()
    var redditViewModel = [RedditViewModel]()
    var delegate : RedditViewModelDelegate?
    
    init() {
        
    }
    
    init(redditModel: RedditChildrenDataResponse)
    {
        self.redditModel = redditModel
    }
    
    init( _ delegate : RedditViewModelDelegate)
    {
        self.delegate = delegate
        
        fetchRedditData { (success, response, error) in
            if success {
                self.delegate?.redditData(self)
            } else {
                self.delegate?.redditDataGetError(error)
            }
        }
    }
    
    
    // Converting All Models into ViewModels
    
    func getRedditViewModel(_ items : [BaseResponse<RedditChildrenDataResponse>]?) -> [RedditViewModel] {
        
        var redditViewModels = [RedditViewModel]()
        
        if let array = items {
            for obj in array {
                
                if let childrenResponse = obj.data {
                    redditViewModels.append(RedditViewModel(redditModel: childrenResponse))
                }                
            }
            return redditViewModels
        }
        
        return redditViewModels
    }
    
    // Fetching From Remote.
    func fetchRedditData(requestCompleted : @escaping (_ succeeded: Bool, _ result: RedditDataResponse?, _ error : Error?) -> ()) {
        
        RedditService().getRedditData(success: { (response) in
            
            if let children = response.data?.children {
                self.redditViewModel = self.getRedditViewModel(children)
                requestCompleted(true, response.data, nil)
            } else {
                requestCompleted(false,nil,NSError.init(domain: "Error", code: 1000, message: "User Data found Nil"))
            }
        }) { (error) in
            requestCompleted(false,nil,error)
            log.debug(error)
        }
    }
    
    public var title: String {
        return  redditModel.title ?? ""
    }
    
    public var selftext: String {
        return redditModel.selftext ?? ""
    }
    
    public var thumbnail: String {
        return redditModel.thumbnail ?? ""
    }
    
    public var thumbnail_width: Int {
        return redditModel.thumbnail_width ?? 0
    }
    
    public var thumbnail_height: Int {
        return redditModel.thumbnail_height ?? 0
    }
    
}

