//
//  JSONDataLoader.swift
//  iFab2020-MuseumApp
//
//  Created by Orlando Landaeta on 09/09/2020.
//  Copyright © 2020 Orlando Landaeta. All rights reserved.
//

import Foundation

//    "jsonID"          : "1",
//    "jsonQRCode"      : "NES",
//    "jsonWikiURL"     : "https://en.wikipedia.org/wiki/Nintendo_Entertainment_System",
//    "jsonImageFile"   : "https://i.imgur.com/YrJ7tok.png",
//    "jsonVideoFile"   : null


public class JSONDataLoader
{
    @Published var varJSONDataLoader = [JSONData]()
    
    init() {
        funcLoad()
        //funcsort()
    }
    
    func funcLoad()
    {
        if let letFileLocation = Bundle.main.url(forResource: "JSONLista", withExtension: "json")
        {
            //do catch en caso de error
            do {
                let letData = try Data(contentsOf: letFileLocation)
                let letJSONDecoder = JSONDecoder()
                let letDataFromJSON = try letJSONDecoder.decode([JSONData].self, from: letData)
                self.varJSONDataLoader = letDataFromJSON
            } catch {
                print(error)
            }
        }
    }
    
//    func funcsort()
//    {
//        self.varJSONDataLoader = self.varJSONDataLoader.sorted(by: {$0.varJSONId < $1.varJSONId})
//    }
    
}
