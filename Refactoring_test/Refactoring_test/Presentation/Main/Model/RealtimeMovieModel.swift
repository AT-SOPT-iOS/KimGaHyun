//
//  RealtimeMovieModel.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 5/1/25.
//

import UIKit

struct RealtimeMovieModel {
    let image: UIImage
}

extension RealtimeMovieModel {
    static func dummy() -> [RealtimeMovieModel] {
        return [
            RealtimeMovieModel(image: .today1),
            RealtimeMovieModel(image: .today2),
            RealtimeMovieModel(image: .today3),
            RealtimeMovieModel(image: .today4)
        ]
    }
}
