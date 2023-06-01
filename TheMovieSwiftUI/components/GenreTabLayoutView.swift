//
//  GenreTabLayoutView.swift
//  TheMovieSwiftUI
//
//  Created by Kuu on 23/4/23.
//

import SwiftUI

struct GenreTabLayoutView: View {
    
    @State var genres: [GenreVO] = dummyGenres
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false){
            ScrollViewReader{ scrollView in
                HStack(spacing: MARGION_MEDIUM_2){
                    ForEach(genres, id: \.genreName) { genre in
                        VStack{
                            /*@START_MENU_TOKEN@*/Text(genre.genreName)/*@END_MENU_TOKEN@*/
                                .foregroundColor(genre.isSelected ? .white: Color(TITLE_LABLE_COLOR))
                                .font(.system(size: TEXT_REGULAR))
                                .fontWeight(genre.isSelected ? .bold : .medium)
                            
                            Rectangle()
                                .fill(genre.isSelected ? .yellow : .clear)
                                .frame(height: 2)
                                
                        }.onTapGesture {
                            
                            genres = genres
                                .map{ iteratedGenre in
                                    if iteratedGenre.genreName == genre.genreName{
                                        return GenreVO(genreName: iteratedGenre.genreName,isSelected: true)
                                    }else{
                                        return GenreVO(genreName: iteratedGenre.genreName,isSelected: false)
                                    }
                            }
                            
                            withAnimation {
                                scrollView.scrollTo(genre.genreName, anchor: .center)
                            }
                          
                        }
                       
                    }
                }
                
            }
        }
        
    }
}

struct GenreTabLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        GenreTabLayoutView()
    }
}
