//
//  Disponibilidade.swift
//  BibSenac
//
//  Created by Natanael Ribeiro on 26/11/16.
//  Copyright © 2016 Edm Senac Projeto IOS. All rights reserved.
//

import Foundation
import SwiftyJSON

class Disponibilidade : NSObject {
    init(JSONData: JSON) {
        super.init()
        

            for (k, v) in JSONData
            {
                if self.responds(to: Selector(k))
                {
                    self.setValue(v.rawValue, forKey: k)
                }
            }

    }
    var local : String?
    var parte : String?
    var disponib : String?
    var localiza: String?
    var dt_empre : String?
    var dt_devol : String?
    var exemplar : String?
    var colecao : String?
}

