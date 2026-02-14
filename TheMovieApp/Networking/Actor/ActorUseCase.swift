//
//  ActorUseCase.swift
//  TheMovieApp
//
//  Created by Abid Kerimli on 12.02.26.
//

import Foundation

protocol ActorUseCase {
    func getPopularActors(page:String,compleation: @escaping ((Actor?,String?) -> Void))
}
