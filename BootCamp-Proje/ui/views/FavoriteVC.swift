//
//  FavoriteVC.swift
//  BootCamp-Proje
//
//  Created by ismail karaçayır on 14.10.2023.
//

import UIKit




class FavoriteVC: UIViewController {
 
    

    @IBOutlet weak var tableView: UITableView!
    var favList = [Yemekcore]()
    var viewModel = MainViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

    }
    override func viewWillAppear(_ animated: Bool) {
        print("FavoriteVC viewWillAppear  çalıştı")
        self.cartListrefresh()
    }
    
    func cartListrefresh(){
        viewModel.getCoreDataList()

        _ = viewModel.coreDataFoodList.subscribe(onNext: { favList in
            self.favList = favList
            for item in favList {
                print(item.yemek_adi!)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
             
            }})
    
    }
    



}


extension FavoriteVC: UITableViewDelegate,UITableViewDataSource ,FavCellProtokol{
    func deleteFav(indexPath: IndexPath) {
        let deleteFood = favList[indexPath.row]
        if let name = deleteFood.yemek_adi{
            self.viewModel.deleteCoreDate(foodName: name)
        }
        
       

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let favFood = favList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell") as! FavoriTableViewCell
        cell.foodNameLbl.text = favFood.yemek_adi
        cell.indexPath = indexPath
        cell.favCellprotokol = self
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(favFood.yemek_resim_adi!)"){
            DispatchQueue.main.async {
                cell.FoodİmageView.kf.setImage(with: url)
            }
        }
        return cell
    }
    
    
}
