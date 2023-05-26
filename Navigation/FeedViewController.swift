//
//  FeedViewController.swift
//  Navigation
//
//  Created by Наргиза Тамеева on 09.05.2023.
//

import UIKit

class FeedViewController: UIViewController {
 
    private lazy var firstButton: UIButton = {
            let button = UIButton()
            button.setTitle("Show post", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .systemYellow
            button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
            button.layer.cornerRadius = 20
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.7
            button.layer.shadowOffset = CGSize(width: 4, height: 4)
            button.layer.shadowRadius = 4
            button.addTarget(self, action: #selector(addPost), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
    private lazy var  secondButton: UIButton = {
              let button = UIButton()
              button.setTitle("Показать пост", for: .normal)
              button.setTitleColor(.black, for: .normal)
              button.backgroundColor = .systemPink
              button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
              button.layer.cornerRadius = 20
              button.layer.shadowColor = UIColor.black.cgColor
              button.layer.shadowOpacity = 0.7
              button.layer.shadowOffset = CGSize(width: 4, height: 4)
              button.layer.shadowRadius = 4
              button.addTarget(self, action: #selector(addPost), for: .touchUpInside)
              button.translatesAutoresizingMaskIntoConstraints = false
              return button
          }()
    
    private lazy var stackView: UIStackView = {[unowned self] in
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
       
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
       
        stackView.addArrangedSubview(self.firstButton)
        stackView.addArrangedSubview(self.secondButton)
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        navigationItem.title = "Лента"
        view.addSubview(stackView)
        setupContraints()
    }
    
    private func setupContraints(){
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 200),
            stackView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc func addPost() {
        let post = Post(title: "Новый пост")
        let postViewController = PostViewController(post: post)
        navigationController?.pushViewController(postViewController, animated: true)
    }
}
