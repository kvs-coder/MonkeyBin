//
//  ScoreTableViewController.swift
//  MonkeyBin
//
//  Created by Victor Kachalov on 06.06.19.
//  Copyright © 2019 Victor Kachalov. All rights reserved.
//

import UIKit
import MessageUI

class ScoreTableViewController: UIViewController {
    
    private let cellId = "cell"
    private var scores: [Score] = []
    
    private let mainView = ScoreTableView()
    
    private unowned var tableView: UITableView { return mainView.scoreTableView }
    private unowned var backButton: UIButton { return mainView.backButton }
    
    private let df: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd 'в' HH:mm"
        return dateFormatter
    }()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        getScores()
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ОК", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getScores()
    }
    
    private func getScores() {
        scores = DBInterface.queryObjects(entity: Score.self)
        tableView.reloadData()
    }
    
    private func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        cell.imageView?.image = nil
        cell.backgroundColor = .clear
        
        let game = scores[indexPath.row].game!
        
        cell.imageView?.image = game == Constants.ballGameName ? UIImage(named: "luck_icon") : UIImage(named: "coin_icon")
        
        let result = scores[indexPath.row].result!
        let date = df.string(from: scores[indexPath.row].date!)
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = "Твоя игра от \(date)"
        
        if result == "Удача!" {
            cell.textLabel?.text? += "\nТы молодец, удача на твоей стороне!"
        }
        if result == "Нет..." {
            cell.textLabel?.text? += "\nЭх, не повезло, но не унывай! Все у тебя получится!"
        }
        if result == "Попробуй еще!" {
            cell.textLabel?.text? += "\nПопытка не пытка, попробуй еще разок!"
        }
        if result == "Орел!" {
            cell.textLabel?.text? += "\nНадеюсь, тобой был загадан именно Орел"
        }
        if result == "Решка!" {
            cell.textLabel?.text? += "\nРешка тоже неплохо, особенно, если выигрыш за тобой!"
        }
    }

}

extension ScoreTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        configureCell(cell, at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let result = scores[indexPath.row].result!
        let game = scores[indexPath.row].game!
        let date = df.string(from: scores[indexPath.row].date!)
        
        let text = "Посмотри! Моя удача говорит мне это: \(result), в игре: \(game), а вот, когда была игра: \(date)"
        sendEmail(with: text)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            let score = scores[indexPath.row]
            scores.remove(at: indexPath.row)
            DBInterface.deleteObject(score)
            DBInterface.saveContext()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
}

extension ScoreTableViewController: MFMailComposeViewControllerDelegate {
    
    func sendEmail(with text: String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setMessageBody(text, isHTML: true)
            present(mail, animated: true)
        } else {
            showAlert(title: "Ошибка!", message: #"Не удалось отправить сообщение! Проверь, настроено ли приложение "Почта" и есть ли соединение с интернетом"#)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
}
