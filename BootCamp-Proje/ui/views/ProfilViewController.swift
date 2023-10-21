//
//  ProfilViewController.swift
//  BootCamp-Proje
//
//  Created by ismail karaçayır on 21.10.2023.
//

import UIKit

class ProfilViewController: UIViewController {

    @IBOutlet weak var profilView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
           gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemOrange.withAlphaComponent(0.1).cgColor, UIColor.white.cgColor, UIColor.white.cgColor]
           navigationController?.view.layer.insertSublayer(gradientLayer, at: 0)
        profilView.layer.insertSublayer(gradientLayer, at: 0)

    }
    


}
