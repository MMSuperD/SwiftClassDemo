//
//  FAN_PersonModel.swift
//  SwiftClassDemo
//
//  Created by 王丹 on 2022/8/4.
//

import Foundation

struct FAN_PersonModel: Codable {
    
    var userId: Int
    
    var name: String
    
    var modelName: String
    
    //嵌套模型
    var booksList: [FAN_BookModel]?
    
    
    private enum CodingKeys : String, CodingKey {
        
        case userId = "id"
        case name = "name"
        case modelName = "modelName"
        case booksList = "booksList"
    }
    
//    /// 这个是解码
//    init(from decoder: Decoder) throws {
//
//         let container = try decoder.container(keyedBy: CodingKeys.self)
//
//         useId =  try container.decode(Int.self, forKey: .userId)
//
//         name = try container.decode(String.self, forKey: .name)
//
//         modelName = try container.decode(String.self, forKey: .modelName)
//
//         booksList = try container.decode(Array.self, forKey: .booksList)
//
//    }
//
//    // 这个是编码
//    func encode(to encoder: Encoder) throws {
//
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        try container.encode(useId, forKey: .userId)
//
//        try container.encode(name, forKey: .name)
//
//        try container.encode(modelName, forKey: .modelName)
//
//        try container.encode(booksList, forKey: .booksList)
//
//    }
    
    
}

struct FAN_BookModel: Codable {
    
    var color: String
    var size: String
    
//    private enum CodingKeys : String, CodingKey {
//        
//        case color = "color"
//        case size = "size"
//    }
//
//    
//    /// 这个是解码
//    init(from decoder: Decoder) throws {
//         
//         let container = try decoder.container(keyedBy: CodingKeys.self)
//         
//        color =  try container.decode(String.self, forKey: .color)
//         
//        size = try container.decode(String.self, forKey: .size)
//
//         
//    }
//    
//    // 这个是编码
//    func encode(to encoder: Encoder) throws {
//        
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        
//        try container.encode(color, forKey: .color)
//        
//        try container.encode(size, forKey: .size)
//
//    }
}
