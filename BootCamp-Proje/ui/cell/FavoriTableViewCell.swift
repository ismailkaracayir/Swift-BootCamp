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
    
    @IBOutlet weak var ImageParentView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = .axial
        gradientLayer.frame = ImageParentView.bounds
        gradientLayer.locations = [ 0.1,  1 ]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint =  CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = [
         UIColor.systemOrange.withAlphaComponent(0.9).cgColor,
         UIColor.white.cgColor,]
        ImageParentView.layer.insertSublayer(gradientLayer, at: 0)

        contentView.layer.borderWidth = 2.0
        contentView.layer.borderColor = UIColor.systemOrange.withAlphaComponent(0.3).cgColor
        contentView.layer.cornerRadius = 30.0
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
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
