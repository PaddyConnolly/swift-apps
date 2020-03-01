//
//  ArtistResponse.swift
//  MusicByLocation
//
//  Created by Connolly, Patrick (IRG) on 01/03/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import Foundation

struct ArtistResponse: Codable {
    var count: Int
    var results: [Artist]
    
    private enum CodingKeys: String, CodingKey {
        case count = "resultCount"
        case results
    }
}
