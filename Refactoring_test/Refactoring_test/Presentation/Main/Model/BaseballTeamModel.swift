//
//  BaseballTeamModel.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 5/1/25.
//

import UIKit

struct BaseballTeamModel {
    let image: UIImage
}

extension BaseballTeamModel {
    static func dummy() -> [BaseballTeamModel] {
        return [
            BaseballTeamModel(image: .bears),
            BaseballTeamModel(image: .lions),
            BaseballTeamModel(image: .kt),
            BaseballTeamModel(image: .nc),
            BaseballTeamModel(image: .eagles),
            BaseballTeamModel(image: .giants)
        ]
    }
}
