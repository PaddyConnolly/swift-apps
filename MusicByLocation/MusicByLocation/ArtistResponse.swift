//
//  ArtistResponse.swift
//  MusicByLocation
//
//  Created by Connolly, Patrick (IRG) on 01/03/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import Foundation

struct ArtistResponse: Codable {
    var resultCount: Int
    var results: [Artist]
}
