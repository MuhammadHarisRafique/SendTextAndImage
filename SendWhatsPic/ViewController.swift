//
//  ViewController.swift
//  SendWhatsPic
//
//  Created by Higher Visibility on 27/05/2017.
//  Copyright © 2017 HigherVisibility. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var docs = UIDocumentInteractionController()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnPressed(_ sender: UIButton) {
        
        self.sendPicWhatsup()

        //self.senbyActivity()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
        
    }

    func senbyActivity(){
        let shareText = "Hello, world!"
        
        if let image = UIImage(named: "image.png") {
        
            let vc = UIActivityViewController(activityItems: [shareText, image], applicationActivities: [])
            self.present(vc, animated: true, completion: nil)
        }
    
    }
    func sendPicWhatsup(){

    let urlWhats = "whatsapp://app"
        
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed){
        
            if let whatsupURL = URL(string: urlString){
            
                if UIApplication.shared.canOpenURL(whatsupURL){
                
                    if let image = UIImage(named: "image.png"){
                    
                       if let imageData = UIImagePNGRepresentation(image)
                        
                       {
                          let tempfile = URL(fileURLWithPath: NSHomeDirectory()).appendingPathComponent("Documents/whatAppTmp.wai")
                        do{
                        
                            try imageData.write(to: tempfile, options: .atomicWrite)
                            self.docs = UIDocumentInteractionController(url: tempfile)
                            self.docs.uti = "net.whatsapp.iamge"
                            self.docs.presentOpenInMenu(from: CGRect.zero, in: self.view, animated: true)
                            
                            
                        
                        }catch let error {
                        
                        print(error)
                        }
                        
                        
                        }
                    
                    }
                    
                
                
                }
            
            
            }
            
            
        
        }
        
        
    
    }
}

