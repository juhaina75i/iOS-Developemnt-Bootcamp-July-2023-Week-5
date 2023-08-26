//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Juhaina on 04/02/1445 AH.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userData: UserDataViewModel
    @EnvironmentObject var auth: AuthViewModel
    @State var currentUser: Optional <UserModel> = nil
    @State var currentUserPosts: Array<Post> = []
    var initialUser: UserModel? {
        userData.users.first
    }
    var body: some View {
        VStack{
            if let currentUser = currentUser {
                
                HStack{
                    Spacer()
                    Button(action: {
                        auth.signOut()
                    }, label: {
                        Text("Sign out")
                    })
                }
                HStack{
                    VStack{
                        Text(currentUser.fullName)
                        Text(currentUser.userName)
                    }
                    Spacer()
                    AsyncImage(url:URL(string:  "https://source.unsplash.com/300x200/?person")).frame(width: 75, height: 75).clipShape(Circle())
                }
                Text("Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum")
                Text("\(currentUser.followers.count)followers")
                HStack  {
                    Button(action: {
                    }, label: {
                        Text("Edit profile")
                            .frame(maxWidth: .infinity).padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.black)
                            .foregroundColor(.white)
                    })
                    Button(action: {
                        
                    }, label: {
                        Text("Share profile").frame(maxWidth: .infinity)
                    })
                }
                .padding()
            }else{
                HStack{
                    Spacer()
                    Button(action: {
                        auth.signOut()
                    }, label: {
                        Text("Sign out")
                    })
                }
                HStack{
                    VStack{
                        Text("***************")
                        Text("***************")
                    }
                    Spacer()
                    AsyncImage(url:URL(string:  "https://source.unsplash.com/300x200/?person")).frame(width: 75, height: 75).clipShape(Circle())
                }
                Text("******************************************************************************************")
                Text("******************************")
                HStack  {
                    Button(action: {
                        
                    }, label: {
                        Text("Sign out")
                            .frame(maxWidth: .infinity).padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.black)
                            .foregroundColor(.white)
                    })
                    Button(action: {
                        
                    }, label: {
                        Text("Sign out").frame(maxWidth: .infinity)
                    })
                }
            }
            ScrollView{
                ForEach(userData.post){
                    postData in
                    if let user = userData.fetchUserById(postData.createdBy){
                        NavigationLink(destination: {
                            PostScreenView(posModelt: postData, userModel: user)
                        }, label: {
                            PostCardCompenetView(post: postData, userModel: user )
                        }).buttonStyle(.plain)
                    }
                }
            }
            
        }.onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)){
                self.currentUser = self.initialUser
            if let uuid = UUID(uuidString: auth.token) {
                if let user = userData.fetchUserById(uuid){
                    self.currentUser = user
                }
                self.currentUserPosts = userData.post.filter { post in
                    return post.createdBy == uuid
                }   }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(UserDataViewModel()).environmentObject(AuthViewModel())
    }
}
