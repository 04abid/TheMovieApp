//
//  HomeCell.swift
//  TheMovieApp
//
//  Created by Abid Kerimli on 01.02.26.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    private lazy var collection: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 16
        layout.itemSize = .zero
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(TopImageBottomCell.self, forCellWithReuseIdentifier: TopImageBottomCell.identity)
        return collection
    }()
    
    lazy var title: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var items = [MovieResult]()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        configureConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraint() {
        addSubview(collection)
        addSubview(title)
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 32),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            title.topAnchor.constraint(equalTo: topAnchor),
            
            collection.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor),
            collection.topAnchor.constraint(equalTo: title.bottomAnchor,constant: 16),
            collection.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
   
    
    func configure(data: HomeModel) {
        items = data.items
        title.text = data.title
    }
}

extension HomeCell:collectionConfiguration {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopImageBottomCell.identity, for: indexPath) as! TopImageBottomCell
//        cell.configure(items: items[indexPath.item])
        cell.configure(data: items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 160, height: collectionView.frame.height)
    }
}

