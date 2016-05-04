//
//  NumberOfPatientViewController.swift
//  TestiOSCharts
//
//  Created by  on 5/4/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import UIKit

class NumberOfPatientViewController: UIViewController,ChartViewDelegate {

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
        
        barChartView.maxVisibleValueCount = 10
        barChartView.pinchZoomEnabled = false
        barChartView.doubleTapToZoomEnabled = false
        barChartView.drawGridBackgroundEnabled = true
        
        barChartView.scaleYEnabled = false
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
        leftAxis._customAxisMin = true
        leftAxis._axisMinimum = 0.0
        /// draw vertical enbale,width and color
        leftAxis.drawAxisLineEnabled = true
        leftAxis.axisLineWidth = 5.0
        leftAxis.axisLineColor = UIColor(red: 191/255, green: 203/255, blue: 220/255, alpha: 1.0)
        /// draw value on vertical
        leftAxis.drawLabelsEnabled = true
    }
    
    // MARK: - Setup Data
    
    func barChartViewData(){
        var xVals = [String]()
        var values = [[Double]]()
        var yVals1 = [BarChartDataEntry]()
        var yVals2 = [BarChartDataEntry]()
        var yVals3 = [BarChartDataEntry]()
        var yVals4 = [BarChartDataEntry]()
        var yVals5 = [BarChartDataEntry]()
        var yVals6 = [BarChartDataEntry]()
        var yVals7 = [BarChartDataEntry]()
        
        values = [
            [0,0,0,0,0,0,0],
            [0,0,0,-1.6,47.6,-1.2,9.9],
            [0,0,0,-4.4,87,5.2,19.4],
            [0,0,0,-6.6,102.3,38.3,28.5],
            [0,0,0,-7.4,87.1,87.5,41.9],
            [0,0,0,-7.4,42.9,187.4,43.2],
            [0,0,0,-7.4,-2.5,269.8,45]
                ]
        
        let iYear = 2010
        
        for i in 0...6 {
            xVals.append("\(5*i+iYear)")
            let value = values[i]
            
            yVals1.append(BarChartDataEntry(value: value[0], xIndex: i))
            yVals2.append(BarChartDataEntry(value: value[1], xIndex: i))
            yVals3.append(BarChartDataEntry(value: value[2], xIndex: i))
            yVals4.append(BarChartDataEntry(value: value[3], xIndex: i))
            yVals5.append(BarChartDataEntry(value: value[4], xIndex: i))
            yVals6.append(BarChartDataEntry(value: value[5], xIndex: i))
            yVals7.append(BarChartDataEntry(value: value[6], xIndex: i))
        }
        
        let dataSet1:BarChartDataSet = BarChartDataSet(yVals: yVals1, label: "00～04才")
        dataSet1 .setColor(UIColor(red: 217/255, green: 169/255, blue: 83/255, alpha: 1.0))
        dataSet1.drawValuesEnabled = false;
        
        let dataSet2:BarChartDataSet = BarChartDataSet(yVals: yVals2, label: "05～14才")
        dataSet2.setColor(UIColor(red: 194/255, green: 207/255, blue: 134/255, alpha: 1.0))
        dataSet2.drawValuesEnabled = false
        
        let dataSet3:BarChartDataSet = BarChartDataSet(yVals: yVals3, label: "15～19才")
        dataSet3.setColor(UIColor(red: 215/255, green: 217/255, blue: 187/255, alpha: 1.0))
        dataSet3.drawValuesEnabled = false
        
        let dataSet4:BarChartDataSet = BarChartDataSet(yVals: yVals4, label: "20～39才")
        dataSet4.setColor(UIColor(red: 125/255, green: 180/255, blue: 225/255, alpha: 1.0))
        dataSet4.drawValuesEnabled = false
        
        let dataSet5:BarChartDataSet = BarChartDataSet(yVals: yVals5, label: "40～59才")
        dataSet5.setColor(UIColor(red: 151/255, green: 174/255, blue: 195/255, alpha: 1.0))
        dataSet5.drawValuesEnabled = false
        
        let dataSet6:BarChartDataSet = BarChartDataSet(yVals: yVals6, label: "60～79才")
        dataSet6.setColor(UIColor(red: 201/255, green: 202/255, blue: 159/255, alpha: 1.0))
        dataSet6.drawValuesEnabled = false
        
        let dataSet7:BarChartDataSet = BarChartDataSet(yVals: yVals7, label: "80才以上")
        dataSet7.setColor(UIColor(red: 221/255, green: 95/255, blue: 147/255, alpha: 1.0))
        dataSet7.drawValuesEnabled = false
        
        barChartView.data?.xValsObjc = xVals
        
        let barChartData = BarChartData(xVals: xVals, dataSets: [dataSet1,dataSet2,dataSet3,dataSet4,dataSet5,dataSet6,dataSet7])
        barChartData.groupSpace = 5.0
        barChartData .setValueFont(UIFont(name: "HelveticaNeue-Light", size: 10.0))
        barChartView.data = barChartData
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
