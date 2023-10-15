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
}
