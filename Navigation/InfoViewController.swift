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

        let button = UIButton(type: .system)
        button.setTitle("Показать Alert", for: .normal)
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func showAlert() {
        let alert = UIAlertController(title: "Alert", message: "This is an alert.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
