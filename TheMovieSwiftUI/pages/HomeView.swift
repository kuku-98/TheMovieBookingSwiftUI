//
//  HomeView.swift
//  TheMovieSwiftUI
//
//  Created by Theint Su on 20/4/23.
//

import SwiftUI

struct HomeView: View {
    @State var isShowDetails : Bool = false
    
    var body: some View {
        ZStack{
            
            //background
            Color("primary_color")
            
            
            //body
            VStack(alignment: .leading, spacing: 0.0){
                //app_bar
                AppBarView()
                
                
                ScrollView(.vertical){
                    
                    VStack(alignment: .leading){
                        //Banner View
                        BannerSectionView {
                            //Navigate
                            debugPrint("Navigate To Detail")
                            isShowDetails = true
                            
                        }
                        
                        //Popular Movie List View
                        PopularMovieSectionView {
                            isShowDetails = true
                        }
                        
                        
                        //Check Movie Showtime Section
                        CheckMovieShowTimeView()
                        
                        //Spacer
                        Spacer()
                            .frame(height: MARGION_LARGE)
                        
                        //Genre Section
                        VStack(alignment: .leading, spacing: 0.0) {

                            GenreTabLayoutView()
                                .padding([.leading, .trailing], MARGION_MEDIUM_2)

                            
                            ScrollView(.horizontal){
                                HorizontalMovieListView{
                                    isShowDetails = true
                                }.padding([.top, .bottom], MARGION_MEDIUM_3)
                                    .background(Color(PRIMARY_DARK_COLOR))

                            }
                            
                        }
                        
                        
                        //Showcase Section
                        ShowCaseSectionView {
                            isShowDetails = true
                        }
                        
                        
                     //Spacer
                     Spacer()
                            .frame(height: MARGION_LARGE)
                        
                     //Actor Section
                        ActorOrCreatorListView(title: LABEL_BEST_ACTORS, moreTitle: LABEL_MORE_ACTORS).padding([.top, .bottom], MARGION_MEDIUM_3)
                            .background(Color(PRIMARY_DARK_COLOR))
                       
                    }
                    
                }.padding(.top, MARGION_MEDIUM_3)
                
                
                
            }.padding(.top, MARGION_XXLARGE)
                .fullScreenCover(isPresented: $isShowDetails) {
                    MovieDetailsView(isShowDetailBinding: $isShowDetails)
                }
            
        }.edgesIgnoringSafeArea([.top, .bottom])
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().previewLayout(.fixed(width: 390, height: 2000))
    }
}



struct AppBarView: View {
    var body: some View {
        HStack{
            //Menu icon
            Image(systemName: IC_HORIZONTAL_LINES)
                .resizable()
                .foregroundColor(.white)
                .frame(width: MARGION_LARGE, height: MARGION_LARGE)
            
            
            Spacer()
            
            //Title
            Text(LABEL_DISCOVER)
                .foregroundColor(.white)
                .font(.system(size: TEXT_REGULAR))
                .fontWeight(.bold)
            
            
            Spacer()
            
            //Search icon
            Image(systemName: IC_MAGNIFYING_GLASS)
                .resizable()
                .foregroundColor(.white)
                .frame(width: MARGION_LARGE, height: MARGION_LARGE)
        }.padding([.leading, .trailing], MARGION_LARGE)
    }
}




struct BannerSectionView: View {
    
    var onTapMovie: () -> Void = {
        
    }
    
    init(onTapMovie: @escaping () -> Void){
        self.onTapMovie = onTapMovie
        UIPageControl.appearance().pageIndicatorTintColor = .gray
        UIPageControl.appearance().currentPageIndicatorTintColor = .yellow
    }
    
    var body: some View {
        TabView{
            
            ForEach(0..<5, id: \.self) { _ in
                BannerItemView().onTapGesture {
                    onTapMovie()
                }
            }
        }.tabViewStyle(.page)
            .frame(height: BANNER_SECTION_HEIGHT)
    }
}

struct HorizontalMovieListView: View {
    
    var onTapMovie: () -> Void = {
        
    }
    var body: some View {
        HStack{
            ForEach(0..<10, id: \.self){ _ in
                MovieItemView().onTapGesture {
                    onTapMovie()
                }
            }
        }
    }
}

struct PopularMovieSectionView: View {
    
    var onTapMovie: () -> Void = {
        
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {
            //Title Label
            Text("BEST POPULAR MOVIES AND SERIES")
                .foregroundColor(Color(TITLE_LABLE_COLOR))
                .font(.system(size: TEXT_REGULAR_2X))
                .fontWeight(.bold)
                .padding(.leading, MARGION_CARD_MEDIUM_2)
            
            
            ScrollView(.horizontal){
                HorizontalMovieListView {
                    self.onTapMovie()
                }
            }
            
            
        }.padding(.top, MARGION_MEDIUM_3)
    }
}

struct CheckMovieShowTimeView: View{
    var body: some View{
        ZStack{
            //Back Ground
            Color(PRIMARY_LIGHT_COLOR)
                .frame(height: 200)
                .shadow(radius: 5.0)
            
            //Content
            HStack{
                VStack(alignment: .leading){
                    Text("Check Moive \n Show times")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: TEXT_HEADING_2X))
                        .padding([.top, .leading], MARGION_MEDIUM_3)
                    
                    Spacer()
                    
                    Text("SEE MORE")
                        .foregroundColor(.yellow)
                        .underline()
                        .padding([.bottom, .leading], MARGION_MEDIUM_3)
                        
                }
              
                Spacer()
                
                Image(systemName: "location.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: MARGION_XILARGE, height: MARGION_XILARGE)
                    .padding(.trailing, MARGION_XLARGE)
                
            }
        }.padding(EdgeInsets(top: MARGION_XLARGE, leading: MARGION_CARD_MEDIUM_2, bottom: 0, trailing: MARGION_CARD_MEDIUM_2))
    }
}

struct ShowCaseMovieBodyView: View {
    var onTapMovie: () -> Void = {
        
    }
    
    var body: some View {
        ScrollView(.horizontal){
            HStack(spacing: 0.0){
                ForEach(0..<10, id: \.self){ _ in
                   
                    ShowCaseMovieItemView().onTapGesture {
                        onTapMovie()
                    }
                    
                }
            }.padding( .trailing, MARGION_CARD_MEDIUM_2)
            
        }
        
    }
}



struct ShowCaseSectionView: View {
    
    var onTapMovie: () -> Void = {
        
    }
    var body: some View {
        VStack(alignment: .leading){
            
            //ShowCase Title
            ShowCaseTitleView()
            
            //Spacer
            Spacer()
                .frame(height: MARGION_CARD_MEDIUM_2)
            
            
            //ShowCase Movie item View
            ShowCaseMovieBodyView {
                self.onTapMovie()
            }
        }.padding(.top, MARGION_MEDIUM_2)
    }
}

struct ShowCaseTitleView: View {
    var body: some View {
        HStack{
            //Title
            Text(LABEL_SHOWCASES)
                .foregroundColor(Color(TITLE_LABLE_COLOR))
                .fontWeight(.bold)
                .font(.system(size: TEXT_REGULAR))
            
            
            //Spacer
            Spacer()
            
            
            //More ShowCases
            Text(LABEL_MORE_SHOWCASES)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: TEXT_REGULAR))
                .underline()
            
            
        }.padding([.leading, .trailing], MARGION_CARD_MEDIUM_2)
    }
}
