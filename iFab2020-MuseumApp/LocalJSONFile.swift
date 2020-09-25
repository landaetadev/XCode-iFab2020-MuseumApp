//
//  LocalJSONFile.swift
//  iFab2020-MuseumApp
//
//  Created by Orlando Landaeta on 23/09/2020.
//  Copyright © 2020 Orlando Landaeta. All rights reserved.
//

import Foundation


//func readLocalJsonFile()
func readLocalJsonFile(varCodQR:String)
//func readLocalJsonFile(varCodQR:String) -> String
{

    let letPath = Bundle.main.path(forResource: "JSONLista", ofType: "json")
    let letURL = URL(fileURLWithPath: letPath!)
    
    do
    {
        let letData = try Data(contentsOf: letURL)
        let letJSON = try JSONSerialization.jsonObject(with: letData, options: .mutableContainers)
        //guard let letArray = letJSON as? [Any] else {return}
        for user in letJSON as! [Any]
        {
            guard let letUserDict = user as? [String:Any] else {return}
            guard let jsonID = letUserDict["jsonID"] else {return}
            guard let jsonQRCode = letUserDict["jsonQRCode"] else {return}
            guard let jsonWikiURL = letUserDict["jsonWikiURL"] else {return}
            guard let jsonImageFile = letUserDict["jsonImageFile"] else {return}
            guard let jsonVideoFile = letUserDict["jsonVideoFile"] else {return}
            
            //COMPARACION DE CODIGO QR CON LISTA JSON
            if jsonQRCode as! String == varCodQR
            {
                print("INFORMACION DATOS LOCALJSON")
                print("QR RECIBIDO: \(varCodQR)")
                print("ID: \(String(describing: jsonID)) \n" +
                        "QRCode: \(String(describing: jsonQRCode))\n" +
                        "WikiURL: \(String(describing: jsonWikiURL))\n" +
                        "ImageFile: \(String(describing: jsonImageFile))\n" +
                        "VideoFile: \(String(describing: jsonVideoFile))")
            }else{
                print("El código QR no fue encontrado")
            }
            
        }
        
    }catch{
        print(error)
    }
}

//func SendDatosPantalla()
//{
//    let a = string(jsonID)
//    print("INFORMACION DATOS LOCALJSON")
//    print("QR RECIBIDO: \(varCodQR)")
//    print("\(a)")
//}


