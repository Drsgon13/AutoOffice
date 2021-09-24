//
//  LessonView.swift
//  AutoOffice
//
//  Created by Илья Проскурнев on 22.09.2021.
//

import SwiftUI
import AutoOfficeUI

struct LessonView: View {

    @State var id_training_lessons: String

    init(id_training_lessons: String) {
        self.id_training_lessons = id_training_lessons
    }

    var body: some View {
        VStack {
            HStack {
                NavPopButton(destination: .root){
                    Image(systemName: "arrow.left")
                    Text("В самое начало")
                }
                NavPopButton(destination: .previous){
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

struct LessonView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView(id_training_lessons: "0")
    }
}
