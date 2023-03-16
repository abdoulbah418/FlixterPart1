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
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=fbb0d70a541292670d25556ee064acbc&language=en-US&page=1")!

        // Use the URL to instantiate a request
        let request = URLRequest(url: url)

                // Create a URLSession using a shared instance and call its dataTask method
                // The data task method attempts to retrieve the contents of a URL based on the specified URL.
                // When finished, it calls it's completion handler (closure) passing in optional values for data (the data we want to fetch), response (info about the response like status code) and error (if the request was unsuccessful)
                
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

                    // The `JSONSerialization.jsonObject(with: data)` method is a "throwing" function (meaning it can throw an error) so we wrap it in a `do` `catch`
                    // We cast the resultant returned object to a dictionary with a `String` key, `Any` value pair.
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
                        let response = try decoder.decode(MoviesResponse.self, from: data)

                        // Access the array of movies from the `results` property
                        let movies = response.results
                        
                        // Execute UI updates on the main thread
                        DispatchQueue.main.async {
                            self.movies = movies
                            self.tableView.reloadData()
                        }
                        
                        print("✅ \(movies)")
                    } catch {
                        print("❌ Error parsing JSON: \(error.localizedDescription)")
                    }
                }

                // Initiate the network request
                task.resume()

                tableView.dataSource = self
        
        print(movies)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender is UITableViewCell {
            let indexPath = tableView.indexPathForSelectedRow
            let moviesDetailVC = segue.destination as! MoviesDetailViewController
            let selectedMovie = movies[indexPath!.row]
            moviesDetailVC.movie = selectedMovie
            moviesDetailVC.poster_path = selectedMovie.poster_path
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

