//
//  ViewController.swift
//  BTVNAPIURLSession
//
//  Created by Văn Tiến Tú on 03/08/2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    

    var arr: [Results] = [] {
           didSet{
               collectionView?.reloadData()
           }
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.clipsToBounds = true
        searchTextField.layer.cornerRadius = 20
        configCollectionView()
//        getDataByAlamofire()
        navigationController?.navigationBar.isHidden = true
        searchTextField.delegate = self
    }
    func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib1 = UINib(nibName: "FilmCollectionViewCell", bundle: nil)
               collectionView.register(nib1, forCellWithReuseIdentifier: "FilmCollectionViewCell")
    }
    func getDataByAlamofire() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(self.searchTextField.text ?? "")&limit=20") else {
            print("URL ko ton tai")
            return
        }
        Alamofire.request(url).responseJSON { response in
            print(response.result.isSuccess)
            print(response.error?.localizedDescription ?? "")

            guard let value = response.result.value else {
                print("No data response")
                return
            }
            let result = JSON(value)
            print(result)
            let phime = Phim(result)
            self.arr = phime.results ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmCollectionViewCell", for: indexPath) as! FilmCollectionViewCell
        let item = arr[indexPath.row]
        cell.item = item
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/2)-15, height: (collectionView.frame.width/2)+40)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return .init(top: 0, left: 8, bottom: 0, right: 8)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = FilmViewController()
        vc.film = arr[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.getDataByAlamofire()
      //  view.endEditing(true)
        return true
    }
}


