//
//  HelpView.swift
//  AutoOffice
//
//  Created by Илья Проскурнев on 14.09.2021.
//

import SwiftUI
import Networking

final class NewsScreenViewModel: ObservableObject {
    @Published var newsList: String = .init()

    init() {
        HelpAPI.getHelp { list, error in
            self.newsList = (list?.content)!
        }
    }
}

struct HelpView: View {
    @StateObject var listViewModel = NewsScreenViewModel()

    var body: some View {
        ZStack {
            WebView(htmlString: listViewModel.newsList)
        }

    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
