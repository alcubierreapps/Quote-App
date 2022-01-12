//
//  QuoteView.swift
//  Quotes Test
//
//  Created by Alcubierre Holdings Inc. on 2022-01-08.
//

import SwiftUI

struct QuoteView: View {
    //MARK: Properties
    
    var quote: Quote
    @State private var showModal: Bool = false
    
    var body: some View {
        ZStack{
            //Card Image
            Image(quote.image)
                .resizable()
                .scaledToFit()
            
            //Card Main Quote
            VStack(alignment: .leading, spacing: 12){
                //Main Quote
                Text(quote.mainQuote)
                    .font(.system(.largeTitle, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 3, x: 0, y: 3)
                Text("- " + quote.author)
                    .font(.title2)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 3, x: 0, y: 3)
            }
            .padding()
        }
        .cornerRadius(15)
        .shadow(color: Color("ColorBackground"), radius: 8, x: 2, y:2)
        .onTapGesture {
            self.showModal = true
        }
        .sheet(isPresented: self.$showModal){
            QuoteDetailView(quote: self.quote)
        }
        
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(quote: quoteData[0])
            .previewLayout(.sizeThatFits)
    }
}
