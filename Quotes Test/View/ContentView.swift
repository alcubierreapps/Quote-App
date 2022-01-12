//
//  ContentView.swift
//  Quotes Test
//
//  Created by Alcubierre Holdings Inc. on 2022-01-08.
//

import SwiftUI

struct ContentView: View {
    //MARK: Properties
    
    var quotes: [Quote] = quoteData
    
    var body: some View {
       
        ScrollView(.vertical, showsIndicators: false){
            
            //MARK: Quote Card
            VStack{
                ForEach(quotes) {item in
                    QuoteView(quote: item)
                }
                .padding()
        }
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(quotes: quoteData)
    }
}
