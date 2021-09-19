//
//  SignInView.swift
//  AutoOffice
//
//  Created by Илья Проскурнев on 10.09.2021.
//

import SwiftUI
import Networking
import AutoOfficeUI

struct SignInView: View {

    @StateObject var userData = UserDefaultData()

    @State var idshop = ""
    @State var login = ""
    @State var password = ""
    @State var passShow = false
    @State var checked = true

    @State var method: String = "getUserData"

    @State var shoowHelp = false

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

                    TextField("Введите ID магазина", text: $idshop)
                        .autocapitalization(.none)
                    Divider()
                }
                .padding(.bottom)

                VStack(alignment: .leading) {
                    Text("Логин")
                        .multilineTextAlignment(.center)

                    TextField("Введите логин", text: $login)
                        .autocapitalization(.none)
                    Divider()

                }
                .padding(.bottom)

                VStack(alignment: .leading) {
                    Text("Пароль")
                        .multilineTextAlignment(.center)

                    HStack {
                        if passShow {
                            TextField("Введите пароль", text: $password)
                                .autocapitalization(.none)
                        } else {
                            SecureField("Введите пароль", text: $password)
                                .autocapitalization(.none)
                        }
                        Button(action: { passShow.toggle() }, label: {
                            Image(systemName: self.passShow ? "eye.slash" : "eye")
                                .accentColor(.gray)
                        })
                    }
                    Divider()
                }

            }
            .padding(.horizontal)

            VStack (alignment: .center) {
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

                Button(action: {
                    entranceUser()
                }, label: {
                    Text("Войти")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 120)
                })
                .padding(.all)
                .background(Color("blue"))
                .clipShape(Capsule())
                Button(action: {}, label: {
                    Text("Забыли пароль")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 120)
                })
                .padding(.all)
                .background(Color("blue"))
                .clipShape(Capsule())
                Button(action: {
                    shoowHelp.toggle()
                }, label: {
                    Text("Помощь")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 120)
                })
                .fullScreenCover(isPresented: self.$shoowHelp, content:{
                    HelpView()
                })
                .padding(.all)
                .background(Color("blue"))
                .clipShape(Capsule())
            }
            .padding(.horizontal)

        }
    }

    func entranceUser() {
        self.idshop = self.idshop.trimmingCharacters(in: .whitespaces)
        self.login = self.login.trimmingCharacters(in: .whitespaces)
        self.password = self.password.trimmingCharacters(in: .whitespaces)
        
        UserAPI.getUserData(user: User.init(login: login, password: password, method: method))
        { user, error in
            if (user?.error == "") {
                if(checked) {
                    UserDefaults.standard.set(true, forKey: "status")
                }
                UserDefaults.standard.set(self.idshop, forKey: "idshop")
                UserDefaults.standard.set(self.login, forKey: "login")
                UserDefaults.standard.set(self.password, forKey: "password")
            }
            
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
