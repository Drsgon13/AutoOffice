//
//  HelpView.swift
//  AutoOffice
//
//  Created by Илья Проскурнев on 14.09.2021.
//

import SwiftUI
import Networking
import AutoOfficeUI

final class HelpModel: ObservableObject {
    @Published var helpContent: String = .init()
    init() {
        HelpAPI.getHelp() { help, error in
            self.helpContent = (help?.content)!
        }
    }
}

struct HelpView: View {
    @StateObject var helpViewModel = HelpModel()

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
            WebView(htmlString: helpViewModel.helpContent)
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
