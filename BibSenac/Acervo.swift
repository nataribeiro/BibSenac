//
//  Acervo.swift
//  BibSenac
//
//  Created by Natanael Ribeiro on 26/11/16.
//  Copyright © 2016 Edm Senac Projeto IOS. All rights reserved.
//

import Foundation

class Acervo : NSObject {
    override init() {
        super.init()
    }
    init(dict: NSDictionary) {
        super.init()
        
        for (k, v) in dict
        {
            let key = k as! String
            if self.responds(to: Selector(key))
            {
                self.setValue(v, forKey: key)
            }
        }
        
    }
    var _id: String? = ""
    var _senac: String? = ""
    var dstaq: String? = ""
    var chamd: String? = ""
    var aPrin : String? = ""
    var aArtg : String? = ""
    var aScdr : String? = ""
    var pbcao : String? = ""
    var fsico : String? = ""
    var rsumo : String? = ""
    var notas : String? = ""
    var assun : String? = ""
    var urlImg : String? = ""
    var urlPdf : String? = ""
    var urlLink : String? = ""
    var pdico : String? = ""
    var serie : String? = ""
    var adicionado : String? = ""
}
