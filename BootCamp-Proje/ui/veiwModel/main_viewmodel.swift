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
}
