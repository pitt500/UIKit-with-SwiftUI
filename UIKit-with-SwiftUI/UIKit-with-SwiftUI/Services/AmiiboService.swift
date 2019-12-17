//
//  AmiiboService.swift
//  UIKit-with-SwiftUI
//
//  Created by projas on 12/16/19.
//  Copyright © 2019 projas. All rights reserved.
//

import Foundation

enum ServiceError: Error {
  case networkError
  case invalidFormat
}

class AmiiboService {
  private let baseUrl = "https://www.amiiboapi.com/api/amiibo/"
  
  func getSmashAmiibos(completion: @escaping ([Amiibo]) -> Void, errorHandler: @escaping (Error?) -> Void) {
    guard var parametersUrl = URLComponents(string: baseUrl) else {
      fatalError("Invalid URL")
    }
    parametersUrl.queryItems = [URLQueryItem(name: "amiiboSeries", value: "Super Smash Bros.")]
    
    guard let url = parametersUrl.url else {
      fatalError("Invalid URL")
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      
      if let error = error {
        DispatchQueue.main.async {
          errorHandler(error)
        }
        return
      }
      
      guard let data = data, let amiiboList = try? JSONDecoder().decode([Amiibo].self, from: data)  else {
        DispatchQueue.main.async {
          errorHandler(ServiceError.invalidFormat)
        }
        return
      }
    
      DispatchQueue.main.async {
        completion(amiiboList)
      }
      
    }.resume()
  }
}
