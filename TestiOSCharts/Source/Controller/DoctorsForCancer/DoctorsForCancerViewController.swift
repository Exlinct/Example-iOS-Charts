//
//  DoctorsForCancerViewController.swift
//  TestiOSCharts
//
//  Created by  on 5/3/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import UIKit

class DoctorsForCancerViewController: UIViewController,ChartViewDelegate {

    @IBOutlet weak var bubbleChartView: BubbleChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bubbleChartViewSetup()
        bubbleChartData()
    }
    
    private func bubbleChartViewSetup() {
        bubbleChartView.delegate = self;
        
        bubbleChartView.descriptionText = "This is a test"
        bubbleChartView.noDataTextDescription = "No data"
        
        bubbleChartView.drawGridBackgroundEnabled = false
        bubbleChartView.dragEnabled = true
        
        bubbleChartView .setScaleEnabled(true)
        bubbleChartView.maxVisibleValueCount = 200
        bubbleChartView.pinchZoomEnabled = true
        bubbleChartView.rightAxis.enabled = false
        
        let chartLegend:ChartLegend = bubbleChartView.legend
        chartLegend.position = ChartLegend.Position.RightOfChart
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
        
        // set max value
        xAxis._customAxisMax = true
        xAxis._axisMaximum = 10
        
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
        
//        // set max value for leftAxis
//        leftAxis._customAxisMax = true
//        leftAxis._axisMaximum = 10;
    }
    
    private func bubbleChartData() {
        var xVals = [String]()
        var yVals1 = [BubbleChartDataEntry]()
        var yVals2 = [BubbleChartDataEntry]()
        var yVals3 = [BubbleChartDataEntry]()
        var yVals4 = [BubbleChartDataEntry]()
        var yVals5 = [BubbleChartDataEntry]()
        
        var values:[[Double]] = [
            [18355,30.1,5526],
            [45206,33.8,15280],
            [110008,25.1,27634],
            [71595,28.6,20487],
            [107845,18.2,19584]
        ]
        
        let value1 = values[0]
        let entry1 = BubbleChartDataEntry(xIndex: 0, value: value1[1], size: 5526)
        yVals1.append(entry1)
        
        let value2 = values[1]
        let entry2 = BubbleChartDataEntry(xIndex: 1, value: value2[1], size: 15280)
        yVals2.append(entry2)
        
        let value3 = values[2]
        let entry3 = BubbleChartDataEntry(xIndex: 2, value: value3[1], size: 27634)
        yVals3.append(entry3)
        
        let value4 = values[3]
        let entry4 = BubbleChartDataEntry(xIndex: 3, value: value4[1], size: 20487)
        yVals4.append(entry4)
        
        let value5 = values[4]
        let entry5 = BubbleChartDataEntry(xIndex: 4, value: value5[1], size: 19584)
        yVals5.append(entry5)
        
        let dataSet1:BubbleChartDataSet = BubbleChartDataSet(yVals: yVals1, label: "DataSet 1")
        dataSet1 .setColor(UIColor(red: 217/255, green: 169/255, blue: 83/255, alpha: 1.0))
        dataSet1.drawValuesEnabled = false
        dataSet1._maxSize = 40000
        
        let dataSet2:BubbleChartDataSet = BubbleChartDataSet(yVals: yVals2, label: "DataSet 2")
        dataSet2.setColor(UIColor(red: 194/255, green: 207/255, blue: 134/255, alpha: 1.0))
        dataSet2.drawValuesEnabled = false
        dataSet2._maxSize = 40000
        
        let dataSet3:BubbleChartDataSet = BubbleChartDataSet(yVals: yVals3, label: "DataSet 3")
        dataSet3.setColor(UIColor(red: 215/255, green: 217/255, blue: 187/255, alpha: 1.0))
        dataSet3.drawValuesEnabled = false
        dataSet3._maxSize = 40000
        
        let dataSet4:BubbleChartDataSet = BubbleChartDataSet(yVals: yVals4, label: "DataSet 4")
        dataSet4.setColor(UIColor(red: 125/255, green: 180/255, blue: 225/255, alpha: 1.0))
        dataSet4.drawValuesEnabled = false
        dataSet4._maxSize = 40000
        
        let dataSet5:BubbleChartDataSet = BubbleChartDataSet(yVals: yVals5, label: "DataSet 4")
        dataSet5.setColor(UIColor(red: 151/255, green: 174/255, blue: 195/255, alpha: 1.0))
        dataSet5.drawValuesEnabled = false
        dataSet5._maxSize = 40000
        dataSet5._xMax = 10
        
        bubbleChartView.data = BubbleChartData(xVals: xVals, dataSets: [dataSet1,dataSet2,dataSet3,dataSet4,dataSet5])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
