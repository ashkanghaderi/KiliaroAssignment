//
//  AlbumImagesModel.swift
//  KiliaroTest
//
//  Created by Ashkan Ghaderi on 2022-02-08.
//

import Foundation

typealias AlbumImagesModel = [AlbumImageModel]

// MARK: - AlbumImageModel
struct AlbumImageModel: Codable {

    let id: String?
    let userID: String?
    let mediaType: MediaType?
    let filename: String?
    let size: Int64?
    let createdAt: String?
    let takenAt, guessedTakenAt: Date?
    let md5Sum: String
    let contentType: ContentType?
    let video: String?
    let thumbnailURL, downloadURL: String?
    let resx, resy: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case mediaType = "media_type"
        case filename, size
        case createdAt = "created_at"
        case takenAt = "taken_at"
        case guessedTakenAt = "guessed_taken_at"
        case md5Sum = "md5sum"
        case contentType = "content_type"
        case video
        case thumbnailURL = "thumbnail_url"
        case downloadURL = "download_url"
        case resx, resy
    }
}

enum ContentType: String, Codable {
    case imageJPEG = "image/jpeg"
}

enum MediaType: String, Codable {
    case image = "image"
}
