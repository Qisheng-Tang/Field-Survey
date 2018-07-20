//
//  FieldSurveyViewController.swift
//  Field Survey
//
//  Created by QishengTang on 2018/7/19.
//  Copyright © 2018年 QishengTang. All rights reserved.
//

import UIKit

class FieldSurveyViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var dataArray:[ClassificationModel] = [ClassificationModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Field Survey"
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = 80
        self.tableView.tableFooterView = UIView()
        self.dataArray = JSONToModel.loadJSONData()
        self.tableView.reloadData()
    }
    // MARK UITableViewDelegate,UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let fieldModel = self.dataArray[indexPath.row]
        let icon = cell.viewWithTag(1) as! UIImageView
        icon.image = UIImage.init(named: fieldModel.classification!.rawValue)
        let title = cell.viewWithTag(2) as! UILabel
        title.text = fieldModel.title
        let date = cell.viewWithTag(3) as! UILabel
        date.text = fieldModel.date.dateToString()
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let observationVc = segue.destination as! ObservationViewController
            let fieldModel = self.dataArray[indexPath.row]
            observationVc.fieldModel = fieldModel
        }
    }
}
