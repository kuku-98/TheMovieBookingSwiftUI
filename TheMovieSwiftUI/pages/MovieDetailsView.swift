//
//  MovieDetailsView.swift
//  TheMovieSwiftUI
//
//  Created by Theint Su on 28/4/23.
//

import SwiftUI

struct MovieDetailsView: View {
    
    @Binding var isShowDetailBinding : Bool
    
    var body: some View {
        ZStack{
            //Background
            Color(PRIMARY_DARK_COLOR)
            
            
            ScrollView(.vertical){
                VStack(alignment: .leading){
                    //App Bar
                    DetailsAppBarView {
                        isShowDetailBinding = false
                    }
                    
                    
                    //Genre, Time and Favourite Item
                    GenreTimeAndFavButtonView()
                    
                    //storyline Section
                    StoryLineSectionView()
                    
                    //Actors List
                    ActorOrCreatorListView(title: LABEL_ACTORS, moreTitle: "")
                        .padding(EdgeInsets(top: MARGION_LARGE, leading: MARGION_CARD_MEDIUM_2, bottom: MARGION_MEDIUM_2, trailing: MARGION_CARD_MEDIUM_2))
                        .background(Color(PRIMARY_COLOR))
                        .padding(.top, MARGION_MEDIUM_2)
                    
                    
                    //About film Section
                    AboutFilmView()
                    
                    //Creators List
                    ActorOrCreatorListView(title: LABEL_CREATORS, moreTitle: LABEL_MORE_CREATORS)
                        .padding(EdgeInsets(top: MARGION_LARGE, leading: MARGION_CARD_MEDIUM_2, bottom: MARGION_MEDIUM_2, trailing: MARGION_CARD_MEDIUM_2))
                        .background(Color(PRIMARY_COLOR))
                        .padding(.top, MARGION_MEDIUM_2)
                        
                
                }
            }
            
        }.edgesIgnoringSafeArea([.top, .bottom])
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(isShowDetailBinding: .constant(false)).previewLayout(.fixed(width: 500, height: 2000))
    }
}

struct DetailsAppBarView: View {
    var onTapBack : () -> Void = {}
    var body: some View {
        
        ZStack{
            //Movie Poster
            Image(IG_MOVIE_POSTER)
                .resizable()
                .frame(width: UIScreen.main.bounds.width,height: MOVIE_DETAIL_APPBAR_HEIGHT)
                .aspectRatio(contentMode: .fill)
                .clipped()
            
            //Gradient
            LinearGradient(colors: [.clear, Color(PRIMARY_DARK_COLOR)], startPoint: .top, endPoint: .bottom)
            
            
            VStack(alignment: .leading){
                //Back and Search
                BackAndSearchButtonView{
                    self.onTapBack()
                }
                
                Spacer()
                
                //Year and Rating
                YearAndRatingView()
                //Movie Name
                Text("Fantastic Beasts and Where To Find Them")
                    .font(.system(size: TEXT_HEADING_1X))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding([.leading, .trailing], MARGION_MEDIUM)
                
                
            }.padding(EdgeInsets(top: MARGION_XXLARGE, leading: MARGION_CARD_MEDIUM_2, bottom: MARGION_CARD_MEDIUM_2, trailing: MARGION_CARD_MEDIUM_2))
            
        }.frame(height: MOVIE_DETAIL_APPBAR_HEIGHT)
    }
}

struct BackAndSearchButtonView: View {
    
    var onTapBack: () -> Void = {}
    var body: some View {
        HStack{
            //Back Button
            ZStack{
                
                Circle()
                    .fill(.black.opacity(0.6))
                
                    .frame(width: MARGION_XLARGE, height: MARGION_XLARGE)
                
                Image(systemName: IC_BACK)
                    .foregroundColor(.white)
            }.onTapGesture {
                onTapBack()
            }
            
            Spacer()
            
            //Search Button
            Image(systemName: IC_MAGNIFYINGGLASS)
                .foregroundColor(.white)
            
        }.padding([.leading, .trailing], MARGION_LARGE)
    }
}

struct YearAndRatingView: View {
    var body: some View {
        HStack{
            Text("2016")
                .foregroundColor(.white)
                .frame(width: MOVIE_DETAIL_APPBAR_DATE_WIDTH, height: MARGION_XLARGE)
                .background(.yellow)
                .cornerRadius(MARGION_MEDIUM_2)
                .font(.system(size: TEXT_REGULAR_2X))
                .fontWeight(.bold)
            
            Spacer()
            
            VStack(spacing: 0.0){
                RatingBarView(maximumRating: 5, currentRating: 4)
                
                Text("38876 VOTES")
                    .font(.system(size: TEXT_REGULAR))
                    .foregroundColor(Color(TITLE_LABLE_COLOR))
                    .fontWeight(.bold)
                
            }
            
            Text("9.76")
                .font(.system(size: TEXT_BIG))
                .foregroundColor(.white)
                .fontWeight(.bold)
            
        }.padding([.leading, .trailing], MARGION_LARGE)
    }
}

struct GenreTimeAndFavButtonView: View {
    var body: some View {
        HStack(spacing: MARGION_LARGE){
            
            Image(systemName: "clock")
                .foregroundColor(.yellow)
            
            Text("2h 30mins")
                .foregroundColor(.white)
                .font(.system(size: TEXT_REGULAR))
                .fontWeight(.medium)
            
            //Genres
            ForEach(0..<3, id:  \.self){ _ in
                Text("Action")
                    .foregroundColor(.white)
                    .font(.system(size: TEXT_SMALL))
                    .padding(EdgeInsets(top: MARGION_SMALL, leading: MARGION_MEDIUM, bottom: MARGION_SMALL, trailing: MARGION_MEDIUM))
                    .background(.black.opacity(0.8))
                    .cornerRadius(MARGION_CARD_MEDIUM_2)
                
                
                
            }
            
            Image(systemName: "heart")
                .foregroundColor(.yellow)
            
        }.padding([.leading, .trailing], MARGION_MEDIUM)
    }
}

struct PlayTrailerButtonView: View {
    var body: some View {
        HStack{
            ZStack{
                Circle()
                    .fill(.black.opacity(0.6))
                    .frame(width: MARGION_XLARGE, height: MARGION_XLARGE)
                Image(systemName: "play.fill")
                    .resizable()
                    .foregroundColor(.yellow)
                    .frame(width: MARGION_MEDIUM, height: MARGION_MEDIUM)
            }
            
            Text("Play TRAILER")
                .foregroundColor(.white)
                .font(.system(size: TEXT_REGULAR))
                .fontWeight(.bold)
            
            
        }
        .padding([.leading, .trailing] , MARGION_CARD_MEDIUM_2)
        .frame(height: MARGION_XXLARGE)
        .background(.yellow)
        .cornerRadius(MARGION_LARGE)
    }
}

struct RateMovieButtonView: View {
    var body: some View {
        HStack{
            
            Image(systemName: IC_STAR_FILL)
                .foregroundColor(.yellow)
                .frame(width: MARGION_MEDIUM, height: MARGION_MEDIUM)
            
            
            Text("RATE MOVIE")
                .foregroundColor(.white)
                .font(.system(size: TEXT_REGULAR))
                .fontWeight(.bold)
                .padding(.leading, MARGION_SMALL)
            
            
        }
        .padding([.leading, .trailing] , MARGION_CARD_MEDIUM_2)
        .frame(height: MARGION_XXLARGE)
        .overlay(RoundedRectangle(cornerRadius: MARGION_LARGE).stroke(.white))
    }
}

struct StoryLineSectionView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text(LABEL_STORY_LINE)
                .foregroundColor(Color(TITLE_LABLE_COLOR))
                .font(.system(size: TEXT_REGULAR_2X))
                .fontWeight(.bold)
            
            Text("In the present day, Logan lives as a hermit in the Yukon, tormented by hallucinations of Jean Grey, whom he was forced to kill to save the world.[c] He is located by Yukio, a mutant with the ability to foresee people's deaths, on behalf of Ichirō, now the CEO of a technology zaibatsu. Ichirō, who is dying of cancer, wants Logan to accompany Yukio to Japan so that he may repay his life debt. In Tokyo, Logan meets Ichirō's son Shingen and granddaughter Mariko. There, Ichirō offers to transfer Logan's healing abilities into his own body, thus saving Ichirō's life and alleviating Logan of his near-immortality, which Logan views as a curse. Believing he is acting on his friend’s best interests however, Logan refuses and prepares to leave the following day. That night, Ichirō's physician Dr. Green introduces something into Logan's body, but Logan dismisses it as a dream.")
                .foregroundColor(.white)
                .font(.system(size: TEXT_REGULAR))
                .fontWeight(.bold)
                .padding([.top], MARGION_MEDIUM)
                .lineLimit(5)
            
            //Play Trailer and Rate Movie
            HStack{
                PlayTrailerButtonView()
                
                RateMovieButtonView()
                
            }.padding([.top], MARGION_CARD_MEDIUM_2)
            
            
        }.padding(EdgeInsets(top: MARGION_MEDIUM_3, leading: MARGION_LARGE, bottom: 0, trailing: MARGION_LARGE))
    }
}

struct AboutFilmRowView: View {
    var key: String = ""
    var value: String = ""
    var body: some View {
        HStack(alignment: .top){
            Text(key)
                .foregroundColor(Color(TITLE_LABLE_COLOR))
                .font(.system(size: TEXT_REGULAR))
                .fontWeight(.medium)
                .frame(width: SCREEN_WIDTH
                       * 0.4, alignment: .leading)
            
            Text(value)
                .foregroundColor(.white)
                .font(.system(size: TEXT_REGULAR))
                .fontWeight(.medium)
                .lineLimit(5)
                
            
        }.padding(.top, MARGION_CARD_MEDIUM_2)
    }
}

struct AboutFilmView: View {
    var body: some View {
        VStack( alignment: .leading, spacing: 0.0){
            Text("ABOUT FILM")
                .foregroundColor(Color(TITLE_LABLE_COLOR))
                .font(.system(size: TEXT_REGULAR_2X))
                .fontWeight(.bold)
            
            
            AboutFilmRowView(key: LABEL_ORIGINAL_TITLE, value: "The Wolverime")
            
            AboutFilmRowView(key: LABEL_TYPE, value: "Fantasy, Adventure, Family")
            
            AboutFilmRowView(key: LABEL_PRODUCTION, value: "United Kingdom, USA")
            AboutFilmRowView(key: LABEL_ORIGINAL_RELEASE, value: "8th November 2016")
            AboutFilmRowView(key: LABEL_Description, value: "In the present day, Logan lives as a hermit in the Yukon, tormented by hallucinations of Jean Grey, whom he was forced to kill to save the world.[c] He is located by Yukio, a mutant with the ability to foresee people's deaths, on behalf of Ichirō, now the CEO of a technology zaibatsu. Ichirō, who is dying of cancer, wants Logan to accompany Yukio to Japan so that he may repay his life debt. In Tokyo, Logan meets Ichirō's son Shingen and granddaughter Mariko.")
            
        }.padding(EdgeInsets(top: MARGION_MEDIUM_2, leading: MARGION_LARGE, bottom: 0.0, trailing: MARGION_LARGE))
    }
}
