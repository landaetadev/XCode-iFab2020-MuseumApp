//
//  JSONData.swift
//  iFab2020-MuseumApp
//
//  Created by Orlando Landaeta on 09/09/2020.
//  Copyright © 2020 Orlando Landaeta. All rights reserved.
//

import Foundation

//{
//    "jsonID"          : 1,
//    "jsonQRCode"      : "NES",
//    "jsonWikiURL"     : "https://en.wikipedia.org/wiki/Nintendo_Entertainment_System",
//    "jsonImageFile"   : "https://i.imgur.com/YrJ7tok.png",
//    "jsonVideoFile"   : null
//},

struct JSONData : Codable
{
    //Las var deben tener el mismo nombre que los campos del JSON
    var jsonID: Int
    var jsonQRCode: String
    var jsonWikiURL: String
    var jsonImageFile: String
    var jsonVideoFile: String
}
