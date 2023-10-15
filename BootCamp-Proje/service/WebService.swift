//
//  WebService.swift
//  BootCamp-Proje
//
//  Created by ismail karaçayır on 14.10.2023.
//

import Foundation
import Alamofire
import RxSwift
class WebService {
 var foodList = BehaviorSubject<[Yemekler]>(value:[Yemekler]())
    init() {
        allFoodList()
    }
    
    func allFoodList (){
         print("web servis çalıştı")
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).response {
            response in
            if let data = response.data {
                

                do{
                    let response = try JSONDecoder().decode(Welcome1.self, from: data)
                    if let list = response.yemekler {
                        self.foodList.onNext(list)
                    }
                }catch{
                    print("hata oluştu")
                    print(error.localizedDescription)
                }
                
            }
        }
    }
    
    
    
}
   




