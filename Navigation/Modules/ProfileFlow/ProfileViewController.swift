//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Наргиза Тамеева on 09.05.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let detailView = DetailPhotoView()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(
            frame: .zero,
            style: .grouped
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        navigationItem.hidesBackButton = true
        setupUI()
        setupTable()
        
        
    }
    
    private func setupTable() {
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.id)
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
    
    private func setupDetailPhotoView() {
        let detailView = DetailPhotoView()
        detailView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailView)
        detailView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        let center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
        let initialFrame = CGRect(origin: center, size: CGSize.zero)
        let targetFrame = CGRect(x: self.view.safeAreaInsets.left, y: self.view.safeAreaInsets.top, width: self.view.bounds.width - self.view.safeAreaInsets.left - self.view.safeAreaInsets.right, height: self.view.bounds.height - self.view.safeAreaInsets.top - self.view.safeAreaInsets.bottom)
        let initialPath = UIBezierPath(ovalIn: initialFrame).cgPath
        let targetPath = UIBezierPath(rect: targetFrame).cgPath
        let maskLayer = CAShapeLayer()
        maskLayer.path = initialPath
        detailView.layer.mask = maskLayer
        let maskLayerAnimation = CABasicAnimation(keyPath: "path")
        maskLayerAnimation.fromValue = initialPath
        maskLayerAnimation.toValue = targetPath
        maskLayerAnimation.duration = 0.3
        maskLayerAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        maskLayerAnimation.fillMode = CAMediaTimingFillMode.forwards
        maskLayerAnimation.isRemovedOnCompletion = false
        maskLayer.add(maskLayerAnimation, forKey: "path")
        UIView.animate(withDuration: 0.3, animations: {
            detailView.transform = .identity
        })
        NSLayoutConstraint.activate([
            detailView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            detailView.topAnchor.constraint(equalTo: self.view.topAnchor),
            detailView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        self.view.layoutIfNeeded()
        detailView.animateCloseButton()
        detailView.closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
    }
    
 
    @objc private func closeButtonPressed() {
        print("closeButtonPressed")
        reverseAnimationCloseButton()
    
    }
    
    @objc private func reverseAnimationCloseButton(){
        UIView.animate(withDuration: 0.3) {
            self.detailView.closeButton.alpha = 0
        }
        UIView.animate(withDuration: 0.3, animations: {
            self.detailView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            self.detailView.alpha = 0
        })
        UIView.animate(withDuration: 0.5) {
         //   self.detailView. = .identity
       }
    }

}



extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = ProfileHeaderView()
            header.backgroundColor = .systemGray6
            header.tapOnImage = {[weak self] in
                print("Taped on the image")
                
               self?.setupDetailPhotoView()
                
            }
            return header
        } else {
            let header = UIView()
            header.backgroundColor = .systemGray6
            header.heightAnchor.constraint(equalToConstant:2).isActive = true
            return header
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return posts.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.id, for: indexPath) as? PhotosTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as? PostTableViewCell else {
                return UITableViewCell()
            }
            let post = posts[indexPath.row]
            cell.configure(with: post)
            return cell
        }
    }
   

   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            let photosVC = PhotosViewController()
            navigationController?.pushViewController(photosVC, animated: true)
            
            
        }
    }
 
}
