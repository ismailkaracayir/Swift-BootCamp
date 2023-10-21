//
//  TableViewCell.swift
//  BootCamp-Proje
//
//  Created by ismail karaçayır on 16.10.2023.
//

import UIKit


protocol CellProtocol {
    func deleteCell (indexPath: IndexPath)
}
class TableViewCell: UITableViewCell {

    @IBOutlet weak var allPriceLbl: UILabel!
    @IBOutlet weak var foodItemLbl: UILabel!
    @IBOutlet weak var foodPriceLbl: UILabel!
    @IBOutlet weak var foodNameLbl: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    var cellProtocol : CellProtocol?
    var indexPath : IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    // Inside UITableViewCell subclass

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.borderWidth = 2.0
        contentView.layer.borderColor = UIColor.systemOrange.withAlphaComponent(0.3).cgColor
        contentView.layer.cornerRadius = 30.0
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        contentView.layer.shadowColor = UIColor.white.cgColor
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowRadius = 5.0
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func deleteBtn(_ sender: Any) {
        print("delete btn tiklandı")
        cellProtocol?.deleteCell(indexPath: indexPath!)
        
    }
}
