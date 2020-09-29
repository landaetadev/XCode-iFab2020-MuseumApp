//
//  ReadQRViewController.swift
//  iFab2020-MuseumApp
//
//  Created by Orlando Landaeta on 26/08/2020.
//  Copyright © 2020 Orlando Landaeta. All rights reserved.
//

import UIKit
import AVFoundation

class ReadQRViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate
{
    
    @IBOutlet weak var imgReadQRCode: UIImageView!
    
    var varVideo = AVCaptureVideoPreviewLayer()
    
    //Creando Sesion de captura de video
    let letSession = AVCaptureSession()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //BackButton Hide
        navigationItem.hidesBackButton = true
        
        //Marco en la pantalla
        imgReadQRCode.layer.borderColor = UIColor.lightGray.cgColor
        imgReadQRCode.layer.borderWidth = 10
        imgReadQRCode.layer.cornerRadius = 20

        
        //Define capture device
        //position: .back => camara trasera
        //position: .front => camara frontal
        guard
            let letCaptureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: AVMediaType.video, position: .back)
            else
        {
                //EN CASO DE QUE NO SE DETECTE CAMARA EN EL DIPOSITIVO
            print("LA CAMARA NO HA SIDO DETECTADA")
                let letAlertaCam = UIAlertController(title: "ERROR", message: "No se detecta camara en el dispositivo", preferredStyle: .alert)
                //Boton en el mensaje
                letAlertaCam.addAction(UIAlertAction(title: "OK", style: .default, handler: { (nil) in
                    //Al no detectar camara regresa a la pantalla anterior - Click en OK
                    self.navigationController?.popViewController(animated: true)
                    self.dismiss(animated: true, completion: nil)
                }))
                //Activar el mensaje
                self.present(letAlertaCam, animated: true, completion: nil)
                return
        }
        
        do{
            let letInput = try AVCaptureDeviceInput(device: letCaptureDevice)
            letSession.addInput(letInput)
        }catch{
            print ("ERROR - Tu dipositivo no puede dar video")
        }
        
        let letOutput = AVCaptureMetadataOutput()
        letSession.addOutput(letOutput)
        
        //Activar la deteccion de codigos QR a traves de la camara
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
                    print("LA CAMARA FUNCIONA, EL CODIGO DICE: \(letObject.stringValue!)")
                    let letCodeQRDetectado = letObject.stringValue!
                    //PASAR INFORMACION LEIDA EN EL QR A LOCALJSON
                    readLocalJsonFile(varCodQR: letCodeQRDetectado)
                    
                    // Activar la pantalla de contenido al encontrar QR => CameraVC -> ContenidoVC
                    if varCodQRFound == true
                    {
                    let letStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let letTabBarController = letStoryboard.instantiateViewController(withIdentifier: "ContenidoVC")
                    letTabBarController.modalPresentationStyle = .fullScreen
                    self.present(letTabBarController, animated: true, completion: nil)
                        
                        //DETIENE LA SESION DE LA CAMARA PARA EVITAR LEER QR'S MIENTRAS SE VISITA EL TAB BAR
                        //LA CAMARA SE REACTIVA AL REGRESAR A LA PANTALLA MUSEUMAPP
                        letSession.stopRunning()
                    } 
                    
                }
            }
        }
    }

}
