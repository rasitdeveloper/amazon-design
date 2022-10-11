//
//  ViewController.swift
//  RasitOdev6
//
//  Created by Rasit on 8.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    @IBOutlet weak var viewSearchBarOutlet: UIView!
    @IBOutlet weak var viewTeslimatOutlet: UIView!
    @IBOutlet weak var sliderCollection: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    @IBOutlet weak var sliderCollectionSmall: UICollectionView!
    @IBOutlet weak var sliderCollectionFirsatUrunleri: UICollectionView!
    
    
    
    
    
    var timer : Timer?
    var currentIndex = 0
    let imgArray = ["1slider1","1slider2","1slider3","1slider4","1slider5","1slider6","1slider7","1slider8","1slider9","1slider10"]
    let imgArraySmall = ["2slider2","2slider3","2slider4","2slider6","2slider5","2slider7","2slider8","2slider9","2slider10","2slider11"]
    var firsatUrunleriListe = [FirsatUrunleri]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if #available(iOS 13.0, *) {
            let app = UIApplication.shared
            let statusBarHeight: CGFloat = app.statusBarFrame.size.height
            
            let statusbarView = UIView()
            statusbarView.backgroundColor = UIColor(red: 0.47, green: 0.86, blue: 0.86, alpha: 1.00)
            view.addSubview(statusbarView)
          
            statusbarView.translatesAutoresizingMaskIntoConstraints = false
            statusbarView.heightAnchor
                .constraint(equalToConstant: statusBarHeight).isActive = true
            statusbarView.widthAnchor
                .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
            statusbarView.topAnchor
                .constraint(equalTo: view.topAnchor).isActive = true
            statusbarView.centerXAnchor
                .constraint(equalTo: view.centerXAnchor).isActive = true
          
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = UIColor(red: 0.47, green: 0.86, blue: 0.86, alpha: 1.00)
        }
        
        let u1 = FirsatUrunleri(urun_id: 1, urun_ad: "Logitech G73X", urun_fiyat: 3200, urun_indirim: 10, resim_adi: "firsat1")
        let u2 = FirsatUrunleri(urun_id: 2, urun_ad: "OPPO X Buds", urun_fiyat: 500, urun_indirim: 15, resim_adi: "firsat2")
        let u3 = FirsatUrunleri(urun_id: 3, urun_ad: "Hugh Butler X", urun_fiyat: 1020, urun_indirim: 5, resim_adi: "firsat3")
        let u4 = FirsatUrunleri(urun_id: 4, urun_ad: "Mark Ryden 19", urun_fiyat: 815, urun_indirim: 15, resim_adi: "firsat4")
        let u5 = FirsatUrunleri(urun_id: 5, urun_ad: "XEnergy Wattmeter X9", urun_fiyat: 150, urun_indirim: 20, resim_adi: "firsat5")
        let u6 = FirsatUrunleri(urun_id: 6, urun_ad: "Sma Optipro 3", urun_fiyat: 500, urun_indirim: 10, resim_adi: "firsat6")
        let u7 = FirsatUrunleri(urun_id: 7, urun_ad: "Royal Canin 37", urun_fiyat: 500, urun_indirim: 5, resim_adi: "firsat7")
        
        firsatUrunleriListe.append(u1)
        firsatUrunleriListe.append(u2)
        firsatUrunleriListe.append(u3)
        firsatUrunleriListe.append(u4)
        firsatUrunleriListe.append(u5)
        firsatUrunleriListe.append(u6)
        firsatUrunleriListe.append(u7)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = viewSearchBarOutlet.bounds
        gradientLayer.colors = [UIColor(red: 0.47, green: 0.86, blue: 0.86, alpha: 1.00).cgColor, UIColor(red: 0.59, green: 0.90, blue: 0.78, alpha: 1.00).cgColor]
        viewSearchBarOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        searchBarOutlet.layer.cornerRadius = 6
        searchBarOutlet.layer.masksToBounds = true
        searchBarOutlet.layer.borderWidth = 0.5
        searchBarOutlet.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        searchBarOutlet.isTranslucent = true
        searchBarOutlet.barTintColor = .white
        searchBarOutlet.searchTextField.backgroundColor = .white
        
        viewTeslimatOutlet.layer.backgroundColor = UIColor(red: 0.59, green: 0.90, blue: 0.92, alpha: 0.75).cgColor
        
        sliderCollection.delegate = self
        sliderCollection.dataSource = self
        
        sliderCollectionSmall.delegate = self
        sliderCollectionSmall.dataSource = self
        
        sliderCollectionFirsatUrunleri.delegate = self
        sliderCollectionFirsatUrunleri.dataSource = self
        
        pageView.numberOfPages = imgArray.count
        startTimer()
        
        
    }
    
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(nextToIndex), userInfo: nil, repeats: true)
    }
    @objc func nextToIndex() {
        if currentIndex == imgArray.count - 1 {
            currentIndex = -1
        } else {
            currentIndex += 1
            sliderCollection.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
            pageView.currentPage = currentIndex
        }
            
    }

}



extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sliderCollection {
            return imgArray.count
        }
        if collectionView == sliderCollectionSmall {
            return imgArraySmall.count
        }
        if collectionView == sliderCollectionFirsatUrunleri {
            return firsatUrunleriListe.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sliderCollection {
            let cell1 = sliderCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SliderCollectionViewCell
            cell1.sliderImageViewOutlet.image = UIImage(named: imgArray[indexPath.row])
            return cell1
        }
        if collectionView == sliderCollectionSmall {
            let cell2 = sliderCollectionSmall.dequeueReusableCell(withReuseIdentifier: "cellSmall", for: indexPath) as! SliderSmallCollectionViewCell
            cell2.sliderSmallImageViewOutlet.image = UIImage(named: imgArraySmall[indexPath.row])
            return cell2
        }
        if collectionView == sliderCollectionFirsatUrunleri {
            let urun = firsatUrunleriListe[indexPath.row]
            let cell3 = sliderCollectionFirsatUrunleri.dequeueReusableCell(withReuseIdentifier: "cellFirsat", for: indexPath) as! FirsatUrunleriCollectionViewCell
            cell3.firsatUrunleriImageView.image = UIImage(named: urun.resim_adi!)
            cell3.firsatUrunleriYuzde.text = "%\(String(urun.urun_indirim!))"
            cell3.firsatUrunleriFiyat.text = "\(String(urun.urun_fiyat!)) TL"
            let urunFiyat = Int(urun.urun_fiyat ?? 0)
            let urunIndirim = Int(urun.urun_indirim ?? 0)
            let oncekiFiyat = Int(urunFiyat + (urunFiyat * urunIndirim / 100))
            //oncekiFiyat = urun.urun_fiyat-(urun.urun_fiyat * urun.urun_indirim / 100)
            cell3.firsatUrunleriOncekiFiyat.text = "Önceki fiyat: \(oncekiFiyat)"
            cell3.firsatUrunleriUrunAdi.text = urun.urun_ad
            
            return cell3
        }
        return sliderCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SliderCollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == sliderCollection {
            return CGSize(width: sliderCollection.frame.width, height: sliderCollection.frame.height)
        }
        if collectionView == sliderCollectionSmall {
            return CGSize(width: 85, height: 95)
        }
        if collectionView == sliderCollectionFirsatUrunleri {
            return CGSize(width: 190, height: 210)
        }
        return CGSize(width: sliderCollection.frame.width, height: sliderCollection.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == sliderCollection {
            return 0
        }
        if collectionView == sliderCollectionSmall {
            return 16
        }
        if collectionView == sliderCollectionFirsatUrunleri {
            return 10
        }
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == sliderCollectionSmall {
            return UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 7)
        }
        if collectionView == sliderCollectionFirsatUrunleri {
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == sliderCollectionFirsatUrunleri {
            return 5
        }
        return 0
    }
    
}
