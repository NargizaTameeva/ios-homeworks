//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Наргиза Тамеева on 09.05.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Профиль"
        setupUI()
        setupTable()
        
        let headerView = ProfileHeaderView()
        headerView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 250)
        headerView.backgroundColor = .lightGray
        tableView.tableHeaderView = headerView
    }
    
    private func setupTable() {
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}


extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:PostTableViewCell.id,for: indexPath) as? PostTableViewCell else {return UITableViewCell() }
        let post = posts[indexPath.row]
        cell.configure(with:post)
        return cell
    }

}

