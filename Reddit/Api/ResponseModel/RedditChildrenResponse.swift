//
//  RedditChildrenResponse.swift
//  Reddit
//
//  Created by Maheep on 27/06/19.
//  Copyright © 2019 Maheep. All rights reserved.
//

import Foundation

//class RedditChildrenResponse: Codable {
//    
//    var kind : String?
//    var data : String?
//    var thumbnail : String?
//    var thumbnail_width : Int?
//    var thumbnail_height : Int?
//    
//    init() {
//        
//    }
//    
//    
//    init(title: String?, selftext: String?, thumbnail: String?, thumbnail_width: Int?, thumbnail_height: Int?) {
//        
//        self.title = title
//        self.selftext = selftext
//        self.thumbnail = thumbnail
//        self.thumbnail_width = thumbnail_width
//        self.thumbnail_height = thumbnail_height
//    }
//    
//    
//    convenience init(data: Data) throws {
//        let obj = try newJSONDecoder().decode(RedditChildrenDataResponse.self, from: data)
//        self.init(title: obj.title, selftext: obj.selftext, thumbnail: obj.thumbnail, thumbnail_width: obj.thumbnail_width, thumbnail_height: obj.thumbnail_height)
//    }
//    
//    
//    func getModel(data: Data) throws-> RedditChildrenDataResponse  {
//        let me = try newJSONDecoder().decode(RedditChildrenDataResponse.self, from: data)
//        return me
//    }
//    
//    
//    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//    
//    func toJson() -> [String : AnyObject]? {
//        let jsonData = try! JSONEncoder().encode(self)
//        
//        do {
//            let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String:AnyObject]
//            return json
//        } catch {
//            log.debug("Error in Serialization of RedditChildrenDataResponse")
//        }
//        
//        return nil
//    }
//    
//}
//
