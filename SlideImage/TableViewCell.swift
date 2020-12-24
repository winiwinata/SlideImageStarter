//
//  TableViewCell.swift
//  SlideImage
//
//  Created by 羅壽之 on 2020/12/17.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var placeDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
