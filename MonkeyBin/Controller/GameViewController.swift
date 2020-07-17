//
//  GameViewController.swift
//  MonkeyBin
//
//  Created by Florian on 07.07.19.
//  Copyright © 2019 Victor Kachalov. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    private let gameView = GameView()
    
    private unowned var magicBallPlayButton: UIButton { return gameView.magicBallPlayButton }
    private unowned var coinPlayButton: UIButton { return gameView.coinPlayButton }
    private unowned var backButton: UIButton { return gameView.backButton }
    
    override func loadView() {
        view = gameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        magicBallPlayButton.addTarget(self, action: #selector(magicBallPlayButtonTapped), for: .touchUpInside)
        coinPlayButton.addTarget(self, action: #selector(coinPlayButtonTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func magicBallPlayButtonTapped() {
        let magicBallVC = MagicBallViewController()
        magicBallVC.modalPresentationStyle = .fullScreen
        present(magicBallVC, animated: true, completion: nil)
    }
    
    @objc func coinPlayButtonTapped() {
        let coinVC = FlipCoinViewController()
        coinVC.modalPresentationStyle = .fullScreen
        present(coinVC, animated: true, completion: nil)
    }

}
