//
//  ActivityComponentView.swift
//  ThreadsClone
//
//  Created by Juhaina on 06/02/1445 AH.
//

import Foundation

import SwiftUI

struct ActivityComponentView: View {
    var body: some View {
        VStack{
            HStack{
                ScrollView(.horizontal){
                    Button(action: {
                        
                    }, label: {
                        Text("ALL")
                    })
                }
                
            }
        }
    }
}


