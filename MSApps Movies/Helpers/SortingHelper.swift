//
//  SortingHelper.swift
//  MSApps Movies
//
//  Created by Nitzan Mor on 03/01/2020.
//  Copyright © 2020 Nitzan Mor. All rights reserved.
//

import UIKit

struct SortingHelper {
    static let shared = SortingHelper()
    private init(){}
    
    func sortByReleaseYear(movies:[Movie])->[Movie]{
        var mutatingMovies = movies
        var i = movies.count - 1
        var isSorted = true
        while i > 0 {
            for j in 0..<i{
                if mutatingMovies[j].releaseYear < mutatingMovies[j+1].releaseYear{
                    let temp = mutatingMovies[j]
                    mutatingMovies[j] = mutatingMovies[j+1]
                    mutatingMovies[j+1] = temp
                    isSorted = false
                }
            }
            if isSorted{
                return mutatingMovies
            }
            i -= 1
        }
        return mutatingMovies
    }
}
