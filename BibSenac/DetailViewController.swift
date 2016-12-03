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
    
    var acervo: Acervo = Acervo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadAcervoDetails()
        // Do any additional setup after loading the view.
    }
    
    func getAvailability(_senac: String)
    {
        self._senac = _senac
        
        api.loadData(_senac){ result, error in
            if error == nil {
                self.availables = result
            } else {
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
        let urlImage = URL(string: (acervo.urlImg)!)
        
        DispatchQueue.main.async {
            let data = try! Data(contentsOf: urlImage!)
            self.imgCollection.image = UIImage(data: data)
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
