//
//  ACell.swift
//  DNA
//
//  Created by 장서영 on 2021/03/18.
//

import UIKit

class ACell: UITableViewCell {
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearMonthLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailTxt: UITextView!
    @IBOutlet weak var deleteBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
