//
//  ObservationViewController.swift
//  Field Survey
//
//  Created by QishengTang on 2018/7/19.
//  Copyright © 2018年 QishengTang. All rights reserved.
//

import UIKit

class ObservationViewController: UIViewController {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var detailLabel: UITextView!
    var fieldModel:ClassificationModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Observation"
        self.icon.image = UIImage.init(named: fieldModel.classification!.rawValue)
        self.titleLabel.text = fieldModel.title
        self.dateLabel.text = fieldModel.date.dateToString()
        self.detailLabel.text = fieldModel.desc
    }
}
