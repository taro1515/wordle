//
//  ViewController.swift
//  wordle
//
//  Created by 永末拓朗 on 2022/08/13.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var ansTableVIew: UITableView!
    @IBOutlet weak var ansTxt1: UITextField!
    @IBOutlet weak var ansTxt2: UITextField!
    @IBOutlet weak var ansTxt3: UITextField!
    @IBOutlet weak var ansTxt4: UITextField!
    @IBOutlet weak var ansTxt5: UITextField!
    @IBOutlet weak var ansTxt6: UITextField!
    
    let presenter = wordlePresenter()
    
    var ansText = ""
    var question = ""
    var resultList = [ResultArray]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.ansTableVIew.register(UINib(nibName: "resultTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        self.question = self.presenter.gameStart()
    }

    @IBAction func onBtn() {
        //回答の結合
        self.ansText = String(self.ansTxt1.text ?? "")
        self.ansText += String(self.ansTxt2.text ?? "")
        self.ansText += String(self.ansTxt3.text ?? "")
        self.ansText += String(self.ansTxt4.text ?? "")
        self.ansText += String(self.ansTxt5.text ?? "")
        self.ansText += String(self.ansTxt6.text ?? "")
        
        let check = presenter.onBtn(ans:self.ansText, ques: self.question)
        let resultArray = ResultArray(result: check, ans1: self.ansTxt1.text ?? "", ans2: self.ansTxt2.text ?? "", ans3: self.ansTxt3.text ?? "", ans4: self.ansTxt4.text ?? "", ans5: self.ansTxt5.text ?? "", ans6: self.ansTxt6.text ?? "")
        self.resultList.append(resultArray)
        
        //正解した場合
        if self.presenter.getCorrectFlg() && self.question.count == self.ansText.count{
            let alert = UIAlertController(title: "", message: "正解！", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default) { (action) in
                self.dismiss(animated: true, completion: nil)
                self.resultList.removeAll()
                self.ansTableVIew.reloadData()
                self.question = self.presenter.gameStart()
            }
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }else{
            self.ansTableVIew.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resultList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! resultTableViewCell
        cell.answer1.text = self.resultList[indexPath.row].ans1
        cell.answer2.text = self.resultList[indexPath.row].ans2
        cell.answer3.text = self.resultList[indexPath.row].ans3
        cell.answer4.text = self.resultList[indexPath.row].ans4
        cell.answer5.text = self.resultList[indexPath.row].ans5
        cell.answer6.text = self.resultList[indexPath.row].ans6
        
        cell.answer1.layer.borderWidth = 1.0
        cell.answer1.layer.borderColor = UIColor.black.cgColor
        cell.answer2.layer.borderWidth = 1.0
        cell.answer2.layer.borderColor = UIColor.black.cgColor
        cell.answer3.layer.borderWidth = 1.0
        cell.answer3.layer.borderColor = UIColor.black.cgColor
        cell.answer4.layer.borderWidth = 1.0
        cell.answer4.layer.borderColor = UIColor.black.cgColor
        cell.answer5.layer.borderWidth = 1.0
        cell.answer5.layer.borderColor = UIColor.black.cgColor
        cell.answer6.layer.borderWidth = 1.0
        cell.answer6.layer.borderColor = UIColor.black.cgColor
        
        if self.resultList[indexPath.row].result[0] == "2"{
            cell.answer1.textColor = UIColor.red
        }else if self.resultList[indexPath.row].result[0] == "1"{
            cell.answer1.textColor = UIColor.green
        }
        
        if self.resultList[indexPath.row].result[1] == "2"{
            cell.answer2.textColor = UIColor.red
        }else if self.resultList[indexPath.row].result[1] == "1"{
            cell.answer2.textColor = UIColor.green
        }
        
        if self.resultList[indexPath.row].result[2] == "2"{
            cell.answer3.textColor = UIColor.red
        }else if self.resultList[indexPath.row].result[2] == "1"{
            cell.answer3.textColor = UIColor.green
        }
        
        if self.resultList[indexPath.row].result[3] == "2"{
            cell.answer4.textColor = UIColor.red
        }else if self.resultList[indexPath.row].result[3] == "1"{
            cell.answer4.textColor = UIColor.green
        }
        
        if self.resultList[indexPath.row].result[4] == "2"{
            cell.answer5.textColor = UIColor.red
        }else if self.resultList[indexPath.row].result[4] == "1"{
            cell.answer5.textColor = UIColor.green
        }
        
        if self.resultList[indexPath.row].result[5] == "2"{
            cell.answer6.textColor = UIColor.red
        }else if self.resultList[indexPath.row].result[5] == "1"{
            cell.answer6.textColor = UIColor.green
        }
        
        return cell
    }
    
}

class ResultArray{
    let result :[String]
    let ans1 : String
    let ans2 : String
    let ans3 : String
    let ans4 : String
    let ans5 : String
    let ans6 : String
    
    init(result:[String], ans1:String, ans2:String, ans3:String, ans4:String, ans5:String, ans6:String){
        self.result = result
        self.ans1 = ans1
        self.ans2 = ans2
        self.ans3 = ans3
        self.ans4 = ans4
        self.ans5 = ans5
        self.ans6 = ans6
    }
}

