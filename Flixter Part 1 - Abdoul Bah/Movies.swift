//
//  Movies.swift
//  Flixter Part 1 - Abdoul Bah
//
//  Created by Abdoul Bah on 3/12/23.
//

import Foundation

struct Movie {
    let title: String
    let overview: String
    let popularity: Double
    let voteAverage: Double
    let voteCount: Int
    let posterPath: URL?
    //    let id: Int
    //    let originalLanguage: String
    //    let originalTitle: String
    //    let releaseDate: String
    //    let video: Bool
}

extension Movie{
    static var mockMovies: [Movie] = [
        Movie(title: "Knock at the Cabin",
              overview: "While vacationing at a remote cabin, a young girl and her two fathers are taken hostage by four armed strangers who demand that the family make an unthinkable choice to avert the apocalypse. With limited access to the outside world, the family must decide what they believe before all is lost.",
              popularity: 2476.814,
              voteAverage: 6.5,
              voteCount: 959,
              posterPath: URL(string: "https://image.tmdb.org/t/p/w500//dm06L9pxDOL9jNSK4Cb6y139rrG.jpg")
             ),
        
        
        Movie(title: "Puss in Boots: The Last Wish",
              overview: "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.",
              popularity: 2700.624,
              voteAverage: 8.4,
              voteCount: 4453,
              posterPath: URL(string: "https://image.tmdb.org/t/p/w500/kuf6dutpsT0vSVehic3EZIqkOBt.jpg")
             ),
        
        Movie(title: "Black Panther, Wakanda Forever",
              overview: "Queen Ramonda, Shuri, M’Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’Challa’s death.  As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.",
              popularity: 2361.671,
              voteAverage: 7.3,
              voteCount: 4004,
              posterPath: URL(string: "https://image.tmdb.org/t/p/w500//sv1xJUazXeYqALzczSZ3O6nkH75.jpg")
             ),
        
        Movie(title: "Plane",
              overview: "After a heroic job of successfully landing his storm-damaged aircraft in a war zone, a fearless pilot finds himself between the agendas of multiple militias planning to take the plane and its passengers hostage.",
              popularity: 1612.024,
              voteAverage: 6.9,
              voteCount: 853,
              posterPath: URL(string: "https://image.tmdb.org/t/p/w500//qi9r5xBgcc9KTxlOLjssEbDgO0J.jpg")
             ),
        
        Movie(title: "Creed III",
              overview: "After dominating the boxing world, Adonis Creed has been thriving in both his career and family life. When a childhood friend and former boxing prodigy, Damien Anderson, resurfaces after serving a long sentence in prison, he is eager to prove that he deserves his shot in the ring. The face-off between former friends is more than just a fight. To settle the score, Adonis must put his future on the line to battle Damien - a fighter who has nothing to lose.",
              popularity: 1513.262,
              voteAverage: 7,
              voteCount: 289,
              posterPath: URL(string: "https://image.tmdb.org/t/p/w500//vJU3rXSP9hwUuLeq8IpfsJShLOk.jpg")
             ),
        
        Movie(title: "Little Dixie",
              overview: "Erstwhile Special Forces operative Doc Alexander is asked to broker a truce with the Mexican drug cartel in secrecy. When Oklahoma Governor Richard Jeffs celebrates the execution of a high-ranking cartel member on TV, his Chief of Staff and Doc inform him about the peace he just ended. But it’s too late, as Cuco, the cartel’s hatchet man, has set his vengeful sights on Doc’s daughter Dixie.",
              popularity: 1142.946,
              voteAverage: 5.9,
              voteCount: 72,
              posterPath: URL(string: "https://image.tmdb.org/t/p/w500/cmWTZj9zzT9KFt3XyL0gssL7Ig8.jpg")
             ),
        
        Movie(title: "Nocebo",
              overview: "A fashion designer hires a nanny from the Philippines to assist her in caring for her family while she is suffering from what she believes is a tick-related illness. The nanny uses traditional Filipino folk healing techniques to help her, but in the process of doing so, she uncovers a horrifying truth about why she is there and why her employer is actually sick.",
              popularity: 1114.779,
              voteAverage: 6.5,
              voteCount: 41,
              posterPath: URL(string: "https://image.tmdb.org/t/p/w500/3FPnDTlX0LsaU4VD5mc82BMbchA.jpg")
             )
    ]
    
    
}

