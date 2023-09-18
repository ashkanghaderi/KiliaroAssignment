//
//  AppConfiguration.swift
//  KiliaroTest
//
//  Created by Ashkan Ghaderi on 2022-02-08.
//

import Foundation

final class AppConfiguration {
    static var shareID: String = {
        guard let shareID = Bundle.main.object(forInfoDictionaryKey: "ShareID") as? String else {
            fatalError("ShareID must not be empty in plist")
        }
        return shareID
    }()
    static var apiBaseURL: String = {
        guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "ApiBaseURL") as? String else {
            fatalError("ApiBaseURL must not be empty in plist")
        }
        return apiBaseURL
    }()
}
