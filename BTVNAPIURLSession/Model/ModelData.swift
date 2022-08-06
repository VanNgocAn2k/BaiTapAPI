//
//  ModelData.swift
//  BTVNAPIURLSession
//
//  Created by Văn Tiến Tú on 03/08/2022.
//

import Foundation
import SwiftyJSON

struct Phim {

    var resultCount: Int?
    var results: [Results]?
    
    init() {}

    init(_ json: JSON) {
        resultCount = json["resultCount"].intValue
        results = json["results"].arrayValue.map({ j -> Results in
            return Results(j)
        })
    }

}

struct Results {

    var wrapperType: String?
    var kind: String?
    var collectionId: Int?
    var trackId: Int?
    var artistName: String?
    var collectionName: String?
    var trackName: String?
    var collectionCensoredName: String?
    var trackCensoredName: String?
    var collectionArtistId: Int?
    var collectionArtistViewUrl: String?
    var collectionViewUrl: String?
    var trackViewUrl: String?
    var previewUrl: String?
    var artworkUrl30: String?
    var artworkUrl60: String?
    var artworkUrl100: String?
    var collectionPrice: Double?
    var trackPrice: Double?
    var trackRentalPrice: Double?
    var collectionHdPrice: Double?
    var trackHdPrice: Double?
    var trackHdRentalPrice: Double?
    var releaseDate: String?
    var collectionExplicitness: String?
    var trackExplicitness: String?
    var discCount: Int?
    var discNumber: Int?
    var trackCount: Int?
    var trackNumber: Int?
    var trackTimeMillis: Int?
    var country: String?
    var currency: String?
    var primaryGenreName: String?
    var contentAdvisoryRating: String?
    var longDescription: String?
    var hasITunesExtras: Bool?

    init(_ json: JSON) {
        wrapperType = json["wrapperType"].stringValue
        kind = json["kind"].stringValue
        collectionId = json["collectionId"].intValue
        trackId = json["trackId"].intValue
        artistName = json["artistName"].stringValue
        collectionName = json["collectionName"].stringValue
        trackName = json["trackName"].stringValue
        collectionCensoredName = json["collectionCensoredName"].stringValue
        trackCensoredName = json["trackCensoredName"].stringValue
        collectionArtistId = json["collectionArtistId"].intValue
        collectionArtistViewUrl = json["collectionArtistViewUrl"].stringValue
        collectionViewUrl = json["collectionViewUrl"].stringValue
        trackViewUrl = json["trackViewUrl"].stringValue
        previewUrl = json["previewUrl"].stringValue
        artworkUrl30 = json["artworkUrl30"].stringValue
        artworkUrl60 = json["artworkUrl60"].stringValue
        artworkUrl100 = json["artworkUrl100"].stringValue
        collectionPrice = json["collectionPrice"].doubleValue
        trackPrice = json["trackPrice"].doubleValue
        trackRentalPrice = json["trackRentalPrice"].doubleValue
        collectionHdPrice = json["collectionHdPrice"].doubleValue
        trackHdPrice = json["trackHdPrice"].doubleValue
        trackHdRentalPrice = json["trackHdRentalPrice"].doubleValue
        releaseDate = json["releaseDate"].stringValue
        collectionExplicitness = json["collectionExplicitness"].stringValue
        trackExplicitness = json["trackExplicitness"].stringValue
        discCount = json["discCount"].intValue
        discNumber = json["discNumber"].intValue
        trackCount = json["trackCount"].intValue
        trackNumber = json["trackNumber"].intValue
        trackTimeMillis = json["trackTimeMillis"].intValue
        country = json["country"].stringValue
        currency = json["currency"].stringValue
        primaryGenreName = json["primaryGenreName"].stringValue
        contentAdvisoryRating = json["contentAdvisoryRating"].stringValue
        longDescription = json["longDescription"].stringValue
        hasITunesExtras = json["hasITunesExtras"].boolValue
    }
   
}



