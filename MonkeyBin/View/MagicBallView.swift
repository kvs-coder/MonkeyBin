//
//  MagicBallView.swift
//  MonkeyBin
//
//  Created by Victor Kachalov on 21.05.19.
//  Copyright © 2019 Victor Kachalov. All rights reserved.
//

import UIKit

class MagicBallView: UIView {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mgBg")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let ballImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "magicBallEmpty")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let questionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "question")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let ballSmileMonkeyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ballSmileMonkey")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let popUpImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "popUp")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let infoTableImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "infoTable")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let fadeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fade")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let magicBallGameRulesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "magicBallRules")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let iHaveLuckButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "getLuck"), for: .normal)
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
        addSubview(ballImageView)
        addSubview(questionImageView)
        addSubview(ballSmileMonkeyImageView)
        addSubview(popUpImageView)
        addSubview(infoTableImageView)
        addSubview(fadeImageView)
        addSubview(magicBallGameRulesImageView)
        addSubview(iHaveLuckButton)
        addSubview(buttonStack)
        buttonStack.addArrangedSubview(menuButton)
        buttonStack.addArrangedSubview(backButton)
        
        backgroundImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backgroundImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
        fadeImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        fadeImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        fadeImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        fadeImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
        ballImageView.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
        ballImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        ballImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        ballImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        questionImageView.centerYAnchor.constraint(equalTo: ballImageView.centerYAnchor, constant: -10).isActive = true
        questionImageView.centerXAnchor.constraint(equalTo: ballImageView.centerXAnchor).isActive = true
        questionImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        questionImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        ballSmileMonkeyImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        ballSmileMonkeyImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        ballSmileMonkeyImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -150).isActive = true
        
        switch UIDevice.screenType {
        case .iPhones_4_4S:
            ballSmileMonkeyImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        case .iPhones_5_5s_5c_SE:
            ballSmileMonkeyImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        case .iPhones_6_6s_7_8:
            ballSmileMonkeyImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        case .iPhones_6Plus_6sPlus_7Plus_8Plus:
            ballSmileMonkeyImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        case .iPhones_X_XS:
            ballSmileMonkeyImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        case .iPhone_XR:
            ballSmileMonkeyImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        case .iPhone_XSMax:
            ballSmileMonkeyImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        case .unknown:
            ballSmileMonkeyImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        }
        
        buttonStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        buttonStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60).isActive = true
        buttonStack.widthAnchor.constraint(equalToConstant: 200).isActive = true
        buttonStack.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        popUpImageView.layer.zPosition = 1
        popUpImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        popUpImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        popUpImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        popUpImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        magicBallGameRulesImageView.layer.zPosition = 1
        magicBallGameRulesImageView.topAnchor.constraint(equalTo: popUpImageView.topAnchor, constant: 20).isActive = true
        magicBallGameRulesImageView.rightAnchor.constraint(equalTo: popUpImageView.rightAnchor, constant: -20).isActive = true
        magicBallGameRulesImageView.leftAnchor.constraint(equalTo: popUpImageView.leftAnchor, constant: 20).isActive = true
        magicBallGameRulesImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        infoTableImageView.layer.zPosition = 1
        infoTableImageView.rightAnchor.constraint(equalTo: popUpImageView.rightAnchor, constant: -10).isActive = true
        infoTableImageView.leftAnchor.constraint(equalTo: popUpImageView.leftAnchor, constant: 10).isActive = true
        infoTableImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        infoTableImageView.centerYAnchor.constraint(equalTo: popUpImageView.centerYAnchor, constant: 50).isActive = true
        
        iHaveLuckButton.layer.zPosition = 1
        iHaveLuckButton.rightAnchor.constraint(equalTo: infoTableImageView.rightAnchor, constant: -20).isActive = true
        iHaveLuckButton.leftAnchor.constraint(equalTo: infoTableImageView.leftAnchor, constant: 20).isActive = true
        iHaveLuckButton.centerYAnchor.constraint(equalTo: infoTableImageView.centerYAnchor, constant: -5).isActive = true
        iHaveLuckButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
   }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
