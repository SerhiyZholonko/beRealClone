//
//  Feed.swift
//  BeRealClone
//
//  Created by apple on 05.10.2023.
//

import SwiftUI
import Kingfisher

struct Feed: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel

    @Binding var mainMenu: String
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            ZStack {
                ScrollView {
                    VStack {
                        VStack {
                            ZStack {
                                VStack(alignment: .leading) {
                                    Image ("drone")
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius (5)
                                }
                                VStack {
                                    HStack {
                                        Image("duck")
                                            .resizable()
                                            .scaledToFit ()
                                            .border (.black)
                                            .cornerRadius (2)
                                            .frame(width: 20, height: 40)
                                            .padding (.leading)
                                        Spacer()
                                    }
                                    .padding(.top, 18)
                                    Spacer()
                                }
                            }
                            .frame(width: 100)
                        }
                        VStack {
                            Text("Add a caption...")
                                .foregroundColor (.white)
                                . fontWeight(.semibold)
                            Text ("View Comment" )
                                .foregroundColor(.gray)
                            HStack {
                                Text ("Enschede, Enschede-North • 1 hr late")
                                    .foregroundColor (.gray)
                                    .font (.system(size: 12))
                                ThreeDots.init(size: 4, color: .gray)
                            }
                        }
                        Spacer()
                        ForEach(1..<8) { _ in
                            FeedCell()
                        }
                    }
                    .padding(.top, 80)
                }
                VStack {
                    VStack {
                        HStack{
                            Button {
                                withAnimation {
                                    self.mainMenu = "left"
                                }
                            } label: {
                                Image(systemName: "person.2.fill")
                                     .foregroundColor(.white)
                            }

                            Spacer()
                            Text("BeReal.")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 22))
                            Spacer()
                            Button {
                                self.mainMenu = "profile"
                            } label: {
                                if let profileImageUrl = viewModel.currentUser?.profileImageUrl {
                                    KFImage(URL(string: profileImageUrl))
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: 35, height: 35)
                                        .cornerRadius(35/2)
                                } else {
                                    Circle()
                                        .frame(width: 35, height: 35)
                                        .foregroundColor(Color(red: 152/255, green: 163/255, blue: 16/255))
                                        .overlay(
                                            Circle()
                                                .foregroundColor(.white)
                                                .frame(width: 35, height: 35)
                                                .overlay(
                                                    Text(viewModel.currentUser!.fullname.prefix(1).uppercased())
                                                        .foregroundColor(.black) // Set the text color to your preference
                                                        .font(.system(size: 15))
                                                )
                                        )
                                }
                            }


                        }
                        HStack(alignment: .center){
                            Text("My Friends")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                            Text("Discovery")
                                .foregroundColor(.gray)
                        }
                    }
                    Spacer()
                }
            }
            
        }
        .onAppear {
            KingfisherManager.shared.cache.clearMemoryCache()
        }
        
    }
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Feed(mainMenu: .constant("feed"))
    }
}
