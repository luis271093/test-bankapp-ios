//
//  SaldosModel.swift
//  BankApp
//
//  Created by luis hector hernandez godinez  on 19/05/22.
//

import Foundation

// MARK: - Empty
public struct EmptySaldos: Decodable {
    public let saldos: [Saldo]

}

// MARK: - Saldo
public struct Saldo: Decodable {
    public let cuenta, saldoGeneral, ingresos, gastos: Int
    public let id: Int

}

