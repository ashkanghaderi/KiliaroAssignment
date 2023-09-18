//
//  AlbumItemViewController.swift
//  KiliaroTest
//
//  Created by Ashkan Ghaderi on 2022-02-09.
//

import UIKit

class AlbumItemViewController: UIViewController,Storyboarded {
    
    weak var coordinator: AlbumItemCoordinator?
    
    @IBOutlet weak var mainIndicator: UIActivityIndicatorView!{
        didSet{
            mainIndicator.isHidden = true
        }
    }
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var createdDate: UILabel!{
        didSet{
            createdDate.textColor = .white
        }
    }
    private let albumItemVM: AlbumItemViewModel = AlbumItemViewModel(albumService: AlbumService.shared)
    var albumImageModel: AlbumImageModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let model = albumImageModel {
            albumItemVM.downloadfile(from: model)
        }
    }
    
    private func setupBinding() {
        albumItemVM.loading = { [weak self] isLoading in
            guard let self = self else { return }
            self.mainIndicator.startAnimating()
            self.mainIndicator.isHidden = !isLoading
        }

        albumItemVM.errorHandler = { [weak self] error in
            guard let self = self else { return }
            self.showAlert(message: error)
        }
        
        albumItemVM.downloadHandler = { [weak self] previewModel in
            guard let self = self else { return }
            if let url = previewModel.previewItemURL {
                self.imageView.image = UIImage(contentsOfFile: url.path)
            }
            self.createdDate.text = previewModel.displayName
        }
    }
    
    private func showAlert(title: String = "Error", message: String, buttonTitle: String = "Ok") {
        let ac = UIAlertController(title: title,
                                    message: message,
                                    preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(ac, animated: true, completion: {
            self.coordinator?.finish()
        })
    }

    @IBAction func onBack(_ sender: Any) {
        coordinator?.finish()
    }
}
