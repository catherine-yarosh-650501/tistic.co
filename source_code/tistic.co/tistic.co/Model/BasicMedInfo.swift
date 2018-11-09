//
//  BasicMedInfo.swift
//  tistic.co
//
//  Created by Yan Khamutouski on 10/30/18.
//  Copyright © 2018 Yan Khamutouski. All rights reserved.
//

import Foundation
import HealthKit

public class BasicMedInfo: Codable {
    
    private var diseases: String
    private var allergy: String
    private var medicaments: String
    private var weight: Double
    private var height: Double
    private var bloodType: String
    private var sex: String
    
    init() {
        self.diseases = "none"
        self.allergy = "none"
        self.medicaments = "none"
        self.weight = 0
        self.height = 0
        self.bloodType = "none"
        self.sex = "none"
        self.getHKWeightAndHeight()
        readData()
        do {
            let temp = try getSexAndBloodType()
            self.bloodType = temp.bloodType.stringRepresentation
            self.sex = temp.biologicalSex.stringRepresentation
        } catch let error {
            print(error)
        }
    }
    
    func setDiseases(text: String) {
        self.diseases = text
    }
    
    func getDiseases() -> String {
        return self.diseases
    }
    
    func setAllergy(text: String) {
        self.allergy = text
    }
    
    func getAllergy() -> String {
        return self.allergy
    }
    
    func setMedicaments(text: String) {
        self.medicaments = text
    }
    
    func getMedicaments() -> String {
        return self.medicaments
    }
    
    func getWeight() -> Double {
        return self.weight
    }
    
    func getHeight() -> Double {
        return self.height
    }
    
    func getBloodType() -> String {
        return self.bloodType
    }
    
    func getBiologicalSex() -> String {
        return self.sex
    }
    
    func readData() {
        
        if Storage.fileExists("Diagnoses.json", in: .documents) == true {
            let temp = Storage.retrieve("Diagnoses.json", from: .documents, as: BasicMedInfo.self)
            self.diseases = temp.diseases
            self.allergy = temp.allergy
            self.medicaments = temp.medicaments
            self.weight = temp.weight
            self.height = temp.height
            self.bloodType = temp.bloodType
            self.sex = temp.sex
        } else {
            return
        }
    }
    
    func writeData() {
        
        Storage.store(self, to: .documents, as: "Diagnoses.json")
    }
    
    private func getSexAndBloodType() throws -> (biologicalSex: HKBiologicalSex,
        bloodType: HKBloodType) {
            let healthKitStore = HKHealthStore()
            do {
                let biologicalSex = try healthKitStore.biologicalSex()
                let bloodType = try healthKitStore.bloodType()
                
                let unwrappedBiologicalSex = biologicalSex.biologicalSex
                let unwrappedBloodType = bloodType.bloodType
                
                return (unwrappedBiologicalSex, unwrappedBloodType)
            }
    }

    private func getHKWeightAndHeight() {
       
        guard let weightSampleType = HKSampleType.quantityType(forIdentifier: .bodyMass) else {
            print("Body Mass Sample Type is no longer available in HealthKit")
            return
        }
        
        guard let heightSampleType = HKSampleType.quantityType(forIdentifier: .height) else {
            print("Height Sample Type is no longer available in HealthKit")
            return
        }
        
        self.getMostRecentSample(for: weightSampleType) { (sample, error) in
            guard let sample = sample else {
                if let error = error {
                    print(error)
                }
                
                return
            }
            
            let weightInKilograms = sample.quantity.doubleValue(for: HKUnit.gramUnit(with: .kilo))
            self.weight = weightInKilograms
        }
        
        self.getMostRecentSample(for: heightSampleType) { (sample, error) in
            guard let sample = sample else {
                if let error = error {
                    print(error)
                }
                
                return
            }
            
            let heightInMeters = sample.quantity.doubleValue(for: HKUnit.meter()) * 100
            self.height = heightInMeters
        }
    }
    
    private func getMostRecentSample(for sampleType: HKSampleType,
                             completion: @escaping (HKQuantitySample?, Error?) -> Swift.Void) {
        
        let mostRecentPredicate = HKQuery.predicateForSamples(withStart: Date.distantPast,
                                                              end: Date(),
                                                              options: .strictEndDate)
        
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate,
                                              ascending: false)
        let limit = 1
        let sampleQuery = HKSampleQuery(sampleType: sampleType,
                                        predicate: mostRecentPredicate,
                                        limit: limit,
                                        sortDescriptors: [sortDescriptor]) { (query, samples, error) in
                                                guard let samples = samples,
                                                    let mostRecentSample = samples.first as? HKQuantitySample else {
                                                        
                                                        completion(nil, error)
                                                        return
                                                }
                                                completion(mostRecentSample, nil)
        }
        HKHealthStore().execute(sampleQuery)
    }
}
