//
//  HomeUseCase.swift
//  TheMovieApp
//
//  Created by Abid Kerimli on 12.02.26.
//

import Foundation


protocol HomeUseCase {
    func getHomeItems(endpoint: String ,compleation: @escaping ((Movie?,String?) -> Void))
}
