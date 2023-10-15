//
//  main_viewmodel.swift
//  BootCamp-Proje
//
//  Created by ismail karaçayır on 14.10.2023.
//

import Foundation
import RxSwift
class MainViewModel {
    var foodList = BehaviorSubject<[Yemekler]>(value:[Yemekler]())
    var foodRepo = FoodRepositoty()
    init() {
        foodList = foodRepo.foodList
    }
    
    
    func allFoodList (){
        foodRepo.allFoodList()
    }
    
    func addToCard(yemek_adi : String , yemek_fiyat: String , yemek_resim_adi : String, yemek_siparis_adet: Int)  {
        
        foodRepo.addToCard(yemek_adi: yemek_adi, yemek_fiyat: yemek_fiyat, yemek_resim_adi: yemek_resim_adi, yemek_siparis_adet: yemek_siparis_adet)
 
       }
}
