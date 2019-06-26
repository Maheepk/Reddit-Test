//
//  APIUrls.swift
//  Reddit
//
//  Created by Maheep on 26/06/19.
//  Copyright © 2019 Maheep. All rights reserved.
//

import Foundation

struct ServiceURL {
    
    struct RedditResponse{
        static let GET_JSON_FOR_REDDIT = ServiceURL().Environment() + "r/swift.json"
    }
    
    // Base URL with respect to App Environment
    func Environment() -> String
    {
        //        switch HPBUtil.loadEnvironment() {
        //        }
        return "https://www.reddit.com/"
    }
}
