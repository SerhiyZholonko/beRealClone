//
//  Main.swift
//  BeRealClone
//
//  Created by apple on 22.10.2023.
//

import SwiftUI
import Firebase

struct Main: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    var body: some View {
        Group{
           if viewModel.userSession == nil{
                
                MainAuthenticationView()
//                    .environmentObject(viewModel)

            }
                else {
                    if let user = viewModel.currentUser {
                        ContentView()
                    }
//                        .environmentObject(viewModel)

                }
            }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
