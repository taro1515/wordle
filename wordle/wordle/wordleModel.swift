//
//  wordleModel.swift
//  wordle
//
//  Created by 永末拓朗 on 2022/08/13.
//

import Foundation

class wordleModel{

    var correctFlg = false
    
    //回答確認
    func wordCheck(answer:String, question:String) -> Array<String>{
        //1文字ずつに分割
        let ansArray = Array(answer)
        let quesArray = Array(question)
        
        var resultArray : [String] = []
        
        var ansCnt = 0
        for ans in ansArray{
            var quesCnt = 0
            
            if quesArray.count <= ansCnt{
                break
            }
            //文字と場所が一致しているか
            if ans == quesArray[ansCnt]{
                resultArray.append("2")
            }else{
                for ques in quesArray{
                    //文字が含まれているか
                    if ans == ques{
                        resultArray.append("1")
                        break
                    }
                    if quesCnt == quesArray.count - 1{
                        resultArray.append("0")
                    }else{
                        quesCnt += 1
                    }
                }
            }
            ansCnt += 1
        }
        
        self.correctCheck(resultArray: resultArray)
        
        while resultArray.count < 6{
            resultArray.append("0")
        }
        
        return resultArray
    }
    
    func correctCheck(resultArray:[String]){
        self.correctFlg = true
        for check in resultArray{
            if check != "2"{
                self.correctFlg = false
                break
            }
        }
    }
    
    func correctFlgInit(){
        self.correctFlg = false
    }
}
