//
//  SponsorModel.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 5/1/25.
//

import UIKit

struct SponsorModel {
    let image: UIImage
}

extension SponsorModel {
    static func dummy() -> [SponsorModel] {
        return [
            SponsorModel(image: .KBO),
            SponsorModel(image: .KBL),
            SponsorModel(image: .appleTV),
            SponsorModel(image: .AFC)
        ]
    }
}
