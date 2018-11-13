//
//  HealthKitExtensions.swift
//  tistic.co
//
//  Created by Yan Khamutouski on 11/3/18.
//  Copyright © 2018 Yan Khamutouski. All rights reserved.
//

import HealthKit

extension HKBloodType {
    var stringRepresentation: String {
        switch self {
        case .notSet: return "Unknown"
        case .aPositive: return "A(II)Rh+"
        case .aNegative: return "A(II)Rh-"
        case .bPositive: return "B(III)Rh+"
        case .bNegative: return "B(III)Rh-"
        case .abPositive: return "AB(IV)Rh+"
        case .abNegative: return "AB(IV)Rh-"
        case .oPositive: return "O(I)Rh+"
        case .oNegative: return "O(I)Rh-"
        }
    }
}

extension HKBiologicalSex {
    var stringRepresentation: String {
        switch self {
        case .notSet: return "Unknown"
        case .female: return "Female"
        case .male: return "Male"
        case .other: return "Other"
        }
    }
}

