//
//  File.swift
//  
//
//  Created by Илья Проскурнев on 20.09.2021.
//

import SwiftUI

public extension AnyTransition {

    public static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading).combined(with: .opacity)
        let removal = AnyTransition.scale.combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }

}
