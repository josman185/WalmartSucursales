//
//  SucursalesTableViewController.swift
//  Walmart Mobile
//
//  Created by Jose Vargas on 27/03/20.
//  Copyright © 2020 joscompany. All rights reserved.
//

import UIKit

class SucursalesTableViewController: UIViewController {

    struct SucursalesConstants {
        static let sucursalCell = "sucursalCell"
    }
    
    // MARK: - Properties
    var sucursalesTableView = UITableView()
    var sucursalViewModels: [SucursalViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sucursales Walmart"
        configureTableView()
        fetchSucursales()
    }
    
    // MARK: - TableViewConfig
    func configureTableView() {
        view.addSubview(sucursalesTableView)
        setTableViewDelegates()
        sucursalesTableView.rowHeight = 100
        sucursalesTableView.register(SucursalCell.self, forCellReuseIdentifier: SucursalesConstants.sucursalCell)
        sucursalesTableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        sucursalesTableView.delegate = self
        sucursalesTableView.dataSource = self
    }
    
    // MARK: - FetchData
    func fetchSucursales() {
        CustomActivityIndicator.start()
        NetworkingManager.shared.fetchSucursales { (result: Result<[Sucursal], NetworkingManager.APIServiceError>) in
            switch result {
            case .success(let tienda):
                self.sucursalViewModels = tienda.map({ return SucursalViewModel(sucursal: $0) })
                DispatchQueue.main.async {
                    self.sucursalesTableView.reloadData()
                    CustomActivityIndicator.stop()
                }
            case .failure(let error):
                print(error.localizedDescription)
                CustomActivityIndicator.stop()
            }
        }
    }
    
    func showSucursalDetail(_ sucursal: SucursalViewModel) {
        let detailVC = SucursalDetailViewController()
        detailVC.sucursalViewModel = sucursal
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - TableViewDelegate
extension SucursalesTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sucursalViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SucursalesConstants.sucursalCell) as? SucursalCell else { return UITableViewCell() }
        let sucursalViewModel = sucursalViewModels[indexPath.row]
        cell.sucursalViewModel = sucursalViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sucursal = self.sucursalViewModels[indexPath.row]
        showSucursalDetail(sucursal)
    }
}
