//
//  ScoreTableView.swift
//  MonkeyBin
//
//  Created by Florian on 07.07.19.
//  Copyright © 2019 Victor Kachalov. All rights reserved.
//

import UIKit

class ScoreTableView: UIView {
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Мои результаты"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let scoreTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        backgroundColor = UIColor(red: 232, green: 158, blue: 77)
        
        addSubview(infoLabel)
        addSubview(scoreTableView)
        addSubview(buttonStack)
        buttonStack.addArrangedSubview(backButton)
        
        infoLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 10).isActive = true
        infoLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        scoreTableView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20).isActive = true
        scoreTableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scoreTableView.bottomAnchor.constraint(equalTo: buttonStack.topAnchor, constant: -20).isActive = true
        scoreTableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true

        buttonStack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        buttonStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60).isActive = true
        buttonStack.widthAnchor.constraint(equalToConstant: 200).isActive = true
        buttonStack.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

