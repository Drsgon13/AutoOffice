//
//  HelpView.swift
//  AutoOffice
//
//  Created by Илья Проскурнев on 14.09.2021.
//

import SwiftUI
import Networking

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
        ZStack {
            WebView(htmlString: helpViewModel.helpContent)
//            Text(String(helpViewModel.helpContent))
        }

    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
