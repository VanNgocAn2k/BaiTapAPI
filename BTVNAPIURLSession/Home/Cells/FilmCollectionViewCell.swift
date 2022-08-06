//
//  FilmCollectionViewCell.swift
//  BTVNAPIURLSession
//
//  Created by Văn Tiến Tú on 03/08/2022.
//

import UIKit

class FilmCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var nameFilmLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    var item: Results? {
            didSet{
                nameFilmLabel.text = item?.trackName
                filmImage.load(url: item?.artworkUrl60)
            }
        }

}
