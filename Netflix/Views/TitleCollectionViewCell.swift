//
//  TitleCollectionViewCell.swift
//  Netflix
//
//  Created by Bryan on 2022/1/13.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell"

    let imageView :UIImageView = {
        let image = UIImageView()
        image.contentMode  = .scaleAspectFill
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds

    }
    
    // public
    public func configure (model:String){
        guard let url = URL(string: "https://image.tmdb.org/t/p/original" + model ) else {return}
        imageView.sd_setImage(with: url, completed: nil)
        
    }
}
