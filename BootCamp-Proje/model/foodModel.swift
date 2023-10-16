//
//  foodModel.swift
//  BootCamp-Proje
//
//  Created by ismail karaçayır on 14.10.2023.
//

import Foundation


struct Welcome1: Codable {
    var yemekler: [Yemekler]?
    var success: Int?
}

struct Yemekler: Codable {
    var yemek_id: String?
    var yemek_adi: String?
    var yemek_resim_adi: String?
    var yemek_fiyat: String?
    
    init(yemek_id: String? , yemek_adi: String? , yemek_resim_adi: String? , yemek_fiyat: String? ) {
        self.yemek_id = yemek_id
        self.yemek_adi = yemek_adi
        self.yemek_resim_adi = yemek_resim_adi
        self.yemek_fiyat = yemek_fiyat
    }
}


struct CrudResponse : Codable {
    var success :Int?
    var message : String?
}


struct Welcome2: Codable {
    var sepet_yemekler: [sepet_yemekler]?
    var success: Int?
}

struct sepet_yemekler : Codable {
    var sepet_yemek_id : String?
    var yemek_adi: String?
    var yemek_resim_adi: String?
    var yemek_fiyat: String?
    var yemek_siparis_adet : String?
    var kullanici_adi : String?
    
    init(sepet_yemek_id: String? = nil, yemek_adi: String? = nil, yemek_resim_adi: String? = nil, yemek_fiyat: String? = nil, yemek_siparis_adet: String? = nil, kullanici_adi: String? = nil) {
        self.sepet_yemek_id = sepet_yemek_id
        self.yemek_adi = yemek_adi
        self.yemek_resim_adi = yemek_resim_adi
        self.yemek_fiyat = yemek_fiyat
        self.yemek_siparis_adet = yemek_siparis_adet
        self.kullanici_adi = kullanici_adi
    }

}
