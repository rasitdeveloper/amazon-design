//
//  Kategori.swift
//  RasitOdev6
//
//  Created by Rasit on 10.10.2022.
//

import Foundation

class Kategoriler {
    var kategori_id:Int?
    var kategori_ad:String?
    var kategori_foto:String?
    
    init(kategori_id: Int, kategori_ad: String, kategori_foto: String) {
        self.kategori_id = kategori_id
        self.kategori_ad = kategori_ad
        self.kategori_foto = kategori_foto
    }
    
}
