//
//  LabToDoTableViewCell.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2022/03/30.
//

import UIKit

class LabToDoTableViewCell: UITableViewCell {
    @IBOutlet private(set) weak var todoLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
