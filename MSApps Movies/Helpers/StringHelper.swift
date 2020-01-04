//
//  StringHelper.swift
//  MSApps Movies
//
//  Created by Nitzan Mor on 04/01/2020.
//  Copyright © 2020 Nitzan Mor. All rights reserved.
//

import UIKit

class StringHelper{
    static let shared = StringHelper()
    private init(){}
    
    func movieGenresToString(movie:Movie)->String{
        var genreString = "Genre: "
        let count = movie.genres?.count ?? 0
        for i in 0..<count{
            let genre = movie.genres?.object(at: i) as! Genre
            genreString += "\(genre.genre ?? ""), "
        }
        genreString.removeLast()
        genreString.removeLast()
        return genreString
    }

}
