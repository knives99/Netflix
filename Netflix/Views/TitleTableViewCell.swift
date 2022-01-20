//
//  TitleTableViewCell.swift
//  Netflix
//
//  Created by Bryan on 2022/1/14.
//

//UIImage.SymbolConfiguration(pointSize: 25)

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    static let identifier = "TitleTableViewCell"
    
    private let playTitleButton:UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25))
        button.setImage(image, for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    private let titleLable:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .regular)
//        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let titlePosterUIImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
//        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(playTitleButton)
        addSubview(titleLable)
        addSubview(titlePosterUIImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyConstraints()

    }
    
    public func configure(model:TitleTableViewCellViewModel){
        titleLable.text = model.title
        let url = URL(string: "https://image.tmdb.org/t/p/w500/" + model.imagePath )
        titlePosterUIImage.sd_setImage(with: url, completed: nil)
    }
    
    private func applyConstraints(){
//        let titlesPosterUIImageViewConstraints = [
//            titlePosterUIImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            titlePosterUIImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
//            titlePosterUIImage.widthAnchor.constraint(equalToConstant: 100),
//            titlePosterUIImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
//        ]
//
//
//        let titleLabelConstraints = [
//            titleLable.leadingAnchor.constraint(equalTo: titlePosterUIImage.trailingAnchor, constant: 20),
//            titleLable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
//        ]
//
//
//        let playTitleButtonConstraints = [
//            playTitleButton.centerYAnchor .constraint(equalTo: contentView.centerYAnchor),
//            playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
//        ]
//        NSLayoutConstraint.activate(titleLabelConstraints)
//        NSLayoutConstraint.activate(titlesPosterUIImageViewConstraints)
//        NSLayoutConstraint.activate(playTitleButtonConstraints)
        
        titlePosterUIImage.frame = CGRect(x: 0, y: 3, width: 100, height: 100)
        titleLable.frame = CGRect(x: titlePosterUIImage.frame.width, y: (contentView.frame.height - titleLable.frame.height) / 2, width: contentView.frame.width - titlePosterUIImage.frame.width - playTitleButton.frame.width, height: 80)
        playTitleButton.frame = CGRect(x: contentView.frame.width - playTitleButton.frame.width, y: (contentView.frame.height - playTitleButton.frame.height) / 2, width: 100, height: 100)
        
    }
    
    
}
