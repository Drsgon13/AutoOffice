//
//  ImageLoaderTest.swift
//  AutoOffice
//
//  Created by Илья Проскурнев on 26.06.2021.
//

import SwiftUI
import Combine
import Foundation

class ImageLoaderTest: ObservableObject {
    @Published var image: UIImage?
    private let url: URL

    init(url: URL) {
        self.url = url
    }

    deinit {
        cancel()
    }

    func load() {}

    func cancel() {}
}
