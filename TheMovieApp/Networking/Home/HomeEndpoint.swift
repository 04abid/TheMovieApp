//
//  HomeEndpoint.swift
//  TheMovieApp
//
//  Created by Abid Kerimli on 06.02.26.
//

import Foundation


enum HomeEndpoint: String, CaseIterable {
    case nowPlaying = "movie/now_playing"
    case popular = "movie/popular"
    case topRated = "movie/top_rated"
    case upComing = "movie/upcoming"
}
