//
//  ContentView.swift
//  AutoOffice
//
//  Created by Илья Проскурнев on 10.09.2021.
//

import SwiftUI

struct ContentView: View {
    @State var idshoop = ""
    @State var login = ""
    @State var password = ""
    @State var passShow = false

    var body: some View {
        VStack {
            Text("АвтоОфис")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding(.all)


            VStack {
                Text("ID магазина")
                    .multilineTextAlignment(.center)
                    .padding(.bottom)

                TextField("Введите ID магазина", text: $idshoop)
                    .padding(.leading)
            }

            VStack {
                Text("Логин")
                    .multilineTextAlignment(.center)
                    .padding(.bottom)

                TextField("Введите логин", text: $login)
                    .padding(.leading)
            }
            .padding(.all)

            VStack {
                Text("Пароль")
                    .multilineTextAlignment(.center)
                    .padding(.bottom)

                HStack {
                    TextField("Введите пароль", text: $password)
                        .padding(.leading)
                    Button(action: { passShow.toggle() }, label: {
                        if (!passShow) {
                            Image(systemName: "eye_closed")
                        } else {
                            Image(systemName: "eye")
                        }
                    })
                }
            }
            .padding(.all)

            VStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Войти")
                })
                .padding(.all)
                Button(action: {}, label: {
                    Text("Забыли пароль")
                })
                .padding(.all)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Помощь")
                })
                .padding(.all)
            }

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
