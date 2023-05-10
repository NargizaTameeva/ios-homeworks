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
        
        let post = Post(title: "Заголовок поста")
        let button = UIButton(type: .system)
            button.setTitle("Показать пост", for: .normal)
            button.setTitleColor(.blue, for: .normal)
            button.backgroundColor = .systemMint
            button.layer.cornerRadius = 8
            button.addTarget(self, action: #selector(showPost), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)

            button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
                _ = PostViewController(post: post)
        
        }

    @objc private func showPost() {
        let postVC = PostViewController(post: Post(title: "Заголовок поста"))
        postVC.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Нажми меня", style: .plain, target: postVC, action: #selector(postVC.buttonTapped))
        navigationController?.pushViewController(postVC, animated: true)
    }

}

