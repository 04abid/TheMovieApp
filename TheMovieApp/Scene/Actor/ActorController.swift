//
//  ActorController.swift
//  TheMovieApp
//
//  Created by Abid Kerimli on 04.02.26.
//

import UIKit

class ActorController: BaseController{
    
    private lazy var search: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "search"
        search.searchBarStyle = .default
        search.delegate = self
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    private lazy var collection: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 24
        layout.headerReferenceSize = .init(width: view.frame.width, height: 200)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .clear
        collection.showsVerticalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(ActorImageLabelHeader.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: "ActorImageLabelHeader")
        return collection
    }()
    
//    private let viewModel = ActorViewModel()
    
    private let viewModel: ActorViewModel
    
    init(viewModel: ActorViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureViewModel() {
        viewModel.getActor()
        viewModel.succes = {
            self.collection.reloadData()
        }
    }
    
    override func configureConstraint() {
        view.addSubview(search)
        view.addSubview(collection)
        
        NSLayoutConstraint.activate([
            
            search.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            search.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 8),
            search.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.topAnchor.constraint(equalTo: search.bottomAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ActorController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ActorImageLabelHeader", for: indexPath) as! ActorImageLabelHeader
        header.configure(with: viewModel)
        return header
    }
}

extension ActorController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.getSearchResult(with: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        viewModel.resetItems()
    }
}
