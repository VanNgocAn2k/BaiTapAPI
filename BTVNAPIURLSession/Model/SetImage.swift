//
//  SetImage.swift
//  BTVNAPIURLSession
//
//  Created by Văn Tiến Tú on 04/08/2022.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: String?) {
        if let url = url, let link = URL(string: url) {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: link) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        }
    }
}

