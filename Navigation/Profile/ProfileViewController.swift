//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Наргиза Тамеева on 09.05.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    private let profileHeaderView: ProfileHeaderView = {
        let profileHV = ProfileHeaderView()
        profileHV.translatesAutoresizingMaskIntoConstraints = false
        return profileHV
    }()
    
    private lazy var newButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Сhange title", for: .normal)
        button.backgroundColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationItem.title = "Профиль"
        view.addSubview(profileHeaderView)
        view.addSubview(newButton)
        setupContraints()
    }
    
    
    private func setupContraints(){
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo:view.leadingAnchor , constant : 0),
            profileHeaderView.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant : 0),
            profileHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            newButton.leadingAnchor.constraint(equalTo:view.leadingAnchor , constant : 0),
            newButton.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant : 0),
            newButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        
        ])
    }
    
   
}
