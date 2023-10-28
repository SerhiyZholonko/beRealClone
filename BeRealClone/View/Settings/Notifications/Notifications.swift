//
//  Notifications.swift
//  BeRealClone
//
//  Created by apple on 13.10.2023.
//

import SwiftUI

struct Notifications: View {
    @Environment(\.dismiss) var dismiss
    @State var mentions = false
    @State var comments = false
    @State var friendRequests = false
    @State var lateBeReal = false
    @State var realMojis = false
    @State var buttonActive = false
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea ()
                VStack {
                    ZStack {
                        Text ("Notifications")
                            .fontWeight (.semibold)
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Image (systemName: "arrow.backward")
                                    .font (.system(size: 20))
                            }

                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    Spacer()
                }
                .foregroundColor (.white)
                VStack {
                    VStack {
                        HStack{
                            Text("On BeReal, you're in control of your push notifications.")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        HStack {
                            Text("You can choose the type of notifications you want to receive.")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                       

                    }
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    VStack (spacing: 14) {
                        VStack {
                            NotificationButton(icon:
                                                "person.crop.square.filled.and.at.rectangle", text:
                                                "Mentions", toggle: $mentions)
                            HStack {
                                Text ("dilaysila mentioned you on seanlund's BeReal")
                                    .foregroundColor (.gray)
                                    .font(.system (size: 12))
                                .padding( .leading)
                                Spacer ()
                            }
                        }
                    
                        }
                    VStack {
                        NotificationButton(icon: "bubble.left.fill", text: "Comments", toggle: $comments)
                        HStack {
                            Text ("ercimmiyal commented on your BeReal.")
                                .foregroundColor (.gray)
                                .font (. system (size: 12))
                                .padding (. leading)
                            Spacer()
                        }
                    }
                    VStack {
                        NotificationButton(icon: "person.2.fill", text: "Friend Request", toggle: $friendRequests)
                        HStack {
                            Text ("ercimmival just sent vou a friend request")
                                .foregroundColor (.gray)
                                .font (. system (size: 12))
                                .padding (. leading)
                            Spacer()
                        }
                    }
                    VStack {
                        NotificationButton(icon: "timer", text: "Late BeReal", toggle: $lateBeReal)
                        HStack {
                            Text ("zeymustu just posted late")
                                .foregroundColor (.gray)
                                .font (. system (size: 12))
                                .padding (.leading)
                            Spacer()
                        }
                    }
                    VStack {
                        NotificationButton(icon: "face.smiling.fill", text: "RealMojes", toggle: $realMojis )
                        HStack {
                            Text ("ogulcansatafoglu just reacted to your BeReal.")
                                .foregroundColor (.gray)
                                .font (. system (size: 12))
                                .padding (.leading)
                            Spacer()
                        }
                    }
                    Spacer()
                    WhiteButtonView(buttonActive: $buttonActive, text: "Sava")
                        .onChange (of: mentions || comments || friendRequests ||
                                   lateBeReal || realMojis) { _ in
                            buttonActive = true
                        }
               
                }
                .padding(.top, 50)
                .padding(.horizontal)
               
               
            }
        }
        }
}

struct Notifications_Previews: PreviewProvider {
    static var previews: some View {
        Notifications()
    }
}
