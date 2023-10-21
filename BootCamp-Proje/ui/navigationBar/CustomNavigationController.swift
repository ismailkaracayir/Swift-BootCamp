//
//  CustomNavigationController.swift
//  BootCamp-Proje
//
//  Created by ismail karaçayır on 21.10.2023.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()


        // Özel Navigation Bar'ı oluşturun
         let customNavBar = UINavigationBar()
        customNavBar.prefersLargeTitles = true
        customNavBar.largeTitleTextAttributes = [.foregroundColor: UIColor.systemOrange,.font : UIFont.systemFont(ofSize: 30)]
        
         
         let customNavItem = UINavigationItem(title: "Özel Sayfa")
        customNavItem.largeTitleDisplayMode = .always

         customNavBar.setItems([customNavItem], animated: false)
         self.setValue(customNavBar, forKey: "navigationBar")

     }
    
    

    }
    




