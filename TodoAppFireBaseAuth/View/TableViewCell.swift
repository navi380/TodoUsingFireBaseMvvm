//
//  TableViewCell.swift
//  TodoAppFireBaseAuth
//
//  Created by Naveed Tahir on 07/10/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var assignData: Post?{
        didSet{
            self.title.text = assignData?.title
        }
    }
    
}
