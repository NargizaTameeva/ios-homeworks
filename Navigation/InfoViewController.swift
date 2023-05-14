//
//  InfoViewController.swift
//  Navigation
//
//  Created by Наргиза Тамеева on 09.05.2023.
//

import UIKit

class InfoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Информация"
        let alertButton = UIButton(type: .system)
        alertButton.setTitle("Показать alert", for: .normal)
        alertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        view.addSubview(alertButton)
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @objc func showAlert() {
        let alertController = UIAlertController(title: "Заголовок", message: "Сообщение", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Действие 1", style: .default) { _ in
            print("Нажата первая кнопка")
        }
        let action2 = UIAlertAction(title: "Действие 2", style: .default) { _ in
            print("Нажата вторая кнопка")
        }
        alertController.addAction(action1)
        alertController.addAction(action2)
        present(alertController, animated: true, completion: nil)
    }
}
