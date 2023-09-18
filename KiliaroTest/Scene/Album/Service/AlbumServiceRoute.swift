//
//  AlbumServiceRoute.swift
//  KiliaroTest
//
//  Created by Ashkan Ghaderi on 2022-02-08.
//

import Foundation

public enum AlbumServiceRoute {
    case media(String)
    
    var path: String {
        switch self {
        case .media(let id):
            return "shared/\(id)/media"
        }
    }
}
