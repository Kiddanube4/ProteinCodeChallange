//
//  BaseWebService.swift
//  ProteinCodeChallange
//
//  Created by Namik Karabiyik on 4.12.2023.
//

import Foundation

enum Request {
    case getFriends(count:Int)
    case none
}

final class BaseWebService {
       private let baseUrl = "https://randomuser.me/"
       private var requestType:Request = .none
    
    static let shared = BaseWebService()
    
    private var path: String {
         switch requestType {
         case .getFriends:
             return "\(baseUrl)api/"
         case .none:
             return ""
         }
         
     }
    private let session: URLSession = {
            let config = URLSessionConfiguration.default
            config.timeoutIntervalForRequest = 30
            config.timeoutIntervalForResource = 30
            config.waitsForConnectivity = true
            config.allowsCellularAccess = true
            return URLSession(configuration: config)
            
        }()
    
    
    private var request: URLRequest? {
        switch requestType {
        case .getFriends(let count):
            let parameters = ["results": "\(count)"]
            var urlComponents = URLComponents(string: path)!
               urlComponents.queryItems = parameters.map { URLQueryItem(name: $0, value: $1) }
               
               // Create the URL from URL components
               let url = urlComponents.url!
               
               // Create the GET request
               var request = URLRequest(url: url)
               request.httpMethod = "GET"
               return request
            
    
            
            
        case .none:
            return nil
        }
        
    }
    
    func senRequest<T:Codable>(to type:Request,
                                       responseHandler:@escaping(Result<T,ApiError>)->Void) {
          requestType = type
          guard let request = request else {
              responseHandler(.failure(.invalidRequest))
              return
          }
          
          let task =  session.dataTask(with: request) { data, response, error in
              guard let data = data else {
                  responseHandler(.failure(.noData))
                  return
              }
              if let error = error {
                  responseHandler(.failure(.taskError("Task failed.")))
              }
              
              guard let response = response as? HTTPURLResponse else{
                  responseHandler(.failure(.invalidResponse(500)))
                  return
                  
              }
              
              switch response.statusCode {
              case 200...226:
              
                    let response = try? JSONDecoder().decode(T.self, from: data)
                  guard let response = response else {
                      responseHandler(.failure(.invalidResponse(500)))
                      return
                  }
                  responseHandler(.success(response))
              case 400:
                  responseHandler(.failure(.badRequest(response.statusCode)))
              case 401:
                  responseHandler(.failure(.unauthorized(response.statusCode)))
              case 402:
                  responseHandler(.failure(.paymentRequired(response.statusCode)))
              case 403:
                  responseHandler(.failure(.forbidden(response.statusCode)))
              case 404:
                  responseHandler(.failure(.notFound(response.statusCode)))
              case 405:
                  responseHandler(.failure(.methodNotAllowed(response.statusCode)))
              case 408:
                  responseHandler(.failure(.methodNotAllowed(response.statusCode)))
              case 500:
                  responseHandler(.failure(.internalServerError(response.statusCode)))
              case 502:
                  responseHandler(.failure(.badGateway(response.statusCode)))
              case 511:
                  responseHandler(.failure(.networkAuthenticationRequired(response.statusCode)))
              default:
                  responseHandler(.failure(.invalidResponse(response.statusCode)))
            
              }
              
          }
          task.resume()

          
          
      }
    
    
}
