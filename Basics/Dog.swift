//
//  Dog.swift
//  Basics
//
//  Created by abhishek on 1/26/17.
//  Copyright © 2017 abhishek. All rights reserved.
//

import Foundation

class Dog : CustomStringConvertible, SameProtocol{
    
    func protoBark() {
        print("Proto Woof Woof")
        self.no_of_legs = 2
    }
    
    private var type: String
    private var no_of_legs: Int
    
    private var fur_color: String? //optional
    private var names: [String]?
    
    init(type: String, no_of_legs: Int){
        self.type = type
        self.no_of_legs = no_of_legs
    }
    
    public var description: String {
        return "\(type) is a dog with \(no_of_legs) legs"
    }
    
    public var bark: String{
        return "bark"
    }
    
    func puppyBark() {
        print("woof woof")
    }
    
    func puppyBark(whattosay: String) -> String{
        return "Woof woof "  + whattosay
    }
    
    func callhim(name: String){
        if names == nil {
            names = Array()
        }
        names?.append(name)
    }
    
    //setters and getters in swift
    var legs: Int {
        get{
            return no_of_legs
        }
        set{
            no_of_legs = newValue
        }
    }
    
    func listAllNames(){
        for name in self.names!{
            print(name)
        }
    }
    
}
