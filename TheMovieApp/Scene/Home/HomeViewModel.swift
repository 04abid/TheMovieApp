//
//  HomeViewModel.swift
//  TheMovieApp
//
//  Created by Abid Kerimli on 31.01.26.
//

import Foundation


struct HomeModel {
    var title: String
    var items: [MovieResult]
}

class HomeViewModel {
    var items = [HomeModel]()

    private var useCase: HomeUseCase
    init(useCase: HomeUseCase) {
        self.useCase = useCase
    }
    
    var succes: (() -> Void)?
    var error: ((String) -> Void)?
    
    
    func getMovies() {
        getMovieItems(endpoint: HomeEndpoint.nowPlaying.rawValue, title: "Now Playing")
        getMovieItems(endpoint: HomeEndpoint.popular.rawValue, title: "Popular")
        getMovieItems(endpoint: HomeEndpoint.topRated.rawValue, title: "Top Rated")
        getMovieItems(endpoint: HomeEndpoint.upComing.rawValue, title: "Upcoming")
    }
    
    func getMovieItems(endpoint: String, title: String) {
        useCase.getHomeItems(endpoint: endpoint) { data, erroMessage in
            if let erroMessage {
                self.error?(erroMessage)
            } else if let data {
                self.items.append(.init(title: title, items: data.results ?? [] ))
                print(self.items)
                self.succes?()
            }
        }
    }
}
        
        
    

