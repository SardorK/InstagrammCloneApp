//
//  DatabaseManager.swift
//  InstagrammCloneApp
//
//  Created by User 2 on 08/02/23.
//

import FirebaseDatabase

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    //MARK: Public
    
    /// Check username and email are available
    ///- Parameters
    ///    -email: String representing email
    ///    -username: String representing username
    
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void){
        completion(true)
    }
    
    /// Insert new user data to database
    ///- Parameters
    ///    -email: String representing email
    ///    -username: String representing username
    
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void){
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            if error == nil{
                completion(true)
                return
            }else{
                completion(false)
                return
            }
        }
    }
}

