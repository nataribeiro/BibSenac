//
//  SearchService.swift
//  BibSenac
//
//  Created by TIAGO AUGUSTO GRAF on 26/11/16.
//  Copyright © 2016 Edm Senac Projeto IOS. All rights reserved.
//

import UIKit

class SearchService : NSObject
{
    func getURL(_ titulo: String, _ autor:String,_ assunto:String) -> NSURL? {
        let baseUrl = "http://pelletteria.net.br/edm/modulos/banco/webservice/package/ctrl/CtrlObj.php?method=get_acervo"
        
        let requestURL = NSURL(string: (baseUrl+"&titulo="+titulo+"&autor="+autor+"&assunto="+assunto).addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics)!)
        
        return requestURL
    }
    
    func loadData(_ titulo:String, _ autor:String,_ assunto:String, _ completion: @escaping (_ result: SearchResults?, _ error: NSError?) -> Void) {
        guard let loadURL = getURL(titulo, autor, assunto) else {
            DispatchQueue.main.async {
                completion(nil, nil)
            }
            return
        }
        
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: loadURL as URL)
        let session = URLSession.shared
        session.dataTask(with: urlRequest as URLRequest, completionHandler: { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completion(nil, error as NSError?)
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, nil)
                }
                return
            }
            
            let i = SearchResults(JSONData: data)
            DispatchQueue.main.async {
                completion(i, nil)
            }
        }).resume()
    }
    
}
