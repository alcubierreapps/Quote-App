//
//  QuoteModel.swift
//  Quotes Test
//
//  Created by Alcubierre Holdings Inc. on 2022-01-08.
//

import Foundation
import SwiftUI

//MARK: Quote Model

struct Quote: Identifiable {
    var id = UUID()
    var image: String
    var author: String
    var mainQuote: String
    var moreQuotes:[String]
}
