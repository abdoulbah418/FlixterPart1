//
//  MoviesViewController.swift
//  Flixter Part 1 - Abdoul Bah
//
//  Created by Abdoul Bah on 3/12/23.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        movies = Movie.mockMovies
        
        print(movies)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell),
            let moviesDetailVC = segue.destination as? MoviesDetailViewController {
            let selectedMovie = Movie.mockMovies[indexPath.row]
            moviesDetailVC.movie = selectedMovie
            moviesDetailVC.posterPath = selectedMovie.posterPath
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    

}

