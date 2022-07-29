//
//  CeldaPokemonTableViewCell.swift
//  Pokedex
//
//  Created by Jose on 28/07/2022.
//

import UIKit

class CeldaPokemonTableViewCell: UITableViewCell {


    @IBOutlet weak var nombrePokemon: UILabel!
    @IBOutlet weak var imagenPokemon: UIImageView!
    @IBOutlet weak var tipoPokemon: UILabel!
    @IBOutlet weak var pesoPokemon: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
