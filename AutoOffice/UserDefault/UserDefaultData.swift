//
//  UserDefaultData.swift
//  AutoOffice
//
//  Created by Илья Проскурнев on 16.09.2021.
//

import Foundation

public class UserDefaultData: ObservableObject {

    let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    let idshoop = UserDefaults.standard.value(forKey: "idshoop") as? String ?? "sheremetev"
    let login = UserDefaults.standard.value(forKey: "login") as? String
    let password = UserDefaults.standard.value(forKey: "password") as? String

    let imageProfile = UserDefaults.standard.value(forKey: "imageProfile") as? String
    let phoneProfile = UserDefaults.standard.value(forKey: "phone") as? String
    let lastNameProfile = UserDefaults.standard.value(forKey: "lastName") as? String
    let firstNameProfile = UserDefaults.standard.value(forKey: "firstName") as? String

}

