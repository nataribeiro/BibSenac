//
//  SearchResults.swift
//  BibSenac
//
//  Created by TIAGO AUGUSTO GRAF on 26/11/16.
//  Copyright © 2016 Edm Senac Projeto IOS. All rights reserved.
//

import UIKit
import SwiftyJSON

class SearchResults : NSObject {

    var isThereMore: Bool = false
    var livros: [Acervo] = []
    override init() {}
    init(JSONData: JSON) {
        super.init()
        
            self.isThereMore = JSONData["isThereMore"] == "true"
            
            let livros = JSONData["livros"]
            // Loop
            for (value) in livros
            {
                let item = Acervo(dict: value.1)
                self.livros.append(item)
            }

    }
}
