//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Наргиза Тамеева on 31.05.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    static let id = "PhotosTableViewCell"
    
    lazy var photosLabel: UILabel = {
           let label = UILabel()
           label.text = "Photos"
           label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
           label.textColor = .black
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
    
    lazy var photosButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var ImageView1: UIImageView = {
           let imageView = UIImageView()
           imageView.image = UIImage(named: "photo0")
           imageView.translatesAutoresizingMaskIntoConstraints = false
           imageView.clipsToBounds = true
           imageView.layer.cornerRadius = 6
           return imageView
       }()
    
    lazy var ImageView2: UIImageView = {
           let imageView = UIImageView()
           imageView.image = UIImage(named: "photo1")
           imageView.translatesAutoresizingMaskIntoConstraints = false
           imageView.clipsToBounds = true
           imageView.layer.cornerRadius = 6
           return imageView
       }()
    
    lazy var ImageView3: UIImageView = {
           let imageView = UIImageView()
           imageView.image = UIImage(named: "photo2")
           imageView.translatesAutoresizingMaskIntoConstraints = false
           imageView.clipsToBounds = true
           imageView.layer.cornerRadius = 6
           return imageView
       }()
    
    lazy var ImageView4: UIImageView = {
           let imageView = UIImageView()
           imageView.image = UIImage(named: "photo3")
           imageView.translatesAutoresizingMaskIntoConstraints = false
           imageView.clipsToBounds = true
           imageView.layer.cornerRadius = 6
           return imageView
       }()
    
   
    
    weak var parentViewController: UIViewController?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    private func setupUI() {
        addSubview(photosLabel)
        addSubview(photosButton)
        addSubview(ImageView1)
        addSubview(ImageView2)
        addSubview(ImageView3)
        addSubview(ImageView4)

        let screenWidth = UIScreen.main.bounds.width
        let offset = CGFloat(12)

        NSLayoutConstraint.activate([
                photosLabel.topAnchor.constraint(equalTo: topAnchor, constant: offset),
                photosLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
                
                photosButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
                photosButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset),
                photosButton.widthAnchor.constraint(equalToConstant: 24), // Задаем ширину кнопки
                photosButton.heightAnchor.constraint(equalToConstant: 24), // Задаем высоту кнопки
                
                ImageView1.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: offset),
                ImageView1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
                ImageView1.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -offset),
                ImageView1.widthAnchor.constraint(equalToConstant: (screenWidth - offset * 4) / 4),
                ImageView1.heightAnchor.constraint(equalToConstant: (screenWidth - offset * 4) / 4),

                ImageView2.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: offset),
                ImageView2.leadingAnchor.constraint(equalTo:ImageView1.trailingAnchor, constant: 8),
                ImageView2.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -offset),
                ImageView2.widthAnchor.constraint(equalTo: ImageView1.widthAnchor),
                ImageView2.heightAnchor.constraint(equalTo: ImageView1.heightAnchor),

                ImageView3.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: offset),
                ImageView3.leadingAnchor.constraint(equalTo: ImageView2.trailingAnchor, constant: 8),
                ImageView3.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -offset),
                ImageView3.widthAnchor.constraint(equalTo: ImageView1.widthAnchor),
                ImageView3.heightAnchor.constraint(equalTo: ImageView1.heightAnchor),

                ImageView4.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: offset),
                ImageView4.leadingAnchor.constraint(equalTo: ImageView3.trailingAnchor, constant: 8),
                ImageView4.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -offset),
                ImageView4.widthAnchor.constraint(equalTo: ImageView1.widthAnchor),
                ImageView4.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset),
                ImageView4.heightAnchor.constraint(equalTo: ImageView1.heightAnchor),
                
            ])

    }

}

