//
//  FavoriTableViewCell.swift
//  BootCamp-Proje
//
//  Created by ismail karaçayır on 20.10.2023.
//

import UIKit

protocol FavCellProtokol{
   func deleteFav(indexPath : IndexPath)
}
class FavoriTableViewCell: UITableViewCell {

    @IBOutlet weak var foodNameLbl: UILabel!
    @IBOutlet weak var FoodİmageView: UIImageView!
    var indexPath : IndexPath?
    var favCellprotokol : FavCellProtokol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func deleteFavBtn(_ sender: Any) {
        favCellprotokol?.deleteFav(indexPath: indexPath!)
    }
    
    @IBAction func addToCardBtn(_ sender: Any) {
    }
}
