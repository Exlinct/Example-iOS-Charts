//
//  BubbleChartXY.swift
//  TestiOSCharts
//
//  Created by Exlinct on 5/11/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import UIKit
import SwiftCharts

class BubbleChartXY: UIViewController,UITableViewDataSource,UITableViewDelegate {

    private var chart: Chart?
    var arrYears:[String] = ["2011","2012","2013","2014","2015"]
    let identifier:String = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        bubbleChartViewSetup()
    }
    
    // MARK: - Setup Bubble ChartView
    
    func bubbleChartViewSetup() {
        if (self.chart != nil) {
            self.chart?.clearView()
        }
        
        let chartFrame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height - 200)
        let labelSettings = ChartLabelSettings(font: ExamplesDefaults.labelFont)
        var rawData:[(Double,Double,Double,UIColor)] = []
        
        for _ in 0...19 {
            let xVal = Double.random(0, max: 15)
            let yVal = Double.random(0, max: 15)
            let size = Double.random(50, max: 200)
            let color = UIColor(red: Int.random(0, max: 255), green: Int.random(0, max: 255), blue: Int.random(0, max: 255))
            let val = (xVal,yVal,size,color)
            rawData.append(val)
        }
        
        let chartPoints: [ChartPointBubble] = rawData.map{ChartPointBubble(x: ChartAxisValueDouble($0, labelSettings: labelSettings), y: ChartAxisValueDouble($1), diameterScalar: $2, bgColor: $3)}
        
        let xValues = (0).stride(through: 20, by: 2).map {ChartAxisValueInt($0, labelSettings: labelSettings)}
        let yValues = (0).stride(through: 20, by: 2).map {ChartAxisValueInt($0, labelSettings: labelSettings)}
        
        let xModel = ChartAxisModel(axisValues: xValues, axisTitleLabel: ChartAxisLabel(text: "Axis title", settings: labelSettings))
        let yModel = ChartAxisModel(axisValues: yValues, axisTitleLabel: ChartAxisLabel(text: "Axis title", settings: labelSettings.defaultVertical()))
        
        let coordsSpace = ChartCoordsSpaceLeftBottomSingleAxis(chartSettings: ExamplesDefaults.chartSettings, chartFrame: chartFrame, xModel: xModel, yModel: yModel)
        let (xAxis, yAxis, innerFrame) = (coordsSpace.xAxis, coordsSpace.yAxis, coordsSpace.chartInnerFrame)
        
        let bubbleLayer = self.bubblesLayer(xAxis: xAxis, yAxis: yAxis, chartInnerFrame: innerFrame, chartPoints: chartPoints)
        
        let guidelinesLayerSettings = ChartGuideLinesDottedLayerSettings(linesColor: UIColor.blackColor(), linesWidth: 0)
        let guidelinesLayer = ChartGuideLinesDottedLayer(xAxis: xAxis, yAxis: yAxis, innerFrame: innerFrame, settings: guidelinesLayerSettings)
        
        let guidelinesHighlightLayerSettings = ChartGuideLinesDottedLayerSettings(linesColor: UIColor(red: 191, green: 203, blue: 220), linesWidth: 3, dotWidth: 0, dotSpacing: 0)
        let guidelinesHighlightLayer = ChartGuideLinesForValuesDottedLayer(xAxis: xAxis, yAxis: yAxis, innerFrame: innerFrame, settings: guidelinesHighlightLayerSettings, axisValuesX: [ChartAxisValueDouble(0)], axisValuesY: [ChartAxisValueDouble(0)])
        
        let chart = Chart(
            frame: chartFrame,
            layers: [
                xAxis,
                yAxis,
                guidelinesLayer,
                guidelinesHighlightLayer,
                bubbleLayer
            ]
        )
        
        self.view.addSubview(chart.view)
        self.chart = chart
    }
    
    private func bubblesLayer(xAxis xAxis: ChartAxisLayer, yAxis: ChartAxisLayer, chartInnerFrame: CGRect, chartPoints: [ChartPointBubble]) -> ChartLayer {
        
        let maxBubbleDiameter: Double = 200, minBubbleDiameter: Double = 50
        
        if 1 == 1 {
            
            let (minDiameterScalar, maxDiameterScalar): (Double, Double) = chartPoints.reduce((min: 0, max: 0)) {tuple, chartPoint in
                (min: min(tuple.min, chartPoint.diameterScalar), max: max(tuple.max, chartPoint.diameterScalar))
            }
            
            let diameterFactor = (maxBubbleDiameter - minBubbleDiameter) / (maxDiameterScalar - minDiameterScalar)
            
            return ChartPointsViewsLayer(xAxis: xAxis, yAxis: yAxis, innerFrame: chartInnerFrame, chartPoints: chartPoints, viewGenerator: {(chartPointModel, layer, chart) -> UIView? in
                
                let diameter = CGFloat(chartPointModel.chartPoint.diameterScalar * diameterFactor)
                
                let circleView = ChartPointEllipseView(center: chartPointModel.screenLoc, diameter: diameter)
                circleView.fillColor = chartPointModel.chartPoint.bgColor
                circleView.borderColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
                circleView.borderWidth = 1
                circleView.animDelay = Float(chartPointModel.index) * 0.2
                circleView.animDuration = 1.2
                circleView.animDamping = 0.4
                circleView.animInitSpringVelocity = 0.5
                return circleView
            })
            
        } else {
            return ChartPointsBubbleLayer(xAxis: xAxis, yAxis: yAxis, innerFrame: chartInnerFrame, chartPoints: chartPoints)
        }
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
        bubbleChartViewSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
