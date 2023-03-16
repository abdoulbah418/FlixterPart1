//
//  PostersViewController.swift
//  Flixter Part 1 - Abdoul Bah
//
//  Created by Abdoul Bah on 3/15/23.
//

import UIKit
import Nuke

class PostersViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var posters: [Poster] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        let poster = posters[indexPath.item]
        let imageUrlString = "https://image.tmdb.org/t/p/w500" + poster.poster_path
        let imageUrl = URL(string: imageUrlString)!
        Nuke.loadImage(with: imageUrl, into: cell.posterImageView)
        
        return cell
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=fbb0d70a541292670d25556ee064acbc&language=en-US&page=1")!
        
        // Use the URL to instantiate a request
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }
            
            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }
            
            do {
                // Create a JSON Decoder
                let decoder = JSONDecoder()
                
                // Create a date formatter
                let dateFormatter = DateFormatter()
                
                // Set a custom date format based on what we see coming back in the JSON
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                
                // Set the decoding strategy on the JSON decoder to use our custom date format
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                
                // Use the JSON decoder to try and map the data to our custom model.
                // TrackResponse.self is a reference to the type itself, tells the decoder what to map to.
                let response = try decoder.decode(PostersResponse.self, from: data)
                
                // Access the array of movies from the `results` property
                let posters = response.results
                
                // Execute UI updates on the main thread
                DispatchQueue.main.async {
                    self.posters = posters
                    self.collectionView.reloadData()
                }
                
                print("✅ \(posters)")
            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
        }
        
        // Initiate the network request
        task.resume()
        
        print(posters)
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        // The minimum spacing between adjacent cells (left / right, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumInteritemSpacing = 1
        
        // The minimum spacing between adjacent cells (top / bottom, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumLineSpacing = 5
    
        
        // Set this to however many columns you want to show in the collection.
        let numberOfColumns: CGFloat = 2
        
        // Calculate the width each cell need to be to fit the number of columns, taking into account the spacing between cells.
        let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns
        
        // Set the size that each tem/cell should display at
        layout.itemSize = CGSize(width: width, height: width)
        
        // Do any additional setup after loading the view.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if sender is UICollectionViewCell {
//            if let indexPath = collectionView.indexPathsForSelectedItems?.first {
//                let detailViewController = segue.destination as! MoviesDetailViewController
//                let selectedPoster = posters[indexPath.row]
//                detailViewController.movie = Movie(id: selectedPoster.id, title: selectedPoster.title, overview: selectedPoster.overview, poster_path: selectedPoster.poster_path, vote_average: selectedPoster.vote_average, vote_count: selectedPoster.vote_count, popularity: selectedPoster.popularity)
//                detailViewController.poster_path = selectedPoster.poster_path
//            }
//        }
//    }
//
//
}
