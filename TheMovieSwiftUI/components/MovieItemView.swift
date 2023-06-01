//
//  MovieItemView.swift
//  TheMovieSwiftUI
//
//  Created by Kuu on 20/4/23.
//

import SwiftUI

struct MovieItemView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: MAGION_CLEAR){
            //Movie Image
            Image(IG_MOVIE_POSTER)
                .resizable()
                .frame(width: 150, height: 180)
            
            
            //Movie Name
            Text("The Wolverine")
                .foregroundColor(.white)
                .font(.system(size: TEXT_REGULAR_2X))
                .fontWeight(.bold)
                .padding(.top, MARGION_MEDIUM)
            
            //Rating Info
            HStack{
                //Rating Text
                Text("8.2")
                    .foregroundColor(.white)
                    .font(.system(size: TEXT_REGULAR_2X))
                    .fontWeight(.medium)
                
                //Rating Star
                RatingBarView(maximumRating: 5, currentRating: 4)
                
                
            }.padding(.top, MARGION_MEDIUM)
            
        }.padding(.leading, MARGION_CARD_MEDIUM_2)
    }
}

struct MovieItemView_Previews: PreviewProvider {
    static var previews: some View {
        MovieItemView()
            .previewLayout(.fixed(width: 150, height: 250))
    }
}


