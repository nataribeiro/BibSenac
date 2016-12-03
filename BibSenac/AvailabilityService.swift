//
//  AvailabilityService.swift
//  BibSenac
//
//  Created by TIAGO AUGUSTO GRAF on 03/12/16.
//  Copyright © 2016 Edm Senac Projeto IOS. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AvailabilityService: NSObject {

    func getURL(_ senacId: NSString) -> URLConvertible {
        let baseUrl = "http://pelletteria.net.br/edm/modulos/data_mining/mAcervo_disponivel.php" as NSString

        let params = "\(baseUrl)?_senac=\(senacId)"
        
        return params
    }
    
    func loadData(_ senacId:String, _ completion: @escaping (_ result: [Disponibilidade], _ error: NSError?) -> Void) {
        let loadURL = getURL(senacId as NSString)
        Alamofire.request(loadURL).responseJSON { response in
            var ret = [Disponibilidade]()
            let json = JSON(data: response.data!)

            
            for (_, subJSON): (String, JSON) in json {
                let available = Disponibilidade(JSONData: subJSON)
                ret.append(available)
            }
            
            DispatchQueue.main.async {
                completion(ret, nil)
            }
        }

    }
}
