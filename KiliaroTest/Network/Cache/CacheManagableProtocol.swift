//
//  CacheManagableProtocol.swift
//  KiliaroTest
//
//  Created by Ashkan Ghaderi on 2022-02-08.
//

import Foundation

protocol CacheManagerProtocol {
    var cacheManager: URLCache { get set }
    func cachedResponse(for urlRequest: URLRequest) -> CachedURLResponse?
    func clearAllCache()
    func cacheConfig() -> URLSessionConfiguration
}
