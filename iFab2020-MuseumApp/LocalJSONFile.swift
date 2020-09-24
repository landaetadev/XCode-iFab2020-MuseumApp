//
//  LocalJSONFile.swift
//  iFab2020-MuseumApp
//
//  Created by Orlando Landaeta on 23/09/2020.
//  Copyright © 2020 Orlando Landaeta. All rights reserved.
//

import Foundation

public func readLocalJsonFile()
{

    guard let letPath = Bundle.main.path(forResource: "JSONLista", ofType: "json") else {return}
    let letURL = URL(fileURLWithPath: letPath)
    
    do
    {
        let letData = try Data(contentsOf: letURL)
        //print("data \n \(letData)")
        let letJSON = try JSONSerialization.jsonObject(with: letData, options: .mutableContainers)
        //print("json \n \(letJSON)")
        
        guard let letArray = letJSON as? [Any] else {return}
        //print("ARRAY \n \(letArray)")
        for user in letArray
        {
            guard let letUserDict = user as? [String:Any]  else {return}
            guard let jsonID = letUserDict["jsonID"] as? Int else {return}
            print("ID: \(jsonID)")
            guard let jsonQRCode = letUserDict["jsonQRCode"] as? String else {return}
            print("QRCode: \(jsonQRCode)")
            guard let jsonWikiURL = letUserDict["jsonWikiURL"] as? String else {return}
            print("WikiURL: \(jsonWikiURL)")
            guard let jsonImageFile = letUserDict["jsonImageFile"] as? String else {return}
            print("ImageFile: \(jsonImageFile)")
            guard let jsonVideoFile = letUserDict["jsonVideoFile"] as? String else {return}
            print("VideoFile: \(jsonVideoFile)")
            
            if jsonQRCode =  letObject.stringValue
            {}
            
            
//            if txtSearch.text!.contains(Name)
//            {
//                lblName.text = Name
//                lblAge.text = String(Age)
//                lblGender.text = Gender
//                lblPet.text = Pets
//            }
        }
        
    }catch{
        print(error)
    }
    
}
