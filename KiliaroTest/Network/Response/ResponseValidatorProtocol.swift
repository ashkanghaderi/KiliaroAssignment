//
//  ResponseValidatorProtocol.swift
//  KiliaroTest
//
//  Created by Ashkan Ghaderi on 2022-02-08.
//

import Foundation

protocol ResponseValidatorProtocol {
    func validation<T: Codable>(response: HTTPURLResponse?, data: Data?) -> Result<T, RequestError>
}
