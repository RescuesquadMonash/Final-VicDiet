import UIKit
import Charts
import TKRadarChart

class MealPlanOverviewView: UIView, UITableViewDelegate, UITableViewDataSource,TKRadarChartDataSource, TKRadarChartDelegate{
    func numberOfStepForRadarChart(_ radarChart: TKRadarChart) -> Int {
        return 4
    }
    
    func numberOfRowForRadarChart(_ radarChart: TKRadarChart) -> Int {
        return 6
    }
    
    func numberOfSectionForRadarChart(_ radarChart: TKRadarChart) -> Int {
        return 2
    }
    
    func titleOfRowForRadarChart(_ radarChart: TKRadarChart, row: Int) -> String {
        if row == 0{
            return "a"
        }
        if row == 1{
            return "a"
        }
        if row == 2{
            return "a"
        }
        if row == 3{
            return "a"
        }
        if row == 4{
            return "a"
        }else{
            return "a"
        }
    }
    
    func valueOfSectionForRadarChart(withRow row: Int, section: Int) -> CGFloat {
        if section == 0{
            return 10
        }
        if section == 1{
            return 10
        }
        if section == 2{
            return 10
        }
        if section == 3{
            return 10
        }
        if section == 4{
            return 10
        }else{
            return 10
        }
    }
    
    
    var homePageController: HomePageController?
    var mealPlanResultController: MealPlanResultController?
    
    let overviewLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.text = "Meal Plan Overview"
        label.font =  UIFont.boldSystemFont(ofSize: 18)
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    var overviewChart : PieChartView = {
        let oc = PieChartView()
        oc.rotationEnabled = false
        oc.legend.enabled = false
        oc.chartDescription?.enabled = false
        return oc
        
    }()
//    var proteinDataEntry = PieChartDataEntry(value: 0)
//    var calciumDataEntry = PieChartDataEntry(value: 0)
//    var fatDataEntry = PieChartDataEntry(value: 0)
//    var sodiumDataEntry = PieChartDataEntry(value: 0)
//    var CDataEntry = PieChartDataEntry(value: 0)
//    var ADataEntry = PieChartDataEntry(value: 0)
//    var pieChartDataEntryArray = [PieChartDataEntry]()
    
    lazy var radarChart: TKRadarChart = {
        let radarChart = TKRadarChart()
        radarChart.dataSource = self
        radarChart.delegate = self
        
        return radarChart
    }()
    
    
//    var proteinDataEntry = RadarChartDataEntry(value: 10)
//    var calciumDataEntry = RadarChartDataEntry(value: 10)
//    var fatDataEntry = RadarChartDataEntry(value: 10)
//    var sodiumDataEntry = RadarChartDataEntry(value: 10)
//    var CDataEntry = RadarChartDataEntry(value: 10)
//    var ADataEntry = RadarChartDataEntry(value: 10)
//    var radarChartDataEntryArray = [RadarChartDataEntry]()
    var radar: RadarChartView = {
        let rc = RadarChartView()

        return rc
    }()
    
    let nutrientOverviewProtein: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nProtein", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let nutrientOverviewCalcium: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nCalcium", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let nutrientOverviewFat: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nFat", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let nutrientOverviewSodium: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nSodium", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let nutrientOverviewVitaminC: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nVitaminC", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let nutrientOverviewVitaminA: UITextView = {
        let textView = UITextView()
        let physicalAttributedText = NSMutableAttributedString(string: "150", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        
        physicalAttributedText.append(NSMutableAttributedString(string: "\nVitaminA", attributes: [NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = physicalAttributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    lazy var tableView0: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        return tv
        
    }()
    lazy var tableView1: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        return tv
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        
        tableView0.register(UITableViewCell.self, forCellReuseIdentifier: "cellId00")
        tableView0.register(UITableViewCell.self, forCellReuseIdentifier: "cellId01")
        tableView0.register(UITableViewCell.self, forCellReuseIdentifier: "cellId02")
        self.tableView0.separatorStyle = UITableViewCell.SeparatorStyle.none

        
        tableView1.register(UITableViewCell.self, forCellReuseIdentifier: "cellId10")
        tableView1.register(UITableViewCell.self, forCellReuseIdentifier: "cellId11")
        tableView1.register(UITableViewCell.self, forCellReuseIdentifier: "cellId12")
        self.tableView1.separatorStyle = UITableViewCell.SeparatorStyle.none

        
        //radarChart.frame = frame
        
        
        setupData(protein: 0, calcium: 0, fat: 0, sodium: 0, vitaminC: 0, vitaminA: 0)
        setupViews()
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(protein: Double,calcium: Double, fat: Double, sodium: Double, vitaminC:Double, vitaminA: Double){
//        setupPieChartData(protein: protein, calcium: calcium, fat: fat, sodium: sodium, vitaminC: vitaminC, vitaminA: vitaminA)
        setupRadarChartData(protein: protein, calcium: calcium, fat: fat, sodium: sodium, vitaminC: vitaminC, vitaminA: vitaminA)
        setupBothSidesData(protein: protein, calcium: calcium, fat: fat, sodium: sodium, vitaminC: vitaminC, vitaminA: vitaminA)
    }
    
    func setupBothSidesData(protein: Double,calcium: Double, fat: Double, sodium: Double, vitaminC:Double, vitaminA: Double){
        let physicalAttributedText0 = NSMutableAttributedString(string: "\(String(format: "%.1f\("g")", protein))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor(red: 66/255, green: 134/255, blue: 244/255, alpha: 1)])
        physicalAttributedText0.append(NSMutableAttributedString(string: "\nProtein", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 8), NSAttributedString.Key.foregroundColor: UIColor.black]))
        nutrientOverviewProtein.attributedText = physicalAttributedText0
        
        let physicalAttributedText1 = NSMutableAttributedString(string: "\(String(format: "%.1f\("mg")", calcium))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor(red: 66/255, green: 134/255, blue: 244/255, alpha: 1)])
        physicalAttributedText1.append(NSMutableAttributedString(string: "\nCalcium", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 8), NSAttributedString.Key.foregroundColor: UIColor.black]))
        nutrientOverviewCalcium.attributedText = physicalAttributedText1
        
        let physicalAttributedText2 = NSMutableAttributedString(string: "\(String(format: "%.1f\("g")", fat))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor(red: 66/255, green: 134/255, blue: 244/255, alpha: 1)])
        physicalAttributedText2.append(NSMutableAttributedString(string: "\nFat", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 8), NSAttributedString.Key.foregroundColor: UIColor.black]))
        nutrientOverviewFat.attributedText = physicalAttributedText2
        
        let physicalAttributedText3 = NSMutableAttributedString(string: "\(String(format: "%.1f\("mg")", sodium))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor(red: 66/255, green: 134/255, blue: 244/255, alpha: 1)])
        physicalAttributedText3.append(NSMutableAttributedString(string: "\nSodium", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 8), NSAttributedString.Key.foregroundColor: UIColor.black]))
        nutrientOverviewSodium.attributedText = physicalAttributedText3
        
        let physicalAttributedText4 = NSMutableAttributedString(string: "\(String(format: "%.1f\("mg")", vitaminC))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor(red: 66/255, green: 134/255, blue: 244/255, alpha: 1)])
        physicalAttributedText4.append(NSMutableAttributedString(string: "\nVitaminC", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 8), NSAttributedString.Key.foregroundColor: UIColor.black]))
        nutrientOverviewVitaminC.attributedText = physicalAttributedText4
        
        let physicalAttributedText5 = NSMutableAttributedString(string: "\(String(format: "%.1f\("mg")", vitaminA))", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor(red: 66/255, green: 134/255, blue: 244/255, alpha: 1)])
        physicalAttributedText5.append(NSMutableAttributedString(string: "\nVitaminA", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 8), NSAttributedString.Key.foregroundColor: UIColor.black]))
        nutrientOverviewVitaminA.attributedText = physicalAttributedText5
        
     
    }
    
//    func setupPieChartData(protein: Double,calcium: Double, fat: Double, sodium: Double, vitaminC:Double, vitaminA: Double){
//
//        proteinDataEntry.value = protein
//        proteinDataEntry.label = "Pro"
//        calciumDataEntry.value = calcium
//        calciumDataEntry.label = "Ca"
//        fatDataEntry.value = fat
//        fatDataEntry.label = "Fat"
//        sodiumDataEntry.value = sodium
//        sodiumDataEntry.label = "Sodium"
//        CDataEntry.value = vitaminC
//        CDataEntry.label = "Vc"
//        ADataEntry.value = vitaminA
//        ADataEntry.label = "Va"
//        pieChartDataEntryArray = [proteinDataEntry,calciumDataEntry,fatDataEntry,sodiumDataEntry,CDataEntry,ADataEntry]
//
//        let chartDataSet = PieChartDataSet(values: pieChartDataEntryArray, label: nil)
//        let chartData = PieChartData(dataSet: chartDataSet)
//        let colors = [UIColor.orange,UIColor.brown,UIColor.blue,UIColor.red,UIColor.green,UIColor.gray]
//        chartDataSet.colors = colors as! [NSUIColor]
//        overviewChart.data = chartData
//        chartDataSet.selectionShift = 0
//        chartData.setDrawValues(false)
//    }
    
    func setupRadarChartData(protein: Double,calcium: Double, fat: Double, sodium: Double, vitaminC:Double, vitaminA: Double){
        let proteinDataEntry = RadarChartDataEntry(value: protein)
        let calciumDataEntry = RadarChartDataEntry(value: calcium)
        let fatDataEntry = RadarChartDataEntry(value: fat)
        let sodiumDataEntry = RadarChartDataEntry(value: sodium)
        let CDataEntry = RadarChartDataEntry(value: vitaminC)
        let ADataEntry = RadarChartDataEntry(value: vitaminA)
        var radarChartDataEntryArray = [RadarChartDataEntry]()
//
//        proteinDataEntry.value = protein
//        //proteinDataEntry.label = "Pro"
//        calciumDataEntry.value = calcium
//        //calciumDataEntry.label = "Ca"
//        fatDataEntry.value = fat
//        //fatDataEntry.label = "Fat"
//        sodiumDataEntry.value = sodium
//        //sodiumDataEntry.label = "Sodium"
//        CDataEntry.value = vitaminC
//        //CDataEntry.label = "Vc"
//        ADataEntry.value = vitaminA
//        //ADataEntry.label = "Va"
        
        radarChartDataEntryArray = [proteinDataEntry,calciumDataEntry,fatDataEntry,sodiumDataEntry,CDataEntry,ADataEntry]
        
        radar.webColor = UIColor(red: 232/255, green: 232/255, blue: 0/255, alpha: 1)
        radar.innerWebColor = UIColor(red: 232/255, green: 232/255, blue: 0/255, alpha: 1)
        radar.webAlpha = 1.0
        
        
        radar.xAxis.xOffset = 0.0
        radar.xAxis.yOffset = 0.0
        radar.xAxis.labelTextColor = UIColor(red: 66/255, green: 134/255, blue: 244/255, alpha: 1)
        radar.xAxis.labelFont = .boldSystemFont(ofSize: 9)
        radar.xAxis.drawLabelsEnabled = true
        radar.xAxis.labelWidth = 2
        radar.xAxis.labelHeight = 2
        
        radar.yAxis.labelCount = 3
        radar.yAxis.axisMinimum = 0
        radar.yAxis.axisMaximum = 60
        radar.yAxis.drawLabelsEnabled = false
        radar.yAxis.labelFont = .systemFont(ofSize: 8, weight: .light)
        
        radar.rotationEnabled = false
        radar.legend.enabled = false
        radar.chartDescription?.enabled = false
        
        let chartDataSet = RadarChartDataSet(values: radarChartDataEntryArray, label: "Yours")
        chartDataSet.drawFilledEnabled = true
        chartDataSet.fillAlpha = 0.5
        chartDataSet.lineWidth = 2
        chartDataSet.fillColor = UIColor(red: 66/255, green: 134/255, blue: 244/255, alpha: 1)
        let chartData = RadarChartData(dataSet: chartDataSet)
        chartData.setDrawValues(true)
        chartData.setValueFont(.systemFont(ofSize: 8, weight: .light))
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 1
        formatter.multiplier = 1.0
        formatter.percentSymbol = "%"
        formatter.zeroSymbol = ""
        chartData.setValueFormatter(DefaultValueFormatter(formatter: formatter))
        
        
        let xValues = ["Protein", "Calcium", "Fat", "Sodium", "VitaminC", "VitaminA"]
        let chartFormatter = RadarChartFormatter(labels: xValues)
        let xAxis = XAxis()
        xAxis.valueFormatter = chartFormatter
        radar.xAxis.valueFormatter = xAxis.valueFormatter
      
        radar.data = chartData
        radar.notifyDataSetChanged()
    }
    private class RadarChartFormatter: NSObject, IAxisValueFormatter {
        
        var labels: [String] = []
        
        func stringForValue(_ value: Double, axis: AxisBase?) -> String {
            if Int(value) < labels.count {
                return labels[Int(value)]
            }else{
                return String("")
            }
        }
        
        init(labels: [String]) {
            super.init()
            self.labels = labels
        }
    }
    
    
    func setupViews(){
//        addSubview(overviewLabel)
//        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
//        overviewLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
//        overviewLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
//        overviewLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
//        overviewLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.12).isActive = true
        
        addSubview(tableView0)
        tableView0.translatesAutoresizingMaskIntoConstraints = false
        tableView0.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
        tableView0.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView0.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.15).isActive = true
        tableView0.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        addSubview(tableView1)
        tableView1.translatesAutoresizingMaskIntoConstraints = false
        tableView1.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
        tableView1.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView1.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.15).isActive = true
        tableView1.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        
        
        addSubview(radar)
        radar.translatesAutoresizingMaskIntoConstraints = false
        radar.centerXAnchor.constraint(equalTo: centerXAnchor,constant: 0).isActive = true
        radar.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.7).isActive = true
        radar.topAnchor.constraint(equalTo: topAnchor).isActive = true
        radar.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.88).isActive = true
//        addSubview(overviewChart)
//        overviewChart.translatesAutoresizingMaskIntoConstraints = false
//        overviewChart.leadingAnchor.constraint(equalTo: tableView0.trailingAnchor).isActive = true
//        overviewChart.trailingAnchor.constraint(equalTo: tableView1.leadingAnchor).isActive = true
//        overviewChart.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//        overviewChart.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableView0{
            return 3
        }else{
            return 3
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableView0{
            if indexPath.row == 0{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId00")
                
                cell.addSubview(nutrientOverviewProtein)
                nutrientOverviewProtein.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewProtein.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewProtein.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewProtein.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewProtein.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }
            if indexPath.row == 1{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId01")
                
                cell.addSubview(nutrientOverviewCalcium)
                nutrientOverviewCalcium.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewCalcium.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewCalcium.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewCalcium.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewCalcium.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }else{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId02")
                
                cell.addSubview(nutrientOverviewFat)
                nutrientOverviewFat.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewFat.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewFat.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewFat.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewFat.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }
            
        }else{
            if indexPath.row == 0{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId10")
                
                cell.addSubview(nutrientOverviewSodium)
                nutrientOverviewSodium.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewSodium.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewSodium.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewSodium.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewSodium.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }
            if indexPath.row == 1{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId11")
                
                cell.addSubview(nutrientOverviewVitaminC)
                nutrientOverviewVitaminC.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewVitaminC.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewVitaminC.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewVitaminC.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewVitaminC.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }else{
                let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId12")
                
                cell.addSubview(nutrientOverviewVitaminA)
                nutrientOverviewVitaminA.translatesAutoresizingMaskIntoConstraints = false
                nutrientOverviewVitaminA.centerXAnchor.constraint(equalTo: cell.centerXAnchor, constant: 0).isActive = true
                nutrientOverviewVitaminA.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: 0).isActive = true
                nutrientOverviewVitaminA.heightAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 1).isActive = true
                nutrientOverviewVitaminA.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 1).isActive = true
                return cell
            }
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == tableView0{
            return 1
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == tableView0{
            return tableView.frame.height/3
        }else{
            return tableView.frame.height/3
        }
    }
    
}
extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}
