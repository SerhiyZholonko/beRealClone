//
//  EditProfile.swift
//  BeRealClone
//
//  Created by apple on 08.10.2023.
//

import SwiftUI
import Kingfisher

struct EditProfile: View {
    @State var width = UIScreen.main.bounds.width
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State var fullname: String
    @State var username: String
    @State var bio: String
    @State var location: String
    @State var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State var profileImage: Image?
    @Environment (\.dismiss) var dismiss
    let currentUser: User
    init (currentUser: User) {
        self.currentUser = currentUser
        self._fullname = State(initialValue: currentUser.fullname)
        self._bio = State(initialValue: currentUser.bio ?? "")
        self._username = State(initialValue: currentUser.username ?? "")
        self._location = State(initialValue: currentUser.username ?? "")
    }
    var body: some View {
        VStack {
            ZStack {
                
                Color.black.ignoresSafeArea ()
                VStack {
                    ZStack {
                        HStack {
                            Button {
                               dismiss()
                            } label: {
                                Text ("Cancel")
                                    .foregroundColor (.white)
                            }
                            Spacer ()
                            Button {
                                Task{ await saveData() }
                                dismiss()
                            } label: {
                                Text ("Save")
                                    .foregroundColor (.gray)
                            }

                        }
                        .padding(.horizontal, width * 0.05)
                        Text("Edit Profile")
                            .foregroundColor (.white)
                            .fontWeight(.semibold)
                    }
                    HStack {
                        Spacer()
                        Rectangle()
                            .frame (width: width * 0.95, height: 0.7)
                            .foregroundColor (.gray)
                            .opacity (0.5)
                        
                    }
                    VStack {
                        Button {
                            self.imagePickerPresented.toggle()
                            
                        } label: {
                            
                            ZStack(alignment: .bottomTrailing) {
                                if currentUser.profileImageUrl != nil && profileImage == nil {
                                    if let profileImageUrl = currentUser.profileImageUrl {
                                        KFImage(URL(string: profileImageUrl))
                                            .resizable()
                                            .frame (width: 120, height: 120)
                                            .cornerRadius (60)
                                    }
                                }
                               else  if let image =  profileImage {
                                    image
                                        .resizable()
                                        .frame (width: 120, height: 120)
                                        .cornerRadius (60)
                                } else {
                                    Circle()
                                    .frame (width: 120, height: 120)
                                    .cornerRadius (60)
                                        .foregroundColor (Color (red: 152/255, green: 163/255, blue: 16/255)) .overlay(
                                            Text(viewModel.currentUser!.fullname.prefix(1).uppercased())
                                                .foregroundColor (.white)
                                                .font (.system(size: 55))
                                    )
                                }
                                ZStack {
                                    ZStack {
                                        Circle ()
                                            .frame (width: 34, height: 34)
                                            .foregroundColor (.black)
                                        Circle()
                                            .frame (width: 30, height: 30)
                                            .foregroundColor(.white)
                                        Circle()
                                            .frame (width: 30, height: 30)
                                            .foregroundColor (.black)
                                            .opacity(0.1)
                                        
                                    }
                                    Image(systemName: "camera.fill")
                                        .font(.system(size: 16))
                                        .foregroundColor(.black)
                                        .shadow (color: .white, radius: 1, x: 1,
                                                 y: 1)
                                    
                                }
                            }
                          

                        }
                        .sheet(isPresented: $imagePickerPresented) {
                            loadImage()
                        } content: {
                            ImagePicker(image: $selectedImage)
                        }

                        //Menu
                        VStack {
                            Rectangle()
                                .frame (width: width * 0.9, height: 0.7)
                                .foregroundColor (.gray)
                                .opacity(0.3)
                            HStack {
                                HStack {
                                    Text ("Full Name" )
                                        .foregroundColor (.white)
                                        .font(.system(size: 16))
                                    Spacer()
                                }
                                .frame (width: width * 0.22)
                                HStack {
                                    
                                    TextField("", text: $fullname)
                                        .font (.system(size: 16))
                                        .placeholder (when: fullname.isEmpty) {
                                            Text(viewModel.currentUser!.fullname)
                                                .foregroundColor (.white)
                                                .font (.system(size: 16))
                                            Spacer()
                                        }
                                        .foregroundColor (.white)
                                        .padding (.leading, width * 0.05)
                                        .frame(width: width * 0.63)
                                }
                            }
                            .padding (.horizontal, width * 0.05)
                            .padding (.top, 24)
                            HStack {
                                HStack {
                                    Text ("Username" )
                                        .foregroundColor (.white)
                                        .font(.system(size: 16))
                                    Spacer()
                                }
                                .frame (width: width * 0.22)
                                HStack {
                                    
                                    TextField("", text: $username)
                                        .font (.system(size: 16))
                                        .placeholder (when: fullname.isEmpty) {
                                            Text (viewModel.currentUser!.username ?? "").foregroundColor (.white)
                                                .font (.system(size: 16))
                                             
                                            Spacer()
                                        }
                                        .foregroundColor (.white)
//                                        .padding (.leading, width * 0.05)
                                        .frame(width: width * 0.63)
                                }
                            }
                            Rectangle()
                                .frame (width: width * 0.9, height: 0.7)
                                .foregroundColor (.gray)
                                .opacity(0.3)
                            VStack(alignment: .center) {
                                HStack {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text ("Bio" )
                                                .foregroundColor(.white)
                                                .font(.system(size: 16))
                                            
                                            Spacer()
                                            
                                        }
                                        Spacer()
                                            .padding(.leading)
                                            .frame(width: 80)
                                    }
                                    TextEditor (text: $bio)
                                        .foregroundColor (.white)
                                        .background (.black)
                                        .scrollContentBackground(.hidden)
                                        .padding(.leading, -10)
                                        .padding(.top, -10)
                                }
                                .padding(.leading)
                                .frame(height: 100)
                                .overlay(
                                    VStack {
                                        HStack {
                                            if bio.isEmpty {
                                                Text ("Bio")
                                                    .foregroundColor (.gray)
                                                    .font (.system(size: 16))
                                                    .zIndex (1)
                                                    .padding (.top, 8)
                                                .padding(.leading, 130)
                                            }
                                            Spacer ()
                                        }
                                        .padding(.top, -8)
                                        Spacer ()
                                    }
                                    )
                            }
                        }
                        HStack {
                            HStack {
                                Text ("Location" )
                                    .foregroundColor (.white)
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            .frame (width: width * 0.22)
                            HStack {
                                
                                TextField("", text: $location)
                                    .font (.system(size: 16))
                                    .placeholder (when: fullname.isEmpty) {
                                        Text (viewModel.currentUser!.location ?? "").foregroundColor (.gray)
                                            .font (.system(size: 16))
                                            .padding (.leading, width * 0.05)
                                        Spacer()
                                    }
                                    .foregroundColor(.white)
                                    .frame(width: width * 0.63)
                            }
                        }
                    }
                    .padding (.horizontal, width * 0.05)
                    .padding (.top, 24)
                    Spacer()
                }
            }
        }
    }
    func loadImage() {
        
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
    func saveData() async {
        if viewModel.currentUser!.fullname != self.fullname && self.fullname.isEmpty {
            viewModel.currentUser!.fullname = self.fullname
            await viewModel.saveUserData (data: ["fullname" : self.fullname ])
        }
        if viewModel.currentUser!.username != self.username && !self.username.isEmpty{
            viewModel.currentUser!.username = self.username
            await viewModel.saveUserData(data: ["username" : self.username ])
        }
        if viewModel.currentUser!.bio != self.bio && !self.bio.isEmpty {
            viewModel.currentUser!.bio = self.bio
            await viewModel.saveUserData(data: ["bio" : bio])
        }
        if viewModel.currentUser!.location != self.location && !self.location.isEmpty{
            viewModel.currentUser!.location = self.location
            await viewModel.saveUserData (data: ["location": location])
        }
        if selectedImage != nil {
            viewModel.uploadProfileImage (image: selectedImage!) { url in
                do {
                    Task {viewModel.currentUser!.profileImageUrl = url
                        await viewModel.saveUserData (data: ["profileImageUrl" : url])}
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile(currentUser: User(id: nil, username: nil, profileImageUrl: nil, date: "", fullname: "", bio: nil, location: nil))
    }
}
