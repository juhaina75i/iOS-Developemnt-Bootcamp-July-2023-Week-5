//
//  ActivityView.swift
//  ThreadsClone
//
//  Created by Juhaina on 04/02/1445 AH.
//

import SwiftUI

struct ActivityView: View {
    enum Category: String, CaseIterable{
        case all
        case replies
        case mentions
        case verified
        
        
        
        var title :String {
            
            switch self{
                
            case .all:
                return "All"
            case .replies:
                return "Replies"
            case .mentions:
                return "Mentions"
            case .verified:
                return "Verified"
            }
        }
        
        
    }
    
    @State var currentCategories: Category  = .all
    var body: some View {
        VStack{
            HStack{
                ScrollView(.horizontal){
                    HStack{
                        ForEach(Category.allCases, id: \.self){ category in
                            Button(action: {
                                
                                
                            }, label: {
                                Text(category.title)
                                    .frame(width:100)
                                    .padding(.horizontal,12)
                                    .padding(.vertical, 8)
                                    .background(.black)
                                    .foregroundColor(.white)
                                    .background(RoundedRectangle(cornerRadius: 12.5).stroke(.gray.opacity(0.25)))
                                
                            }  )
                            .padding(.bottom)
                        }
                        .padding()
                        
                    }
                    
                }
                
            }

            ScrollView{
                ForEach(0...10, id:\.self){ _ in
                    HStack(alignment: .top){
                        AsyncImage(url:URL(string:  "https://source.unsplash.com/40x40/?person")
                        ) {result in
                            if let image = result.image {
                                image.resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                
                            } else {
                                ProgressView()
                            }
                            
                        } .frame(width: 40, height: 40)
                        VStack(alignment: .leading){
                            Text("Username")
                            Text("Flawless")
                            Text("455 Followers")
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        Button(action: {
                            
                        }, label:{
                            Text("Follow")
                                .padding(.horizontal, 19)
                                .padding(.vertical, 8)
                                .background(RoundedRectangle(cornerRadius: 12.5).stroke(.gray.opacity(0.25))
                                )
                        }).buttonStyle(.plain)
                        
                    }.padding(.horizontal)
                    Divider()
                }
            }}
    }
}
struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
