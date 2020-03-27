//
//  Sucursal.swift
//  Walmart Mobile
//
//  Created by Jose Vargas on 27/03/20.
//  Copyright © 2020 joscompany. All rights reserved.
//

import Foundation

struct jsonTiendas: Decodable {
    let responseArray: [Sucursal]
}

struct Sucursal: Decodable {
    let storeID: String
    let name: String
    let address: String
    let telephone: String
    let manager: String
    let zipCode: String
    let latSpan: String
    let latPoint: String
    let lonPoint: String
    let opens: String
}
