//
//  DocumentTableViewCell.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2022/03/27.
//

import UIKit

class DocumentTableViewCell: UITableViewCell {
    @IBOutlet private(set) weak var documentNameLabel: UILabel!
    @IBOutlet private(set) weak var deadlineLabel: UILabel!
    @IBOutlet private(set) weak var documentCell: UIView!
    @IBOutlet private(set) weak var documentContetView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

//        documentCell.layer.cornerRadius = 20.0
        documentCell.backgroundColor = .clear
        documentCell.layer.shadowOffset = .init(width: 0.5, height: 0.5)
        documentCell.layer.shadowOpacity = 0.2
        documentCell.layer.shadowRadius = 20.0
        documentContetView.layer.cornerRadius = 20.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
