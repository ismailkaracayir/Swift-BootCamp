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
    var isActive : Bool = false

    

    
      
    @IBAction func favoriteBtn(_ sender: Any) {
        print("Fovorite Button Tıklandı")

     
  
         cellProtocolFavoriye?.addFovorite(indexPath: indexPath!)

        
    }
    
    
    
    
    @IBAction func addToCartBtn(_ sender: Any) {
        
    }
    
    
}
