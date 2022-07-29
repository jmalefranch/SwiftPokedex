//
//  UITableView+Extension.swift
//  Pokedex
//
//  Created by Jose on 27/07/2022.
//

import Foundation
import UIKit

extension ListPokemonViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemonFiltrados.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = pokemonTable.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! CeldaPokemonTableViewCell
        celda.nombrePokemon.text = (pokemonFiltrados[indexPath.row].name)?.uppercased()
        celda.pesoPokemon.text = "Peso: \(pokemonFiltrados[indexPath.row].weight ?? 0)"
        celda.tipoPokemon.text = "Tipo: \(pokemonFiltrados[indexPath.row].type ?? "")"
        //Celda imagen desde la API
        if let urlString = pokemonFiltrados[indexPath.row].imageUrl {
            if let imagenURL = URL(string: urlString) {
                DispatchQueue.global().async {
                    guard let imagenData = try? Data(contentsOf: imagenURL) else {return}
                    let image = UIImage(data: imagenData)
                    DispatchQueue.main.async {
                        celda.imagenPokemon.image = image
                    }
                }
            }
        }
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pokemonSeleccionado = pokemonFiltrados[indexPath.row]
        performSegue(withIdentifier: "verPokemon", sender: self)
        
        //deseleccionar celda
        pokemonTable.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verPokemon" {
            let verPokemon = segue.destination as! DetallesPokemonViewController
            verPokemon.pokemonDetalles = pokemonSeleccionado
        }
    }
    
}
