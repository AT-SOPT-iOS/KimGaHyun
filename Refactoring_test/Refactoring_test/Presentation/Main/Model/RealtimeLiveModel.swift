//
//  realtimeLiveModel.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 5/1/25.
//

import UIKit

struct RealtimeLiveModel {
    let image: UIImage
    let rank: String
    let title: String
    let detailInfo: String
    let percentage: String
}

extension RealtimeLiveModel {
    static func dummy() -> [RealtimeLiveModel] {
        return [
            RealtimeLiveModel(image: .chnageLover, rank: "1", title: "JTBC", detailInfo: "환승연애 4화", percentage: "27.2%"),
            RealtimeLiveModel(image: .askingStar, rank: "2", title: "별들에게물어봐", detailInfo: "별들에게물어 2화", percentage: "24.2%"),
            RealtimeLiveModel(image: .hesmine, rank: "3", title: "선재업고튀어", detailInfo: "선재업고튀어 5화", percentage: "21.3%"),
            RealtimeLiveModel(image: .playground, rank: "4", title: "지구뿅뿅오락실", detailInfo: "지구뿅뿅오락실 1화", percentage: "17.2%")
        ]
    }
}
