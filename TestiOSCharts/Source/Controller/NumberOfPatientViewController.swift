//
//  NumberOfPatientViewController.swift
//  TestiOSCharts
//
//  Created by  on 5/4/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import UIKit
import Charts

class NumberOfPatientViewController: UIViewController,ChartViewDelegate,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var tableView: UITableView!
    
    var arrYears:[String] = ["2011","2012","2013","2014","2015"]
    var arrChartData:[BarChartData] = []
    var barChartDataSet:[BarChartDataSet] = []
    let identifier:String = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        barChartViewSetup()
        makeDataSameple()
        ConfigTableView()
    }
    
    // MARK: - Config TableView
    
    func ConfigTableView() {
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
        
        barChartView.maxVisibleValueCount = 10
        barChartView.pinchZoomEnabled = false
        barChartView.doubleTapToZoomEnabled = false
        barChartView.drawGridBackgroundEnabled = true
        
        barChartView.scaleYEnabled = false
        barChartView.setVisibleXRangeMaximum(0.18)
        // disable right axis
        barChartView.rightAxis.enabled = false
        // config legend view show dataSet
        barChartView.legend.position = ChartLegend.ChartLegendPosition.BelowChartLeft
        barChartView.legend.form = ChartLegend.ChartLegendForm.Square
        barChartView.legend.formSize = 9.0
        barChartView.legend.font = UIFont.systemFontOfSize(11)
        barChartView.legend.xEntrySpace = 5.0
        barChartView.backgroundColor = UIColor.whiteColor()
        barChartView.gridBackgroundColor = UIColor.whiteColor()
        barChartView.highlightPerTapEnabled = true
        barChartView.moveViewToX(100)
        barChartView.drawMarkers = false
        barChartView.animate(xAxisDuration: 3.0, yAxisDuration: 3.0)
        
        let xAxis: ChartXAxis = barChartView.xAxis;
        xAxis.labelFont = UIFont(name: "HelveticaNeue-Light", size: 10.0)!
        xAxis.labelPosition = ChartXAxis.XAxisLabelPosition.Bottom
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
        leftAxis.labelPosition = ChartYAxis.YAxisLabelPosition.OutsideChart
        leftAxis.spaceTop = 0.0
        leftAxis.drawLabelsEnabled = true
        leftAxis.drawLimitLinesBehindDataEnabled = true
        leftAxis.drawGridLinesEnabled = false
        leftAxis.gridLineDashLengths = [2.0]
        leftAxis.axisMinValue = 0.0
        
        /// draw vertical enbale,width and color
        leftAxis.drawAxisLineEnabled = true
        leftAxis.axisLineWidth = 5.0
        leftAxis.axisLineColor = UIColor(red: 191/255, green: 203/255, blue: 220/255, alpha: 1.0)
        
        /// draw value on vertical
        leftAxis.drawLabelsEnabled = true
        
        // set left axis max
        leftAxis.axisMaxValue = 350
    }
    
    // MARK: - Make Data Sample
    
    func makeDataSameple() {
        barChartDataSet.removeAll()
        let iYear = 2010
        let labels = ["00～04才","05～14才","15～19才","20～39才","40～59才","60～79才","80才以上"]
        var xVals:[String] = []
        
        for i in 0...6 {
            xVals.append("\(iYear + i * 5)")
            var yVals:[BarChartDataEntry] = []
            
            for j in 0...6 {
                let val = Double.random(-10, upper: 300)
                let yVal:BarChartDataEntry = BarChartDataEntry(value: val, xIndex: j)
                yVals.append(yVal)
            }
            
            let dataSet:BarChartDataSet = BarChartDataSet(yVals: yVals, label: labels[i])
            dataSet.setColor(UIColor(red: Int.random(0, max: 255), green: Int.random(0, max: 255), blue: Int.random(0, max: 255)))
            dataSet.drawValuesEnabled = false
            barChartDataSet.append(dataSet)
        }
        let barChartData = BarChartData(xVals: xVals, dataSets: barChartDataSet)
        barChartData.groupSpace = 5.0
        barChartData .setValueFont(UIFont(name: "HelveticaNeue-Light", size: 10.0))
        barChartView.data = barChartData
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
        makeDataSameple()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
