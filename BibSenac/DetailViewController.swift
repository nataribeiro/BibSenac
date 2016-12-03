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
    
    var acervo: Acervo = Acervo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        acervo = Acervo()
        acervo.dstaq = "Título do Acervo"
        acervo.chamd = ""
        acervo.aPrin = "Autor Principal Autor Principal Autor Principal "
        acervo.aArtg = ""
        acervo.aScdr = "Autor Secundário Autor Secundário Autor Secundário "
        acervo.pbcao = "1990"
        acervo.fsico = "255 páginas"
        acervo.rsumo = "Mussum Ipsum, cacilds vidis litro abertis. Praesent vel viverra nisi. Mauris aliquet nunc non turpis scelerisque, eget. Leite de capivaris, leite de mula manquis. Paisis, filhis, espiritis santis. Suco de cevadiss, é um leite divinis, qui tem lupuliz, matis, aguis e fermentis.\nA ordem dos tratores não altera o pão duris Diuretics paradis num copo é motivis de denguis. Nullam volutpat risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio. Mauris nec dolor in eros commodo tempor. Aenean aliquam molestie leo, vitae iaculis nisl."
         acervo.notas = "Adicionais ao Resumo"
         acervo.assun = "Assuntos"
         acervo.url = "http://www.test-study-guides.com/wp-content/uploads/2013/03/Best-TOEFL-Books9.png"
        
        loadAcervoDetails()
        // Do any additional setup after loading the view.
    }
    
    func loadAcervoDetails() {
        lblTitle.text = acervo.dstaq
        lblAuthor.text = (acervo.aPrin)! + (acervo.aArtg)!
        lblCoauthor.text = acervo.aScdr
        lblPublish.text = acervo.pbcao
        lblSummary.text = acervo.rsumo
        let urlImage = URL(string: (acervo.url)!)
        
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
