//
//  ComapreNationalsViewController.swift
//  TestiOSCharts
//
//  Created by  on 5/5/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import UIKit

class ComapreNationalsViewController: UIViewController,ChartViewDelegate,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var bubbleChartView: BubbleChartView!
    @IBOutlet weak var tableView: UITableView!
    var chartDataSet = [BubbleChartDataSet]()
    var arrYears:[String] = ["2011","2012","2013","2014","2015"]
    let identifier:String = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        chartViewSetup()
        makeSampleData()
        configTableView()
    }
    
    // MARK: - Config TableView
    
    func configTableView() {
        self.tableView.layer.borderWidth = 1.0
        self.tableView.layer.borderColor = UIColor.blackColor().CGColor
    }
    
    // MARK: - ChartView Setup
    
    func chartViewSetup() {
        // set property chart view
        bubbleChartView.delegate = self;
        bubbleChartView.descriptionText = "This is a test"
        bubbleChartView.noDataTextDescription = "No data"
        bubbleChartView.drawGridBackgroundEnabled = false
        bubbleChartView.dragEnabled = true
        bubbleChartView .setScaleEnabled(true)
        bubbleChartView.maxVisibleValueCount = 10
        bubbleChartView.pinchZoomEnabled = true
        bubbleChartView.rightAxis.enabled = false
        
        // set chart legend
        let chartLegend:ChartLegend = bubbleChartView.legend
        chartLegend.verticalAlignment = ChartLegend.VerticalAlignment.Bottom
        chartLegend.font = UIFont(name: "HelveticaNeue-Light", size: 10.0)!
        
        let xAxis: ChartXAxis = bubbleChartView.xAxis
        xAxis.labelPosition = ChartXAxis.LabelPosition.Bottom
        xAxis.labelFont = UIFont.systemFontOfSize(10)
        xAxis.labelTextColor = UIColor.blackColor()
        xAxis.drawGridLinesEnabled = false
        xAxis.gridLineWidth = 5.0
        xAxis.gridColor = UIColor.blueColor()
        
        // draw horizontal enbale width and color
        xAxis.drawAxisLineEnabled = true
        xAxis.axisLineWidth = 5.0
        xAxis.axisLineColor = UIColor(red: 191/255, green: 203/255, blue: 220/255, alpha: 1.0)
        
        // draw label on horizontal
        xAxis.drawLabelsEnabled = true
        
        let leftAxis:ChartYAxis = bubbleChartView.leftAxis
        leftAxis.labelFont = UIFont(name: "HelveticaNeue-Light", size: 10.0)!
        leftAxis.spaceTop = 0.3
        leftAxis.spaceBottom = 0.3
        leftAxis.axisMinValue = 0.0
        leftAxis.drawGridLinesEnabled = false
        
        /// draw vertical enbale,width and color
        leftAxis.drawAxisLineEnabled = true
        leftAxis.axisLineWidth = 5.0
        leftAxis.axisLineColor = UIColor(red: 191/255, green: 203/255, blue: 220/255, alpha: 1.0)
        
        /// draw value on vertical
        leftAxis.drawLabelsEnabled = true
        
        //set max value left axis
        leftAxis._customAxisMax = true
        leftAxis._axisMaximum = 8
        
        // set min value left axis
        leftAxis._customAxisMin = true
        leftAxis._axisMinimum = -8
        
        xAxis.axisRange = 2.0
        bubbleChartView.setVisibleXRangeMaximum(0.3)
    }
    
    // MARK: - Make Sample Data
    
    func makeSampleData() {
        chartDataSet.removeAll()
        let labels = ["東京慈恵会医科大学附属病院","日本医科大学付属病院","順天堂大学医学部附属順天堂医院","東京医科歯科大学医学部附属病院","東京大学医学部附属病院"]
        var xVals = [String]()
        
        for i in 0...4 {
            var yVals = [BubbleChartDataEntry]()
            xVals .removeAll()
            
            for j in 0...100 {
                let val  = Double.random(-6, max: 6)
                let size = CGFloat.random(0, max: 30000)
                let dataEntry = BubbleChartDataEntry(xIndex: j, value: val, size: size)
                yVals.append(dataEntry)
                xVals.append("\(j + 1)")
            }
            
            let dataSet:BubbleChartDataSet = BubbleChartDataSet(yVals: yVals, label: labels[i])
            dataSet.setColor(UIColor(red: Int.random(0, max: 255), green: Int.random(0, max: 255), blue: Int.random(0, max: 255)))
            dataSet.drawValuesEnabled = false
            dataSet._maxSize = 30000
            chartDataSet.append(dataSet)
        }
        
        let chartData = BubbleChartData(xVals: xVals, dataSets: chartDataSet)
        self.bubbleChartView.data = chartData
    }
    
    // MARK: - UITableView DataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrYears.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell! = tableView .dequeueReusableCellWithIdentifier(identifier)! as UITableViewCell
        cell.textLabel?.text = arrYears[indexPath.row]
        
        return cell
    }
    
    // MARK: - UITableView Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        makeSampleData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
