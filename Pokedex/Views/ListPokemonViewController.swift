//
//  ViewController.swift
//  Pokedex
//
//  Created by Jose on 27/07/2022.
//

import UIKit

class ListPokemonViewController: UIViewController {

    @IBOutlet weak var pokemonSearchBar: UISearchBar!
    @IBOutlet weak var pokemonTable: UITableView!
    
    //MARK: Variables
    var pokemonManager = PokemonManager()
    var pokemons: [Pokemon] = []
    var pokemonSeleccionado: Pokemon?
    //variable para el searchbar
    var pokemonFiltrados : [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //registrar la celda custom
        pokemonTable.register(UINib(nibName: "CeldaPokemonTableViewCell", bundle: nil), forCellReuseIdentifier: "celda")
        
        pokemonSearchBar.delegate = self
        pokemonTable.delegate = self
        pokemonTable.dataSource = self
        pokemonManager.delegado = self
        
        //ejecutar el metodo para buscar lista de pokemon
        pokemonManager.verPokemon()
        
        pokemonFiltrados = pokemons
    }


}

extension ListPokemonViewController: PokemonManagerDelegado {
    func mostrarListaPokemon(lista: [Pokemon]) {
        pokemons = lista
        DispatchQueue.main.async {
            self.pokemonFiltrados = self.pokemons
            self.pokemonTable.reloadData()
        }
    }
}

