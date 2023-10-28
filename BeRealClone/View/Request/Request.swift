//
//  Request.swift
//  BeRealClone
//
//  Created by apple on 10.10.2023.
//

import SwiftUI

struct Request: View {
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    RoundedRectangle (cornerRadius: 12)
                        .frame (height: 65)
                        .foregroundColor (Color(red: 40/255, green: 40/255, blue: 35/255)) .overlay(
                            HStack {
                                Image ("pp")
                                    .resizable()
                                    .scaledToFill()
                                    .frame (width: 40, height: 40) .cornerRadius (20)
                                
                                VStack(alignment: .leading) {
                                    Text ("Invite friends on BeReal")
                                        .foregroundColor(.white)
                                        .fontWeight (.semibold)
                                    Text ("bere.al/cemsa" )
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Image(systemName: "square.and.arrow.up")
                                    .foregroundColor (.white)
                                    .font (.system(size: 18))
                            }
                                .padding(.horizontal)
                            )
                        .padding(.horizontal)
                    VStack{
                        HStack{
                            Text("MY FRIENDS (21) ")
                                .foregroundColor (Color (red: 205/255, green: 204/255, blue:
                            209/255))
                            .fontWeight (.semibold)
                            .font (.system(size: 14))
                            Spacer()
                            HStack {
                                Text ("Sent" )
                                    .foregroundColor(.gray)
                                    .font (.system(size: 14))
                                Image (systemName: "chevron.right")
                                    .foregroundColor (.gray)
                                    .font(.system(size: 14))
                            }
                        }
                         
                         RoundedRectangle (cornerRadius: 18)
                        .frame(width: UIScreen.main.bounds.width * 0.95, height: 90)
                        .foregroundColor (Color(red: 28/255, green: 28/255, blue: 30/255)) .overlay (
                            VStack(spacing: 8) {
                                VStack {
                                    Spacer ()
                                    Text ("No pending requests")
                                        .fontWeight(.semibold)
                                        .foregroundColor (.white )
                                    Spacer ()
                                    HStack {
                                        Spacer ()
                                        Text ("You don't have any pending requests.")
                                            .foregroundColor (.white)
                                        Spacer ()
                                    }
                                }
                                .padding()
                            }
                            )
                    }
                                .padding(.top, 20)

                    
                }
                .padding(.top, 120)
            }
        }
    }
}
struct Request_Previews: PreviewProvider {
    static var previews: some View {
        Request()
    }
}
