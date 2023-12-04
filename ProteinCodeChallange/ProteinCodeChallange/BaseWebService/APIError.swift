//
//  APIError.swift
//  ProteinCodeChallange
//
//  Created by Namik Karabiyik on 4.12.2023.
//

import Foundation
enum ApiError:LocalizedError {
    
    case noData
    case invalidUrl
    case taskError(String)
    case invalidResponse(Int)
    case invalidRequest
    
    
    //400 errors
    case badRequest(Int)
    case unauthorized(Int)
    case paymentRequired(Int)
    case forbidden(Int)
    case notFound(Int)
    case methodNotAllowed(Int)
    case requestTimeout(Int)
    //500 errors
    case internalServerError(Int)
    case badGateway(Int)
    case networkAuthenticationRequired(Int)
    
    
        var errorDescription: String? {
            switch self {
            case .badGateway(let code):
                return "Bad Gateway \(code)"
            case .badRequest(let code):
                return "Bad Request \(code)"
            case .forbidden(let code):
                return "Forbidden \(code)"
            case .unauthorized(let code):
                return "Unauthorized"
            case .paymentRequired(let code):
                return "paymentRequired"
            case .notFound(let code):
                return "notfound"
            case .methodNotAllowed(let code):
                return "methodNotAllowed"
            case .requestTimeout(let code):
                return "requestTimeout"
            case .internalServerError(let code):
                return "internalServerError"
            case .networkAuthenticationRequired(let code):
                return "networkAuthenticationRequired"
            case .noData:
                return "noData"
            case .invalidUrl:
                return "invalidUrl"
            case .taskError(_):
                return "taskError"
            case .invalidResponse(_):
                return "invalidResponse"
            case .invalidRequest:
                return "Request is invalid"
            }
    
        }
    

    
}
