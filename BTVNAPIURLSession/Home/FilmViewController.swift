//
//  FilmViewController.swift
//  BTVNAPIURLSession
//
//  Created by Văn Tiến Tú on 05/08/2022.
//

import UIKit
import AVKit
import AVFAudio

class FilmViewController: UIViewController, AVPlayerViewControllerDelegate {

    @IBOutlet weak var imageFilm: UIImageView!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var watchButton: UIButton!
    
    var playerController = AVPlayerViewController()
       var film: Results?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        watchButton.clipsToBounds = true
        watchButton.layer.cornerRadius = 20
        navigationItem.title = "Thông tin phim"
        designUI()
    }
    func designUI() {
           imageFilm.load(url:film?.artworkUrl60)
           trackLabel.text = "\(film?.trackName ?? "")"
           artistLabel.text = "\(film?.artistName ?? "")"
           priceLabel.text = "\(film?.trackPrice ?? 0)$"
           countryLabel.text = "\(film?.country ?? "")"
       }

    @IBAction func watchTrailerButton(_ sender: UIButton) {
        guard let url = URL(string: (film?.previewUrl)!)  else {return}
                    let player = AVPlayer(url: url)
                    playerController = AVPlayerViewController()
                    playerController.player = player
                    playerController.allowsPictureInPicturePlayback = true
                    playerController.delegate = self
                    playerController.player?.play()
                    present(playerController, animated: true)
        
    }
    
}
