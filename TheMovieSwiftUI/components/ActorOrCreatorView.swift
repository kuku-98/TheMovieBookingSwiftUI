//
//  ActorOrCreatorView.swift
//  TheMovieSwiftUI
//
//  Created by Theint Su on 28/4/23.
//

import SwiftUI

struct ActorOrCreatorListView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Best Actor")
                    .foregroundColor(Color(TITLE_LABLE_COLOR))
                    .font(.system(size: TEXT_REGULAR_2X))
                    .fontWeight(.bold)
                
                Spacer()
                Text("More Actor")
                    .foregroundColor(.white)
                    .font(.system(size: TEXT_REGULAR_2X))
                    .fontWeight(.bold)
                    .underline()
            }.padding([.leading,.trailing], MARGION_CARD_MEDIUM_2)
            
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(0..<10, id: \.self){ _ in
                        //ActorOrCreator
                        ActorItemView()
                    
                    }
                }.padding([.leading, .trailing], MARGION_CARD_MEDIUM_2)
            }
           
        }
    }
}

struct ActorOrCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        ActorOrCreatorListView()
    }
}

struct ActorItemView: View {
    var body: some View {
        ZStack{
            //Actor Image
            Image("actor")
                .resizable()
                .frame(width: 168, height: 220)
            
            
            VStack(alignment: .leading){
                
                //Fav Image
                HStack{
                    Spacer()
                    
                    Image(systemName: "heart.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: MARGION_LARGE, height: MARGION_LARGE)
                        .padding([.trailing, .top], MARGION_CARD_MEDIUM_2)
                }
                
                //Spacer
                Spacer()
                
                
                //Actor Info
                VStack(alignment: .leading, spacing: MAGION_CLEAR){
                    Text("Lenonardo De Caprio")
                        .foregroundColor(.white)
                        .font(.system(size: TEXT_REGULAR))
                        .fontWeight(.bold)
                    
                    HStack{
                        Image(systemName: "hand.thumbsup.fill")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: MARGION_MEDIUM_2, height: MARGION_MEDIUM_2)
                        
                        
                        Text("You Like 13 movies")
                            .foregroundColor(Color(TITLE_LABLE_COLOR))
                            .font(.system(size: TEXT_SMALL))
                            .fontWeight(.bold)
                    }.padding(.top, MARGION_SMALL)
                    
                }.padding([.leading, .bottom], MARGION_MEDIUM)
                
                
            }
        }.frame(width: 168, height: 220)
    }
}
