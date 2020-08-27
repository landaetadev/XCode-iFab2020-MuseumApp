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
        funcAnimacion()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //Thread.sleep(forTimeInterval: 0)
        //self.btnLeerQRCodes.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //btnLeerQRCodes.isHidden = true
    }
    
    func funcAnimacion (){
        UIImageView.animate(withDuration: 3.0){
            self.imgLogoUPV.center.y += self.view.bounds.width
            self.imgLogoiFab.center.y -= self.view.bounds.width
        }
    }
    
}

