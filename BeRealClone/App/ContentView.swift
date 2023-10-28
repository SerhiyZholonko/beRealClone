//
//  ContentView.swift
//  BeRealClone
//
//  Created by apple on 04.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State var width = UIScreen.main.bounds.width
    @State var menu = "feed"
    @EnvironmentObject var viewModel: AuthenticationViewModel
    init () {
        UITextView.appearance().backgroundColor = .clear
    }
    func simpleSuccess () {
        let generator = UINotificationFeedbackGenerator ( )
        generator.notificationOccurred (.success)
    }
    var body: some View {
//        MainAuthenticationView()
//            .environmentObject(viewModel)
        
        NavigationView{
            HStack(spacing: 0){
                LeftMenu( mainMenu: $menu)
                    .frame(width: width)
                Feed(mainMenu: $menu)
                    .frame(width: width)
                    .environmentObject(viewModel)
                Profile(mainMenu: $menu)
                    .frame(width: width)
            }
            .offset (x: menu == "left" ? width : 0)
            .offset (x: menu == "profile" ? -(width) : 0)
            .onChange (of: menu) { newValue in
                simpleSuccess()
            }
            .environmentObject(viewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
