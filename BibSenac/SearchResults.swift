//
//  SearchResults.swift
//  BibSenac
//
//  Created by TIAGO AUGUSTO GRAF on 26/11/16.
//  Copyright © 2016 Edm Senac Projeto IOS. All rights reserved.
//

import UIKit

class SearchResults : NSObject {

    var isThereMore: Bool = false
    var livros: [Acervo] = []
    
    init(JSONData: Data) {
        super.init()
        
        do{
            let options = JSONSerialization.ReadingOptions.allowFragments
            let dict: NSDictionary = try JSONSerialization.jsonObject(with: JSONData, options: options) as! NSDictionary
        
            self.isThereMore = dict["isThereMore"] as! Bool
            
            let livros = dict["livros"] as! NSArray
            // Loop
            for (value) in livros
            {
                let item = Acervo(dict: value as! NSDictionary)
                self.livros.append(item)
            }
            // Or you can do it with using
            //self.setValuesForKeys(dict)
            // instead of loop method above
        } catch {
            print(error)
        }
    }
}
