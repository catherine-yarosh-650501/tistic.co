//
//  Person.swift
//  tistic.co
//
//  Created by Yan Khamutouski on 10/30/18.
//  Copyright © 2018 Yan Khamutouski. All rights reserved.
//

import Foundation
import UIKit
import HealthKit
import Contacts

class Person {
    
    static func getInstance() -> Person {
        return Person()
    }
    
    private var image: Data
    private var name: String
    private var surname: String
    private var birthday: String
    var basicInfo: BasicMedInfo
    var dentalData: DentalInfo
    
    private init() {
        //получить информацию о владельце телефона
        //поиск по контактам
        //фоточку и фамилию
        //затем дернуть функцию чтения из hk  рост вес дата рождения группа крови пол
        
        self.image = Data()
        self.name = "none"
        self.surname = "none"
        self.birthday = "none"
        
        self.basicInfo = BasicMedInfo()
        self.dentalData = DentalInfo()
        do {
            self.birthday = try getAge()
            var temp = matches(for: ".+?(?=’)", in: UIDevice.current.name)
            self.name = temp[0]
            var myInfo = searchContact(searchString: temp[0])
            let my = myInfo[0]
            if my.imageData != nil {
                self.image = my.imageData!
                self.surname = my.familyName
                    }
        }catch let error {
            print(error)
        }
    }
    
    func getImage() -> Data {
        return self.image
    }
    func getName() -> String {
        return self.name
    }
    func getSurname() -> String {
        return self.surname
    }
    func getBirthday() -> String {
        return self.birthday

    }
    func getDentalInfo() -> [Int: String] {
        //generate concatenated dict
        return [0 : "none"]
    }
    func getAge() throws -> String {
            
            let healthKitStore = HKHealthStore()
            do {
                let birthdayComponents = try healthKitStore.dateOfBirthComponents()
            
                let today = Date()
                let calendar = Calendar.current
                let todayDateComponents = calendar.dateComponents([.year],
                                                                  from: today)
                let thisYear = todayDateComponents.year!
                let age = thisYear - birthdayComponents.year!
                
                var unwrappedAge = String()
                
                unwrappedAge.append(String(birthdayComponents.day!))
                unwrappedAge.append("/")
                unwrappedAge.append(String(birthdayComponents.month!))
                unwrappedAge.append("/")
                unwrappedAge.append(String(birthdayComponents.year!))
                unwrappedAge.append(" (")
                unwrappedAge.append(String(age))
                unwrappedAge.append(" years old)")
                
                return unwrappedAge
            }
    }
    func matches(for regex: String, in text: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    func searchContact(searchString: String) -> [CNContact] {
        //Fetch
        let contactStore: CNContactStore = CNContactStore()
        var contacts: [CNContact] = [CNContact]()
        let fetchRequest: CNContactFetchRequest = CNContactFetchRequest(keysToFetch: [CNContactVCardSerialization.descriptorForRequiredKeys()])
        
        do {
            try contactStore.enumerateContacts(with: fetchRequest, usingBlock: {
                contact, _ in
                contacts.append(contact) })
            
        } catch {
            print("Get contacts \(error)")
        }
        
        //Search
        var resultArray: [CNContact] = [CNContact]()
        
        for item in contacts {
            if item.givenName == searchString {
                resultArray.append(item)
            }
        }
        let withoutDuplicates: [CNContact] = [CNContact](Set(resultArray))
        return withoutDuplicates
        
    }
}


