//
//  ImageUploader.swift
//  BeRealClone
//
//  Created by apple on 28.10.2023.
//

import UIKit
import Firebase
import FirebaseStorage

enum UploadType {
    case profile
    case post
    
    var filePath: StorageReference {
        let filename = NSUUID() . uuidString
        switch self {
        case .profile:
            return Storage.storage().reference(withPath: "/profile_images/\(filename) ")
        case .post:
            return Storage.storage().reference(withPath: "/post_images/\(filename) ")
        }
    }
}

struct ImageUploader {
    static func uploadImage(image: UIImage, type: UploadType, completion: @escaping (String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let ref = type.filePath
        ref.putData(imageData, metadata: nil) { (metadata, error) in
            if let error = error {
                print("Error uploading image: \(error.localizedDescription)")
                return
            }
            
            // Image uploaded successfully
            ref.downloadURL { url, error in
                guard let downloadURL = url?.absoluteString else {
                    print("Error getting download URL")
                    return
                }
                completion(downloadURL)
                
                // Handle the downloadURL as needed (e.g., save it to a database)
                print("Image uploaded successfully. Download URL: \(downloadURL)")
            }
        }
    }
}
