//
//  SpecificMovieViewController.swift
//  MSApps Movies
//
//  Created by Nitzan Mor on 04/01/2020.
//  Copyright © 2020 Nitzan Mor. All rights reserved.
//

import UIKit
import SDWebImage

// present the specific movie details that was clicked
class SpecificMovieViewController: UIViewController {
    
    var movie:Movie?
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieReleaseYearLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    
    @IBOutlet weak var movieGenreLabel: UILabel!
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setLabelAndImageView()
    }
    
    func setLabelAndImageView(){
        guard let movie = self.movie else {return}
        movieTitleLabel.text = movie.title
        movieReleaseYearLabel.text = "Release year: \(movie.releaseYear)"
        movieRatingLabel.text = "Rating: \(movie.rating)"
        movieGenreLabel.text = StringHelper.shared.movieGenresToString(movie: movie)
        
        if movie.image?.count ?? 0 > 0{
            let url = URL(string: movie.image!)
            movieImageView.sd_setImage(with: url)
        }
        movieImageView.layer.cornerRadius = movieImageView.bounds.height / 8
        movieImageView.layer.borderColor = UIColor.black.cgColor
        movieImageView.layer.borderWidth = 0.5
    }
}
