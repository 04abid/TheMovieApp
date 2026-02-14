//
//  ActorViewModel.swift
//  TheMovieApp
//
//  Created by Abid Kerimli on 04.02.26.
//

import Foundation


class ActorViewModel {
    var filteredItems: [ActorResult] = []
    var isSearching: Bool = false
    var items = [ActorResult]()
    var actorData: Actor?
    
//    private var manager = ActorManager()
    
    private var useCase: ActorUseCase
    
    init(useCase: ActorUseCase) {
        self.useCase = useCase
    }
    
    var succes: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getActor() {
        let page = (actorData?.page ?? 0 ) + 1
        useCase.getPopularActors(page: "\(page)") { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.actorData = data
                self.items.append(contentsOf: data.results ?? [])
                print(self.items)
                self.succes?()
            }
        }
    }
    
    func startPageInation(index: Int) {
        if index > items.count - 2 && (actorData?.page ?? 00 <= actorData?.totalPages ?? 0) {
            getActor()
        }
    }
}



extension ActorViewModel {
    func getSearchResult(with data: String) {
        if data.isEmpty {
            isSearching = false
            filteredItems.removeAll()
        } else {
            isSearching = true
            filteredItems = items.filter { actor in
                guard let actorName = actor.name else { return false }
                let matches = actorName.lowercased().contains(data.lowercased())
                return matches
            }
        }
        succes?()
    }
    
    func getDisplayItems() -> [ActorResult] {
        return   isSearching ? filteredItems : items
    }
    
    func resetItems() {
        isSearching = false
        filteredItems.removeAll()
        succes?()
    }
}

