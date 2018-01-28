//
//  RoundedImageView.swift
//  AlbumSearch
//
//  Created by Руслан Акберов on 28.01.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedImageView: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
}
