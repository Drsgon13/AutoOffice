//
//  ContentView.swift
//  AutoOffice
//
//  Created by Илья Проскурнев on 10.09.2021.
//

import SwiftUI
import AutoOfficeUI

struct ContentView: View {

    @StateObject var userData = UserDefaultData()

    var body: some View {
        VStack{
            if userData.status{
                NavControllerView(transition: .custom(.moveAndFade)) {
                    BaseView()
                }
            }
            else{
                NavControllerView(transition: .custom(.moveAndFade)) {
                    SignInView()
                }
            }
        }.animation(.spring())
            .onAppear {
                NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                    userData.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
