//
//  DetailViewController.swift
//  BibSenac
//
//  Created by Natanael Ribeiro on 26/11/16.
//  Copyright © 2016 Edm Senac Projeto IOS. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AvailableTableViewController {
            if segue.identifier == "showAvailable" {
                    destination._senac = acervo._senac
            }
        }
    }

}
