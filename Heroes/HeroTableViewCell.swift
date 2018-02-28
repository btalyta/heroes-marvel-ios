//
//  HeroesTableViewCell.swift
//  Heroes
//
//  Created by Bárbara Souza on 27/02/2018.
//  Copyright © 2018 Bárbara Souza. All rights reserved.
//

import UIKit
import Kingfisher

class HeroTableViewCell: UITableViewCell {

    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lvThumbnail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepareCell(withHero hero: Hero){
        self.lbName.text = hero.name
        self.lbDescription.text = hero.description
        if let url = URL(string: hero.thumbnail.url){
            self.lvThumbnail.kf.indicatorType = .activity
            self.lvThumbnail.kf.setImage(with: url)
        }else{
            self.lvThumbnail.image = nil
        }
        
        self.lvThumbnail.layer.cornerRadius = self.lvThumbnail.frame.size.height/2
        self.lvThumbnail.layer.borderColor = UIColor.red.cgColor
        self.lvThumbnail.layer.borderWidth = 2.0
    }

}
