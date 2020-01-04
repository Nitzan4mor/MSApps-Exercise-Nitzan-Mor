//
//  DAO.swift
//  MSApps Movies
//
//  Created by Nitzan Mor on 03/01/2020.
//  Copyright © 2020 Nitzan Mor. All rights reserved.
//

import UIKit
import CoreData

class DAO{
    static let shared = DAO()
    private init(){}
    
    let context = CoreDataStack.shared.context
    
    typealias JSON = Dictionary<String ,Any>
    
    func fetchAllMovies(delegate:DAODelegate){
        // fetch from core data
        let fetchRequest:NSFetchRequest<Movie> = Movie.fetchRequest()
        guard let result:[Movie] = try? context.fetch(fetchRequest) else {return}
        if result.count > 0 {
            // pass to the delegate
            delegate.moviesReceived(movies: SortingHelper.shared.sortByReleaseYear(movies: result))
        }
            // else decode json save to core data and fetch movies again
        else {
            decodeJson()
            fetchAllMovies(delegate: delegate)
        }
    }
    
    // parsing single json object from QR code and saving it in core data
    func saveMovieFromQRCode(stringValue:String)->Movie?{
        guard let data = stringValue.data(using: .utf8) else {return nil}
        guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as? JSON else {return nil}
        let movie = Movie(context: context)
        movie.title = jsonObject["title"] as? String
        movie.image = jsonObject["image"] as? String
        movie.rating = jsonObject["rating"] as? Double ?? 0.0
        movie.releaseYear = jsonObject["releaseYear"] as? Int32 ?? 0
        for string in jsonObject["genre"] as? [String] ?? []{
            let genre = Genre(context: context)
            genre.genre = string
            movie.addToGenres(genre)
        }
        CoreDataStack.shared.saveContext()
        return movie
    }
    
    // parsing array of json objects from QR code and saving them in core data
    private func decodeJson(){
        guard let url = Bundle.main.url(forResource: "movies", withExtension: "json") else {return}
        guard let data = try? Data(contentsOf: url) else {return}
        guard let jsonArray = try? JSONSerialization.jsonObject(with: data, options: []) as? Array<JSON> else {return}
        for i in 0..<jsonArray.count{
            let movie = Movie(context: context)
            movie.title = jsonArray[i]["title"] as? String
            movie.image = jsonArray[i]["image"] as? String
            movie.rating = jsonArray[i]["rating"] as? Double ?? 0.0
            movie.releaseYear = jsonArray[i]["releaseYear"] as? Int32 ?? 0
            for string in jsonArray[i]["genre"] as? [String] ?? []{
                let genre = Genre(context: context)
                genre.genre = string
                movie.addToGenres(genre)
            }
        }
        CoreDataStack.shared.saveContext()
    }
    
    
}

protocol DAODelegate {
    func moviesReceived(movies:[Movie])
}
