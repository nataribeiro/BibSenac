//
//  SearchService.swift
//  BibSenac
//
//  Created by TIAGO AUGUSTO GRAF on 26/11/16.
//  Copyright © 2016 Edm Senac Projeto IOS. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SearchService : NSObject
{
    func getURL(_ titulo: NSString, _ autor:NSString,_ assunto:NSString) -> URLConvertible {
        let baseUrl = "http://pelletteria.net.br/edm/modulos/banco/webservice/package/ctrl/CtrlObj.php?method=get_acervo" as NSString
        
        let encodedTitulo = titulo
        let encodedAutor = autor
        let encodedAssunto = assunto
        let params = "\(baseUrl)&titulo=\(encodedTitulo)&autor=\(encodedAutor)&assunto=\(encodedAssunto)"
        
        return params
    }
    
    func loadData(_ titulo:String, _ autor:String,_ assunto:String, _ completion: @escaping (_ result: SearchResults?, _ error: NSError?) -> Void) {
        let loadURL = getURL(titulo as NSString, autor as NSString, assunto as NSString)
        //let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: loadURL as URL)
        Alamofire.request(loadURL).responseJSON { response in
            let json = JSON(data: response.data!)
            
            let i = SearchResults(JSONData: json)
            DispatchQueue.main.async {
                completion(i, nil)
            }
        }
    }
    
}
