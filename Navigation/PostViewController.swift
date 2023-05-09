//
//  PostViewController.swift
//  Navigation
//
//  Created by Наргиза Тамеева on 09.05.2023.
//

import UIKit



class PostViewController: UIViewController {
    private let post: Post

    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Добавляем Bar Button Item в навигейшн бар
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,target: self, action: #selector(openInfo))
        title = post.title
        view.backgroundColor = .white
    }
    @objc private func openInfo() {
            let infoVC = InfoViewController()
            present(infoVC, animated: true, completion: nil)
        }
}
