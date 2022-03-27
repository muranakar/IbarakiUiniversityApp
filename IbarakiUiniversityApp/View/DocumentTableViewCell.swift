//
//  DocumentTableViewCell.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2022/03/27.
//

import UIKit

class DocumentTableViewCell: UITableViewCell {
    @IBOutlet weak var documentNameLabel: UILabel!
    @IBOutlet weak var deadlineLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
