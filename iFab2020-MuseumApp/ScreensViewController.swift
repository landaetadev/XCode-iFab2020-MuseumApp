//
//  PantallasViewController.swift
//  iFab2020-MuseumApp
//
//  Created by Orlando Landaeta on 25/09/2020.
//  Copyright © 2020 Orlando Landaeta. All rights reserved.
//

import UIKit

class ScreensViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
 
}

func funcReadJsonData()
{
    //print("INFORMACION DATOS LOCALJSON DESDE SCREENVIEWCONTROLLER")
    print("ID: \(varJSONID) \n" + "QRCode: \(varJSONQRCode) \n" +  "WikiURL: \(varJSONWikiURL) \n" + "ImageFile: \(varJSONImageFile) \n" + "VideoFile: \(varJSONVideoFile) \n")
    //CARGAR DATOS DE WIKI
    //CARGAR DATOS DE IMAGES
    //CARGAR DATOS DE VIDEOS
}

class ScreenWikiViewController: UIViewController
{

    override func viewDidLoad() {
        super.viewDidLoad()
        print("INFORMACION DATOS LOCALJSON DESDE WIKIVIEWCONTROLLER")
        funcReadJsonData()
        //print("ID: \(varJSONID) \n" + "QRCode: \(varJSONQRCode) \n" +  "WikiURL: \(varJSONWikiURL) \n" + "ImageFile: \(varJSONImageFile) \n" + "VideoFile: \(varJSONVideoFile) \n")

        view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    }
 
}

class ScreenImagesController: UIViewController
{

    override func viewDidLoad() {
        super.viewDidLoad()
        print("INFORMACION DATOS LOCALJSON DESDE IMAGEVIEWCONTROLLER")
        funcReadJsonData()
        //print("ID: \(varJSONID) \n" + "QRCode: \(varJSONQRCode) \n" +  "WikiURL: \(varJSONWikiURL) \n" + "ImageFile: \(varJSONImageFile) \n" + "VideoFile: \(varJSONVideoFile) \n")

        view.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
    }
 
}

class ScreenVideoViewController: UIViewController
{

    override func viewDidLoad() {
        super.viewDidLoad()
        print("INFORMACION DATOS LOCALJSON DESDE VIDEOVIEWCONTROLLER")
        funcReadJsonData()
        //print("ID: \(varJSONID) \n" + "QRCode: \(varJSONQRCode) \n" +  "WikiURL: \(varJSONWikiURL) \n" + "ImageFile: \(varJSONImageFile) \n" + "VideoFile: \(varJSONVideoFile) \n")

        view.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
    }
 
}
