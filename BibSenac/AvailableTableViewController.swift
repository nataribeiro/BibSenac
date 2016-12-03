//
//  AvailableTableViewController.swift
//  BibSenac
//
//  Created by Natanael Ribeiro on 26/11/16.
//  Copyright © 2016 Edm Senac Projeto IOS. All rights reserved.
//
import UIKit
import Alamofire
import SwiftyJSON

class AvailableTableViewController: UITableViewController {
    
    var _senac:String?
    let URL_AVAILABLE = "http://pelletteria.net.br/edm/modulos/data_mining/mAcervo_disponivel.php?_senac="
    var availables = [Disponibilidade]()
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return availables.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let available = availables[indexPath.row]
        cell.textLabel?.text = available.disponib
        cell.detailTextLabel?.text = available.local
        return cell
    }
    
 }
