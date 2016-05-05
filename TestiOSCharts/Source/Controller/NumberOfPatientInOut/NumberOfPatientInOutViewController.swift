//
//  NumberOfPatientInOutViewController.swift
//  TestiOSCharts
//
//  Created by  on 5/4/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import UIKit

class NumberOfPatientInOutViewController: UIViewController,ChartViewDelegate {

    @IBOutlet weak var barChartView: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        barChartViewSetup()
        barChartViewData()
    }
    
    // MARK: - Setup Barchart View
    
    func barChartViewSetup() {
        barChartView.delegate = self
        
        barChartView.descriptionText = ""
        barChartView.noDataTextDescription = "You need to provide data for the chart."
        
        barChartView.drawBarShadowEnabled = false
        barChartView.drawValueAboveBarEnabled = false
        
        barChartView.maxVisibleValueCount = 5
        barChartView.pinchZoomEnabled = false
        barChartView.doubleTapToZoomEnabled = false
        barChartView.drawGridBackgroundEnabled = true
        
        barChartView.scaleYEnabled = false
        barChartView.scaleXEnabled = true

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
    }
    
    // MARK: - Setup Data
    
    func barChartViewData(){
        var xVals = [String]()
        var values = [[AnyObject]]()
        var yVals1 = [BarChartDataEntry]()
        var yVals2 = [BarChartDataEntry]()
        var yVals3 = [BarChartDataEntry]()
        
        values = [
            ["区中央部",1300,277.8,1022.2],
            ["区南部",576,385,191],
            ["区西南部",601,477,124],
            ["区西部",1007,429.4,577.6],
            ["区西北部",282,689,-407],
            ["区東北部",108,480.8,-372.8],
            ["区東部",222,493.6,-271.6],
            ["西多摩",37,	145.4,-108.4],
            ["南多摩",127,524.4,-397.4],
            ["北多摩西部",54,234.4,-180.4],
            ["北多摩南部",376,356.2,19.8]
        ]
        
        let count = values.count - 1
        
        for i in 0...count {
            let value = values[i]
            xVals.append(value[0] as! String)
            
            yVals1.append(BarChartDataEntry(value: value[1] as! Double, xIndex: i))
            yVals2.append(BarChartDataEntry(value: value[2] as! Double, xIndex: i))
            yVals3.append(BarChartDataEntry(value: value[3] as! Double, xIndex: i))
        }
        
        let dataSet1:BarChartDataSet = BarChartDataSet(yVals: yVals1, label: "実患者数")
        dataSet1 .setColor(UIColor(red: 217/255, green: 169/255, blue: 83/255, alpha: 1.0))
        dataSet1.drawValuesEnabled = false;
        
        let dataSet2:BarChartDataSet = BarChartDataSet(yVals: yVals2, label: "推定患者数")
        dataSet2.setColor(UIColor(red: 194/255, green: 207/255, blue: 134/255, alpha: 1.0))
        dataSet2.drawValuesEnabled = false
        
        let dataSet3:BarChartDataSet = BarChartDataSet(yVals: yVals3, label: "流入流出患者数")
        dataSet3.setColor(UIColor(red: 215/255, green: 217/255, blue: 187/255, alpha: 1.0))
        dataSet3.drawValuesEnabled = false
        
        barChartView.data?.xValsObjc = xVals
        
        let barChartData = BarChartData(xVals: xVals, dataSets: [dataSet1,dataSet2,dataSet3])
        barChartData.groupSpace = 5.0
        barChartData .setValueFont(UIFont(name: "HelveticaNeue-Light", size: 10.0))
        barChartView.data = barChartData
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
