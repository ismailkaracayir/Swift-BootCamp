//
//  CollectionViewCell.swift
//  BootCamp-Proje
//
//  Created by ismail karaçayır on 14.10.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var foodNameLbl: UILabel!
    
    @IBOutlet weak var priceLbl: UILabel!
    

    
      
    
    @IBAction func addToCartBtn(_ sender: Any) {
    }
    
    @IBAction func FavoriesBtn(_ sender: Any) {
    }
}
