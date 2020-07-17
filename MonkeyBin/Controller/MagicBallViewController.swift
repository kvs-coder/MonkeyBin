//
//  MagicBallViewController.swift
//  MonkeyBin
//
//  Created by Victor Kachalov on 21.05.19.
//  Copyright © 2019 Victor Kachalov. All rights reserved.
//

import UIKit

class MagicBallViewController: UIViewController, GameSceneProtocol {
    
    private let mainView = MagicBallView()
    
    private unowned var magicBallResultImageView: UIImageView { return mainView.questionImageView }
    private unowned var fadeImageView: UIImageView { return mainView.fadeImageView }
    private unowned var rulesImageView: UIImageView { return mainView.magicBallGameRulesImageView }
    private unowned var infoTableImageView: UIImageView { return mainView.infoTableImageView }
    private unowned var popUpImageView:  UIImageView { return mainView.popUpImageView }
    private unowned var monkeyImageView:  UIImageView { return mainView.ballSmileMonkeyImageView }
    private unowned var iGetLuckButton: UIButton { return mainView.iHaveLuckButton }
    private unowned var menuButton: UIButton { return mainView.menuButton }
    private unowned var backButton: UIButton { return mainView.backButton }

    private var randomAnswerIndex: Int = 0
    private let answerImagesArray: [String] = ["luck",
                                               "noLuck",
                                               "more"]
    
    private let answerStringsArray: [String] = ["Удача!",
                                                "Нет...",
                                                "Попробуй еще!"]
    
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
        present(startVC, animated: true, completion: nil)
    }
    
    @objc func iGetLuckButtonTapped() {
        UIView.animate(withDuration: 1, animations: { [unowned self] in
            self.fadeImageView.alpha = 0
            self.rulesImageView.alpha = 0
            self.iGetLuckButton.isHidden = true
            self.infoTableImageView.alpha = 0
            self.popUpImageView.alpha = 0
            self.magicBallResultImageView.rotate()
            }, completion: { [unowned self] _ in
                self.randomAnswerIndex = Int(arc4random_uniform(3))
                self.magicBallResultImageView.image = UIImage(named: self.answerImagesArray[self.randomAnswerIndex])
                
                if self.answerImagesArray[self.randomAnswerIndex] == "noLuck" {
                    UIView.animate(withDuration: 1, animations: { [unowned self] in
                        self.monkeyImageView.alpha = 0
                        }, completion: { [unowned self] _ in
                            UIView.animate(withDuration: 1, animations: { [unowned self] in
                                self.monkeyImageView.alpha = 1
                                self.monkeyImageView.image = UIImage(named: "confusedMonkey")
                            })
                    })
                }
                
                if self.answerImagesArray[self.randomAnswerIndex] == "more" {
                    UIView.animate(withDuration: 1, animations: { [unowned self] in
                        self.monkeyImageView.alpha = 0
                        }, completion: { [unowned self] _ in
                            UIView.animate(withDuration: 1, animations: { [unowned self] in
                                self.monkeyImageView.alpha = 1
                                self.monkeyImageView.image = UIImage(named: "surprisedMonkey")
                            })
                    })
                }
                
                if self.answerImagesArray[self.randomAnswerIndex] == "luck" {
                    UIView.animate(withDuration: 1, animations: { [unowned self] in
                        self.monkeyImageView.alpha = 0
                        }, completion: { [unowned self] _ in
                            UIView.animate(withDuration: 1, animations: { [unowned self] in
                                self.monkeyImageView.alpha = 1
                                self.monkeyImageView.image = UIImage(named: "happyMonkey")
                            })
                    })
                }
                
                self.saveGameResult(text: self.answerStringsArray[self.randomAnswerIndex])
        })
    }
    
    func saveGameResult(text: String) {
        let result = DBInterface.createObject(of: Score.self)
        result?.date = Date()
        result?.game = Constants.ballGameName
        result?.result = text
        DBInterface.saveContext()
    }
}
