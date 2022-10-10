//
//  firsatUrunleri.swift
//  RasitOdev6
//
//  Created by Rasit on 9.10.2022.
//

import Foundation

class FirsatUrunleri {
    var urun_id:Int?
    var urun_ad:String?
    var urun_fiyat:Int?
    var urun_indirim:Int?
    var resim_adi:String?
    
    init(urun_id: Int, urun_ad: String, urun_fiyat: Int, urun_indirim: Int, resim_adi: String) {
        self.urun_id = urun_id
        self.urun_ad = urun_ad
        self.urun_fiyat = urun_fiyat
        self.urun_indirim = urun_indirim
        self.resim_adi = resim_adi
    }
    
}
