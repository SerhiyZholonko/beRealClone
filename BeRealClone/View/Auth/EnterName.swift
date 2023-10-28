//
//  Name.swift
//  BeRealClone
//
//  Created by apple on 15.10.2023.
//

import SwiftUI

struct EnterName: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    @Binding var name: String
    @State var buttonActive: Bool = false
    @Binding var nameButtonClicked: Bool
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea ()
                
                VStack {
                    HStack {
                        Spacer ()
                        Text ("BeReal.")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 22))
                        Spacer()
                    }
                    Spacer()
                }
                VStack(alignment: .center, spacing: 18) {
                    Text("Let's get started, what's your name?")
                        .fontWeight (.heavy)
                        .font(.system(size: 16))
                    Text (name.isEmpty ? "Your name" : "" )
                        .foregroundColor (name.isEmpty ? Color(red: 70/255, green: 70/255, blue: 73/255) : .white)
                        .fontWeight (.heavy) . font (. system(size: 40) )
                        .frame(width: 210)
                        .overlay(
                    TextField("", text: $name)
                        .font (.system(size: 40, weight: .heavy)))
                        .multilineTextAlignment(.center)
                        .foregroundColor (.white)
                    Spacer()
                }
                .foregroundColor(.white)
                .padding(.top, 50)

                VStack {
                    Spacer ()
                    Button {
                        if buttonActive {
                            self.nameButtonClicked = true
                        }
                        else {
                            self.buttonActive = true
                        }
                    } label: {
                        WhiteButtonView (buttonActive: $buttonActive, text: "Continue")
                            .onChange(of : name) { newValue in
                                buttonActive = !newValue.isEmpty ? true : false
                            }
                    }

                }
            }
        }
    }
}

struct EnterName_Previews: PreviewProvider {
    static var previews: some View {
        EnterName(name: .constant(""), nameButtonClicked: .constant(false))
    }
}
