//
//  LessonsView.swift
//  AutoOffice
//
//  Created by Илья Проскурнев on 21.09.2021.
//

import SwiftUI
import AutoOfficeUI
import Networking

struct LessonsView: View {

    @State var id_traning: String

    @State var lessonsList: [LessonsInfo] = []
    @ObservedObject var userDefault = UserDefaultData()

    init(id_traning: String) {
        self.id_traning = id_traning
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
            List(lessonsList) { item in
                NavPushButton(destination: LessonView(id_training_lessons: String(item.idTrainingLessons!))) {
                    Text(item.trainingLessons ?? "No title")
                }

            }.onAppear {
                LessonsAPI.getLessons(lessons: Lessons(login: userDefault.login, password: userDefault.password, method: "getLessons", idTraining: id_traning)) { list, error in
                    if let list = list {
                        self.lessonsList.append(contentsOf: list)
                    } else {
                        if let error = error {
                            print("Error = ", error.localizedDescription)
                        }
                    }
                }
            }
        }
    }
}

struct LessonsView_Previews: PreviewProvider {
    static var previews: some View {
        LessonsView(id_traning: "0")
    }
}
