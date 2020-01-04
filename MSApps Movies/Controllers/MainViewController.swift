//
//  MainViewController.swift
//  MSApps Movies
//
//  Created by Nitzan Mor on 03/01/2020.
//  Copyright © 2020 Nitzan Mor. All rights reserved.
//

import UIKit

// fetching the movies from the DAO and signing up as the delegate
// only after the movies are fetched allow the user to get started
class MainViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    var movies:[Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaults.set(false, forKey: "isMoviesFetched")
        DAO.shared.fetchAllMovies(delegate: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let dest = segue.destination as? MoviesTableViewController else {return}
        dest.movies = self.movies
        
    }
    
    @IBAction func moviesTapped(_ sender: UITapGestureRecognizer) {
        if defaults.bool(forKey: "isMoviesFetched"){
            performSegue(withIdentifier: "showMovies", sender: movies)
        }
    }
    
}

extension MainViewController: DAODelegate{
    func moviesReceived(movies: [Movie]) {
        self.movies = movies
        defaults.set(true, forKey: "isMoviesFetched")
    }
}
