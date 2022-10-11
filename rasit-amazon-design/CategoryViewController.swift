//
//  CategoryViewController.swift
//  RasitOdev6
//
//  Created by Rasit on 10.10.2022.
//

import UIKit

class CategoryViewController: UIViewController {
    
    
    @IBOutlet var mainViewOutlet: UIView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var categoryPageSearchBarOutlet: UISearchBar!
    
    var kategoriListe = [Kategoriler]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let tasarim:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let genislik = self.categoryCollectionView.frame.size.width
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        let hucreGenislik = (genislik-40)/2
        tasarim.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik*1.6)
        categoryCollectionView!.collectionViewLayout = tasarim
        */
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = mainViewOutlet.bounds
        gradientLayer.colors = [UIColor(red: 0.47, green: 0.86, blue: 0.86, alpha: 0.3).cgColor, UIColor(red: 1, green: 1, blue: 1, alpha: 1.00).cgColor]
        mainViewOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        
        categoryPageSearchBarOutlet.layer.cornerRadius = 6
        categoryPageSearchBarOutlet.layer.masksToBounds = true
        categoryPageSearchBarOutlet.layer.borderWidth = 0.5
        categoryPageSearchBarOutlet.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        categoryPageSearchBarOutlet.isTranslucent = true
        categoryPageSearchBarOutlet.barTintColor = .white
        categoryPageSearchBarOutlet.searchTextField.backgroundColor = .white
        
        let k1 = Kategoriler(kategori_id: 1, kategori_ad: "Hediye", kategori_foto: "k1")
        let k2 = Kategoriler(kategori_id: 2, kategori_ad: "Fırsatlar", kategori_foto: "k2")
        let k3 = Kategoriler(kategori_id: 3, kategori_ad: "Gıda ve İçecek", kategori_foto: "k3")
        let k4 = Kategoriler(kategori_id: 4, kategori_ad: "Sağlık, Bakım ve Temizlik", kategori_foto: "k4")
        let k5 = Kategoriler(kategori_id: 5, kategori_ad: "Evcil Hayvan Ürünleri", kategori_foto: "k5")
        let k6 = Kategoriler(kategori_id: 6, kategori_ad: "Moda ve Güzellik", kategori_foto: "k6")
        let k7 = Kategoriler(kategori_id: 7, kategori_ad: "Ev, Mutfak ve Yapı Market", kategori_foto: "k7")
        let k8 = Kategoriler(kategori_id: 8, kategori_ad: "Telefon, Bilgisayar ve Elektronik", kategori_foto: "k8")
        let k9 = Kategoriler(kategori_id: 9, kategori_ad: "Müzik, Video ve Oyun", kategori_foto: "k9")
        let k10 = Kategoriler(kategori_id: 10, kategori_ad: "Kitap", kategori_foto: "k10")
        let k11 = Kategoriler(kategori_id: 11, kategori_ad: "Bebek ve Çocuk Ürünleri", kategori_foto: "k11")
        let k12 = Kategoriler(kategori_id: 12, kategori_ad: "Ofis ve Bilgisayar Aksesuarları", kategori_foto: "k12")
        let k13 = Kategoriler(kategori_id: 13, kategori_ad: "Spor ve Outdoor", kategori_foto: "k13")
        let k14 = Kategoriler(kategori_id: 14, kategori_ad: "Bavullar ve Seyahat Aksesuarları", kategori_foto: "k14")
        let k15 = Kategoriler(kategori_id: 15, kategori_ad: "Otomotiv", kategori_foto: "k15")
        let k16 = Kategoriler(kategori_id: 16, kategori_ad: "Hesabım", kategori_foto: "k16")
        let k17 = Kategoriler(kategori_id: 17, kategori_ad: "Ayarlar", kategori_foto: "setting")
        let k18 = Kategoriler(kategori_id: 18, kategori_ad: "Müşteri Hizmetleri", kategori_foto: "customer-service")
        let k19 = Kategoriler(kategori_id: 19, kategori_ad: "Giriş Yap", kategori_foto: "log-in")
        
        
        kategoriListe.append(k1)
        kategoriListe.append(k2)
        kategoriListe.append(k3)
        kategoriListe.append(k4)
        kategoriListe.append(k5)
        kategoriListe.append(k6)
        kategoriListe.append(k7)
        kategoriListe.append(k8)
        kategoriListe.append(k9)
        kategoriListe.append(k10)
        kategoriListe.append(k11)
        kategoriListe.append(k12)
        kategoriListe.append(k13)
        kategoriListe.append(k14)
        kategoriListe.append(k15)
        kategoriListe.append(k16)
        kategoriListe.append(k17)
        kategoriListe.append(k18)
        kategoriListe.append(k19)

        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
    }
    

}

extension CategoryViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kategoriListe.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let kategori = kategoriListe[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellCategory", for: indexPath) as! CategoryCollectionViewCell
        cell.layer.borderWidth = 0.3
        cell.categoryNameLabel.text = kategori.kategori_ad
        cell.categoryImage.image = UIImage(named: kategori.kategori_foto!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 200)
    }
    
    
    
}
