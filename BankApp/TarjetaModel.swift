//
//  TarjetaModel.swift
//  BankApp
//
//  Created by luis hector hernandez godinez  on 19/05/22.
//

import Foundation

// MARK: - Empty
public struct EmptyTarjeta: Decodable {
    public let tarjetas: [Tarjeta]

}

// MARK: - Tarjeta
public struct Tarjeta: Decodable {
    public let tarjeta, nombre: String
    public let saldo: Int
    public let estado, tipo: String
    public let id: Int

}
