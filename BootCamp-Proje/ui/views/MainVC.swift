//
//  ViewController.swift
//  BootCamp-Proje
//
//  Created by ismail karaçayır on 13.10.2023.
//

import UIKit
import Kingfisher

class MainVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    var foodlist = [Yemekler]()
    var viewModel = MainViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        _ = viewModel.foodList.subscribe(onNext: { foodList in
            self.foodlist = foodList
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                print("arayüz tetiklendi")
            }
            
        })
        
        
        let collectionvewLayout = UICollectionViewFlowLayout()
        collectionvewLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionvewLayout.minimumLineSpacing = 10
        collectionvewLayout.minimumInteritemSpacing = 10
               let screenWidth = UIScreen.main.bounds.width
               let itemGWidth = (screenWidth - 30) / 2
        collectionvewLayout.itemSize = CGSize(width: itemGWidth, height: itemGWidth*1.6)
               collectionView.collectionViewLayout = collectionvewLayout
        
                
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            if let food = sender as? Yemekler {
                let goToVC = segue.destination as! FoodDetailsVC
                goToVC.food = food
            }
        }
    }
    
}
extension MainVC : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.foodlist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let food = self.foodlist[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCell", for: indexPath) as! CollectionViewCell
        cell.foodNameLbl.text = food.yemek_adi
        cell.priceLbl.text = food.yemek_fiyat
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food.yemek_resim_adi!)"){
            DispatchQueue.main.async {
                cell.imageView.kf.setImage(with: url)
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let food = foodlist[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: food)
        self.collectionView.deselectItem(at: indexPath, animated: true)
    }
}

