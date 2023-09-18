//
//  URLRequestLoggableProtocol.swift
//  KiliaroTest
//
//  Created by Ashkan Ghaderi on 2022-02-08.
//

import Foundation

protocol URLRequestLoggableProtocol {
    func logResponse(_ response: HTTPURLResponse?,
                     data: Data?,
                     error: Error?,
                     HTTPMethod: String?)
}
