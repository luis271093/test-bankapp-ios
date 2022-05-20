//
//  MovimientosModel.swift
//  BankApp
//
//  Created by luis hector hernandez godinez  on 19/05/22.
//

import Foundation

// MARK: - Empty
public struct EmptyMovimientos: Decodable {
    public let movimientos: [Movimiento]

}

// MARK: - Movimiento
public struct Movimiento: Decodable {
    public let fecha, descripcion, monto: String
    public let tipo: Tipo
    public let id: Int

}

public enum Tipo: String, Codable {
    case abono = "abono"
    case cargo = "cargo"
}
