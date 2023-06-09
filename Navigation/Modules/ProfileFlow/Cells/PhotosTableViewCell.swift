//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Наргиза Тамеева on 31.05.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

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

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.delegate = self
        cv.dataSource = self
        cv.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.id)
        return cv
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
        addSubview(collectionView)

      let screenWidth = UIScreen.main.bounds.width
        let offset = CGFloat(12)

        NSLayoutConstraint.activate([
            photosLabel.topAnchor.constraint(equalTo:topAnchor, constant: offset),
            photosLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),

            photosButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            photosButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset),
            photosButton.widthAnchor.constraint(equalToConstant: 24),
            photosButton.heightAnchor.constraint(equalToConstant: 24),

            collectionView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: offset),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -offset),
            collectionView.heightAnchor.constraint(equalToConstant: (screenWidth - offset * 4) / 4 )
           
        ])
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.id, for: indexPath) as! PhotosCollectionViewCell
        let photo = photos[indexPath.row]
        cell.setup(with: photo)
        return cell
    }

   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       let screenWidth = UIScreen.main.bounds.width
       let offset = CGFloat(12)
       let cellWidth = (screenWidth - offset * 4) / 4
       return CGSize(width: cellWidth, height: cellWidth)
    }

}
