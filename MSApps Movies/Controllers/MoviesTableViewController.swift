//
//  MoviesTableViewController.swift
//  MSApps Movies
//
//  Created by Nitzan Mor on 03/01/2020.
//  Copyright © 2020 Nitzan Mor. All rights reserved.
//

import UIKit
import SDWebImage

// presenting all of the movies from the core data in the table view
// the images are presented using SDWebImage that handles the chaching
// if movie clicked pass the selected movie to the specific movie VC
// if add button clicked signing up as the delegate and reloading the new movie to the table view
class MoviesTableViewController: UITableViewController {
    
    var movies:[Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = true

        // add button that will allow the user to scan QR code using the mobile's camera
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped(_:)))
        self.navigationItem.rightBarButtonItem = addButton

    }
    
    @objc func addTapped(_ sender:UIBarButtonItem){
        performSegue(withIdentifier: "scanQR", sender: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MoviesTableViewCell
        
        let movie = movies[indexPath.row]

        // Configure the cell...
        
        cell.movieTitleLabel.text = movie.title
        cell.movieYearLabel.text = "Release year: \(movie.releaseYear)"
        cell.movieRatingLabel.text = "Rating: \(movie.rating)"
        cell.movieGenresLabel.text = StringHelper.shared.movieGenresToString(movie: movie)
        
        if movie.image?.count ?? 0 > 0{
            let url = URL(string: movie.image!)
            cell.movieImageView.sd_setImage(with: url)
        }
        cell.movieImageView.layer.cornerRadius = cell.movieImageView.bounds.height / 8
        cell.movieImageView.layer.borderColor = UIColor.black.cgColor
        cell.movieImageView.layer.borderWidth = 0.5

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showSpecific", sender: movies[indexPath.row])
    }
  
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showSpecific" {
            guard let dest = segue.destination as? SpecificMovieViewController else {return}
            guard let movie = sender as? Movie else {return}
            dest.movie = movie
        }
        if segue.identifier == "scanQR"{
            guard let dest = segue.destination as? ScanQRViewController else {return}
            dest.delegate = self
        }
    }
}

extension MoviesTableViewController: ScanQRViewControllerDelegate{
    func newMovieAdded(movie: Movie?) {
        guard let movie = movie else {return}
        movies.append(movie)
        tableView.reloadData()
    }
}
