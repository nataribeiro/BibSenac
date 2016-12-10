//
//  DetailViewController.swift
//  BibSenac
//
//  Created by Natanael Ribeiro on 26/11/16.
//  Copyright © 2016 Edm Senac Projeto IOS. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
   
    let api = AvailabilityService()
    var availables = [Disponibilidade]()
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblCoauthor: UILabel!
    @IBOutlet weak var lblPublish: UILabel!
    @IBOutlet weak var imgCollection: UIImageView!
    @IBOutlet weak var lblSummary: UITextView!
    @IBOutlet weak var btnCheckAvailability: UIButton!
    
    var acervo = Acervo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadAcervoDetails()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let name = "BibSenac - \(self.title!)"
        
        let tracker = GAI.sharedInstance().defaultTracker
        tracker?.set(kGAIScreenName, value: name)
        
        let build = (GAIDictionaryBuilder.createScreenView().build() as NSDictionary) as! [AnyHashable: Any]
        tracker?.send(build)
    }
    
    @IBAction func btnAvailability(_ sender: AnyObject){
        btnCheckAvailability.isEnabled = false
        self.getAvailability()
    }
    func getAvailability()
    {
        api.loadData(self.acervo._senac!){ result, error in
            if error == nil {
                self.btnCheckAvailability.isEnabled = true
                print(self.acervo._senac!)
                self.availables = result
                self.performSegue(withIdentifier: "showAvailable", sender: nil)
            } else {
                self.btnCheckAvailability.isEnabled = true
                print(error.debugDescription)
            }
            
        }
     
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if (segue.identifier == "showAvailable") {
            if let svc = segue.destination as? AvailableTableViewController
            {
                svc.availables = self.availables
            }
        }
    }
    
    func loadAcervoDetails() {
        lblTitle.text = acervo.dstaq
        lblAuthor.text = (acervo.aPrin)! + (acervo.aArtg)!
        lblCoauthor.text = acervo.aScdr
        lblPublish.text = acervo.pbcao
        lblSummary.text = acervo.rsumo
        
        
        if let urlImage = URL(string: (acervo.urlImg)!) {
            DispatchQueue.main.async {
                let data = try! Data(contentsOf: urlImage)
                self.imgCollection.image = UIImage(data: data)
            }
        } else {
            imgCollection.image = #imageLiteral(resourceName: "no_image_available")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation


}
