//
//  Constants.swift
//  Dog Facts
//
//  Created by unthinkable-mac-0025 on 07/08/22.
//

import Foundation


struct Constants {
    
    struct Image {
        struct AssetImage{
           static let DOG_IMAGE = "dog-58"
        }
       
    }
    
    struct ErrorMessage {
        static let API_CALL_ERROR = "Error in API Call"
        static let NO_DATA_RECIEVED = "No Data Recieved"
        static let INVALID_RESPONSE = "Invalid Response Recieved"
        static let JSON_PARSING_ERROR = "Error while parsing JSON data"
        
    }
    
    struct Networking{
        struct HttpMethod {
            static let POST_METHOD = "post"
            static let GET_METHOD = "get"
        }
        struct HeaderFieldValue {
            static let CONTENT_TYPE = "content-type"
            static let BODY_DATA_TYPE_IS_JSON = "application/json"
        }
    }
}
