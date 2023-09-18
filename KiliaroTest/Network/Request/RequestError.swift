//
//  RequestError.swift
//  KiliaroTest
//
//  Created by Ashkan Ghaderi on 2022-02-08.
//

import Foundation

enum RequestError: Error, LocalizedError {
    case unknownError
    case connectionError
    case badHTTPStatus(status: Int, message: String?)
    case authorizationError
    case invalidRequest
    case notFound
    case serverUnavailable
    case jsonParseError
}

extension RequestError {
    public var errorDescription: String? {
        switch self {
        case .connectionError:
            return "Internet Connection Error"
        case .badHTTPStatus(status: let status, message: let message):
            return "Error with status `\(status) and message `\(message ?? "nil")` was thrown"
        case .notFound:
            return "Request not found"
        case .jsonParseError:
            return "JSON parsing probelm"
        default:
            return "Network Error with` \(self)` thrown"
        }
    }
}
