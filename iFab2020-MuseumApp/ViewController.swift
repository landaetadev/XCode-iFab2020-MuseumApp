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
        funcBtnEntrarBorderDesign()
        funcAnimacion()
        navigationController?.navigationBar.isHidden = true
    }
    
    func funcAnimacion ()
    {
        UIImageView.animate(withDuration: 2.0)
        {
            self.imgLogoUPV.center.y += self.view.bounds.width
            self.imgLogoiFab.center.y -= self.view.bounds.width
        }
    }
    
    func funcBtnEntrarBorderDesign ()
    {
        btnLeerQRCodes.layer.backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
        btnLeerQRCodes.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        btnLeerQRCodes.layer.borderWidth = 3
        btnLeerQRCodes.layer.cornerRadius = 10

    }
    
    @IBAction func btnInfoApp(_ sender: Any) {
        //Contenido del mensaje de alerta
        let letMsgInfo = "Aplicación lectora de códigos QR, la app no solicita ni guarda ningún tipo de información personal, se requiere la autorización por parte del usuario para el uso de la cámara del dispositivo mientras la app se encuentre en ejecución. \n" +
            "\n" +
            "Trabajo Final: Especialización en Tecnologías Interactivas - 7ª edición \n" +
            "\n" +
            "Movil App diseñada por: \n" +
            "Orlando Landaeta \n" +
            "\n" +
            "Copyright © 2020"
        //Llamar a funcion de alerta
        let letMsgAlerta = UIAlertController(title: "UPV - iFab - MuseumApp", message: letMsgInfo, preferredStyle: .alert)
        //Boton en el mensaje
        let letBtnOK = UIAlertAction(title: "OK", style: .default, handler: nil)
        letMsgAlerta.addAction(letBtnOK)
        //Activar el mensaje
        self.present(letMsgAlerta, animated: true, completion: nil)
    }
    
}

