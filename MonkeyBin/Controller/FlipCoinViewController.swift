//
//  FlipCoinViewController.swift
//  MonkeyBin
//
//  Created by Victor Kachalov on 02.06.19.
//  Copyright © 2019 Victor Kachalov. All rights reserved.
//

import UIKit

class FlipCoinViewController: UIViewController, GameSceneProtocol {
  
    private let mainView = FlipCoinView()
    
    private unowned var coinResultImageView: UIImageView { return mainView.coinImageView }
    private unowned var fadeImageView: UIImageView { return mainView.fadeImageView }
    private unowned var rulesImageView: UIImageView { return mainView.coinGameRulesImageView }
    private unowned var infoTableImageView: UIImageView { return mainView.infoTableImageView }
    private unowned var popUpImageView:  UIImageView { return mainView.popUpImageView }
    private unowned var monkeyImageView:  UIImageView { return mainView.coinSmileMonkeyImageView }
    private unowned var iGetLuckButton: UIButton { return mainView.iHaveLuckButton }
    private unowned var menuButton: UIButton { return mainView.menuButton }
    private unowned var backButton: UIButton { return mainView.backButton }
    
    private var randomAnswerIndex: Int = 0
    private let answerStringsArray: [String] = ["Орел!", "Решка!"]
    private let answerImagesArray: [String] = ["kopf", "zahl"]
    
    private var counter = 1
    private var timer = Timer()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iGetLuckButton.addTarget(self, action: #selector(iGetLuckButtonTapped), for: .touchUpInside)
        menuButton.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func menuButtonTapped() {
        let startVC = StartViewController()
        startVC.modalPresentationStyle = .fullScreen
        present(startVC, animated: true, completion: nil)
    }
    
    @objc func animate() {
        coinResultImageView.image = UIImage(named: "coin_\(counter)")
        counter += 1
        
        if counter == 3 {
            counter = 0
        }
    }
    
    @objc func iGetLuckButtonTapped() {
        UIView.animate(withDuration: 1, animations: { [unowned self] in
            self.fadeImageView.alpha = 0
            self.rulesImageView.alpha = 0
            self.iGetLuckButton.isHidden = true
            self.infoTableImageView.alpha = 0
            self.popUpImageView.alpha = 0
            
            self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.animate), userInfo: nil, repeats: true)
            
            // einige Animation     self.magicBallResultImageView.rotate()
            }, completion: { [unowned self] _ in
                self.timer.invalidate()
                self.randomAnswerIndex = Int(arc4random_uniform(2))
                self.coinResultImageView.image = UIImage(named: self.answerImagesArray[self.randomAnswerIndex])
                
                UIView.animate(withDuration: 1, animations: { [unowned self] in
                    self.monkeyImageView.alpha = 0
                    }, completion: { [unowned self] _ in
                        UIView.animate(withDuration: 1, animations: { [unowned self] in
                            self.monkeyImageView.alpha = 1
                            self.monkeyImageView.image = UIImage(named: "happyMonkey")
                        })
                })
                
                self.saveGameResult(text: self.answerStringsArray[self.randomAnswerIndex])
        })
    }
    
    func saveGameResult(text: String) {
        let result = DBInterface.createObject(of: Score.self)
        result?.date = Date()
        result?.game = Constants.coinGameName
        result?.result = text
        DBInterface.saveContext()
    }

}
