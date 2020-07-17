//
//  GameView.swift
//  MonkeyBin
//
//  Created by Florian on 07.07.19.
//  Copyright © 2019 Victor Kachalov. All rights reserved.
//

import UIKit

class GameView: UIView {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bg")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let pickMonkeyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pickMonkey")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let tableImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tableDouble")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let magicBallPlayButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "magicBall"), for: .normal)
        button.setTitleColor(.yellow, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let coinPlayButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "coin"), for: .normal)
        button.setTitleColor(.yellow, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "back"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor(.yellow, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(backgroundImageView)
        addSubview(pickMonkeyImageView)
        addSubview(tableImageView)
        addSubview(magicBallPlayButton)
        addSubview(coinPlayButton)
        addSubview(buttonStack)
        buttonStack.addArrangedSubview(backButton)
        
        backgroundImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backgroundImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
        pickMonkeyImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        pickMonkeyImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        pickMonkeyImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100).isActive = true
        
        switch UIDevice.screenType {
        case .iPhones_4_4S:
            pickMonkeyImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        case .iPhones_5_5s_5c_SE:
            pickMonkeyImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        case .iPhones_6_6s_7_8:
            pickMonkeyImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        case .iPhones_6Plus_6sPlus_7Plus_8Plus:
            pickMonkeyImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        case .iPhones_X_XS:
            pickMonkeyImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        case .iPhone_XR:
            pickMonkeyImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        case .iPhone_XSMax:
            pickMonkeyImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        case .unknown:
            pickMonkeyImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        }
        
        tableImageView.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        tableImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        tableImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        tableImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        magicBallPlayButton.centerYAnchor.constraint(equalTo: tableImageView.centerYAnchor, constant: -55).isActive = true
        magicBallPlayButton.rightAnchor.constraint(equalTo: tableImageView.rightAnchor, constant: -40).isActive = true
        magicBallPlayButton.leftAnchor.constraint(equalTo: tableImageView.leftAnchor, constant: 40).isActive = true
        magicBallPlayButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        coinPlayButton.centerYAnchor.constraint(equalTo: tableImageView.centerYAnchor, constant: 110).isActive = true
        coinPlayButton.rightAnchor.constraint(equalTo: tableImageView.rightAnchor, constant: -40).isActive = true
        coinPlayButton.leftAnchor.constraint(equalTo: tableImageView.leftAnchor, constant: 40).isActive = true
        coinPlayButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        buttonStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        buttonStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60).isActive = true
        buttonStack.widthAnchor.constraint(equalToConstant: 200).isActive = true
        buttonStack.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
