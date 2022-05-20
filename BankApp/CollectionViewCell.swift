//
//  CollectionViewCell.swift
//  BankApp
//
//  Created by luis hector hernandez godinez  on 19/05/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var lblCuenta: UILabel!
    @IBOutlet weak var lblPesos: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
