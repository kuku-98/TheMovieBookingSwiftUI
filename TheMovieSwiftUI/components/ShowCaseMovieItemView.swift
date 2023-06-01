//
//  ShowCaseMovieItemView.swift
//  TheMovieSwiftUI
//
//  Created by Theint Su on 27/4/23.
//

import SwiftUI

struct ShowCaseMovieItemView: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
            ZStack{
                
                Image(IG_MOVIE_POSTER)
                    .resizable()
                    .frame(width: SHOWCASE_ITEM_WIDTH, height: SHOWCASE_ITEM_HEIGHT)
                
                Image(systemName: IC_PLAY_BUTTON)
                    .resizable()
                    .frame(width: MARGION_XLARGE, height: MARGION_XLARGE)
                    .foregroundColor(Color.yellow)
            }
            
            VStack(alignment: .leading, spacing: MAGION_CLEAR){
                Text("The Wolveringe")
                    .foregroundColor(.white)
                    .font(.system(size: TEXT_REGULAR_2X))
                
                Text("15 December 2016")
                    .foregroundColor(Color(TITLE_LABLE_COLOR))
                    .font(.system(size: TEXT_REGULAR))
                    .padding(.top, MARGION_SMALL)
                
            }.padding([.leading, .bottom], MARGION_CARD_MEDIUM_2)
            
        }.padding(.leading, MARGION_CARD_MEDIUM_2)
    }
 
}

struct ShowCaseMovieItemView_Previews: PreviewProvider {
    static var previews: some View {
        ShowCaseMovieItemView()
    }
}


