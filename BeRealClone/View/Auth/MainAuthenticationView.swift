//
//  MainAuthenticationView.swift
//  BeRealClone
//
//  Created by apple on 17.10.2023.
//

import SwiftUI

struct MainAuthenticationView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    @State private var nameButtonClicked = false
    @State private var ageButtonClicked = false
    @State private var phoneNumberButtonClicked = false
    
    var body: some View {
        NavigationView {
            if !nameButtonClicked {
                EnterName(name: $viewModel.name, nameButtonClicked: $nameButtonClicked)
                    .environmentObject(viewModel)
            } else if nameButtonClicked && !ageButtonClicked {
                EnterAgeView(year: $viewModel.year, name: $viewModel.name, ageButtonClicked: $ageButtonClicked)
                    .environmentObject(viewModel)
            } else if nameButtonClicked && ageButtonClicked && !phoneNumberButtonClicked {
                EnterPhoneNumber(phoneNumberButtonClicked: $phoneNumberButtonClicked)
                    .environmentObject(viewModel)
            }
        }
    }
}


struct MainAuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        MainAuthenticationView()
    }
}

