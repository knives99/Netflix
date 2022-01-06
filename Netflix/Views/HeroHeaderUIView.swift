//
//  HeroHeaderUIView.swift
//  Netflix
//
//  Created by Bryan on 2022/1/6.
//

import UIKit


//MARK: - Gradient /  Constraints

class HeroHeaderUIView: UIView {
    
    
    private let downloadButton:UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints  = false
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        return button
    }()
    
    private let  playButton:UIButton = {
        let buttom = UIButton()
        buttom.setTitle("Play", for: .normal)
        buttom.layer.borderWidth = 1
        buttom.layer.masksToBounds = true
        buttom.layer.cornerRadius = 8
        buttom.layer.borderColor = UIColor.white.cgColor
        buttom.translatesAutoresizingMaskIntoConstraints = false
        return buttom
    }()
    
    private let heroImageView:UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "A")
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
    }
    
    //Gradient
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
        applyConstraints()
    }
    
    
    //Constraoints
    private func applyConstraints(){
        
        let widthConstant:CGFloat = 120
        let bottomConstant:CGFloat = -80
        let playButtonConstraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottomConstant),
            playButton.widthAnchor.constraint(equalToConstant: widthConstant)
        ]
        
        let downloadButtonContraints = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottomConstant),
            downloadButton.widthAnchor.constraint(equalToConstant: widthConstant)
        ]
        
        NSLayoutConstraint.activate(playButtonConstraints)
        NSLayoutConstraint.activate(downloadButtonContraints)
    }
    
}
