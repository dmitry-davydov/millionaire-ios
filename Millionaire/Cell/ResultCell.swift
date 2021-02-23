//
//  ResultCell.swift
//  Millionaire
//
//  Created by Дима Давыдов on 20.02.2021.
//

import Foundation
import UIKit

class ResultCell: UITableViewCell {
    static let reuseIdentifier = "RecordCell"
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var score: UILabel!
}
