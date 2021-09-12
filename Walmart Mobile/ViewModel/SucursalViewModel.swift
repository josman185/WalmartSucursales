//
//  SucursalViewModel.swift
//  Walmart Mobile
//
//  Created by Jose Vargas on 27/03/20.
//  Copyright © 2020 joscompany. All rights reserved.
//

import Foundation

struct SucursalViewModel {
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
    
    init(sucursal: Sucursal) {
        self.storeID = sucursal.storeID
        self.name = sucursal.name
        self.address = sucursal.address
        self.telephone = sucursal.telephone
        self.manager = sucursal.manager
        self.zipCode = sucursal.zipCode
        self.latSpan = sucursal.latSpan
        self.latPoint = sucursal.latPoint
        self.lonPoint = sucursal.lonPoint
        self.opens = sucursal.opens
    }
}
