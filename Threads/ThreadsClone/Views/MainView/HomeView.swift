//
//  HomeView.swift
//  ThreadsClone
//
//  Created by Juhaina on 04/02/1445 AH.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var UserData: UserDataViewModel

    var body: some View {
        VStack{
            ScrollView{
                ForEach(UserData.post){
                    postData in
                    if let user = UserData.fetchUserById(postData.createdBy){
                        NavigationLink(destination: {
                            PostScreenView(posModelt: postData, userModel: user)
                        }, label: {
                            PostCardCompenetView(post: postData, userModel: user )
                        }).buttonStyle(.plain)
                        
                    }
                    
                }
            }
            
        }
    }
}
