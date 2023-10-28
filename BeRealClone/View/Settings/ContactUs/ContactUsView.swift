//
//  ContactUsView.swift
//  BeRealClone
//
//  Created by apple on 12.10.2023.
//

import SwiftUI

struct ContactUsView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack
        {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    ZStack {
                        Text ("How can we help you?")
                            .foregroundColor(.white)
                            . fontWeight(.semibold)
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
                            ZStack(alignment: .center) {
                                RoundedRectangle (cornerRadius: 10)
                                    .frame (height: 45)
                                    .foregroundColor (Color (red: 28/255, green: 28/255, blue:
                                                                30/255))
                                HStack {
                                    Image (systemName: "questionmark.circle")
                                    Text ("Ask a Question")
                                }
                                .foregroundColor(.white)
                            }
                            ZStack(alignment: .center) {
                                RoundedRectangle (cornerRadius: 10)
                                    .frame (height: 45)
                                    .foregroundColor (Color (red: 28/255, green: 28/255, blue:
                                                                30/255))
                                HStack {
                                    Image (systemName: "ladybug")
                                    Text ("Report a Problem'")
                                }
                                .foregroundColor(.white)
                            }
                            ZStack(alignment: .center) {
                                RoundedRectangle (cornerRadius: 10)
                                    .frame (height: 45)
                                    .foregroundColor (Color (red: 28/255, green: 28/255, blue:
                                                                30/255))
                                HStack {
                                    Image (systemName: "atom")
                                    Text ("Become Beta Tester")
                                }
                                .foregroundColor(.white)
                            }
                            Spacer()
                        }
                        .padding(.top)
                    }
                }
            }
        }
    }
}

struct ContactUsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactUsView()
    }
}
