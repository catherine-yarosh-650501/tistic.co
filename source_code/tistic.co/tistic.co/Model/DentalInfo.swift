//
//  DentalInfo.swift
//  tistic.co
//
//  Created by Yan Khamutouski on 10/30/18.
//  Copyright © 2018 Yan Khamutouski. All rights reserved.
//

import Foundation

public class DentalInfo: Codable {
    private var upperJaw : [Int : String]
    private var lowerJaw : [Int : String]
    
    func getUpperJawInfo() -> [(Int, String)] {
        var tuples = [(Int, String)]()
        for (key, value) in self.upperJaw {
            tuples.append((key, value))
        }
        return tuples
    }
    func getLowerJawInfo() -> [(Int, String)] {
        var tuples = [(Int, String)]()
        for (key, value) in self.lowerJaw {
            tuples.append((key, value))
        }
        return tuples
    }
    
    func setUpperJawInfo(tuples: [(Int, String)]) {
        if tuples.count == 0 {
            self.upperJaw = [:]
        }
        tuples.forEach {
            self.upperJaw[$0.0] = $0.1
        }
    }
    func setLowerJawInfo(tuples: [(Int, String)]) {
        if tuples.count == 0 {
            self.lowerJaw = [:]
        }
        tuples.forEach {
            self.lowerJaw[$0.0] = $0.1
        }
    }
    
    func readData() {
        if Storage.fileExists("MedicalInformation.json", in: .documents) == true {
            let temp = Storage.retrieve("MedicalInformation.json", from: .documents, as: DentalInfo.self)
            self.upperJaw = temp.upperJaw
            self.lowerJaw = temp.lowerJaw
        }
    }
    
    func writeData() {
       Storage.store(self, to: .documents, as: "MedicalInformation.json")
    }
    init () {
        self.lowerJaw = [:]
        self.upperJaw = [:]
        readData()
    }
}
