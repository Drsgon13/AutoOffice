//
//  GoodsView.swift
//  AutoOffice
//
//  Created by Илья Проскурнев on 16.09.2021.
//

import SwiftUI
import AutoOfficeUI


struct GoodsView: View {
    var body: some View {
        ButtonCustom(action: {}) {
            VStack {
                Text("I'm Button")
            }
        }
    }
}

struct GoodsView_Previews: PreviewProvider {
    static var previews: some View {
        GoodsView()
    }
}
