//
//  food_repository.swift
//  BootCamp-Proje
//
//  Created by ismail karaçayır on 14.10.2023.
//

import Foundation
import RxSwift
class FoodRepositoty{
    var foodList = BehaviorSubject<[Yemekler]>(value:[Yemekler]())
    var cardList = BehaviorSubject<[sepet_yemekler]>(value:[sepet_yemekler]())
    var coreDataFoodList = BehaviorSubject<[Yemekcore]>(value:[Yemekcore]())


     var webServices = WebService()
    
    
    init() {
        foodList = webServices.foodList
        cardList = webServices.cardList
        coreDataFoodList = webServices.coreDataFoodList
    }
    func saveLocaleDatabase(food : Yemekler) -> Void {

        webServices.saveLocaleDatabase(food: food)
    
    }
    func deleteCoreDate (foodName:String){
        webServices.deleteCoreDate(foodName: foodName)
    }

    func getCoreDataList()  {
        webServices.getCoreDataList()
    }
    
    func allFoodList (){

        webServices.allFoodList()
    }
    
    
    func addToCard(yemek_adi : String , yemek_fiyat: Int , yemek_resim_adi : String, yemek_siparis_adet: Int)  {
        
         webServices.addToCard(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet)
        
         
    }
    
    func allCardList (){
        webServices.allCardList()
    }
    
    func deleteFood (sepet_yemek_id : Int){
        webServices.deleteFood(sepet_yemek_id: sepet_yemek_id)
        
    }
    
  
}
