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
    var manager = CoreManager()
    
    var succes: (() -> Void)?
    var error: ((String) -> Void)?
    
    
    func getMovies() {
        getNowPlayingMovies()
        getPopularMovies()
        getTopRatedMovies()
        getUpcomigMovies()
    }
    
    private func getNowPlayingMovies() {
        manager.request(model: Movie.self, endpoint: .nowPlaying) { data, erroMessage in
            if let erroMessage {
                self.error?(erroMessage)
            } else if let data {
                self.items.append(.init(title: "Now Playing", items: data.results ?? []))
                print(self.items)
                self.succes?()
            }
        }
    }
    
    private func getPopularMovies() {
        manager.request(model: Movie.self, endpoint: .popular) { data, erroMessage in
            if let erroMessage {
                self.error?(erroMessage)
            } else if let data {
                self.items.append(.init(title: "Popular", items: data.results ?? []))
                print(self.items)
                self.succes?()
            }
        }
    }
    
    private func getTopRatedMovies() {
        manager.request(model: Movie.self, endpoint: .topRated) { data, erroMessage in
            if let erroMessage {
                self.error?(erroMessage)
            } else if let data {
                self.items.append(.init(title: "Top Rated", items: data.results ?? []))
                print(self.items)
                self.succes?()
            }
        }
    }
    
    private func getUpcomigMovies() {
        manager.request(model: Movie.self, endpoint: .upComing) { data, erroMessage in
            if let erroMessage {
                self.error?(erroMessage)
            } else if let data {
                self.items.append(.init(title: "Upcoming", items: data.results ?? []))
                print(self.items)
                self.succes?()
            }
        }
    }
}
