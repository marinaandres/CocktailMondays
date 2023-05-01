//
//  ViewController.swift
//  CocktailMondays
//
//  Created by Marina Andrés Aragón on 11/4/23.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = ""
        
    }
    
    @IBAction func searchButtonAction(_ sender: Any) {
        guard let searchText = textField.text, !searchText.isEmpty else {
            // mostrar una alerta que diga que el campo de búsqueda está vacío
            return
        }
        
        Networking.shared.searchCocktails(byName: searchText, success: { drinks in
            if let firstDrink = drinks.first {
                self.nameLabel.text = firstDrink.strDrink
                self.textField.text = ""
                
                if let imageURL = URL(string: firstDrink.strDrinkThumb) {
                    self.imageLabel.kf.setImage(with: imageURL)
                    self.imageLabel.isHidden = false
                }
            } else {
                let alert = UIAlertController(title: "Error", message: "No tenemos registrado este Cocktail", preferredStyle: .alert)
                let button = UIAlertAction(title: "OK", style: .default)
                alert.addAction(button)
                self.present(alert, animated: true, completion: nil)
            }
        }, failure: { error in
            let alert = UIAlertController(title: "Error", message: "Hubo un error de red. Por favor, intenta de nuevo más tarde.", preferredStyle: .alert)
            let button = UIAlertAction(title: "OK", style: .default)
            alert.addAction(button)
            self.present(alert, animated: true, completion: nil)
        })
    }
}
