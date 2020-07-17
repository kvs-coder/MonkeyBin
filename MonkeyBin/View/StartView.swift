//
//  StartView.swift
//  MonkeyBin
//
//  Created by Florian on 07.07.19.
//  Copyright © 2019 Victor Kachalov. All rights reserved.
//

import UIKit

class StartView: UIView {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bg")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let menuMonkeyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "menuMonkey")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let tableImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "table")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let playButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "play"), for: .normal)
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
    
    let menuButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "menu"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor(.yellow, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(backgroundImageView)
        addSubview(menuMonkeyImageView)
        addSubview(tableImageView)
        addSubview(playButton)
        addSubview(buttonStack)
        buttonStack.addArrangedSubview(menuButton)
        
        backgroundImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backgroundImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
        menuMonkeyImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        menuMonkeyImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        menuMonkeyImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100).isActive = true
        
        switch UIDevice.screenType {
        case .iPhones_4_4S:
            menuMonkeyImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        case .iPhones_5_5s_5c_SE:
            menuMonkeyImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        case .iPhones_6_6s_7_8:
            menuMonkeyImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        case .iPhones_6Plus_6sPlus_7Plus_8Plus:
            menuMonkeyImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        case .iPhones_X_XS:
            menuMonkeyImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        case .iPhone_XR:
            menuMonkeyImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        case .iPhone_XSMax:
            menuMonkeyImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        case .unknown:
            menuMonkeyImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        }
        
        tableImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        tableImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        tableImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        playButton.centerYAnchor.constraint(equalTo: tableImageView.centerYAnchor, constant: 60).isActive = true
        playButton.rightAnchor.constraint(equalTo: tableImageView.rightAnchor, constant: -40).isActive = true
        playButton.leftAnchor.constraint(equalTo: tableImageView.leftAnchor, constant: 40).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        buttonStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        buttonStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60).isActive = true
        buttonStack.widthAnchor.constraint(equalToConstant: 200).isActive = true
        buttonStack.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
