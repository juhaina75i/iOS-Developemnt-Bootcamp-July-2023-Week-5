//
//  UserData.swift
//  ThreadsClone
//
//  Created by Juhaina on 05/02/1445 AH.
//

import Foundation
class UserDataViewModel: ObservableObject {
    @Published var post: Array <Post> = []
    @Published var users: Array <UserModel> = []
    init(){
        let  maxNumberOfUsers = 100
        for _ in 0..<100{
            let  firstandlastname = makeRandomFullName()
            let fullname = "\(firstandlastname)"
            let username = "\(firstandlastname[0]).\(firstandlastname[1])".lowercased()
            let user = UserModel(userName: username,
                                 fullName: fullname,
                                 bio: "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum .",
                                 image: URL(string: "https://source.unsplash.com/300x400/?person")!,
                                 followers: [],
                                 following: [],
                                 posts: [])
            users.append(user)
        }
        let maxNumberOfPosts = maxNumberOfUsers * 5
        for _ in 0..<maxNumberOfPosts {
            let userId = users.randomElement()!.id
            let postData =
            Post(createdBy: userId, content: makeRandomContent(),
                 createdAt: Date(), attachment: makeRandomAttachments(), replay: [], likes:[])
            
            post.append(postData)
            let index = users.firstIndex(where: { user in
                user.id == userId
            })
            if let index = index {
                users[index].posts.append(postData.id)
            }
        }
        for _ in 0..<(maxNumberOfUsers * 2) {
            let user1 = users.indices.randomElement()!
            let user2 = users.indices.randomElement()!
            if user1 != user2 {
                users [user1].following.append(users[user2].id)
                users[user2].followers.append(users[user1].id)
            }
        }
    }
    func fetchPost() {
        let numberOfPost = Int.random(in: 3...10)
        var _post:  Array <Post> = []
        
        for _ in 0...numberOfPost {
            let arraypost = Post(createdBy: UUID() , content: makeRandomContent(),
                                 createdAt: Date(), attachment: makeRandomAttachments(), replay: [], likes:[])
            _post.append(arraypost)
        }
        post = _post
    }
    func  makeRandomFullName() -> Array<String>{
        let username = """
        Abd al-Uzza
        Abdus Salam
        Abd Manaf
        Abd Rabbo
        Abdel Fattah
        Abdel Nour
        Abdul Ahad
        Abdul Ali
        Abdul Alim
        Abdul Azim
        Abd al-Aziz
        Abdul Baqi
        Abdul Bari
        Abdul Basir
        Abdul Basit
        Abdul Ghaffar
        Abdul Ghani
        Abdul Hadi
        Abdul Hafiz
        Abdul Hai
        Abdul Hakim
        Abdul Halim
        Abdul Hamid
        Abdul Haq
        Muneera Yousaf
        Hanadi Yousef
        """
            .components(separatedBy: "\n")
        return username.randomElement()!.components(separatedBy: " ")
    }
    func makeRandomContent() -> Optional<String>{
        let shouldContainContent = Bool.random()
        if shouldContainContent{
            return "TLorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ."
        }
        else{
            return ""
        }
    }
    func makeRandomAttachments() -> Array<URL> {
        let numberOfImage = Int.random(in: 0...5)
        var arrayOfURL =  Array<URL>()
        for _ in 0...numberOfImage{
            arrayOfURL.append( URL(string: "https://source.unsplash.com/40x40/?person")!)
        }
        return arrayOfURL
    }
    func fetchUserById(_ userID: UserModel.ID) -> Optional<UserModel>{
        let index = users.firstIndex(where: { user in
            user.id == userID
        } )
        if let index = index {
            return users[index]
        } else {
            return nil
            
        }
    }
    func fetchPostById(_ postId: Post.ID) -> Optional<Post> {
        let index = post.firstIndex(where: { post in
            post.id == postId})
        if let index = index {
            return post[index]
        }
        return nil
    }
}
