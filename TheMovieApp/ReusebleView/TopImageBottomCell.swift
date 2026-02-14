//
//  TopImageBottomCell.swift
//  TheMovieApp
//
//  Created by Abid Kerimli on 01.02.26.
//

import UIKit

protocol TopImageBottomProtocol {
    var titleText: String {get}
    var imageName: String {get}
}

class TopImageBottomCell: UICollectionViewCell {
    static let identity = "TopImageBottomCell"
    
    lazy var title: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var topImage: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 24
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
       return image
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        configureConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraint() {
        addSubview(topImage)
        addSubview(title)
        
        NSLayoutConstraint.activate([
            topImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            topImage.bottomAnchor.constraint(equalTo: title.topAnchor,constant: -8),
            topImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            topImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            title.bottomAnchor.constraint(equalTo: bottomAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor)
            
        ])
    }
    
    func configure(data: TopImageBottomProtocol) {
        title.text = data.titleText
        topImage.loadURL(data: data.imageName)
    }
}
