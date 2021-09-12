//
//  SucursalDetail.swift
//  Walmart Mobile
//
//  Created by Jose Vargas on 27/03/20.
//  Copyright © 2020 joscompany. All rights reserved.
//

import UIKit

class SucursalDetail: UIView {
    
    // MARK: - Properties
    let nameSucursalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .thin)
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    let telephoneLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    let managerLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    // MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setSubViews()
        self.setConstraints()
    }
    
    func set(detail: SucursalViewModel?) {
        nameSucursalLabel.text = detail?.name
        addressLabel.text = detail?.address
        telephoneLabel.text = detail?.telephone
        managerLabel.text = detail?.manager
    }
    
    // MARK: - setUI
    fileprivate func setSubViews() {
        self.backgroundColor = .white
        self.addSubview(nameSucursalLabel)
        self.addSubview(addressLabel)
        self.addSubview(telephoneLabel)
        self.addSubview(managerLabel)
    }
    
    fileprivate func setConstraints() {
        self.setnameLabelConstrainst()
        self.setAddressLabelConstraints()
        self.setTelephoneLabelConstraints()
        self.setManagerLabelConstraints()
    }
    
    // MARK: - Constraints
    fileprivate func setnameLabelConstrainst() {
        nameSucursalLabel.translatesAutoresizingMaskIntoConstraints = false
        nameSucursalLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        nameSucursalLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        nameSucursalLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        nameSucursalLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    fileprivate func setAddressLabelConstraints() {
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.topAnchor.constraint(equalTo: self.nameSucursalLabel.bottomAnchor, constant: 15).isActive = true
        addressLabel.leftAnchor.constraint(equalTo: self.nameSucursalLabel.leftAnchor, constant: 0).isActive = true
        addressLabel.rightAnchor.constraint(equalTo: self.nameSucursalLabel.rightAnchor, constant: 0).isActive = true
    }
    
    fileprivate func setTelephoneLabelConstraints() {
        telephoneLabel.translatesAutoresizingMaskIntoConstraints = false
        telephoneLabel.topAnchor.constraint(equalTo: self.addressLabel.bottomAnchor, constant: 15).isActive = true
        telephoneLabel.leftAnchor.constraint(equalTo: self.nameSucursalLabel.leftAnchor, constant: 0).isActive = true
        telephoneLabel.rightAnchor.constraint(equalTo: self.nameSucursalLabel.rightAnchor, constant: 0).isActive = true
    }
    
    fileprivate func setManagerLabelConstraints() {
        managerLabel.translatesAutoresizingMaskIntoConstraints = false
        managerLabel.topAnchor.constraint(equalTo: self.telephoneLabel.bottomAnchor, constant: 15).isActive = true
        managerLabel.leftAnchor.constraint(equalTo: self.nameSucursalLabel.leftAnchor, constant: 0).isActive = true
        managerLabel.rightAnchor.constraint(equalTo: self.nameSucursalLabel.rightAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}
