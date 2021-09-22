//
//  GoodView.swift
//  AutoOffice
//
//  Created by Илья Проскурнев on 21.09.2021.
//

import SwiftUI
import AutoOfficeUI

struct GoodView: View {
    
    @State var idgoods: String

    init(idgoods: String) {
        self.idgoods = idgoods
    }

    var body: some View {
        VStack {
            HStack {
                NavPopButton(destination: .root){
                    Image(systemName: "arrow.left")
                    Text("Назад")
                }
            }
            .padding(.top, 5.0)
            .padding(.leading, 12.0)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct GoodView_Previews: PreviewProvider {
    static var previews: some View {
        GoodView(idgoods: "0")
    }
}
