//
//  FilaTableViewCell.swift
//  AppDemo
//
//  Created by L85 on 05/12/16.
//  Copyright © 2016 Integra IT. All rights reserved.
//

import UIKit

class FilaTableViewCell: UITableViewCell {

    @IBOutlet weak var lblIzquierda: UILabel!
    @IBOutlet weak var lblDerecha: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
