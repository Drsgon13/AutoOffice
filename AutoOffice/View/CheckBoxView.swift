//
//  ChebBoxView.swift
//  AutoOffice
//
//  Created by Илья Проскурнев on 10.09.2021.
//

import SwiftUI

struct CheckBoxView: View {
    @Binding var checked: Bool
    @Binding var trimVal: CGFloat

    var animatableData: CGFloat{
        get {trimVal}
        set {trimVal = newValue}
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .trim(from: 0, to: trimVal)
                .stroke(style:StrokeStyle(lineWidth: 2))
                .frame(width: 40, height: 40)
                .foregroundColor(checked ? Color.green : Color.gray.opacity(0.2))
            RoundedRectangle(cornerRadius: 10)
                .trim(from: 0, to: 1)
                .fill(checked ? Color.green : Color.gray.opacity(0.2))
                .frame(width: 30, height: 30)
            if checked {
                Image(systemName: "checkmark")
                    .foregroundColor(Color.white)
            }
        }
    }
}


