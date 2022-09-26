//
//  wordlePresenter.swift
//  wordle
//
//  Created by 永末拓朗 on 2022/08/13.
//

import Foundation

class wordlePresenter{
    
    let model = wordleModel()
    let database = Database()
    var question = ""
    
    func gameStart() -> String{
        self.model.correctFlgInit()
        let ramdom = Int.random(in: 1...152)
        self.question = database.userDatastore.select(no: ramdom)
        return question
    }
    
    func onBtn(ans:String, ques:String) -> Array<String>{
        let result = model.wordCheck(answer: ans, question: ques)
        return result
    }
    
    func selectQue(ramdom:Int) -> String{
        self.question = database.userDatastore.select(no: ramdom)
        return question
    }
    
    func getCorrectFlg() -> Bool{
        return self.model.correctFlg
    }
    
}
