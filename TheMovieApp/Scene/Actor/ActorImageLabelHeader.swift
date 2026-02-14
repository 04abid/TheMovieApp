//
//  ActorImageLabelHeader.swift
//  TheMovieApp
//
//  Created by Abid Kerimli on 06.02.26.
//

import UIKit

class ActorImageLabelHeader: UICollectionReusableView {
    
    private lazy var collection: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(TopImageBottomCell.self, forCellWithReuseIdentifier: "TopImageBottomCell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    private var viewModel: ActorViewModel?
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        configureConstraint()
        configureViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViewModel() {
        viewModel?.getActor()
        viewModel?.succes = {
            self.collection.reloadData()
        }
    }
    
    private func configureConstraint() {
        addSubview(collection)
        
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: topAnchor),
            collection.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            collection.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(with viewModel: ActorViewModel) {
          self.viewModel = viewModel
          viewModel.getActor()
          viewModel.succes = { [weak self] in
              DispatchQueue.main.async {
                  self?.collection.reloadData()
              }
          }
      }
      
}

extension ActorImageLabelHeader: collectionConfiguration {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.getDisplayItems().count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(TopImageBottomCell.self)", for: indexPath) as! TopImageBottomCell
        let displayItems = viewModel?.getDisplayItems()
        cell.configure(data: (displayItems?[indexPath.item])!) 
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        viewModel?.startPageInation(index: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 120, height: 160)
    }
}
