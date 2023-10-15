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
     var webServices = WebService()
    
    
    init() {
        foodList = webServices.foodList
    }
    
    func allFoodList (){

        webServices.allFoodList()
    }
}
