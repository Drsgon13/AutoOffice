//
//  SignInView.swift
//  AutoOffice
//
//  Created by Илья Проскурнев on 10.09.2021.
//

import SwiftUI

struct SignInView: View {
    @State var idshoop = ""
    @State var login = ""
    @State var password = ""
    @State var passShow = false
    @State var checked = true

    @State var trimVal: CGFloat = 0

    var body: some View {
        VStack {
            Text("АвтоОфис")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding(.all)

            VStack (alignment: .leading) {
                VStack (alignment: .leading) {
                    Text("ID магазина")
                        .multilineTextAlignment(.center)

                    TextField("Введите ID магазина", text: $idshoop)
                        .autocapitalization(.none)
                    Divider()
                }
                .padding(.bottom)

                VStack(alignment: .leading) {
                    Text("Логин")
                        .multilineTextAlignment(.center)

                    TextField("Введите логин", text: $login)
                    Divider()

                }
                .padding(.bottom)

                VStack(alignment: .leading) {
                    Text("Пароль")
                        .multilineTextAlignment(.center)

                    HStack {
                        TextField("Введите пароль", text: $password)
                        Button(action: { passShow.toggle() }, label: {
                            Image(systemName: self.passShow ? "eye.slash" : "eye")
                                .accentColor(.gray)
                        })
                    }
                    Divider()
                }

                VStack(alignment: .leading) {
                    Button(action: {
                        if !self.checked {
                            withAnimation(Animation.easeIn(duration: 0.8)) {
                                self.trimVal = 1
                                self.checked.toggle()
                            }
                        } else {
                            withAnimation {
                                self.trimVal = 0
                                self.checked.toggle()
                            }
                        }
                    }, label: {
                        HStack {
                            CheckBoxView(checked: $checked, trimVal: $trimVal)
                            Text("Запомнить")
                        }
                    })
                }
            }
            .padding(.horizontal)

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

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
