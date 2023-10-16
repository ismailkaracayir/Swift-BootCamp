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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func deleteBtn(_ sender: Any) {
        print("delete btn tiklandı")
        cellProtocol?.deleteCell(indexPath: indexPath!)
        
    }
}
