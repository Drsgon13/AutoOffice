//
//  SideMenu.swift
//  AutoOffice
//
//  Created by Илья Проскурнев on 24.09.2021.
//

import SwiftUI
import AutoOfficeUI

struct SideMenu: View {
    @Binding var showMenu: Bool
    @ObservedObject var userDefault = UserDefaultData()
    @State var showHelp = true
    var body: some View {

        VStack(alignment: .leading, spacing: 0) {

            VStack(alignment: .leading, spacing: 15) {


                if (userDefault.imageProfile == nil) {
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 65, height: 65)
                        .clipShape(Circle())
                } 

                Text("iJustine")
                    .font(.title2.bold())

                Text("@ijustine")
                    .font(.callout)
            }
            .padding()
            .padding(.leading)

            ScrollView(.vertical, showsIndicators: false) {

                VStack(spacing: 10){

                    VStack(spacing: 45) {

                        NavPushButton(destination: HelpView()) {
                            HStack(spacing: 14){

                                Image(systemName: "questionmark.circle")
                                    .resizable()
                                    .renderingMode(.template)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 22, height: 22)

                                Text("Помощь")
                            }
                        }

                    }

                    Divider()
                        .padding(.vertical)

                }
            }
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        // Max Width...
        .frame(width: getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(

            Color.primary
                .opacity(0.04)
                .ignoresSafeArea(.container, edges: .vertical)
        )
        .frame(maxWidth: .infinity,alignment: .leading)
    }

    @ViewBuilder
    func TabButton(title: String, image: String)->some View{

        // For navigation...
        // Simple replace button with Navigation Links...

        NavigationLink {

            if (title == "Помощь") {

                NavPushButton(destination: HelpView()) {
                }
            }

        } label: {

            HStack(spacing: 14){

                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 22, height: 22)

                Text(title)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity,alignment: .leading)
        }
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu(showMenu: .constant(false))
    }
}

// Extenting View to get SCreen Rect...
extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }

    func safeArea()->UIEdgeInsets{
        let null = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return null
        }

        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return null
        }

        return safeArea
    }
}

