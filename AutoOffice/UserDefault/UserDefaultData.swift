//
//  UserDefaultData.swift
//  AutoOffice
//
//  Created by Илья Проскурнев on 16.09.2021.
//

import Foundation

public class UserDefaultData: ObservableObject {

    @Published var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    @Published var idshop = UserDefaults.standard.value(forKey: "idshop") as? String ?? "sheremetev"
    @Published var login = UserDefaults.standard.value(forKey: "login") as? String
    @Published var password = UserDefaults.standard.value(forKey: "password") as? String

}
