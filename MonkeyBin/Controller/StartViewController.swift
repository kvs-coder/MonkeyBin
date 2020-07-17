//
//  StartViewController.swift
//  MonkeyBin
//
//  Created by Florian on 07.07.19.
//  Copyright © 2019 Victor Kachalov. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    private let mainView = StartView()
    
    private unowned var playButton: UIButton { return mainView.playButton }
    private unowned var menuButton: UIButton { return mainView.menuButton }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playButton.addTarget(self, action: #selector(playTapped), for: .touchUpInside)
        menuButton.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
    }
    
    @objc func menuButtonTapped() {
        let scoreVC = ScoreTableViewController()
        scoreVC.modalPresentationStyle = .fullScreen
        present(scoreVC, animated: true, completion: nil)
    }
    
    @objc func playTapped() {
        let gameVC = GameViewController()
        gameVC.modalPresentationStyle = .fullScreen
        present(gameVC, animated: true, completion: nil)
    }

}
