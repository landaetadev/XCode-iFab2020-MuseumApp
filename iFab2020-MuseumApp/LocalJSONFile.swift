//
//  LocalJSONFile.swift
//  iFab2020-MuseumApp
//
//  Created by Orlando Landaeta on 23/09/2020.
//  Copyright © 2020 Orlando Landaeta. All rights reserved.
//

import Foundation

var varCodQRFound :Bool = false
var varScreenPrint :Bool = false
var varJSONID = "", varJSONQRCode = "", varJSONTitle = "", varJSONWikiURL = "", varJSONImageFile = "", varJSONVideoFile = ""


func funcReadLocalJsonFile(varCodQR:String)
{
    //RESETEA BOOLEANOS PARA LA PROXIMA BUSQUEDA EN LOCALJSONFILE
    varCodQRFound = false
    varScreenPrint = false
    //RESETEA BOOLEANOS PARA LA PROXIMA BUSQUEDA EN LOCALJSONFILE

    let letPath = Bundle.main.path(forResource: "JSONLista", ofType: "json")
    let letURL = URL(fileURLWithPath: letPath!)
    
    do
    {

        let letData = try Data(contentsOf: letURL)
        //guard let letArray = letJSON as? [Any] else {return}
        //for user in letArray as! [Any]
        let letJSON = try JSONSerialization.jsonObject(with: letData, options: .mutableContainers)
        for user in letJSON as! [Any]
        {
            guard let letUserDict = user as? [String:Any] else {return}
            guard let jsonID = letUserDict["jsonID"] else {return}
            guard let jsonQRCode = letUserDict["jsonQRCode"] else {return}
            guard let jsonTitle = letUserDict["jsonTitle"] else {return}
            guard let jsonWikiURL = letUserDict["jsonWikiURL"] else {return}
            guard let jsonImageFile = letUserDict["jsonImageFile"] else {return}
            guard let jsonVideoFile = letUserDict["jsonVideoFile"] else {return}
            
            //COMPARACION DE CODIGO QR CON LISTA JSON
            if varCodQR == jsonQRCode as! String && varCodQRFound == false && varScreenPrint == false
            {
                
                    print("QR RECIBIDO: \(varCodQR)")
                    varJSONID = "\(jsonID)"
                    varJSONQRCode = "\(jsonQRCode)"
                    varJSONTitle = "\(jsonTitle)"
                    varJSONWikiURL = "\(jsonWikiURL)"
                    varJSONImageFile = "\(jsonImageFile)"
                    varJSONVideoFile = "\(jsonVideoFile)"
                    funcSendDataToScreen()

                varCodQRFound = true
                varScreenPrint = true
            }
            
        }
        
        if varCodQRFound == false && varScreenPrint == false
        {
            print("El código no fue encontrado")
            varScreenPrint = true
            
        }
        
    }catch{
        print(error)
    }
}

func funcSendDataToScreen()
{
    print("INFORMACION DATOS DESDE LOCALJSONFILE")
    print("ID: \(varJSONID) \n" + "QRCode: \(varJSONQRCode) \n" + "Title: \(varJSONTitle) \n" + "WikiURL: \(varJSONWikiURL) \n" + "ImageFile: \(varJSONImageFile) \n" + "VideoFile: \(varJSONVideoFile)")
}


