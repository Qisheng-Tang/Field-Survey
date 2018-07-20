//
//  DateExt.swift
//  Field Survey
//
//  Created by QishengTang on 2018/7/20.
//  Copyright © 2018年 QishengTang. All rights reserved.
//

import Foundation
extension Date
{
    func dateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        let mouth = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
        let resultMonth = mouth[Int(dateFormatter.string(from: self))!]
        dateFormatter.dateFormat = "dd,yyyy,HH:mm:ss"
        let resultMid = dateFormatter.string(from: self)
        dateFormatter.dateFormat = "HH"
        let resultSuffix = Int(dateFormatter.string(from: self))! <= 12 ? "AM" : "PM"
        return String.init(format: "%@ %@ %@", resultMonth,resultMid,resultSuffix)
    }
}
