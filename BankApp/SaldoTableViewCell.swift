//
//  SaldoTableViewCell.swift
//  BankApp
//
//  Created by luis hector hernandez godinez  on 19/05/22.
//

import UIKit

class SaldoTableViewCell: UITableViewCell {

    @IBOutlet weak var lblSaldo: UILabel!
    @IBOutlet weak var lblDinero: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
