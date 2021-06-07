//
//  PantallasViewController.swift
//  iFab2020-MuseumApp
//
//  Created by Orlando Landaeta on 25/09/2020.
//  Copyright © 2020 Orlando Landaeta. All rights reserved.
//

import UIKit
import WebKit
import AVKit
import AVFoundation

class ScreensViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
 
}


class ScreenWikiViewController: UIViewController
{
    
    @IBOutlet weak var imgWikipedia480: UIImageView!
    @IBOutlet weak var webviewScreenWikiVC: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("WikiURL: \(varJSONWikiURL)")
        imgWikipedia480.isHidden = true
        
        //Asigna Texto al titulo del ScreenView
        navigationItem.title = varJSONTitle
        
        //Cargar Web Wiki
        if varJSONWikiURL != ""
        {
            let letURLWeb = URL(string: varJSONWikiURL)
            webviewScreenWikiVC.load(URLRequest(url:letURLWeb!))
        }
        else
        {
            imgWikipedia480.isHidden = false
            webviewScreenWikiVC.isHidden = true
        }

    }
 
}

class ScreenImagesController: UIViewController
{

    
    @IBOutlet weak var imgImages: UIImageView!
    @IBOutlet weak var imgScreenImageVC: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("ImageFile: \(varJSONImageFile)")
        
        //Asigna Texto al titulo del ScreenView
        navigationItem.title = varJSONTitle
        
        //Cargar Imagen
        if varJSONImageFile != ""
        {
            let letURLImage = NSData(contentsOf: NSURL(string: varJSONImageFile)! as URL)
            imgScreenImageVC.image = UIImage(data: letURLImage! as Data)
        }
        else
        {
            imgImages.isHidden = false
            imgScreenImageVC.isHidden = true
        }
        
    }
 
}

class ScreenVideoViewController: UIViewController
{
    
    @IBOutlet weak var imgMovies: UIImageView!
    @IBOutlet weak var webviewScreenVideoVC: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("VideoFile: \(varJSONVideoFile)")
        
        
        //Asigna Texto al titulo del ScreenView
        navigationItem.title = varJSONTitle
        
        //Cargar Video
        if varJSONWikiURL != ""
        {
            let letURLWeb = URL(string: varJSONVideoFile)
            webviewScreenVideoVC.load(URLRequest(url:letURLWeb!))
        }
        else
        {
            imgMovies.isHidden = false
            webviewScreenVideoVC.isHidden = true
        }

    }

}
