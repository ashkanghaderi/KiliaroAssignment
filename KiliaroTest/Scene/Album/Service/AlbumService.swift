//
//  AlbumService.swift
//  KiliaroTest
//
//  Created by Ashkan Ghaderi on 2022-02-08.
//

import Foundation

typealias ImagesCompletionHandler = (Result<AlbumImagesModel, RequestError>) -> Void
typealias ImageDownloadCompletionHandler = DownloadFileCompletionHandler

protocol AlbumServiceProtocol {
    func fetchImages(completionHandler: @escaping ImagesCompletionHandler)
    func downloadImage(url: String, completionHandler: @escaping ImageDownloadCompletionHandler)
}

class AlbumService: AlbumServiceProtocol {
    
    private let requestManager: RequestManagerProtocol
    
    public static let shared: AlbumServiceProtocol = AlbumService(requestManager: RequestManager.shared)
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
    
    func fetchImages(completionHandler: @escaping ImagesCompletionHandler) {
        let sharedKey = AppConfiguration.shareID
        self.requestManager.performRequestWith(url: AlbumServiceRoute.media(sharedKey).path, httpMethod: .get) { (result: Result<AlbumImagesModel, RequestError>) in
            DispatchQueue.main.async {
                completionHandler(result)
            }
        }
    }
    
    func downloadImage(url: String, completionHandler: @escaping ImageDownloadCompletionHandler) {
        self.requestManager.downloadfile(url: url) { success, fileLocation in
            DispatchQueue.main.async {
                completionHandler(success, fileLocation)
            }
        }
    }
}
