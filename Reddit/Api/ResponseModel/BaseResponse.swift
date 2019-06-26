//
//  BaseResponse.swift
//  Reddit
//
//  Created by Maheep on 26/06/19.
//  Copyright © 2019 Maheep. All rights reserved.
//

import UIKit
import Foundation

class BaseResponse<T:Codable>: Codable {
    
    let data: T?
    let kind: String?
    
    init(data: T?, kind: String?) {
        
        self.data = data
        self.kind = kind
    }
    
    convenience init(data: Data?) throws {
        let me = try newJSONDecoder().decode(BaseResponse.self, from: data!)
        try self.init(data: me.data, kind: me.kind)
        
    }
    
    func getModel(data: Data?) throws-> BaseResponse  {
        let me = try newJSONDecoder().decode(BaseResponse.self, from: data!)
        return me
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    func jsonData() throws -> Data? {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: (try self.jsonData())!, encoding: encoding)
    }
    
    
}
