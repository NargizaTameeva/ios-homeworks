//
//  FeedViewController.swift
//  Navigation
//
//  Created by Наргиза Тамеева on 09.05.2023.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()

            let button = UIButton(type: .system)
            button.setTitle("Показать пост", for: .normal)
            button.addTarget(self, action: #selector(showPost), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)

            button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }

        @objc private func showPost() {
            let postVC = PostViewController()
            navigationController?.pushViewController(postVC, animated: true)
        }

}
