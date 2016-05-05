//
//  ComapreNationalsViewController.swift
//  TestiOSCharts
//
//  Created by  on 5/5/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import UIKit

class ComapreNationalsViewController: UIViewController,ChartViewDelegate {

    @IBOutlet weak var bubbleChartView: BubbleChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        chartViewSetup()
        chartViewData()
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
        bubbleChartView.maxVisibleValueCount = 200
        bubbleChartView.pinchZoomEnabled = true
        bubbleChartView.rightAxis.enabled = false
//        bubbleChartView.
        
        // set chart legend
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
        
//        // set max value
//        xAxis._customAxisMax = true
//        xAxis._axisMaximum = 8
//        
//        //set min value
//        xAxis._customAxisMin = true
//        xAxis._axisMinimum = -8
        
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
    }
    
    // MARK: - ChartView Data
    
    func chartViewData() {
        var xVals = [String]()
        var yVals1 = [BubbleChartDataEntry]()
        var yVals2 = [BubbleChartDataEntry]()
        var yVals3 = [BubbleChartDataEntry]()
        var yVals4 = [BubbleChartDataEntry]()
        var yVals5 = [BubbleChartDataEntry]()
        
        let values1:[AnyObject] = [-6.08,12653,-1.28,7040,4.35,12992,-0.33,14524,-0.74,17448,-1.27,43361,2.24,18861,-2.55,1796,1.45,2401,-3.72,5813,-0.9,15041,-0.28,11324,-0.79,7999,-2.86,3739,0.21,420,-3.97,7323,-9.59,28,-1.72,2901]
        
        var val = 0.0
        
        for i in 0..<values1.count {
            if i % 2 == 0 {
                val = values1[i] as! Double
            }
            else {
                let size = values1[i] as! CGFloat
                yVals1.append(BubbleChartDataEntry(xIndex: i, value: val, size: size))
            }
            
            xVals.append("\(i)")
        }
        
        let values2:[AnyObject] = [1.89,19087,-0.3,4008,6.14,5279,-1.43,17979,1.85,26952,2.84,38496,-1.84,10344,-1.28,1906,-2.37,1492,-0.87,7765,0.68,13944,-0.01,8673,6.12,11306,-2.93,1757,1.38,1022,-1.94,11201,0,0,3.94,5690]
        
        for i in 0..<values2.count {
            if i % 2 == 0 {
                val = values2[i] as! Double
            }
            else {
                let size = values2[i] as! CGFloat
                yVals2.append(BubbleChartDataEntry(xIndex: i, value: val, size: size))
            }
        }
        
        let values3:[AnyObject] = [-1.99,23977,1.08,13920,-0.14,7647,-0.45,19324,0.13,28039,2.68,43465,2.84,18125,-0.59,2307,0.76,4381,-2.49,5704,0.36,16298,-1.42,13762,5.78,7477,-1.59,12643,1.93,306,-5.52,2937,0,0,-1.69,4539]
        
        for i in 0..<values3.count {
            if i % 2 == 0 {
                val = values3[i] as! Double
            }
            else {
                let size = values3[i] as! CGFloat
                yVals3.append(BubbleChartDataEntry(xIndex: i, value: val, size: size))
            }
        }
        
        let values4:[AnyObject] = [-4.01,14548,-0.65,4797,2.53,8220,-0.39,15993,0.72,17265,2.07,31117,0.3,17258,2.49,2001,0.83,1400,-0.83,7471,1.66,16064,-1.24,5327,-2.6,6577,-2.31,508,-0.86,203,-8.91,3549,0,0,-0.14,5293]
        
        for i in 0..<values4.count {
            if i % 2 == 0 {
                val = values4[i] as! Double
            }
            else {
                let size = values4[i] as! CGFloat
                yVals4.append(BubbleChartDataEntry(xIndex: i, value: val, size: size))
            }
        }
        
        let values5:[AnyObject] = [-1.39,16614,1.91,13771,4.75,8526,0.2,20163,0.72,24775,1.51,46480,-1.38,28000,0.27,3070,-3.23,1451,-0.89,10796,0.37,15452,-1.27,14468,3.32,17682,1.05,8772,2.36,514,-5.01,5032,-9.22,78,-2.06,6542]
        
        for i in 0..<values5.count {
            if i % 2 == 0 {
                val = values5[i] as! Double
            }
            else {
                let size = values5[i] as! CGFloat
                yVals5.append(BubbleChartDataEntry(xIndex: i, value: val, size: size))
            }
        }
        
        let dataSet1 = BubbleChartDataSet(yVals: yVals1, label: "東京慈恵会医科大学附属病院")
        dataSet1._maxSize = 47000
        dataSet1.setColor(UIColor(red: 214/255, green: 166/255, blue: 80/255, alpha: 1.0))
        dataSet1.drawValuesEnabled = false
        
        let dataSet2 = BubbleChartDataSet(yVals: yVals2, label: "日本医科大学付属病院")
        dataSet2._maxSize = 47000
        dataSet2.setColor(UIColor(red: 12/255, green: 179/255, blue: 224/255, alpha: 1.0))
        dataSet2.drawValuesEnabled = false
        
        let dataSet3 = BubbleChartDataSet(yVals: yVals3, label: "順天堂大学医学部附属順天堂医院")
        dataSet3._maxSize = 47000
        dataSet3.setColor(UIColor(red: 193/255, green: 206/255, blue: 133/255, alpha: 1.0))
        dataSet3.drawValuesEnabled = false
        
        let dataSet4 = BubbleChartDataSet(yVals: yVals4, label: "東京医科歯科大学医学部附属病院")
        dataSet4._maxSize = 47000
        dataSet4.setColor(UIColor(red: 154/255, green: 178/255, blue: 198/255, alpha: 1.0))
        dataSet4.drawValuesEnabled = false
        
        let dataSet5 = BubbleChartDataSet(yVals: yVals5, label: "東京大学医学部附属病院")
        dataSet5._maxSize = 47000
        dataSet5.setColor(UIColor(red: 237/255, green: 250/255, blue: 189/255, alpha: 1.0))
        dataSet5.drawValuesEnabled = false
        
        let bubbleChartData = BubbleChartData(xVals: xVals, dataSets: [dataSet1,dataSet2,dataSet3,dataSet4,dataSet5])
        bubbleChartView.data = bubbleChartData
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
