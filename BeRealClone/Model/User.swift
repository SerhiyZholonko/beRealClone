//
//  User.swift
//  BeRealClone
//
//  Created by apple on 22.10.2023.
//



import Firebase
import FirebaseFirestoreSwift
struct User: Codable, Identifiable {
//    @DocumentID
    var id: String?
    var username: String?
    var profileImageUrl: String?
    var date: String
    var fullname: String
    var bio: String?
    var location: String?
}
