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
    var favFoodList = [Yemekcore]()
    var viewModel = MainViewModel()
    var foodCount : String?
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        viewModel.getCoreDataList()
        _ = viewModel.foodList.subscribe(onNext: { foodList in
            self.foodlist = foodList
            DispatchQueue.main.async {
                self.collectionView.reloadData()

                print("arayüz tetiklendi")
            }
            
        }
        )
  
        
        
        
        
        
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
                goToVC.itemCount = foodCount
                foodCount = nil
            }
        }
    }
    
    
    
    
    
}
extension MainVC : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,CellProtocolFavoriye {
  
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.foodlist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let food = self.foodlist[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCell", for: indexPath) as! CollectionViewCell
        
        cell.indexPath = indexPath
        cell.cellProtocolFavoriye = self
        
        cell.layer.borderWidth = 5.0
        cell.layer.borderColor = UIColor.systemOrange.withAlphaComponent(0.1).cgColor
        cell.layer.cornerRadius = 2.0
        cell.layer.shadowOffset = CGSize(width: 0, height: 4)
        cell.layer.shadowColor = UIColor.white.cgColor
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowRadius = 5.0
        
        if let starFillImage = UIImage(systemName: "star") {
            cell.fovoriteBtnClick.setImage(starFillImage, for: .normal)
        }
       

       
        cell.foodNameLbl.text = food.yemek_adi
        cell.priceLbl.text = "\(food.yemek_fiyat!) TL"
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
    
    func addFovorite(indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        if cell.isActive == false {
            if let starFillImage = UIImage(systemName: "star.fill") {
                   cell.fovoriteBtnClick.setImage(starFillImage, for: .normal)
                cell.isActive = true
                let food = foodlist[indexPath.row]
                print("favori eklenen yemek : \(food.yemek_adi!)")
                self.viewModel.saveLocaleDatabase(food: food)
              
                // coredate ekleme kısmı burda olacak
               }
        }else{
            if let starFillImage = UIImage(systemName: "star") {
                   cell.fovoriteBtnClick.setImage(starFillImage, for: .normal)
                cell.isActive = false
                let food = foodlist[indexPath.row]
                print("favori silinen yemek : \(food.yemek_adi!)")
                if let name = food.yemek_adi {
                    self.viewModel.deleteCoreDate(foodName:name)
                }
                // coredata cıkarma kısmı burda yapılcak
               }
        }
    }
}

