//
//  AgeOfPatientViewController.swift
//  TestiOSCharts
//
//  Created by  on 5/3/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import UIKit

class AgeOfPatientViewController: UIViewController,ChartViewDelegate {

    @IBOutlet weak var barChartView: BarChartView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        chartViewSetUp()
        barChartData()
    }
    
    //MARK: - Setup BarCharView
    
    private func chartViewSetUp() {
        barChartView.delegate = self
        
        barChartView.descriptionText = ""
        barChartView.noDataTextDescription = "You need to provide data for the chart."
        
        barChartView.drawBarShadowEnabled = false
        barChartView.drawValueAboveBarEnabled = false
        
        barChartView.maxVisibleValueCount = 10
        barChartView.pinchZoomEnabled = false
        barChartView.doubleTapToZoomEnabled = false
        barChartView.drawGridBackgroundEnabled = true
        
        barChartView.scaleYEnabled = true
        barChartView.setVisibleXRangeMaximum(0.18)
        
        // disable right axis
        barChartView.rightAxis.enabled = false
        
        // config legend view show dataSet
        barChartView.legend.position = ChartLegend.Position.RightOfChart
        barChartView.legend.form = ChartLegend.Form.Square
        barChartView.legend.formSize = 9.0
        barChartView.legend.font = UIFont.systemFontOfSize(11)
        barChartView.legend.xEntrySpace = 5.0
        barChartView.backgroundColor = UIColor.whiteColor()
        barChartView.gridBackgroundColor = UIColor.whiteColor()
        barChartView.highlightPerTapEnabled = true
        barChartView.moveViewToX(100)
        barChartView.drawMarkers = false
        barChartView.animate(xAxisDuration: 3.0, yAxisDuration: 3.0)
        
        let xAxis: ChartXAxis = barChartView.xAxis
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
        
//        // set xAxis maximum value
//        xAxis._customAxisMax = true
//        xAxis._axisMaximum = 350
        
        let leftAxis: ChartYAxis = barChartView.leftAxis
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
        leftAxis._customAxisMin = true
        leftAxis._axisMinimum = 0.0
        
        /// draw vertical enbale,width and color
        leftAxis.drawAxisLineEnabled = true
        leftAxis.axisLineWidth = 5.0
        leftAxis.axisLineColor = UIColor(red: 191/255, green: 203/255, blue: 220/255, alpha: 1.0)
        
        /// draw value on vertical
        leftAxis.drawLabelsEnabled = true
        
        // set leftAxis maximum value
        leftAxis._customAxisMax = true
        leftAxis._axisMaximum = 500
    }
    
    // MARK: - Setup Data
    
    private func barChartData() {
        var xVals = [String]()
        var yVals = [BarChartDataEntry]()
        
        var values:[[Double]] = [
            [11.2,95.4,151.4,41.8],
            [10.2,113.9,151,49.5],
            [8.4,129.3,153.2,56.9],
            [7.1,135.2,164.6,64],
            [6.6,129.3,181.5,74.4],
            [6.6,112.1,215.8,75.4],
            [6.6,94.4,244.1,76.9]
        ]
        
        let iYear = 2010
        
        for i in 0...6 {
            let data = values[i]
            let entry = BarChartDataEntry(values: [data[0], data[1], data[2], data[3]], xIndex: i)
            yVals.append(entry)
            xVals.append("\(5*i+iYear)")
        }
        
        let dataSet: BarChartDataSet = BarChartDataSet(yVals: yVals, label: "DataSet")
        dataSet.highlightEnabled = false
        dataSet.drawValuesEnabled = false
        dataSet.colors = [
            UIColor(red: 199/255, green: 200/255, blue: 161/255, alpha: 1.00),
            UIColor(red: 116/255, green: 145/255, blue: 172/255, alpha: 1.00),
            UIColor(red: 211/255, green: 95/255, blue: 47/255, alpha: 1.00),
            UIColor(red: 159/255, green: 209/255, blue: 227/255, alpha: 1.00)
        ]
        dataSet.valueTextColor = UIColor.whiteColor()
        dataSet.barSpace = 0.5
        barChartView.data = BarChartData(xVals: xVals, dataSet: dataSet)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
