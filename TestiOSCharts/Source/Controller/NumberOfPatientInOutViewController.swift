//
//  NumberOfPatientInOutViewController.swift
//  TestiOSCharts
//
//  Created by  on 5/4/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import UIKit

class NumberOfPatientInOutViewController: UIViewController,ChartViewDelegate,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var tableView: UITableView!
    var barChartDataSet = [BarChartDataSet]()
    var arrYears:[String] = ["2011","2012","2013","2014","2015"]
    let identifier:String = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        barChartViewSetup()
        makeDataSample()
        configTableView()
    }
    
    // MARK: - Config TableView
    
    func configTableView() {
        self.tableView.layer.borderWidth = 1.0
        self.tableView.layer.borderColor = UIColor.blackColor().CGColor
    }
    
    // MARK: - Setup Barchart View
    
    func barChartViewSetup() {
        barChartView.delegate = self
        
        barChartView.descriptionText = ""
        barChartView.noDataTextDescription = "You need to provide data for the chart."
        
        barChartView.drawBarShadowEnabled = false
        barChartView.drawValueAboveBarEnabled = false

        barChartView.pinchZoomEnabled = false
        barChartView.doubleTapToZoomEnabled = false
        barChartView.drawGridBackgroundEnabled = true
        
        // disable right axis
        barChartView.rightAxis.enabled = false
        
        // config legend view show dataSet
        barChartView.legend.verticalAlignment = ChartLegend.VerticalAlignment.Bottom
        barChartView.legend.form = ChartLegend.Form.Square
        barChartView.legend.formSize = 9.0
        barChartView.legend.font = UIFont.systemFontOfSize(11)
        barChartView.legend.xEntrySpace = 5.0
        barChartView.backgroundColor = UIColor.whiteColor()
        barChartView.gridBackgroundColor = UIColor.whiteColor()
        barChartView.highlightPerTapEnabled = true
        barChartView.drawMarkers = false
        barChartView.animate(xAxisDuration: 3.0, yAxisDuration: 3.0)
        
        let xAxis: ChartXAxis = barChartView.xAxis;
        xAxis.labelFont = UIFont(name: "HelveticaNeue-Light", size: 10.0)!
        xAxis.labelPosition = ChartXAxis.LabelPosition.Bottom
        xAxis.drawGridLinesEnabled = false
        
        // draw horizontal enbale width and color
        xAxis.drawAxisLineEnabled = true
        xAxis.axisLineWidth = 5.0
        xAxis.axisLineColor = UIColor(red: 191/255, green: 203/255, blue: 220/255, alpha: 1.0)
        
        // draw label on horizontal
        xAxis.drawLabelsEnabled = true
        
        let leftAxis: ChartYAxis = barChartView.leftAxis;
        leftAxis.labelFont = UIFont.systemFontOfSize(10)
        leftAxis.labelCount = 8
        leftAxis.labelTextColor = UIColor.blackColor()
        leftAxis.valueFormatter = NSNumberFormatter()
        leftAxis.valueFormatter?.maximumFractionDigits = 0;
        leftAxis.valueFormatter?.negativeSuffix = ""
        leftAxis.valueFormatter?.positiveSuffix = ""
        leftAxis.labelPosition = ChartYAxis.LabelPosition.OutsideChart
        leftAxis.spaceTop = 0.0
        leftAxis.drawLabelsEnabled = true
        leftAxis.drawLimitLinesBehindDataEnabled = true
        leftAxis.drawGridLinesEnabled = false
        leftAxis.gridLineDashLengths = [2.0]
        
        // set min value for chart
        leftAxis._customAxisMin = true
        leftAxis._axisMinimum = -500
        
        // set max value for chart
        leftAxis._customAxisMax = true
        leftAxis._axisMaximum = 1500
        
        /// draw vertical enbale,width and color
        leftAxis.drawAxisLineEnabled = true
        leftAxis.axisLineWidth = 5.0
        leftAxis.axisLineColor = UIColor(red: 191/255, green: 203/255, blue: 220/255, alpha: 1.0)
        
        /// draw value on vertical
        leftAxis.drawLabelsEnabled = true
        
        leftAxis.drawLimitLinesBehindDataEnabled = true
        
        // set axisRange
        xAxis.axisRange = 2
        barChartView.maxVisibleValueCount = 10
        barChartView.setVisibleXRangeMaximum(0.3)
    
    }
    
    // MARK: - Make Data Sample
    
    func makeDataSample() {
        barChartDataSet.removeAll()
        let xVals = ["区中央部","区南部","区西南部","区西部","区西北部","区東北部","区東部","西多摩","南多摩","北多摩西部","北多摩南部","区南部","区西南部","区西部","区西北部","区東北部","区東部","西多摩","南多摩","北多摩西部","北多摩南部","区南部","区西南部","区西部","区西北部","区東北部","区東部","西多摩","南多摩","北多摩西部"]
        let labels = ["実患者数","推定患者数","流入流出患者数"]
        
        for i in 0...2 {
            var yVals = [BarChartDataEntry]()
            for j in 0...29 {
                let val = Double.random(-400, max: 1400)
                let dataEntry:BarChartDataEntry = BarChartDataEntry(value: val, xIndex: j)
                yVals.append(dataEntry)
            }
            let dataSet:BarChartDataSet = BarChartDataSet(yVals: yVals, label: labels[i])
            dataSet.setColor(UIColor(red: Int.random(0, max: 255), green: Int.random(0, max: 255), blue: Int.random(0, max: 255)))
            dataSet.drawValuesEnabled = false
            barChartDataSet.append(dataSet)
        }
        
        let barChartData = BarChartData(xVals: xVals, dataSets: barChartDataSet);
        barChartData.groupSpace = 3.0
        barChartData .setValueFont(UIFont(name: "HelveticaNeue-Light", size: 10.0))
        self.barChartView.data = barChartData
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
        makeDataSample()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
