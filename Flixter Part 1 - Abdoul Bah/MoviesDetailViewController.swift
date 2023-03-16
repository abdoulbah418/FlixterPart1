//
//  MoviesDetailViewController.swift
//  Flixter Part 1 - Abdoul Bah
//
//  Created by Abdoul Bah on 3/13/23.
//

import UIKit
import Nuke

class MoviesDetailViewController: UIViewController {
    var movie: Movie?
    var poster_path: String?

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    @IBOutlet weak var moviePopularityLabel: UILabel!
    @IBOutlet weak var movieTotalVotesLabel: UILabel!
    @IBOutlet weak var movieVoteAvgLabel: UILabel!
    @IBOutlet weak var movieTitleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieOverviewLabel.numberOfLines = 0
        
        movieOverviewLabel.sizeToFit()

        
        if let movie = movie{
            movieTitleLabel.text = movie.title
            movieOverviewLabel.text = movie.overview
            moviePopularityLabel.text = "\(movie.popularity) Popularity"
            movieVoteAvgLabel.text = "\(movie.vote_average) Vote Average"
            movieTotalVotesLabel.text = "\(movie.vote_count) Votes"
        }
        
        if let poster_path = poster_path {
            Nuke.loadImage(with: URL(string: "https://image.tmdb.org/t/p/w500/" + poster_path)!, into: movieImageView)
                   }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
