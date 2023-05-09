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

        // Создаем кнопку для отображения UIAlertController
        let button = UIButton(type: .system)
        button.setTitle("Показать Alert", for: .normal)
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)

        // Устанавливаем констрейнты для кнопки
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @objc private func showAlert() {
        let alert = UIAlertController(title: "Заголовок", message: "Сообщение", preferredStyle: .alert)

        let action1 = UIAlertAction(title: "Действие 1", style: .default) { (_) in
            print("Нажата кнопка Действие 1")
        }

        let action2 = UIAlertAction(title: "Действие 2", style: .default) { (_) in
            print("Нажата кнопка Действие 2")
        }

        alert.addAction(action1)
        alert.addAction(action2)

        present(alert, animated: true, completion: nil)
    }
}
