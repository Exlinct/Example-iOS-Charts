//
//  ViewController.swift
//  TestiOSCharts
//
//  Created by  on 5/3/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import UIKit

struct iOSChart {
    let name:String
    let detail:String
    let identifier:String
    
}

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var iOSCharts = [iOSChart]()
    let CellIdentifier = "CustomeTableCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initializeiOSChart()
    }
    
    func initializeiOSChart() {
        self.iOSCharts = [
            iOSChart(name: "Age of patient", detail: "Chart about age of patient", identifier: "AgeOfPatient"),
            iOSChart(name: "Number of patient", detail: "Chart about number of patient",identifier: "NumberOfPatient"),
            iOSChart(name: "Number of in/out patient", detail: "Chart about number of patient in/out of area",identifier: "NumberOfInOutPatient"),
            iOSChart(name: "Doctors for cancer", detail: "Ratio of seeing doctors for cancer",identifier: "DoctorsForCancer")
                         ]
        self.tableView .reloadData()
    }
    
    // MARK: - UITableView DataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.iOSCharts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:CustomeTableCell! = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as? CustomeTableCell
        cell.configurateTheCell(self.iOSCharts[indexPath.row])
        return cell!
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    
    // MARK: - UITableView Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let iosChart = self.iOSCharts[indexPath.row]
        
        if iosChart.identifier == "AgeOfPatient" {
            let ageOfPatientVC:AgeOfPatientViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ageOfPatientVC") as! AgeOfPatientViewController
            self.navigationController!.pushViewController(ageOfPatientVC, animated: true)
        }
        else if iosChart.identifier == "DoctorsForCancer" {
            let doctorsForCancerVC:DoctorsForCancerViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("doctorsForCancer") as! DoctorsForCancerViewController
            self.navigationController!.pushViewController(doctorsForCancerVC, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

