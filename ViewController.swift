//
//  ViewController.swift
//  BMI-Checker
//
//  Created by 藤井辰哉 on 2023/02/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // セルに表示するデータ
    var data = [
        ["BMI","判定基準"],
        ["18.5未満","やせ"],
        ["18.5〜25未満","標準"],
        ["25〜30未満","肥満1度"],
        ["30〜35未満","肥満2度"],
        ["35〜40未満","肥満3度"],
        ["40以上","肥満4度"],
    ]
    
    // セルの個数を指定するデリゲートメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    // セルに値を設定するデータソースメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // TableViewCellの中に配置したLabelを取得する
        let label1 = Cell.contentView.viewWithTag(1) as! UILabel
        let label2 = Cell.contentView.viewWithTag(2) as! UILabel
        
        //Labelにテキストを設定する
        label1.text = data[indexPath.row][0]
        label2.text = data[indexPath.row][1]
        
        return Cell
    }
    
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var bmiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        heightTextField.placeholder = "身長をcmで入力してください"
        weightTextField.placeholder = "体重をkgで入力してください"
    }
    // 計測ボタンを押下後、テキストフィールド値を取得し、その値を計算してBMIラベルに代入する
    @IBAction func checkButton(_ sender: Any) {
        let doubleH = Double(heightTextField.text!)
        let doubleW = Double(weightTextField.text!)
        bmiLabel.text = calculation(height: doubleH!, weight: doubleW!)
    }
    // BMI計算方法を記述する
    func calculation(height: Double, weight: Double) -> String {
        let h = height / 100
        let w = weight
        var result = w / (h * h)
        result = floor(result * 10) / 10
        
        return result.description
        
    }
    
}

