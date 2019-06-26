//
//  RedditDataResponse.swift
//  Reddit
//
//  Created by Maheep on 26/06/19.
//  Copyright © 2019 Maheep. All rights reserved.
//

import UIKit
import Foundation

class RedditDataResponse: Codable {
    
    var children : [BaseResponse<RedditChildrenDataResponse>]?
    
    init() {
        
    }
    
    
    init(_ children : [BaseResponse<RedditChildrenDataResponse>]?) {
        self.children = children
    }
    
    
    convenience init(data: Data) throws {
        let obj = try newJSONDecoder().decode(RedditDataResponse.self, from: data)
        self.init(obj.children)
    }
    
    
    func getModel(data: Data) throws-> RedditDataResponse  {
        let me = try newJSONDecoder().decode(RedditDataResponse.self, from: data)
        return me
    }
    
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    func toJson() -> [String : AnyObject]? {
        let jsonData = try! JSONEncoder().encode(self)
        
        do {
            let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String:AnyObject]
            return json
        } catch {
            log.debug("Error in Serialization of RedditDataResponse")
        }
        
        return nil
    }
    
}

