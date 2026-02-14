//
//  ActorEndpoint.swift
//  TheMovieApp
//
//  Created by Abid Kerimli on 06.02.26.
//

import Foundation

enum ActorEndpoint: String,CaseIterable {
    case actor = "person/popular"
}

enum ActorEndpoint2 {
    case actor(page: String)
    
    var path: String {
        switch self {
        case .actor(let page):
            return "person/popular?page= \(page)" 
        }
    }
}
