//
//  CurrencyService.swift
//  testBasket
//
//  Created by Piotr Furmanski on 29/04/2019.
//  Copyright © 2019 Piotr Furmanski. All rights reserved.
//

import Foundation

protocol CurrencyServiceProtocol: class {
    func loadCurrencyRates(completion: @escaping (_ currencyPairs: CurrencyPairs?, _ error: Error?) -> ())
}

class CurrencyService: CurrencyServiceProtocol {
    
    private struct Constant {
        static let accesKey = "a23267780d72bb4bf4da78d79eb3d80e"
    }
    
    func loadCurrencyRates(completion: @escaping (_ currencyPairs: CurrencyPairs?, _ error: Error?) -> ()) {
        let apiUrlStr = "http://apilayer.net/api/live?access_key=\(Constant.accesKey)&currencies=EUR,GBP,CAD,PLN&source=USD&format=1"
        guard let url = URL(string: apiUrlStr) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            self?.handleResponse(data: data, response: response, error: error, completion: completion)
        }
        task.resume()
    }
    
    func handleResponse(data: Data?, response: URLResponse?, error: Error?,
                        completion: @escaping (_ currencyPairs: CurrencyPairs?, _ error: Error?) -> ()) {
        guard error == nil else {
            completion(nil, error)
            return
        }

        guard let data = data else {
            completion(nil, nil)
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let currencyPairs = try decoder.decode(CurrencyPairs.self, from: data)
            completion(currencyPairs, nil)
        } catch let error {
            completion(nil, error)
        }
    }
}
