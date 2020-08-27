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

        //Creando Sesion
        let session = AVCaptureSession()
        //Define capture device
        //position: .back => camara trasera
        //position: .front => camara frontal
        let letCaptureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: AVMediaType.video, position: .back)!
        
        do{
            let letInput = try AVCaptureDeviceInput(device: letCaptureDevice)
            session.addInput(letInput)
        }catch{
            print ("ERROR - DEVICE NO DEFINED")
        }
        
        let letOutput = AVCaptureMetadataOutput()
        session.addOutput(letOutput)
        
        letOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        letOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        varVideo = AVCaptureVideoPreviewLayer(session: session)
        varVideo.frame = view.layer.bounds
        view.layer.addSublayer(varVideo)
        
        //Presentar ImageView para leer el codigo
        self.view.bringSubviewToFront(imgReadQRCode)
        
        session.startRunning()
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        if metadataObjects.count != 0
        {
            if let letObject = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
            {
                if letObject.type == AVMetadataObject.ObjectType.qr
                {
                    let msgAlert = UIAlertController(title: "QR Code", message: letObject.stringValue, preferredStyle: .alert)
                    msgAlert.addAction(UIAlertAction(title: "Retake", style: .default, handler: nil))
                    msgAlert.addAction(UIAlertAction(title: "Copy", style: .default, handler: { (nil) in
                        UIPasteboard.general.string = letObject.stringValue
                    }))
                    
                    present(msgAlert, animated: true, completion: nil)
                }
                
            }
        }
    }

 

}
