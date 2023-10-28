//
//  FeedCell.swift
//  BeRealClone
//
//  Created by apple on 05.10.2023.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
        
            VStack(alignment: .leading){
             //MARK: - user
                HStack {
                    Image ("pp")
                        .resizable ()
                        .frame (width: 40, height: 40)
                        .cornerRadius (20)
                    VStack(alignment: .leading){
                        Text("Username")
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                        Text ("Enschede • 7 hr late")
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                    }
                    .padding(.horizontal)
                }
                .padding()
                //MARK: - image
                ZStack {
                    
                
                    VStack {
                        Image("drone")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                        HStack {
                            Text("Add a comment...")
                                .foregroundColor(.gray)
                                .fontWeight (.semibold)
                                .padding (.leading, 4)
                            Spacer()
                        }
                    }
                    VStack {
                        HStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor (.black)
                                .frame (width: 185 , height: 145) .overlay (
                                    Image("duck")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 180, height: 140))
                                .cornerRadius(8)
                            
                            Spacer()
                        }
                        .padding(.leading, 18)
                        Spacer()
                        
                    }
                    VStack {
                        HStack {
                            Spacer()
                            VStack {
                                Spacer()
                                HStack {
                                    VStack {
                                        Image (systemName: "bubble.left.fill")
                                            .foregroundColor(.white)
                                            .font (.system (size: 25))
                                            .shadow (color: .black, radius: 3, x: 1, y: 1)
                                        Image(systemName:  "face.smiling.fill")
                                            .foregroundColor(.white)
                                            .font (.system(size: 25))
                                            .shadow(color: .black, radius: 3, x: 1)
                                            .padding(. top, 15)
                                    }
                                }
                                .padding()
                            }
                        }
                        .padding()
                        Spacer()
                        
                    }
                }
            }
            .frame (width: UIScreen.main.bounds.width, height: 600)

        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
