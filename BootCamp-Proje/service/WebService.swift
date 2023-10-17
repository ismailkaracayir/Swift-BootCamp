//
//  WebService.swift
//  BootCamp-Proje
//
//  Created by ismail karaçayır on 14.10.2023.
//

import Foundation
import Alamofire
import RxSwift
import Dispatch

class WebService {
    var foodList = BehaviorSubject<[Yemekler]>(value:[Yemekler]())
    var cardList = BehaviorSubject<[sepet_yemekler]>(value:[sepet_yemekler]())
    let userName = "ismailkara01"

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
    
    
    func addToCard(yemek_adi : String , yemek_resim_adi : String, yemek_fiyat: Int , yemek_siparis_adet: Int)  {

   
        
        addToCartCheck(yemek_adi: yemek_adi)
        
        print("\(yemek_adi)---\(yemek_resim_adi)---\(yemek_fiyat)---\(yemek_siparis_adet)---\(userName)---")
        let params : Parameters = ["yemek_adi": yemek_adi,"yemek_resim_adi": yemek_resim_adi,"yemek_fiyat":yemek_fiyat,"yemek_siparis_adet":yemek_siparis_adet , "kullanici_adi":userName]

       AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post,parameters: params ).response {
           response in
           if let data = response.data {

               do{
                   let response = try JSONDecoder().decode(CrudResponse.self, from: data)
                   print("gelen message: \(response.message!)")
                   print("gelen success: \(response.success!)")
                   if response.success == 1 {self.allCardList()}
                   
               }catch{
                   print("addToCard hata oluştu")
                   print(error.localizedDescription)
               }
               
           }
       }
        
         
    }
    
    func addToCartCheck(yemek_adi : String) -> Void {
        let semaphore = DispatchSemaphore(value: 0)

        DispatchQueue.global().async {
            print("FONK GELEN YEMEK ADI : \(yemek_adi)")
            _ = self.cardList.subscribe(onNext: { foodlist in
                for element in foodlist {
                    print("FOODLİST GELEN YEMEK ADI : \(element.yemek_adi ?? "boş")")

                    if element.yemek_adi == yemek_adi {
                        let id = Int(element.sepet_yemek_id!)
                        self.deleteFood(sepet_yemek_id: id!)
                    }
                }
            })
            semaphore.signal()
        }
        semaphore.wait()

    }
    
    
    func allCardList (){
        let param : Parameters = ["kullanici_adi":userName]
       AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post,parameters: param).response {
           response in
           if let data = response.data {
               

               do{
                   let response = try JSONDecoder().decode(Welcome2.self, from: data)
                   if let list = response.sepet_yemekler {
                       self.cardList.onNext(list)
                       
                   }
               }catch{
                   print("allCardList hata oluştu")
                   print(error.localizedDescription)
               }
               
           }
       }
        
    }
    
    
    func deleteFood (sepet_yemek_id : Int){
        print("deleteFood web servis çalıştı")
        let param : Parameters = ["sepet_yemek_id":sepet_yemek_id,"kullanici_adi":userName]
       AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post,parameters: param).response {
           response in
           if let data = response.data {

               do{
                   let response = try JSONDecoder().decode(CrudResponse.self, from: data)
                   print("\(response.message!)")
                   print("\(response.success!)")
                   if response.success == 1 {self.allCardList()}
               }catch{
                   print("hata oluştu")
                   print(error.localizedDescription)
               }
               
           }
       }
        
    }
    
    
    
}
   




