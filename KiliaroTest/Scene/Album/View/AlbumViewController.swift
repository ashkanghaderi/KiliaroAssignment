//
//  AlbumViewController.swift
//  KiliaroTest
//
//  Created by Ashkan Ghaderi on 2022-02-09.
//

import UIKit

class AlbumViewController: UIViewController, Storyboarded {
    
    weak var coordinator: AlbumCoordinator?
    private let albumVM: AlbumViewModel = AlbumViewModel(albumService: AlbumService.shared)
    var dataSource: [AlbumImageModel] = []
    var mainIndicator: UIActivityIndicatorView?
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .refresh,
                                                              target: self,
                                                              action: #selector(refreshData(_:))), animated: true)
        
        mainIndicator = UIActivityIndicatorView(style: .medium)
        mainIndicator?.hidesWhenStopped = true
        mainIndicator?.startAnimating()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: mainIndicator!)
        setupCollectionView()
        setupBinding()
        albumVM.fetchImages()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "AlbumCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AlbumCollectionViewCell")
    }
    
    private func setupBinding() {
        albumVM.loading = { [weak self] isLoading in
            guard let self = self else { return }
            self.mainIndicator?.startAnimating()
            self.mainIndicator?.isHidden = !isLoading
        }
        
        albumVM.images = { [weak self] images in
            guard let self = self else { return }
            self.dataSource = images
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        albumVM.errorHandler = { [weak self] error in
            guard let self = self else { return }
            self.showAlert(message: error)
        }
    }
    
    private func showAlert(title: String = "Error", message: String, buttonTitle: String = "Ok") {
        let ac = UIAlertController(title: title,
                                    message: message,
                                    preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(ac, animated: true, completion: nil)
    }
    
    @objc private func refreshData(_ button: UIBarButtonItem) {
        albumVM.refreshAllCachedFilesAndReload()
    }

}

extension AlbumViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCollectionViewCell", for: indexPath) as! AlbumCollectionViewCell
        let model = self.dataSource[indexPath.item]
        cell.bind(model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let dwidth = UIScreen.main.bounds.width
        return CGSize(width: (dwidth - 36) / 3, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = self.dataSource[indexPath.item]
        coordinator?.toPreviewImage(item: model)
    }
}
