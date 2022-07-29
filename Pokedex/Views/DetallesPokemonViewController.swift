//
//  DetallesPokemonViewController.swift
//  Pokedex
//
//  Created by Jose on 29/07/2022.
//

import UIKit

class DetallesPokemonViewController: UIViewController {
    
    var pokemonDetalles : Pokemon?

    @IBOutlet weak var nombrePokemon: UILabel!
    @IBOutlet weak var imagenPokemon: UIImageView!
    @IBOutlet weak var descripcionPokemon: UITextView!
    @IBOutlet weak var tipoPokemon: UILabel!
    @IBOutlet weak var ataquePokemon: UILabel!
    @IBOutlet weak var defensaPokemon: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombrePokemon.text =  pokemonDetalles?.name?.uppercased()
        //Imagen a mostrar
        imagenPokemon.loadFrom(URLAdress: pokemonDetalles?.imageUrl ?? "")
        descripcionPokemon.text = pokemonDetalles?.description ?? "nu hay"
        tipoPokemon.text = "Tipo: \(pokemonDetalles?.type ?? "")"
        ataquePokemon.text = "Ataque: \(pokemonDetalles?.attack ?? 0)"
        defensaPokemon.text = "Defensa: \(pokemonDetalles?.defense ?? 0)"
    }
}

extension UIImageView {
    func loadFrom(URLAdress: String) {
        guard let url = URL(string: URLAdress) else {return}
        
        DispatchQueue.main.async { [weak self] in
            if let imagenData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imagenData) {
                    self?.image = loadedImage
                }
            }
        }
    }
}
