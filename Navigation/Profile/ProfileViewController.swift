//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Наргиза Тамеева on 09.05.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationItem.title = "Профиль"

        let profileHeaderView = ProfileHeaderView()
            profileHeaderView.frame = view.frame
        view.addSubview(profileHeaderView)
    }
   
}
