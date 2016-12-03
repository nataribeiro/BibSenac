//
//  SearchViewController.swift
//  BibSenac
//
//  Created by Natanael Ribeiro on 26/11/16.
//  Copyright © 2016 Edm Senac Projeto IOS. All rights reserved.
//

import UIKit
fileprivate let api = SearchService()

class SearchViewController: UIViewController {

    @IBOutlet weak var textAssunto: UITextField!
    @IBOutlet weak var textTitulo: UITextField!
    @IBOutlet weak var textAutor: UITextField!
    
    var results: SearchResults = SearchResults()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if (segue.identifier == "showSearchResult") {
            if let svc = segue.destination as? TableViewController
            {
                svc.results = self.results                
            }
            
        }
    }

    @IBAction func btnSearch(_ sender: AnyObject) {
        
        api.loadData(textTitulo.text!, textAutor.text!, textAssunto.text!){ result, error in
            if let error = error
            {
                print(error)
            }
            else
            {
                if result != nil && (result?.livros.count)! > 0 {
                    self.results = result!
                    self.performSegue(withIdentifier: "showSearchResult", sender: sender)
                } else {
                    let alert = UIAlertController(title: "Nenhum resultado encontrado!", message: "Altere os dados da consulta e tente novamente.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                        self.dismiss(animated: true, completion: nil)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
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
