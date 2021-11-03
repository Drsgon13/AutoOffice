//
//  ContentView.swift
//  AutoOffice
//
//  Created by Илья Проскурнев on 10.09.2021.
//

import SwiftUI
import AutoOfficeUI
@available(iOS 15.0, *)
struct ContentView: View {

    let userDefault = UserDefaultData()

    var body: some View {
        VStack{
            if userDefault.status {
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

            }
        }
    }
}
@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
