//
//  MealObject.swift
//  VicDiet
//
//  Created by Ming Yang on 18/4/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class MealObject: NSObject,NSCopying  {
    var foodObjectList: [FoodObject]
    var name : String
    init(foodObjectList: [FoodObject]) {
        self.name = "Untitled Meal"
        self.foodObjectList = foodObjectList
 
    }
    func copy(with zone: NSZone? = nil) -> Any {
        let mealObject = MealObject.init(foodObjectList: self.foodObjectList)
        return mealObject
    }
    
}
