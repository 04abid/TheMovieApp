//
//  ActorManager.swift
//  TheMovieApp
//
//  Created by Abid Kerimli on 06.02.26.
//

import Foundation


class ActorManager:ActorUseCase {
    private let manager: CoreManager
    init(manager: CoreManager) {
        self.manager = manager
    }
    
    func getPopularActors(page: String, compleation: @escaping (Actor?, String?) -> Void) {
        manager.request(model: Actor.self,
                        endpoint: ActorEndpoint2.actor(page: page).path,
                        compleation: compleation)
    }
    
//    func getPopularActors(compleation: @escaping ((Actor?,String?) -> Void)) {
//        manager.request(model: Actor.self,
//                        endpoint: ActorEndpoint.actor.rawValue,
//                        
//                        compleation: compleation)
//    }
}
