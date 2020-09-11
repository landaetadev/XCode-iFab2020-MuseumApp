//
//  ReadQRViewController.swift
//  iFab2020-MuseumApp
//
//  Created by Orlando Landaeta on 26/08/2020.
//  Copyright © 2020 Orlando Landaeta. All rights reserved.
//

import UIKit
import AVFoundation

class ReadQRViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    
    @IBOutlet weak var imgReadQRCode: UIImageView!
    
    var varVideo = AVCaptureVideoPreviewLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Color de fuente en la barra superior
        //navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        //BackButton Hide
        navigationItem.hidesBackButton = true
        
        //Cuadro en la pantalla
        funcSquareCamBorderDesign()

        //Creando Sesion
        let letSession = AVCaptureSession()
        //Define capture device
        //position: .back => camara trasera
        //position: .front => camara frontal
        guard
            let letCaptureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: AVMediaType.video, position: .back)
            else {
                //EN CASO DE QUE NO SE DETECTE CAMARA EN EL DIPOSITIVO
                print("ERROR - Your device is not aplicable for video precessing")
                let letAlertaCam = UIAlertController(title: "ERROR", message: "No se detecta camara en el dispositivo", preferredStyle: .alert)
                
                //Boton en el mensaje
                letAlertaCam.addAction(UIAlertAction(title: "OK", style: .default, handler: { (nil) in
                    //Al no detectar camara regresa a la pantalla anterior
                    print("LA CAMARA NO FUNCIONA")
                    self.funcBackPortada()
                }))
                
                //Activar el mensaje
                self.present(letAlertaCam, animated: true, completion: nil)
                return
        }
        
        do{
            let letInput = try AVCaptureDeviceInput(device: letCaptureDevice)
            letSession.addInput(letInput)
        }catch{
            print ("ERROR - Your device can not give video")
        }
        
        let letOutput = AVCaptureMetadataOutput()
        letSession.addOutput(letOutput)
        
        letOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        letOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        varVideo = AVCaptureVideoPreviewLayer(session: letSession)
        varVideo.frame = view.layer.bounds
        varVideo.videoGravity = .resize
        view.layer.addSublayer(varVideo)
        
        //Presentar ImageView para leer el codigo
        self.view.bringSubviewToFront(imgReadQRCode)
        
        letSession.startRunning()
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection)
    {
        
        if metadataObjects.count != 0
        {
            if let letObject = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
            {
                if letObject.type == AVMetadataObject.ObjectType.qr
                {
                    // Pasar a la pantalla de contenido al leer QR => CameraVC -> ContenidoVC
                    let letStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let letTabBarController = letStoryboard.instantiateViewController(identifier: "ContenidoVC")
                    letTabBarController.modalPresentationStyle = .fullScreen
                    self.present(letTabBarController, animated: true, completion: nil)
                    print("LA CAMARA FUNCIONA, EL CODIGO DICE: \(letObject.stringValue!)")
                    
                    //INFORMACION JSON
                    print("INFORMACION JSON")
                    let letDataJSON = JSONDataLoader().varJSONDataLoader
                    print (letDataJSON)
                }
            }
        }
    }
    
    func funcSquareCamBorderDesign ()
    {
        imgReadQRCode.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        imgReadQRCode.layer.borderWidth = 10
        imgReadQRCode.layer.cornerRadius = 20
    }
    
    func funcBackPortada()
    { //ContenidoVC -> CameraVC
        self.navigationController?.popViewController(animated: true)
    }

}
