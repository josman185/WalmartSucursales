//
//  SucursalCell.swift
//  Walmart Mobile
//
//  Created by Jose Vargas on 27/03/20.
//  Copyright © 2020 joscompany. All rights reserved.
//

import UIKit

class SucursalCell: UITableViewCell {

    // MARK: - Properties
    var nombreSucursalLabel = UILabel()
    var addressLabel = UILabel()
    
    var sucursalViewModel: SucursalViewModel? {
        didSet {
            nombreSucursalLabel.text = sucursalViewModel?.name
            addressLabel.text = sucursalViewModel?.address
        }
    }
    
    // MARK: - InitMethods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(nombreSucursalLabel)
        addSubview(addressLabel)
        configureNombreSucursalLabel()
        configureAddressLabel()
        setNombreSucursalConstraints()
        setAddressLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ConfigureUI
    func configureNombreSucursalLabel() {
        nombreSucursalLabel.numberOfLines = 0
        nombreSucursalLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        nombreSucursalLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configureAddressLabel() {
        addressLabel.numberOfLines = 0
        addressLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        addressLabel.adjustsFontSizeToFitWidth = true
    }
    
    // MARK: - Constraints
    func setNombreSucursalConstraints() {
        nombreSucursalLabel.translatesAutoresizingMaskIntoConstraints = false
        nombreSucursalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        nombreSucursalLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        nombreSucursalLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        nombreSucursalLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
    }
    
    func setAddressLabelConstraints() {
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        addressLabel.topAnchor.constraint(equalTo: nombreSucursalLabel.bottomAnchor, constant: 0).isActive = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
