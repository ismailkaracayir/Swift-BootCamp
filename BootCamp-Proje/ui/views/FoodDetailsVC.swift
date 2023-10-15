//
//  FoodDetailsVC.swift
//  BootCamp-Proje
//
//  Created by ismail karaçayır on 13.10.2023.
//

import UIKit
import Kingfisher

class FoodDetailsVC: UIViewController {
    @IBOutlet weak var allPriceLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var foodItemLbl: UILabel!
    var food : Yemekler?
    override func viewDidLoad() {
        super.viewDidLoad()
        foodItemLbl.text = "1"
        if let f = food {
            print(f.yemek_fiyat!)
            priceLbl.text = "\(f.yemek_fiyat ?? "")TL"
            nameLbl.text = f.yemek_adi
            allPriceLbl.text =  "\(f.yemek_fiyat ?? "")TL"
            if let resimAdi = f.yemek_resim_adi, let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(resimAdi)") {
                DispatchQueue.main.async {
                    self.imageView.kf.setImage(with: url)
                }
            }
        }

        

    }
    

    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)

    }
    
    @IBAction func stepperBtn(_ sender: UIStepper) {
        foodItemLbl.text = String(Int(sender.value))
        if let foodItemCountText = food?.yemek_fiyat, // foodItemLbl.text değerini kontrol et
           let foodItemCount = Int(foodItemCountText) { // tamsayıya dönüştür
           let totalPrice = Int(sender.value * Double(foodItemCount))
           allPriceLbl.text = "\(String(totalPrice))TL"
        } else {
           // foodItemLbl.text uygun bir değere dönüşmüyorsa veya nil ise burası çalışır
           allPriceLbl.text = "Hatalı Veri"
        }
      
        
     
    }
 
    @IBAction func addToCartBtn(_ sender: Any) {
    }
    
}