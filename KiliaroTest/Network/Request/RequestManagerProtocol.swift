//
//  RequestManagerProtocol.swift
//  KiliaroTest
//
//  Created by Ashkan Ghaderi on 2022-02-08.
//

import Foundation

typealias DownloadFileCompletionHandler = (_ success: Bool,_ fileLocation: URL?) -> Void

protocol RequestManagerProtocol {

    var session: URLSession! { get set }
    
    var timeOutInterval: Double { get }
    
    var baseApi: String { get set }
    
    var responseValidator: ResponseValidatorProtocol { get set }
    
    var reponseLog: URLRequestLoggableProtocol? { get set }
    
    var fileManager: FileManagerProtocol! { get set }
    
    var cacheManager: CacheManagerProtocol! { get set }
    
    func performRequestWith<T: Codable>(url: String, httpMethod: HTTPMethod, completionHandler: @escaping CodableResponse<T>)
    
    func downloadfile(url: String, completion: @escaping DownloadFileCompletionHandler)
    
}
