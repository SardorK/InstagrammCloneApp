//
//  StorageManager.swift
//  InstagrammCloneApp
//
//  Created by User 2 on 08/02/23.
//

import FirebaseStorage
import Foundation

public class StorageManager {
    
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
    public enum IGStorageManagerError: Error{
        case failedToDownload
    }
    
    public func uploadUserPost(model: UserPost, completion: @escaping(Result<URL, Error>) -> Void){
        
    }
    
    public func downloadImage(with referance: String, completion: @escaping(Result<URL, IGStorageManagerError>) -> Void){
        bucket.child(referance).downloadURL { url, error in
            guard let url = url, error == nil else{
                completion(.failure(.failedToDownload))
                return
            }
            completion(.success(url))
        }
    }
 
}
