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
    
    
    func addToCard(yemek_adi : String , yemek_fiyat: String , yemek_resim_adi : String, yemek_siparis_adet: Int)  {
        
        print("web servis çalıştı")
        let userName = "ismailKara01"
        let params : Parameters = ["yemek_adi": yemek_adi,"yemek_resim_adi": yemek_resim_adi,"yemek_fiyat":yemek_fiyat,"yemek_siparis_adet":yemek_siparis_adet , "kullanici_adi":userName]

       AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post,parameters: params ).response {
           response in
           if let data = response.data {

               do{
                   let response = try JSONDecoder().decode(CrudResponse.self, from: data)
                   print("gelen message\(response.message!)")
                   print("gelen success\(response.success!)")
                   
               }catch{
                   print("hata oluştu")
                   print(error.localizedDescription)
               }
               
           }
       }
        
         
    }
    
    
    
}
   




