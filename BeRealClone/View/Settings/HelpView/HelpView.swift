//
//  HelpView.swift
//  BeRealClone
//
//  Created by apple on 12.10.2023.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    ZStack {
                        Text ("Help" )
                            .foregroundColor (.white)
                            .fontWeight(.semibold)
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Image (systemName: "arrow.backward")
                                    .foregroundColor(.white)
                                    .font (.system(size: 20))
                            }

                            Spacer ()
                        }
                    }
                    Spacer()
                    VStack {
                        VStack(spacing: 16) {
                            NavigationLink {
                                ContactUsView().navigationBarBackButtonHidden()
                            } label: {
                                Chevron(icon: "envelope", text: "Contact us").navigationBarBackButtonHidden()
                            }
                            NavigationLink {
                                
                            } label: {
                                Chevron(icon: "questionmark.circle", text: "Help Center").navigationBarBackButtonHidden()
                            }

                            Spacer()
                        }
                        .padding (.horizontal)
                        .padding (.top, 50)
                    }
                }
            }
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
