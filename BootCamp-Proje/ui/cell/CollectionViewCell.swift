//
//  CollectionViewCell.swift
//  BootCamp-Proje
//
//  Created by ismail karaçayır on 14.10.2023.
//

import UIKit
protocol CellProtocolFavoriye {
    func addFovorite (indexPath: IndexPath)
}
class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var fovoriteBtnClick: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var foodNameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    var cellProtocolFavoriye : CellProtocolFavoriye?
    var indexPath : IndexPath?
    var isFavorite = false // İlk olarak favori olmadığınızı varsayalım

    

    
      
    @IBAction func favoriteBtn(_ sender: Any) {
        print("Fovorite Button Tıklandı")
         
         if !isFavorite {
             if let starFillImage = UIImage(systemName: "star") {
                 fovoriteBtnClick.setBackgroundImage(starFillImage, for: .normal)
             }
             isFavorite = false
             print("\(isFavorite)")
         } else {
             if let starImage = UIImage(systemName: "star.fill") {
                 fovoriteBtnClick.setBackgroundImage(starImage, for: .normal)
             }
             print("\(isFavorite)")

             isFavorite = true
         }
         
         cellProtocolFavoriye?.addFovorite(indexPath: indexPath!)

        
    }
    
    @IBAction func addToCartBtn(_ sender: Any) {
        
    }
    
    
}
