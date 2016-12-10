//
//  SearchViewController.swift
//  BibSenac
//
//  Created by Natanael Ribeiro on 26/11/16.
//  Copyright © 2016 Edm Senac Projeto IOS. All rights reserved.
//

import UIKit
import Google.Analytics

fileprivate let api = SearchService()

class SearchViewController: UIViewController {

    @IBOutlet weak var textAssunto: UITextField!
    @IBOutlet weak var textTitulo: UITextField!
    @IBOutlet weak var textAutor: UITextField!
    @IBOutlet weak var outletSearch: UIButton!
    
    var results: SearchResults = SearchResults()
    override func viewDidLoad() {
        super.viewDidLoad()

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
        let tracker = GAI.sharedInstance().defaultTracker
        
        let all = "\(textTitulo.text!) ; \(textAutor.text!) ; \(textAssunto.text!)"
        let event = (GAIDictionaryBuilder.createEvent(withCategory: "Search", action: "All", label: all, value: nil).build() as NSDictionary) as! [AnyHashable: Any]
        tracker?.send(event)
        
        if let title = textTitulo.text {
            if !title.isEmpty {
                let event2 = (GAIDictionaryBuilder.createEvent(withCategory: "Search", action: "Title", label: title, value: nil).build() as NSDictionary) as! [AnyHashable: Any]
                tracker?.send(event2)
            }
        }
        if let author = textAutor.text {
            if !author.isEmpty {
                let event2 = (GAIDictionaryBuilder.createEvent(withCategory: "Search", action: "Author", label: author, value: nil).build() as NSDictionary) as! [AnyHashable: Any]
                tracker?.send(event2)
            }
        }
        if let subject = textAssunto.text {
            if !subject.isEmpty {
                let event2 = (GAIDictionaryBuilder.createEvent(withCategory: "Search", action: "Subject", label: subject, value: nil).build() as NSDictionary) as! [AnyHashable: Any]
                tracker?.send(event2)
            }
        }
        
        
        
       
        
        
        
        outletSearch.isEnabled = false
        api.loadData(textTitulo.text!, textAutor.text!, textAssunto.text!){ result, error in
            if let error = error
            {
                print(error)
                self.outletSearch.isEnabled = true
            }
            else
            {
                self.outletSearch.isEnabled = true
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
