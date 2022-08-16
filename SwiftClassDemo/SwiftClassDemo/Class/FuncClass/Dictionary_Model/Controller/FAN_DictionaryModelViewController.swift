//
//  FAN_DictionaryModelViewController.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/8/4.
//

import UIKit


struct Student: Codable {
    var userId: Int
    var name: String
    var modelName: String

}

@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get {return number}
        set { number = min(newValue, 12)}
    }
}

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

class FAN_DictionaryModelViewController: FAN_BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        var temp = TwelveOrLess()
        temp.wrappedValue = 20
        
        var temp2 = TwelveOrLess()
        temp2.wrappedValue = 10

        var rectangle = SmallRectangle(height: temp, width: temp2)
        
        print("\(rectangle.width):\(rectangle.height)")
        
        
        
        initData()
        // Do any additional setup after loading the view.
    }
    
    
    override func initData() {
        
//        let student = Student(userId: 1000, name: "fan", modelName: "fan_model")
//
//        //转化为JSON
//
//        let jsonEncoder = JSONEncoder()
//
//        let jsonData = try! jsonEncoder.encode(student)
//
//        let jsonString = String(decoding: jsonData, as: UTF8.self)
//
//        print("\(jsonString)")
        
        
        
        
        let jsonString =
                """
                {
                    "userId":12,
                    "name":"fan",
                    "modelName":"fan_model",
                    "bookList":
                        [{
                            "color":"ff",
                            "size":"18"
                        }]
                }
                """
//        let jsonString =
//        """
//        {
//            "userId":12,
//            "name":"fan",
//            "modelName":"fan_model"
//        }
//        """
        
        if let jsonData = jsonString.data(using: String.Encoding.utf8) {
            
            let person1 = try? JSONDecoder().decode(FAN_PersonModel.self, from: jsonData)
            
            if let person = try? JSONDecoder().decode(FAN_PersonModel.self, from: jsonData) {
                
                print("\(person.modelName)")
            }
        }
    }
}
