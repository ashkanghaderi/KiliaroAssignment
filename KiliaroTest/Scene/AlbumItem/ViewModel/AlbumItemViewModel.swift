//
//  AlbumItemViewModel.swift
//  KiliaroTest
//
//  Created by Ashkan Ghaderi on 2022-02-09.
//

import Foundation

class AlbumItemViewModel {
    
    private var albumService: AlbumServiceProtocol
    init(albumService: AlbumServiceProtocol) {
        self.albumService = albumService
    }
    
    var loading: DataCompletion<Bool>?
    var errorHandler: DataCompletion<String>?
    var downloadHandler: DataCompletion<AlbumPreviewItemModel>?
    
    func downloadfile(from model: AlbumImageModel) {
        guard let url = model.downloadURL else {
            errorHandler?("er")
            return
        }
        loading?(true)
        albumService.downloadImage(url: url) { [weak self] (success, fileLocation) in
            guard let self = self else  { return }
            self.loading?(false)
            if let url = fileLocation, success {
                let previewModel = self.generatePreviewModelFrom(model, url: url)
                self.downloadHandler?(previewModel)
            } else {
                self.errorHandler?("error on Download")
            }
        }
    }
    
    private func generatePreviewModelFrom(_ model: AlbumImageModel, url: URL) -> AlbumPreviewItemModel {
        let previewModel = AlbumPreviewItemModel(displayName: model.createdAt?.toDate() ?? "", fileName: model.filename ?? "", url: url)
        return previewModel
    }
}
