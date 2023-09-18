//
//  FileManagerProtocol.swift
//  KiliaroTest
//
//  Created by Ashkan Ghaderi on 2022-02-08.
//

import Foundation

typealias DataCompletion<T> = ((T) -> Void)

protocol FileManagerProtocol {
    var fileManager: FileManager { get set }
    func exist(file url: String) -> FileReturnType
    func saveFile(url: String ,tempLoc: URL) -> Result<URL, Error>
    func removeFile(url: URL, completion: @escaping DataCompletion<Bool>)
    func removeAllFiles()
}

enum FileReturnType {
    case exist(URL)
    case notExist
}
