//
//  NetworkManager.swift
//  Dog Facts
//
//  Created by unthinkable-mac-0025 on 07/08/22.
//

import Foundation

struct NetworkManager{
    
    let BaseURl = "https://dog-api.kinduff.com/"
    
    func getApiData<T:Codable>(forEndPoint : String, resultType:T.Type, completionHandler:@escaping(Result<T, ResponseStatus>)-> Void){
        
        let urlString = BaseURl + forEndPoint
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.invalidEndPoint))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                print(Constants.ErrorMessage.API_CALL_ERROR)
                completionHandler(.failure(.error(err: error!.localizedDescription)))
            }
            guard let _ = data else{
                print(Constants.ErrorMessage.NO_DATA_RECIEVED)
                completionHandler(.failure(.invalidData))
                return
            }
            guard let _ = response else{
                print(Constants.ErrorMessage.INVALID_RESPONSE)
                completionHandler(.failure(.invalidResponse))
                return
            }
            do{
                let result = try JSONDecoder().decode(T.self, from: data!)
                completionHandler(.success(result))
               // print(result)
                
            }catch let err{
                print("\(Constants.ErrorMessage.JSON_PARSING_ERROR) ->\(err.localizedDescription)")
                completionHandler(.failure(.error(err: err.localizedDescription)))
            }
        }.resume()
    }
    
}

enum ResponseStatus : Error{
    case error(err : String)
    case invalidEndPoint
    case invalidResponse
    case invalidData
    case decodingError(err : String)
}


