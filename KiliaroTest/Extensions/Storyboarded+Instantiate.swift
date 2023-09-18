//
//  Storyboarded+Instantiate.swift
//  KiliaroTest
//
//  Created by Ashkan Ghaderi on 2022-02-08.
//

import Foundation
import UIKit

protocol Storyboarded {
    associatedtype ConcreteCoordinator
    var coordinator: ConcreteCoordinator? { get set }
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    
    private static var fileName: String {
        NSStringFromClass(self)
    }
 
    private static var className: String {
        fileName.components(separatedBy: ".")[1]
    }

    private static var storyboardName: String {
        className.deletingSuffix("ViewController")
    }
    
    private static var storyboard: UIStoryboard {
        UIStoryboard(name: storyboardName, bundle: Bundle.main)
    }

    static func instantiate() -> Self {
        guard let vc = storyboard.instantiateViewController(withIdentifier: className) as? Self else {
            fatalError("Could not find View Controller named \(className)")
        }
        return vc
    }
}

extension Storyboarded where Self: UIViewController {

    static func instantiate(coordinator: ConcreteCoordinator?) -> Self {
        var viewController = instantiate()
        viewController.coordinator = coordinator
        return viewController
    }
}
