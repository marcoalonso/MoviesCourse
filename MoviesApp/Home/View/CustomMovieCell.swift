//
//  CustomMovieCell.swift
//  MoviesApp
//
//  Created by marco rodriguez on 28/09/22.
//

import UIKit

class CustomMovieCell: UITableViewCell {

    @IBOutlet weak var descriptionMovie: UILabel!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var imageMovie: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
