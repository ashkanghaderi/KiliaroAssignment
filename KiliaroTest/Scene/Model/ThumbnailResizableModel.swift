//
//  ThumbnailResizableModel.swift
//  KiliaroTest
//
//  Created by Ashkan Ghaderi on 2022-02-08.
//

import Foundation
import UIKit

enum ImageModes: String {
    case bb
    case crop
    case md
}

struct ThumbnailResizableModel {
    let m: ImageModes
    let h: String
    let w: String
    
    init(mode: ImageModes, height: CGFloat, width: CGFloat) {
        m = mode
        h = height.roundString
        w = width.roundString
    }
    
    func getQuery() -> String {
        var components = URLComponents()
        let m = URLQueryItem(name: "m", value: m.rawValue)
        let h = URLQueryItem(name: "h", value: h)
        let w = URLQueryItem(name: "w", value: w)

        components.queryItems = [w, h, m]
        return components.string ?? ""
    }
}
