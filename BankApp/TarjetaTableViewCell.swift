//
//  TarjetaTableViewCell.swift
//  BankApp
//
//  Created by luis hector hernandez godinez  on 19/05/22.
//

import UIKit

class TarjetaTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewTarjeta: UIImageView!
    @IBOutlet weak var lblEstadoTarjeta: UIView!
    @IBOutlet weak var lblNumeroTarjeta: UILabel!
    @IBOutlet weak var lblNombreTitular: UILabel!
    @IBOutlet weak var lblTitular: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
