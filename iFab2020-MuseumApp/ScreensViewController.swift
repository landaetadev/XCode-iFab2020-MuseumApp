//
//  PantallasViewController.swift
//  iFab2020-MuseumApp
//
//  Created by Orlando Landaeta on 25/09/2020.
//  Copyright © 2020 Orlando Landaeta. All rights reserved.
//

import UIKit
import WebKit

class ScreensViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
 
}

func funcReadJsonData()
{
    //print("ID: \(varJSONID) \n" + "QRCode: \(varJSONQRCode) \n" +  "WikiURL: \(varJSONWikiURL) \n" + "ImageFile: \(varJSONImageFile) \n" + "VideoFile: \(varJSONVideoFile) \n")
    //CARGAR DATOS DE WIKI
    //CARGAR DATOS DE IMAGES
    //CARGAR DATOS DE VIDEOS
}

class ScreenWikiViewController: UIViewController
{
    
    
    @IBOutlet weak var webviewScreenWikiVC: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("WikiURL: \(varJSONWikiURL)")
        funcReadJsonData()
        
        //Asigna Texto al titulo del ScreenView
        navigationItem.title = varJSONQRCode

        let letURLWeb = URL(string: varJSONWikiURL)
        webviewScreenWikiVC.load(URLRequest(url:letURLWeb!))
        
    }
 
}

class ScreenImagesController: UIViewController
{

    @IBOutlet weak var imgScreenImageVC: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("ImageFile: \(varJSONImageFile)")
        funcReadJsonData()
        
        //Asigna Texto al titulo del ScreenView
        navigationItem.title = varJSONQRCode
        
        let letURLImage = NSData(contentsOf: NSURL(string: varJSONImageFile)! as URL)
        imgScreenImageVC.image = UIImage(data: letURLImage! as Data)
        
    }
 
}

class ScreenVideoViewController: UIViewController
{

    override func viewDidLoad() {
        super.viewDidLoad()
        //print("VideoFile: \(varJSONVideoFile)")
        funcReadJsonData()
        
        //Asigna Texto al titulo del ScreenView
        navigationItem.title = varJSONQRCode

        view.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
    }
 
}
