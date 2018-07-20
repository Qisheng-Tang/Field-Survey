//
//  JSONToModel.swift
//  Field Survey
//
//  Created by QishengTang on 2018/7/20.
//  Copyright © 2018年 QishengTang. All rights reserved.
//

import UIKit

class JSONToModel: NSObject {
    class func loadJSONData() -> [ClassificationModel]{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        var resultArray:[ClassificationModel] = [ClassificationModel]()
        
        if let path = Bundle.main.path(forResource: "Field Survey", ofType: "json") ,
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)){
            if let json = try? JSONSerialization.jsonObject(with: data, options: []),
                let root = json as? [String: Any],
                let status = root["status"] as? String ,
                status == "ok"{
                if let observations = root["observations"] as? [Any]{
                    for observation in observations{
                        if let observation = observation as? [String:String]{
                            let fieldModel = ClassificationModel.init(dict: observation)
                            resultArray.append(fieldModel)
                        }
                    }
                }
            }
        }
        return resultArray
    }
}
