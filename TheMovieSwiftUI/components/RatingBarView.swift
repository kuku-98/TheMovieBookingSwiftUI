//
//  RatingBarView.swift
//  TheMovieSwiftUI
//
//  Created by Kuu on 20/4/23.
//

import SwiftUI

struct RatingBarView: View {
    
    var maximumRating : Int = 5
    var currentRating : Int = 3
    var body: some View {
        HStack{
            ForEach(0..<currentRating, id: \.self){ _ in
                Image(systemName: IC_STAR_FILL)
                    .resizable()
                    .foregroundColor(.yellow)
                    .frame(width: MARGION_CARD_MEDIUM_2, height: MARGION_CARD_MEDIUM_2)
                
                
            }
            
            ForEach(0..<(maximumRating-currentRating), id: \.self){ _ in
                Image(systemName: IC_STAR)
                    .resizable()
                    .foregroundColor(.yellow)
                    .frame(width: MARGION_CARD_MEDIUM_2, height: MARGION_CARD_MEDIUM_2)
                
                
            }
        }
    }
}

struct RatingBarView_Previews: PreviewProvider {
    static var previews: some View {
        RatingBarView()
    }
}
