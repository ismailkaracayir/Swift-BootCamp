//
//  AddToCardVC.swift
//  BootCamp-Proje
//
//  Created by ismail karaçayır on 13.10.2023.
//

import UIKit
import Kingfisher


class AddToCardVC: UIViewController {
   
    
    @IBOutlet weak var allCardPriceLbl: UILabel!
    var viewModel = MainViewModel()
    var cardList = [sepet_yemekler]()
    @IBOutlet weak var tableView: UITableView!
    var allPrice : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
  

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.cartListrefresh()
   

    }

    func cartListrefresh(){
        viewModel.allCardList()
        _ = viewModel.cardList.subscribe(onNext: { cardList in
            self.cardList = cardList
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                for item in cardList {
                    if let price = Int(item.yemek_fiyat!) ,let item = Int(item.yemek_siparis_adet!){
                        self.allPrice = self.allPrice + (item * price)
                        self.tabBarItem.badgeValue = String(cardList.count)
                       

                    }
                   
                }
                self.allCardPriceLbl.text = "\(String(self.allPrice)) TL"
                self.allPrice = 0
            }})
    
    }
    

 
    @IBAction func cardConfirmBtn(_ sender: Any) {
   
    }
    
    
}


extension AddToCardVC : UITableViewDelegate ,UITableViewDataSource ,CellProtocol {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = cardList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! TableViewCell

        cell.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        cell.layer.borderWidth = 5.0
        cell.layer.borderColor = UIColor.systemOrange.withAlphaComponent(0.1).cgColor
        
        cell.layer.cornerRadius = 2.0
        cell.layer.shadowOffset = CGSize(width: 0, height: 4)
        cell.layer.shadowColor = UIColor.white.cgColor
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowRadius = 5.0
        cell.cellProtocol = self
        cell.indexPath = indexPath
        cell.foodNameLbl.text = food.yemek_adi
        cell.foodItemLbl.text = food.yemek_siparis_adet
        cell.foodPriceLbl.text = "\(food.yemek_fiyat!) TL"
        if let price = Int(food.yemek_fiyat!){
            if let item = Int(food.yemek_siparis_adet!){
                cell.allPriceLbl.text = "\(String(price * item)) TL"
            }
        }
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food.yemek_resim_adi!)"){
            DispatchQueue.main.async {
                cell.foodImageView.kf.setImage(with: url)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    // my protocol
    func deleteCell(indexPath: IndexPath) {
        let deleteFood = cardList[indexPath.row]
        
        let alertDialog = UIAlertController(title: "Siliniyor", message: "\(deleteFood.yemek_adi!) siliniyor", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Tamam", style: .default) { action in
            let price = Int(deleteFood.sepet_yemek_id!)
            self.viewModel.deleteFood(sepet_yemek_id:price!)
      
        }
        let cancelAction = UIAlertAction(title: "Vazgeç", style: .cancel) { action in

        }
        alertDialog.addAction(okAction)
        alertDialog.addAction(cancelAction)
        present(alertDialog, animated: true)
        
        
    }
    
    
    
}
