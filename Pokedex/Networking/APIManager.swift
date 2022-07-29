//
//  APIManager.swift
//  Pokedex
//
//  Created by Jose on 28/07/2022.
//

import Foundation
import UIKit

protocol PokemonManagerDelegado {
    func mostrarListaPokemon (lista: [Pokemon])
}

struct PokemonManager {
    var delegado: PokemonManagerDelegado?
    
    func verPokemon() {
        let urlString = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) {datos, respuesta, error in
                    if error != nil {
                        print("Error al obtener datos de la API: ", error?.localizedDescription)
                    }
                //MARK: Elimina el "null", que es lo primero que devuelve la API.
                    if let datosSeguros = datos?.parseData(eliminarString: "null,") {
                        if let listaPokemon = self.parsearJSON(datosPokemon : datosSeguros) {
                            print("Lista pokemon: ", listaPokemon)
                            
                            delegado?.mostrarListaPokemon(lista: listaPokemon)
                        }
                    }
            }
            task .resume()
        }
    }
    
    func parsearJSON(datosPokemon: Data) -> [Pokemon]? {
        let decodificador = JSONDecoder()
        do{
            let datosDecodificados = try decodificador.decode([Pokemon].self, from: datosPokemon)
            return datosDecodificados
        }catch{
            print("Error al decodificar los datos: ", error.localizedDescription)
            return nil
        }
    }
}

extension Data{
    func parseData(eliminarString palabra: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: palabra, with: "")
        guard let data = parseDataString?.data(using: .utf8) else { return nil}
        return data
    }
}
