//
//  FirebaseManager.swift
//  CarReceiver
//
//  Created by EDUARD Latynsky on 19.06.2022.
//

import Foundation
import FirebaseAuth

final class FirebaseManager {
    
    // MARK: - Properties
    private var validator = Validator()
    
    static let shared = FirebaseManager()
    let auth = Auth.auth()
    
    private init() {}
    
    //MARK: - Methods
    
    func registration(_ email: String,_ password: String,_ confirmPassword: String, completion: @escaping(Result<NewUser,AuthErrors>) -> ()) {
        guard validator.checkEmail(email) else {
            completion(.failure(.badEmail))
            return
        }
        
        guard validator.checkPasswords(password, confirmPassword) else {
            completion(.failure(.badPassword))
            return
        }
        
        guard validator.checkPasswordForMatch(password, confirmPassword) else {
            completion(.failure(.passwordsNotMatched))
            return
        }
        
        auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error)
                completion(.failure(.unknownError))
            }
            let newUser = NewUser(login: email, password: password)
            completion(.success(newUser))
        }
    }
}

struct NewUser {
    let login: String
    let password: String
}
