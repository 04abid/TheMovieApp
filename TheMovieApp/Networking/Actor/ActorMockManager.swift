//
//  ActorMockManager.swift
//  TheMovieApp
//
//  Created by Abid Kerimli on 12.02.26.
//

import Foundation
//
//class ActorMockManager: ActorUseCase {
//    func getPopularActors(compleation: @escaping ([ActorResult]?, String?) -> Void) {
//        guard let url = Bundle.main.url(forResource: "ActorMockData", withExtension: "json") else {return}
//        do {
//            let data = try Data(contentsOf: url)
//            let items = try JSONDecoder().decode([ActorResult].self, from: data)
//            compleation(items,nil)
//        } catch {
//            compleation(nil,error.localizedDescription)
//        }
//    }
//}
