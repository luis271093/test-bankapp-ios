//
//  User.swift
//  BankApp
//
//  Created by luis hector hernandez godinez  on 19/05/22.
//

import Foundation

// MARK: - Empty
public struct EmptyCuenta: Decodable {
    public let cuenta: [Cuenta]
}

// MARK: - Cuenta
public struct Cuenta: Decodable {
    public let cuenta: Int
    public let nombre, ultimaSesion: String
    public let id: Int

}
