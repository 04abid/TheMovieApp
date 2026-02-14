//
//  CoreHelper.swift
//  TheMovieApp
//
//  Created by Abid Kerimli on 31.01.26.
//

import Foundation
import Alamofire




class CoreHelper {
    static let shared = CoreHelper()
    
    var version = "3"
    var baseURL = "https://api.themoviedb.org/"
    var baseImageURL = "https://image.tmdb.org/t/p/w500"
    
    let headers: HTTPHeaders = [
        "Accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxOTZjN2ZhZGY2NjhhZGEzNzAzYWJmNDkwZWY3MTNjOCIsIm5iZiI6MTc2OTgzMTUwMi4xNjksInN1YiI6IjY5N2Q3YzRlNjMzNzhjOTZmNTFiYjk1YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.62EzuFzmThPBwAJsP8mW7XpTABmCE8gDGeFQzWDfDd0"
    ]
    
    
    func configureURL(endpoint: String) -> String {
        baseURL + version + "/" + endpoint
    }
    
 
    
    func configureImageURL(path: String) -> String {
        baseImageURL + path
    }
}
