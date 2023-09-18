//
//  AlbumViewModel.swift
//  KiliaroTest
//
//  Created by Ashkan Ghaderi on 2022-02-09.
//

import Foundation

class AlbumViewModel {
    
    private var albumService: AlbumServiceProtocol
    init(albumService: AlbumServiceProtocol) {
        self.albumService = albumService
    }
    
    var loading: DataCompletion<Bool>?
    var images: DataCompletion<AlbumImagesModel>?
    var errorHandler: DataCompletion<String>?
    
    func fetchImages() {
        loading?(true)
        albumService.fetchImages { [weak self] result in
            guard let self = self else { return }
            self.loading?(false)
            switch result {
            case .success(let images):
                self.images?(images)
            case .failure(let error):
                self.errorHandler?(error.localizedDescription)
            }
        }
    }
    
    func refreshAllCachedFilesAndReload() {
        FilesManager.standard.removeAllFiles()
        CacheManager.standard.clearAllCache()
        fetchImages()
    }
}
