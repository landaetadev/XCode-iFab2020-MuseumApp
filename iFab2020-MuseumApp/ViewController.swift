//
//  ViewController.swift
//  iFab2020-MuseumApp
//
//  Created by Orlando Landaeta on 23/08/2020.
//  Copyright © 2020 Orlando Landaeta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imgLogoUPV: UIImageView!
    @IBOutlet weak var imgLogoiFab: UIImageView!
    @IBOutlet weak var btnLeerQRCodes: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        funcBtnEntrarBorderDesign()
        funcAnimacion()
        //funcAppearAcceptButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //btnLeerQRCodes.isHidden = true
        
    }
    
    func funcAnimacion (){
        UIImageView.animate(withDuration: 2.0){
            self.imgLogoUPV.center.y += self.view.bounds.width
            self.imgLogoiFab.center.y -= self.view.bounds.width
        }
    }
    
    func funcBtnEntrarBorderDesign ()
    {
        btnLeerQRCodes.layer.backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
        btnLeerQRCodes.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        btnLeerQRCodes.layer.borderWidth = 3
        btnLeerQRCodes.layer.cornerRadius = 10

    }
    
    func funcAppearAcceptButton(){
        Thread.sleep(forTimeInterval: 2)
        self.btnLeerQRCodes.isHidden = false
    }
    
}

