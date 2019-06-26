//
//  Constants.swift
//  Reddit
//
//  Created by Maheep on 26/06/19.
//  Copyright © 2019 Maheep. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

let ApplicationDelegate = UIApplication.shared.delegate as! AppDelegate

typealias CompletionHandler = (_ success: Bool, _ response: Any?) -> Void
typealias ProgressBlock = (_ progress : Progress) -> Void
typealias successBlock = (_ result:AnyObject) -> Void
typealias failureBlock = (_ result:Error) -> Void
typealias customfailureBlock = (_ result:AnyObject) -> Void
typealias failureBlockWithResponse = (_ result:Error, _ response : DataResponse<Any>? ) -> Void



