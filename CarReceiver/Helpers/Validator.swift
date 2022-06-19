//
//  Validator.swift
//  CarReceiver
//
//  Created by EDUARD Latynsky on 19.06.2022.
//

import Foundation

protocol ValidatorProtocol {
    func checkEmail(_ email: String) -> Bool
    func checkPasswords(_ password: String, _ confirmPassword: String) -> Bool
    func checkPasswordForMatch(_ password: String, _ confirmPassword: String) -> Bool
}

class Validator: ValidatorProtocol {
    
    func checkEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func checkPasswords(_ password: String, _ confirmPassword: String) -> Bool {
        guard password.count >= 6,
              confirmPassword.count >= 6 else { return false }
        return true
    }
    func checkPasswordForMatch(_ password: String, _ confirmPassword: String) -> Bool {
        guard password == confirmPassword else { return false }
        return true
    }
    
}
