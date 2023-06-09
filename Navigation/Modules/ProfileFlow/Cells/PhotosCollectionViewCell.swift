//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Наргиза Тамеева on 01.06.2023.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    static let id = "PhotosCollectionViewCell"

    let galleryImageView: UIImageView = {
        let galleryImageView = UIImageView(frame: .zero)
        galleryImageView.translatesAutoresizingMaskIntoConstraints = false
        galleryImageView.contentMode = .scaleAspectFill
        galleryImageView.clipsToBounds = true
        return galleryImageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupSubviews()
        setupLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        contentView.backgroundColor = .systemBackground
        contentView.clipsToBounds = true
    }

    private func setupSubviews() {
        contentView.addSubview(galleryImageView)
    }

    private func setupLayouts() {
        NSLayoutConstraint.activate([
            galleryImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            galleryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            galleryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            galleryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    func setup(with photo: Photo) {
        galleryImageView.image = UIImage(named: photo.name)
    }
}

