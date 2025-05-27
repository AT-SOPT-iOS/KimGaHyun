//
//  TodayTvingModel.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 5/1/25.
//

import UIKit

struct TodayTvingModel {
    let rank: String
    let image: UIImage
}

extension TodayTvingModel {
    static func dummy() -> [TodayTvingModel] {
        return [
            TodayTvingModel(rank: "1", image: .today1),
            TodayTvingModel(rank: "2", image: .today2),
            TodayTvingModel(rank: "3", image: .today3),
            TodayTvingModel(rank: "4", image: .today4),
            TodayTvingModel(rank: "5", image: .nctLife)
        ]
    }
}
