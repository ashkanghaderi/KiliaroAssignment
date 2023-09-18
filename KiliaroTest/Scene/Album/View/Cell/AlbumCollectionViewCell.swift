//
//  AlbumCollectionViewCell.swift
//  KiliaroTest
//
//  Created by Ashkan Ghaderi on 2022-02-09.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var sizeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.image = nil
        sizeLabel.text = ""
    }
    
    func bind(_ model: AlbumImageModel) {
        thumbnailImageView.image = UIImage(named: "placeHolder")
        let thumbnailSizeQuery = setThumbnailSize(model: model)
        let thumbnailURL = (model.thumbnailURL ?? "") + thumbnailSizeQuery
        if let url = URL(string: thumbnailURL) {
            thumbnailImageView.load(url: url)
            sizeLabel.text = ImageSizeUnit(bytes: model.size ?? 0).getSizeUnit()
        }
    }
    
    private func setThumbnailSize(model: AlbumImageModel) -> String {
        let size = calcCellSize()
        let resize = ThumbnailResizableModel(mode: .crop, height: size.height, width: size.width)
        return resize.getQuery()
    }
    
    func calcCellSize() -> CGSize {
        let dwidth = UIScreen.main.bounds.width
        return CGSize(width: (dwidth - 36) / 3, height: 140)
    }
}
