//
//  API.swift
//  AudioDBExplorer
//
//  Created by Carl Hinkle on 1/26/22.
//

import Foundation

 struct Artists: Decodable {
    let artists: [Artist]?
    
    private enum CodingKeys: CodingKey {
        case artists
    }
    
    struct Artist: Decodable, Identifiable {
        let id: String?
        let strArtist: String?
        let strBiographyEN: String?
        let strArtistThumb: String?
        
        private enum CodingKeys: String, CodingKey {
            case strArtist
            case strBiographyEN
            case strArtistThumb
            case id = "idArtist"
        }
    }
}

struct AudioDBAPI {
    private static let APIKEY = 2
    private static let BASEURL = "https://theaudiodb.com/api/v1/json/\(APIKEY)/"
    
    static func search(for artistName: String) async -> Artists? {
        guard var urlComponents = URLComponents(string: "\(BASEURL)search.php") else {
            return nil
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "s", value: artistName)
        ]
        
        let urlSession = URLSession.shared
        
        do {
            let (data, _) = try await urlSession.data(from: urlComponents.url!, delegate: nil)
            let artistData: Artists? = try JSONDecoder().decode(Artists.self, from: data)
            return artistData
        } catch {
            print("Failed to get data: \(String(describing: error.localizedDescription))")
            return nil
        }
    }
}
