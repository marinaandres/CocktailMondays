//
//  Networking.swift
//  CocktailMondays
//
//  Created by Marina Andrés Aragón on 12/4/23.
//

import Foundation
import Alamofire

final class Networking {
    
    let baseURL = "https://www.thecocktaildb.com/api/json/v1/1/"
    let StatusOk = (200...299)
    
    static let shared = Networking()
    
    func searchCocktails(byName name: String, success: @escaping (_ drinks: [Drink])->(), failure: @escaping (_ error: Error?)->()) {
        let url = "\(baseURL)search.php?s=\(name)"
        AF.request(url, method: .get).validate(statusCode: StatusOk).responseDecodable (of: Cocktails.self) { response in
            if let drinks = response.value?.drinks {
                success(drinks)
            } else {
                failure(response.error)
            }
        }
    }
}
