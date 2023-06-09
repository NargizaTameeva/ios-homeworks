//
//  DetailPhotoView.swift
//  Navigation
//
//  Created by Наргиза Тамеева on 06.06.2023.
//

import UIKit

class DetailPhotoView: UIView {
    
    private let enlargedPhoto: UIImageView = {
        let enlargedPhoto = UIImageView()
        enlargedPhoto.backgroundColor = .green
        enlargedPhoto.image = UIImage(named: "avatar")
        enlargedPhoto.translatesAutoresizingMaskIntoConstraints = false
        return enlargedPhoto
        }()
    
     lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .red
        button.alpha = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .clear
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        backgroundColor = .black.withAlphaComponent(0.5)
        addSubview(enlargedPhoto)
        addSubview(closeButton)
        
        NSLayoutConstraint.activate([
           
            closeButton.trailingAnchor.constraint(equalTo:trailingAnchor),
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
        
            enlargedPhoto.leadingAnchor.constraint(equalTo: leadingAnchor),
            enlargedPhoto.trailingAnchor.constraint(equalTo: trailingAnchor),
            enlargedPhoto.centerYAnchor.constraint(equalTo: centerYAnchor),
            enlargedPhoto.centerXAnchor.constraint(equalTo: centerXAnchor),
            enlargedPhoto.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            enlargedPhoto.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
        ])
      
    }
    
    // код для анимации кнопки closeButton
       func animateCloseButton() {
           UIView.animate(withDuration: 0.3, animations: {
               self.closeButton.alpha = 1
           })
       }
   }

