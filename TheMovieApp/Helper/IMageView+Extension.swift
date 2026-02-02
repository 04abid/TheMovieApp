//
//  IMageView+Extension.swift
//  TheMovieApp
//
//  Created by Abid Kerimli on 02.02.26.
//

import UIKit
import Kingfisher


extension UIImageView{
    func loadURL(data: String) {
        let url = URL(string: CoreHelper.shared.configureImageURL(path: data ))
        kf.setImage(with: url)
    }
}
