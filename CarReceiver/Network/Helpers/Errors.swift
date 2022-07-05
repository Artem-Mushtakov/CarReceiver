//
//  Errors.swift
//  CarReceiver
//
//  Created by EDUARD Latynsky on 19.06.2022.
//

import Foundation

enum AuthErrors: LocalizedError {
    case badEmail
    case badPassword
    case passwordsNotMatched
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .badEmail:
            return NSLocalizedString("", comment: "Пожалуйста, введите корректный e-mail")
        case .badPassword:
            return NSLocalizedString("", comment: "Пароль должен иметь 6 или более символов")
        case .passwordsNotMatched:
            return NSLocalizedString("", comment: "Пароли должны совпадать")
        case .unknownError:
            return NSLocalizedString("", comment: "Неизвестная ошибка")
        }
    }
}
