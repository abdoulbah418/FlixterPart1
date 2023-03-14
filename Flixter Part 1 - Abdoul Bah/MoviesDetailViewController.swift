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
    var posterPath: URL?

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
            movieVoteAvgLabel.text = "\(movie.voteAverage) Vote Average"
            movieTotalVotesLabel.text = "\(movie.voteCount) Votes"
        }
        
        if let posterPath = posterPath {
                       Nuke.loadImage(with: posterPath, into: movieImageView)
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
