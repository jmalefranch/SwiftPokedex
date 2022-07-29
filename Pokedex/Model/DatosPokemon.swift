//
//  DatosPokemon.swift
//  Pokedex
//
//  Created by Jose on 28/07/2022.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int?
    let name: String?
    let weight: Int?
    let description: String?
    let imageUrl: String?
    let type: String?
    let attack: Int?
    let defense: Int?
    
}

