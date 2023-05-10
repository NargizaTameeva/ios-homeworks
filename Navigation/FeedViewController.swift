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
        
        // Создаем объект типа Post
            let post = Post(title: "Заголовок поста")

            let button = UIButton(type: .system)
            button.setTitle("Показать пост", for: .normal)
            button.addTarget(self, action: #selector(showPost), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)

            button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // Передаем объект типа Post в PostViewController
                _ = PostViewController(post: post)
        
        }

        @objc private func showPost() {
            let postVC = PostViewController(post: Post(title: "Заголовок поста"))
            navigationController?.pushViewController(postVC, animated: true)
        }

}

