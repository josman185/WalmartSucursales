//
//  SucursalDetailViewController.swift
//  Walmart Mobile
//
//  Created by Jose Vargas on 27/03/20.
//  Copyright © 2020 joscompany. All rights reserved.
//

import UIKit

class SucursalDetailViewController: UIViewController {
    
    // MARK: - Properties
    var detailView: SucursalDetail? { return view as? SucursalDetail }
    var sucursalViewModel: SucursalViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSucursalDetail()
    }
    
    // MARK: - SetDetailData
    func setSucursalDetail() {
        self.view = SucursalDetail(frame: UIScreen.main.bounds)
        detailView?.set(detail: sucursalViewModel)
    }
}
