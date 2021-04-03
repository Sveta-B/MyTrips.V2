//
//  AuthError.swift
//  MyTrips.V2
//
//  Created by Света Брасс on 19.03.21.
//


import Foundation

enum AuthError {
    case notFilled
    case invalidEmail
    case unknownError
    case serverError
    case photoNotExist
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .invalidEmail:
            return NSLocalizedString("Не верный логин или пароль", comment: "")
        case .unknownError:
            /// we will use server_error key to display user internal error
            return NSLocalizedString("server_error", comment: "")
        case .serverError:
            return NSLocalizedString("server_error", comment: "")
            case .photoNotExist:
            return NSLocalizedString("Пользователь не выбрал фотографию", comment: "")
        }
    }
}
