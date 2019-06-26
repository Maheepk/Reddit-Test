//
//  RedditService.swift
//  Reddit
//
//  Created by Maheep on 27/06/19.
//  Copyright © 2019 Maheep. All rights reserved.
//

import Foundation
import Alamofire

class RedditService {

    /**
     GET Reddit from server request
     */
    
    func getRedditData(success : ((_ response: BaseResponse<RedditDataResponse>)-> Void)?, failure : @escaping failureBlock) {
        
        let urlStr = ServiceURL.RedditResponse.GET_JSON_FOR_REDDIT
        
        Client().sendTheWebServiceAccordingToType(method: .get, urlString: urlStr, parameters: nil, headers: nil, encoding: JSONEncoding.default, success: { (response) in
            
            do {
                
                if let data = response.data{
                    self.showResult(data: data)
                    let result = try BaseResponse<RedditDataResponse>(data: data)
                    success?(result)
                } else {
                    failure(Api.Error.emptyData)
                }
            } catch {
                log.debug(error)
                failure(error)
            }
            
        }) { (error) in
            failure(error)
        }
        
    }
    
    /*
     
     Show Result is used for Showing Data into Json Array or Dictionary..
     
     */
    
    func showResult(data : Data){
        do {
            if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? Dictionary<String,Any>
            {
                log.debug(jsonArray)
            } else {
                log.debug("bad json")
            }
        } catch let error as NSError {
            log.debug(error)
        }
    }
    
}
