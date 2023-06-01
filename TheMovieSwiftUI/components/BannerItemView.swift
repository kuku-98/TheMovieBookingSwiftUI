//
//  BannerItemView.swift
//  TheMovieSwiftUI
//
//  Created by Kuu on 20/4/23.
//

import SwiftUI

struct BannerItemView: View {
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .leading, vertical: .bottom)){
            
            //Banner Image. Gradient and Play Button
            BannaerAndGradientView()
            
            //Movie Title
            Text("The Wolverine 2013. \n Official Review")
                .foregroundColor(.white)
                .font(.system(size: TEXT_HEADING_1X))
                .fontWeight(.bold)
                .padding(EdgeInsets(top: MAGION_CLEAR, leading: MARGION_CARD_MEDIUM_2, bottom: MARGION_XLARGE, trailing: MARGION_LARGE))
        }
    }
}


struct BannaerAndGradientView: View {
    var body: some View {
        ZStack{ // components aligin in center
            
            //Movie Poster
            Image(IG_MOVIE_POSTER)
                .resizable()
                .frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: BANNER_IMAGE_HEIGHT, maxHeight: BANNER_IMAGE_HEIGHT)
                .clipped()
            
            //Gradient
            LinearGradient(colors: [.clear, Color(PRIMARY_COLOR)], startPoint: .top, endPoint: .bottom)
            
            
            //Play Button
            Image(systemName: IC_PLAY_BUTTON)
                .resizable()
                .foregroundColor(.yellow)
                .frame(width: MARGION_XXLARGE, height: MARGION_XXLARGE)
                .clipped()
            
        }
    }
}

struct BannerItemView_Previews: PreviewProvider {
    static var previews: some View {
        BannerItemView()
            .previewLayout(.fixed(width: 400, height: 250))
    }
}
