//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Наргиза Тамеева on 27.05.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let id = "PostTableViewCell"
    
    lazy var authorLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            label.textColor = .black
            label.numberOfLines = 2
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    lazy var postImageView: UIImageView = {
           let imageView = UIImageView()
           imageView.layer.masksToBounds = true
           imageView.translatesAutoresizingMaskIntoConstraints = false
           imageView.contentMode = .scaleAspectFit
           imageView.backgroundColor = .black
           return imageView
       }()
    
    lazy var descriptionLabel: UILabel = {
           let label = UILabel()
           label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
           label.textColor = .systemGray
           label.numberOfLines = 0
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
    lazy var likesLabel: UILabel = {
           let label = UILabel()
           label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
           label.textColor = .black
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()

    lazy var viewsLabel: UILabel = {
           let label = UILabel()
           label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
           label.textColor = .black
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with post: Post){
        authorLabel.text = post.author
        postImageView.image = UIImage(named: post.image)
        descriptionLabel.text = post.description
        likesLabel.text = "\(post.likes) likes"
        viewsLabel.text = "\(post.views) views"
        
    }
    
    private func setupUI(){
        [authorLabel,
         postImageView,
         descriptionLabel,
         likesLabel,
         viewsLabel].forEach({ contentView.addSubview($0) })
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo:contentView.topAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            postImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
        
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
            
        ])
    }
    
    
}
