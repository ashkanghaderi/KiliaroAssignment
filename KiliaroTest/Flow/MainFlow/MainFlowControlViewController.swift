//
//  MainFlowControlViewController.swift
//  KiliaroTest
//
//  Created by Ashkan Ghaderi on 2022-02-08.
//

import UIKit

class MainFlowControlViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var toAlbumPage: UIButton!
    
    weak var coordinator: AppCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func toAlbum(_ sender: Any) {
        coordinator?.toAlbum()
    }
}
