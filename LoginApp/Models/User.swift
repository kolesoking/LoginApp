//
//  User.swift
//  LoginApp
//
//  Created by катя on 23.03.2022.
//

import CoreGraphics

struct User {
    let login: String
    let password: String
    let infoUser: InfoUser
    
    static func getUser() -> User {
        User(
            login: "User",
            password: "1234",
            infoUser: InfoUser.getInfoUser()
        )
    }
}

struct InfoUser {
    let name: String
    let surname: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    let age: Int
    let photo: String
    let interests: String
    let aboutMe: String
    
    static func getInfoUser() -> InfoUser {
        InfoUser(
            name: "Sergey",
            surname: "Kolesnikov",
            age: 22,
            photo: "photoUser",
            interests: "У меня много интересов и увлечений, нет какого-то одного. Занимаюсь разными вещами от рыбалки, до скейтбординга",
            aboutMe: "Живу в Воронеже, уже 3 года занимаюсь мужскими стрижками. Моей давней мечтой является программирование, потихоньку осваиваю курс IOS Разработчик с нуля, на платформе SwiftBook!"
        )
    }
    
}
