//
//  PersonViewController.swift
//  RasitOdev6
//
//  Created by Rasit on 10.10.2022.
//

import UIKit

class PersonViewController: UIViewController {
    
    
    @IBOutlet weak var personViewOutlet: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            let app = UIApplication.shared
            let statusBarHeight: CGFloat = app.statusBarFrame.size.height
            
            let statusbarView = UIView()
            statusbarView.backgroundColor = UIColor(red: 0.59, green: 0.90, blue: 0.92, alpha: 0.75)
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
            statusBar?.backgroundColor = UIColor(red: 0.59, green: 0.90, blue: 0.92, alpha: 0.75)
        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = personViewOutlet.bounds
        gradientLayer.colors = [UIColor(red: 0.59, green: 0.90, blue: 0.92, alpha: 0.75).cgColor, UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor]
        personViewOutlet.layer.insertSublayer(gradientLayer, at: 0)
    }
    

}
