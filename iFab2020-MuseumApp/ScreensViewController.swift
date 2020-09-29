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

func funcReadJsonData()
{

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
    @IBOutlet weak var webviewScreenVideoVC: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    print("VideoFile: \(varJSONVideoFile)")
        funcReadJsonData()
        
        //Asigna Texto al titulo del ScreenView
        navigationItem.title = varJSONQRCode
        
        //Cargar Video
        //funStartVideo()
        let letURLWeb = URL(string: varJSONVideoFile)
        webviewScreenVideoVC.load(URLRequest(url:letURLWeb!))
        
    }
    
    
//    func funStartVideo()
//    {
        //Cargar Video local WORKS
//        if let path = Bundle.main.path(forResource: "iMacG3", ofType: "mp4")
//        {
//            let video = AVPlayer(url: URL(fileURLWithPath: path))
//            let videoPlayer = AVPlayerViewController()
//            videoPlayer.player = video
//
//            present(videoPlayer, animated: true, completion:
//            {
//                video.play()
//            })
//        }
        
        //Cargar Video desde la web - NO REPRODUCE EL SONIDO
//        let letVideoURL = NSURL(string: varJSONVideoFile)! as URL
//        let letVideo = AVPlayer(url: letVideoURL)
//        let letVideoplayer = AVPlayerViewController()
//        letVideoplayer.player = letVideo
//
//        present(letVideoplayer, animated: true, completion: {
//            letVideo.play()
//        })
        
//    }
 
}
