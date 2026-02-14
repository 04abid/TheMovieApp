//
//  HomeManager.swift
//  TheMovieApp
//
//  Created by Abid Kerimli on 06.02.26.
//

import Foundation


class HomeManager: HomeUseCase {
    private let manager = CoreManager()
    func getHomeItems(endpoint: String ,compleation: @escaping ((Movie?,String?) -> Void)) {
        manager.request(model: Movie.self, endpoint:endpoint ,compleation:compleation)
    }
}
