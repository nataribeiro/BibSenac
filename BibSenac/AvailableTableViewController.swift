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
        
        checkAvailableFromServer(idSenac: _senac!) { (availables, error: Error?) in
            if error == nil {
                // get obj
                //self.tableView.reloadData()
                print("deu certo")
                print(availables!)
            } else {
                print(error.debugDescription)
                print("deu Errado")
            }
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Configure the cell...
        
        return cell
    }
    
    
    
    func checkAvailableFromServer(idSenac:String , callback: @escaping( _ availables:[Disponibilidade]?, _ error: Error?) -> () ) {
        
        Alamofire.request(URL_AVAILABLE + idSenac).responseJSON { response in
            let json = JSON(data: response.data!)
            print(json)
            
            for (_, subJSON): (String, JSON) in json {
                let available = Disponibilidade(local: subJSON["local"].string,
                                                parte: subJSON["parte"].string,
                                                disponib: subJSON["disponib"].string,
                                                localiza: subJSON["localiza"].string,
                                                dt_empre: subJSON["dt_empre"].string,
                                                dt_devol: subJSON["dt_devol"].string,
                                                exemplar: subJSON["exemplar"].string,
                                                colecao: subJSON["colecao"].string)
                
                self.availables.append(available)
            }
            callback(self.availables, json.error)
            
        }
        
    }

}
