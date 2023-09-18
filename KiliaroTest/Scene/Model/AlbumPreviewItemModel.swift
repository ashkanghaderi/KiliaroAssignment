//
//  AlbumPreviewItemModel.swift
//  KiliaroTest
//
//  Created by Ashkan Ghaderi on 2022-02-09.
//

import Foundation

class AlbumPreviewItemModel {
    let displayName: String
    let fileName: String
    let fileExtension: String?
    let url: URL

    init(displayName: String, fileName: String, url: URL, fileExtension: String? = nil) {
        self.displayName = displayName
        self.fileName = fileName
        self.fileExtension = fileExtension
        self.url = url
    }

    var previewItemTitle: String? {
        return displayName
    }

    var previewItemURL: URL? {
        return url
    }
}
