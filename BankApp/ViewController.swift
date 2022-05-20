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
    @IBOutlet weak var btnAgregarTarjeta: UIButton!
    @IBOutlet weak var tableViewCuenta: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableViewMovimientos: UITableView!

    var cuenta: EmptyCuenta?
    var saldos: [Saldo] = []
    var tarjeta: EmptyTarjeta?
    var movimientos: EmptyMovimientos?


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")

        tableViewCuenta.dataSource = self
        tableViewCuenta.register(UINib(nibName: "TarjetaTableViewCell", bundle: nil), forCellReuseIdentifier: "TarjetaTableViewCell")
        tableViewCuenta.separatorStyle = .none
        tableViewMovimientos.dataSource = self
        tableViewMovimientos.register(UINib(nibName: "MovimientosTableViewCell", bundle: nil), forCellReuseIdentifier: "MovimientosTableViewCell")
        tableViewMovimientos.separatorStyle = .none

        getApiCuenta()
        getSaldos()
    }

    func getApiCuenta(){

        let session = URLSession.shared
        let url = URL(string: "http://bankapp.endcom.mx/api/bankappTest/cuenta")!

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = session.dataTask(with: request) { [self] data, response, error in

            if let data = data {
                do {

                    let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                    print(json!)
                    let decoder = JSONDecoder()
                    let res = try decoder.decode(EmptyCuenta.self, from: data)
                    self.cuenta = res
                    DispatchQueue.main.async {
                        self.lblNombre.text = self.cuenta?.cuenta[0].nombre
                        self.lblFecha.text = self.cuenta?.cuenta[0].ultimaSesion

                    }

                    print(res)
                } catch {

                    print("JSON error: \(error.localizedDescription)")
                }
            }
        }

        task.resume()
    }

    func getSaldos(){
        let session = URLSession.shared
        let url = URL(string: "http://bankapp.endcom.mx/api/bankappTest/saldos")!

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = session.dataTask(with: request) { data, response, error in

            if let data = data {
                do {

                    let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                    print(json!)
                    let decoder = JSONDecoder()
                    let res = try decoder.decode(EmptySaldos.self, from: data)
                    self.saldos = res.saldos
                    self.collectionView.reloadData()

                    print(res)
                } catch {

                    print("JSON error: \(error.localizedDescription)")
                }
            }
        }

        task.resume()

    }

    func getTarjeta(){
        
        let session = URLSession.shared
        let url = URL(string: " http://bankapp.endcom.mx/api/bankappTest/tarjetas")!

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = session.dataTask(with: request) { data, response, error in

            if let data = data {
                do {

                    let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                    print(json!)
                    let decoder = JSONDecoder()
                    let res = try decoder.decode(EmptyTarjeta.self, from: data)
                    self.tarjeta = res

                    print(res)
                } catch {

                    print("JSON error: \(error.localizedDescription)")
                }
            }
        }

        task.resume()
    }

    func getMovimientos(){

        let session = URLSession.shared
        let url = URL(string: "http://bankapp.endcom.mx/api/bankappTest/movimientos")!

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = session.dataTask(with: request) { data, response, error in

            if let data = data {
                do {

                    let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                    print(json!)
                    let decoder = JSONDecoder()
                    let res = try decoder.decode(EmptyMovimientos.self, from: data)
                    self.movimientos = res

                    print(res)
                } catch {

                    print("JSON error: \(error.localizedDescription)")
                }
            }
        }

        task.resume()
    }
    

    @IBAction func btnAgregarTarjeta(_ sender: Any) {

        performSegue(withIdentifier: "segundaPantalla", sender: self)
    }

}
extension ViewController: UITableViewDataSource {


        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            var celda: UITableViewCell!

            if tableView == tableViewCuenta{
                if let cell = tableView.dequeueReusableCell(withIdentifier: "TarjetaTableViewCell") as? TarjetaTableViewCell{
                    celda = cell
                }

            }

            if tableView == tableViewMovimientos{
                let cell = tableView.dequeueReusableCell(withIdentifier: "MovimientosTableViewCell") as! MovimientosTableViewCell

                celda = cell

            }

            return celda

    }
}
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.saldos.count

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        var celda: UICollectionViewCell!
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell{
            if self.saldos.count > 0 {

                cell.lblCuenta.text = String(self.saldos[indexPath.row].cuenta)

                celda = cell

            }

        }
        return celda

    }


}
