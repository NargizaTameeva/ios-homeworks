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
        view.backgroundColor = .systemMint
        navigationItem.title = "Лента"

        let postButton: UIButton = {
            let button = UIButton()
            button.setTitleColor(.systemBlue, for: .normal)
            button.setTitle("Показать пост", for: .normal)
            button.addTarget(self, action: #selector(addPost), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()

        view.addSubview(postButton)
        postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        postButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @objc func addPost() {
        let post = Post(title: "Новый пост")
        let postViewController = PostViewController(post: post)
        navigationController?.pushViewController(postViewController, animated: true)
    }
}
