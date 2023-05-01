//
//  Cocktails.swift
//  CocktailMondays
//
//  Created by Marina Andrés Aragón on 12/4/23.
//

import Foundation

// MARK: - Cocktails
struct Cocktails: Decodable {
    let drinks: [Drink]
}

// MARK: - Drink
struct Drink: Decodable {
    let strDrink: String
    let strDrinkThumb: String
    //let idDrink: String
}
