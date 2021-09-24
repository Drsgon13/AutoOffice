//
//  GoodsView.swift
//  AutoOffice
//
//  Created by Илья Проскурнев on 16.09.2021.
//

import SwiftUI
import AutoOfficeUI
import Networking

final class GoodsViewModel: ObservableObject {

    @Published var goodsList: [GoodsInfo] = .init()
    @ObservedObject var userDefault = UserDefaultData()

    init() {
        GoodsAPI.getUserGoods(goods: Goods(login: userDefault.login, password: userDefault.password, method: "getUserGoods")) { list, error in
            if let list = list {
                self.goodsList.append(contentsOf: list)
            } else {
                if let error = error {
                    print("Error = ", error.localizedDescription)
                }
            }
        }
    }

}

struct GoodsView: View {
    @StateObject var listViewModel = GoodsViewModel()
    @Binding var showMenu: Bool

    var body: some View {
        VStack {

            VStack(spacing: 0){

                HStack{

                    Button {
                        withAnimation{showMenu.toggle()}
                    } label: {
                        Image("profile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                    }

                    Spacer()

                }

                .padding([.leading, .trailing])

                Divider()
            }
            .background(Color(.blue))

            List(listViewModel.goodsList) { item in
                if (item.idTraining == nil) {
                    GoodScreen(idgoods: String(item.idGoods!), image: String(item.image!), goods: String(item.goods!))

                }
                if (item.idTraining != nil) {
                    LessonsScreen(image: String(item.image!), goods: String(item.goods!), id_traning: String(item.idTraining!))

                }
            }
        }
    }
}

struct GoodsView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}

struct GoodScreen: View {

    @State var image: String
    @State var idgoods: String
    @State var goods: String


    init(idgoods: String, image: String, goods: String) {
        self.idgoods = idgoods
        self.image = image
        self.goods = goods
    }

    var body: some View {
        NavPushButton(destination: GoodView(idgoods: idgoods)) {
            VStack {
                Text("Good")
            HStack {
                if (image != "") {
                let imgURL = URL(string: image)
                AsyncImage(url: imgURL!,
                           placeholder: { Text("Loading ...") },
                           image: { Image(uiImage: $0).resizable() })
                    .frame(width: 80, height: 80)
                Text(verbatim: goods)
                }
            }
            }
        }
    }
}

struct LessonsScreen: View {

    @State var image: String
    @State var goods: String
    @State var id_traning: String


    init(image: String, goods: String, id_traning: String) {
        self.image = image
        self.goods = goods
        self.id_traning = id_traning
    }

    var body: some View {
        NavPushButton(destination: LessonsView(id_traning: id_traning)) {
            VStack {
                Text("Lessons")
            HStack {
                if (image != "") {
                let imgURL = URL(string: image)
                AsyncImage(url: imgURL!,
                           placeholder: { Text("Loading ...") },
                           image: { Image(uiImage: $0).resizable() })
                    .frame(width: 80, height: 80)
                Text(verbatim: goods)
            }
            }
            }
        }
    }
}
