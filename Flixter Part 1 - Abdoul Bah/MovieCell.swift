//
//  MovieCell.swift
//  Flixter Part 1 - Abdoul Bah
//
//  Created by Abdoul Bah on 3/12/23.
//

import UIKit
import Nuke

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with movie: Movie) {
        movieTitleLabel.text = movie.title
        movieOverviewLabel.text = movie.overview
        
        if movie.poster_path != nil{
            Nuke.loadImage(with: URL(string: "https://image.tmdb.org/t/p/w500/" + movie.poster_path!)!, into: movieImageView)

        }
    }
}

