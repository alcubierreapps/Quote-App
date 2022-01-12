//
//  QuoteModel.swift
//  Quotes Test
//
//  Created by Alcubierre Holdings Inc. on 2022-01-08.
//

import Foundation
import SwiftUI

//MARK: Quote Model

struct Quote: Identifiable, Decodable {
  
    var id: UUID?
    var image: String
    var author: String
    var mainQuote: String
    var moreQuotes:[String]


    static func testData() -> Quote {
    
        let testAuthor = Quote(id: UUID(), image: "quote-2", author: "Author 1", mainQuote: "Main Quote 1", moreQuotes: ["More Quotes 1", "More Quotes 2"])
    
        return testAuthor
    }
}
