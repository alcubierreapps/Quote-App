//
//  QuoteViewModel.swift
//  Quotes Test
//
//  Created by Alcubierre Holdings Inc. on 2022-01-11.
//

import Foundation
import SwiftUI

class QuoteModel: ObservableObject {
    
    @Published var quotes = [Quote]()
    
    init() {
        // Get authors from local JSON
        self.quotes = getLocalJson()
    }
    
    func getLocalJson() -> [Quote] {
        
        // Get path in app bundle
        let pathString = Bundle.main.path(forResource: "Data", ofType: "json")
        
        if let pathString = pathString {
        
            // Create URL object
            let url = URL(fileURLWithPath: pathString)
            
            do {
                // Create Data object
                let data = try Data(contentsOf: url)
                
                // Decode the json data
                let decoder = JSONDecoder()
                var quotes = try decoder.decode([Quote].self, from: data)
                
                // Add UUID to author instances
                for index in 0..<quotes.count {
                    quotes[index].id = UUID()
                }
                
                return quotes
            }
            catch {
                print("error")
            }
        }
        
        return [Quote]()
    }
}
