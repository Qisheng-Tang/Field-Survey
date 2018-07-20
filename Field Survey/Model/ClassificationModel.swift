//
//  Classification.swift
//  Field Survey
//
//  Created by QishengTang on 2018/7/20.
//  Copyright © 2018年 QishengTang. All rights reserved.
//

import UIKit

enum Classification:String {
    case bird = "bird"
    case amphibian = "amphibian"
    case reptile = "reptile"
    case mammal = "mammal"
    case insect = "insect"
    case fish = "fish"
    case plant = "plant"
}

class ClassificationModel: NSObject {
    var classification:Classification!
    var title:String!
    var desc: String!
    var date:Date!
    
    init(dict:[String:Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "classification"{
            self.classification = Classification.init(rawValue: value as! String)
        }
        if key == "description"{
            self.desc = value as! String
        }
        if key == "date"{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            let tmpDate = dateFormatter.date(from: value as! String)
            self.date = tmpDate
        }
        if key == "title"{
            self.title = value as! String
        }
        super.setValue(value, forKey: key)
    }
}
