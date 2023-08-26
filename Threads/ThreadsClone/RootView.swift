//
//  ContentView.swift
//  ThreadsClone
//
//  Created by Juhaina on 04/02/1445 AH.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var userPrefrences: UserPrefrencesViewModel
    @State var showSplah = true
    var body: some View {
        VStack {

            if showSplah{
                splashView()
            }
            else{
                OnboardingView()
            }
        }
            .onAppear(){
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    withAnimation{
                        self.showSplah = false
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(UserPrefrencesViewModel())
            
    }
}
