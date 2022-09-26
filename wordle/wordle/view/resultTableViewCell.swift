//
//  resultTableViewCell.swift
//  wordle
//
//  Created by 永末拓朗 on 2022/08/14.
//

import Foundation
import UIKit

class resultTableViewCell : UITableViewCell{
    
    @IBOutlet weak var answer1: UILabel!
    @IBOutlet weak var answer2: UILabel!
    @IBOutlet weak var answer3: UILabel!
    @IBOutlet weak var answer4: UILabel!
    @IBOutlet weak var answer5: UILabel!
    @IBOutlet weak var answer6: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
