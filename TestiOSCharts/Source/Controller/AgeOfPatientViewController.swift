//
//  AgeOfPatientViewController.swift
//  TestiOSCharts
//
//  Created by  on 5/3/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import UIKit

public extension Int {
    /// Returns a random Int point number between 0 and Int.max.
    public static var random:Int {
        get {
            return Int.random(Int.max)
        }
    }
    /**
     Random integer between 0 and n-1.
     
     - parameter n: Int
     
     - returns: Int
     */
    public static func random(n: Int) -> Int {
        return Int(arc4random_uniform(UInt32(n)))
    }
    /**
     Random integer between min and max
     
     - parameter min: Int
     - parameter max: Int
     
     - returns: Int
     */
    public static func random(min: Int, max: Int) -> Int {
        return Int.random(max - min + 1) + min
        //Int(arc4random_uniform(UInt32(max - min + 1))) + min }
    }
}

public extension Double {
    /// Returns a random floating point number between 0.0 and 1.0, inclusive.
    public static var random:Double {
        get {
            return Double(arc4random()) / 0xFFFFFFFF
        }
    }
    /**
     Create a random number Double
     
     - parameter min: Double
     - parameter max: Double
     
     - returns: Double
     */
    public static func random(min: Double, max: Double) -> Double {
        return Double.random * (max - min) + min
    }
}

public extension Float {
    /// Returns a random floating point number between 0.0 and 1.0, inclusive.
    public static var random:Float {
        get {
            return Float(arc4random()) / 0xFFFFFFFF
        }
    }
    /**
     Create a random num Float
     
     - parameter min: Float
     - parameter max: Float
     
     - returns: Float
     */
    public static func random(min min: Float, max: Float) -> Float {
        return Float.random * (max - min) + min
    }
}
public extension CGFloat {
    /// Randomly returns either 1.0 or -1.0.
    public static var randomSign:CGFloat {
        get {
            return (arc4random_uniform(2) == 0) ? 1.0 : -1.0
        }
    }
    /// Returns a random floating point number between 0.0 and 1.0, inclusive.
    public static var random:CGFloat {
        get {
            return CGFloat(Float.random)
        }
    }
    /**
     Create a random num CGFloat
     
     - parameter min: CGFloat
     - parameter max: CGFloat
     
     - returns: CGFloat random number
     */
    public static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat.random * (max - min) + min
    }
}

public extension Float {
    /**
     Create a random num Float
     :param: lower number Float
     :param: upper number Float
     :return: random number Float
     By DaRkDOG
     */
    public static func random(lower: Float, upper: Float) -> Float {
        let r = Float(arc4random()) / Float(UInt32.max)
        return (r * (upper - lower)) + lower
    }
}

public extension Double {
    public static func random(lower:Double, upper: Double) -> Double {
        let r = Double(arc4random()) / Double(UInt32.max)
        return (r * (upper - lower)) + lower
    }
}

public extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let r = CGFloat(red)/255
        let g = CGFloat(green)/255
        let b = CGFloat(blue)/255
        
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}

class AgeOfPatientViewController: UIViewController,ChartViewDelegate,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var tableView: UITableView!
    
    var arrYears:[String] = ["2011","2012","2013","2014","2015"]
    var arrChartData:[BarChartData] = [];
    let identifier:String = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        chartViewSetUp()
        makeBarData()
        setupBarChartData()
        configTableView()
    }
    
    // MARK: - Config TableView
    
    func configTableView() {
        self.tableView.layer.borderWidth = 1.0
        self.tableView.layer.borderColor = UIColor.blackColor().CGColor
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
        
        barChartView.scaleYEnabled = false
        barChartView.setVisibleXRangeMaximum(0.18)
        
        // disable right axis
        barChartView.rightAxis.enabled = false
        
        // config legend view show dataSet
        barChartView.legend.horizontalAlignment = ChartLegend.HorizontalAlignment.Left
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
        
        // set xAxis maximum value
        xAxis._customAxisMax = true
        xAxis._axisMaximum = 200
        
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
    
    private func setupBarChartData() {
        let barChartData:BarChartData = arrChartData[0]
        barChartView.animate(xAxisDuration: 3.0, yAxisDuration: 3.0)
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
        let barChartData:BarChartData = arrChartData[indexPath.row]
        barChartView.animate(xAxisDuration: 3.0, yAxisDuration: 3.0)
        barChartView.data = barChartData
    }
    
    // MARK: - Make Bar Data
    
    func makeBarData() {
        let samepleData:[[[Double]]] = self.makeSampleData()
        for i in 0..<samepleData.count {
            let values:[[Double]] = samepleData[i]
            let barChartData = self.makeChartData(values)
            
            arrChartData.append(barChartData)
        }
    }
    
    // MARK: - Make sample chart data
    
    func makeSampleData() -> [[[Double]]] {
        var values:[[[Double]]] = []
        
        for _ in 0...4 {
            var pool1:[[Double]] = []
            
            for _ in 0...6 {
                let value1:Double = Double.random(5.0, upper: 13.0)
                let value2:Double = Double.random(80.0, upper: 120.0)
                let value3:Double = Double.random(140.0, upper: 250.0)
                let value4:Double = Double.random(40.0, upper: 80.0)
                
                let pool2:[Double] = [value1,value2,value3,value4]
                pool1.append(pool2)
            }
            
            values.append(pool1)
        }
        
        return values
    }
    
    // MARK: - Make BarChartData
    
    func makeChartData(values:[[Double]]) -> BarChartData {
        var xVals = [String]()
        var yVals = [BarChartDataEntry]()
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
        return BarChartData(xVals: xVals, dataSet: dataSet)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
