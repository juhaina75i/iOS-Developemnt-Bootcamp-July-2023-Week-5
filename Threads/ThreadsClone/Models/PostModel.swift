//
//  PostModel.swift
//  ThreadsClone
//
//  Created by Juhaina on 05/02/1445 AH.
//

import Foundation

struct Post: Codable, Identifiable{
    var id: UUID = .init()
    let createdBy: UserModel.ID
    let content : String?
    let createdAt: Date
    let attachment: Array<URL>
    var replay: Array<UserModel.ID>
    var likes: Array<UserModel.ID>
}
