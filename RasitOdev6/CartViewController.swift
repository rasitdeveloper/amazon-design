//
//  CartViewController.swift
//  RasitOdev6
//
//  Created by Rasit on 10.10.2022.
//

import UIKit

class CartViewController: UIViewController {
    
    
    @IBOutlet weak var cartSearchBarView: UIView!
    @IBOutlet weak var cartSearchBar: UISearchBar!
    @IBOutlet weak var cartTeslimatView: UIView!
    @IBOutlet weak var cartTeslimatImage: UIImageView!
    @IBOutlet weak var cartTeslimatLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = cartSearchBarView.bounds
        gradientLayer.colors = [UIColor(red: 0.47, green: 0.86, blue: 0.86, alpha: 1.00).cgColor, UIColor(red: 0.59, green: 0.90, blue: 0.78, alpha: 1.00).cgColor]
        cartSearchBarView.layer.insertSublayer(gradientLayer, at: 0)

        cartSearchBar.layer.cornerRadius = 6
        cartSearchBar.layer.masksToBounds = true
        cartSearchBar.layer.borderWidth = 0.5
        cartSearchBar.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        cartSearchBar.isTranslucent = true
        cartSearchBar.barTintColor = .white
        cartSearchBar.searchTextField.backgroundColor = .white
        
        cartTeslimatView.layer.backgroundColor = UIColor(red: 0.59, green: 0.90, blue: 0.92, alpha: 0.75).cgColor
    }
    


}
