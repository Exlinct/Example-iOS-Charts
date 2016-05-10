
//
//  ManagementIndicatorViewController.swift
//  TestiOSCharts
//
//  Created by  on 5/4/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import UIKit

class ManagementIndicatorViewController: UIViewController,ChartViewDelegate {

    @IBOutlet weak var scatterChartView: ScatterChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        chartViewSetup()
        chartViewData()
    }

    // MARK: - ChartView Setup
    
    func chartViewSetup() {
        // set property chart view
        scatterChartView.delegate = self
        scatterChartView.descriptionText = ""
        scatterChartView.noDataTextDescription = "No data"
        scatterChartView.drawGridBackgroundEnabled = false
        scatterChartView.pinchZoomEnabled = false
        scatterChartView.doubleTapToZoomEnabled = false
        scatterChartView.rightAxis.enabled = false
        scatterChartView.legend.position = ChartLegend.Position.RightOfChart
        scatterChartView.legend.form = ChartLegend.Form.Square
        scatterChartView.legend.formSize = 9.0
        scatterChartView.legend.font = UIFont.systemFontOfSize(11)
        scatterChartView.legend.xEntrySpace = 5.0
        scatterChartView.backgroundColor = UIColor.whiteColor()
        scatterChartView.animate(xAxisDuration: 3.0, yAxisDuration: 3.0)
        
        let xAxis: ChartXAxis = scatterChartView.xAxis
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
        
        let leftAxis: ChartYAxis = scatterChartView.leftAxis
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
        leftAxis._axisMaximum = 50.0
    }
    
    // MARK: - ChartView Data
    
    func chartViewData() {
        var xVals = [String]()
        
        let values:[[AnyObject]] = [
            ["日本大学病院",10.26,23.47],
            ["三井記念病院",9.57,28.87],
            ["三楽病院",9.45,23.17],
            ["東京逓信病院",12.53,19.17]
        ]
        
        let value1 = values[0]
        let entry1:ChartDataEntry = ChartDataEntry(value: value1[2] as! Double, xIndex: 0)
        xVals.append(value1[0] as! String)
        
        let value2 = values[1]
        let entry2:ChartDataEntry = ChartDataEntry(value: value2[2] as! Double, xIndex: 1)
        xVals.append(value2[0] as! String)
        
        let value3 = values[2]
        let entry3:ChartDataEntry = ChartDataEntry(value: value3[2] as! Double, xIndex: 2)
        xVals.append(value3[0] as! String)
        
        let value4 = values[3]
        let entry4:ChartDataEntry = ChartDataEntry(value: value4[2] as! Double, xIndex: 3)
        xVals.append(value4[0] as! String)
        
        let dataSet1:ScatterChartDataSet = ScatterChartDataSet(yVals:[entry1], label: value1[0] as? String)
        dataSet1.scatterShape = ScatterChartDataSet.Shape.Circle
        dataSet1.setColor(ChartColorTemplates.colorful()[0])
        
        let dataSet2:ScatterChartDataSet = ScatterChartDataSet(yVals: [entry2], label: value2[0] as? String)
        dataSet2.scatterShape = ScatterChartDataSet.Shape.Cross
        dataSet2.setColor(ChartColorTemplates.colorful()[1])
        
        let dataSet3:ScatterChartDataSet = ScatterChartDataSet(yVals: [entry3], label: value3[0] as? String)
        dataSet3.scatterShape = ScatterChartDataSet.Shape.Square
        dataSet3.setColor(ChartColorTemplates.colorful()[2])
        
        let dataSet4:ScatterChartDataSet = ScatterChartDataSet(yVals: [entry4], label: value4[0] as? String)
        dataSet4.scatterShape = ScatterChartDataSet.Shape.Triangle
        dataSet4.setColor(ChartColorTemplates.colorful()[3])
        
        let scatterChartData:ScatterChartData = ScatterChartData(xVals: xVals, dataSets: [dataSet1,dataSet2,dataSet3,dataSet4])
        scatterChartData.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 7.0))
        scatterChartView.data = scatterChartData
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
