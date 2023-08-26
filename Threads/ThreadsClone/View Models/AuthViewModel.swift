//
//  AuthViewModel.swift
//  ThreadsClone
//
//  Created by Juhaina on 05/02/1445 AH.
//

import Foundation
import SwiftUI
class AuthViewModel: ObservableObject{
        @AppStorage ("token") var token: String = ""
    func signIn(_ id: UserModel.ID) -> Bool{
        token = UUID().uuidString
        return true
    }
    func signOut()->Bool{
        token = ""
        return false
    }
    func reset() {
        token = ""
    }
}
