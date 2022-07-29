//
//  searchBar+Extension.swift
//  Pokedex
//
//  Created by Jose on 29/07/2022.
//

import Foundation
import UIKit

extension ListPokemonViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        pokemonFiltrados = []
        
        if searchText == "" {
            pokemonFiltrados = pokemons
        } else {
            for poke in pokemons {
                if poke.name! != nil {
                    if (poke.name!.lowercased().contains(searchText.lowercased())) {
                        pokemonFiltrados.append(poke)
                }
            }
               
            }
        }
        self.pokemonTable.reloadData()
    }
}
