//
//  ViewController.swift
//  BankApp
//
//  Created by luis hector hernandez godinez  on 19/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblFecha: UILabel!
    @IBOutlet weak var btnCuenta: UIButton!
    @IBOutlet weak var btnEnviarDinero: UIButton!
    @IBOutlet weak var tableViewSaldo: UITableView!
    @IBOutlet weak var btnAgregarTarjeta: UIButton!
    @IBOutlet weak var tableViewCuenta: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableViewSaldo.dataSource = self
        //tableViewSaldo.delegate = self
        tableViewSaldo.register(UINib(nibName: "SaldoTableViewCell", bundle: nil), forCellReuseIdentifier: "SaldoTableViewCell")
    }


}
extension ViewController: UITableViewDataSource{

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            var  cell = tableView.dequeueReusableCell(withIdentifier: "SaldoTableViewCell", for: indexPath) as? SaldoTableViewCell

            return cell!
    }
}
