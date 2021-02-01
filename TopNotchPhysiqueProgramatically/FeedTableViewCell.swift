//
//  FeedTableViewCell.swift
//  TopNotchPhysiqueProgramatically
//
//  Created by Tommy Smale on 9/13/20.
//  Copyright © 2020 Tommy Smale. All rights reserved.
//

import UIKit
import AVFoundation

class FeedTableViewCell: UITableViewCell {
    
    var profilePicture = UIImageView()
    var contentCreator = UILabel()
    var contentCell = UIView()
    var defaultContent = UIImageView()
    var contentTitle = UILabel()

    
    let contentCellSize : CGFloat = 300

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "FeedTableViewCell")
        // Initialization code

        profilePicture.translatesAutoresizingMaskIntoConstraints = false
        contentCreator.translatesAutoresizingMaskIntoConstraints = false
        contentCell.translatesAutoresizingMaskIntoConstraints = false
        defaultContent.translatesAutoresizingMaskIntoConstraints = false
        contentTitle.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(profilePicture)
        contentView.addSubview(contentCreator)
        contentView.addSubview(contentCell)
        contentCell.addSubview(defaultContent)
        contentView.addSubview(contentTitle)
        
        let margins = contentView.layoutMarginsGuide
          
        NSLayoutConstraint.activate([
            
            profilePicture.topAnchor.constraint(equalTo: margins.topAnchor),
            profilePicture.heightAnchor.constraint(equalToConstant: 30),
            profilePicture.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            profilePicture.widthAnchor.constraint(equalToConstant: 30),
            
            contentCreator.topAnchor.constraint(equalTo: margins.topAnchor),
            contentCreator.heightAnchor.constraint(equalTo: profilePicture.heightAnchor),
            contentCreator.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 8),
            contentCreator.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            contentCell.topAnchor.constraint(equalTo: contentCreator.bottomAnchor, constant: 8),
            contentCell.heightAnchor.constraint(equalToConstant: 250),
            contentCell.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            contentCell.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            defaultContent.topAnchor.constraint(equalTo: contentCell.topAnchor),
            defaultContent.bottomAnchor.constraint(equalTo: contentCell.bottomAnchor),
            defaultContent.leadingAnchor.constraint(equalTo: contentCell.leadingAnchor),
            defaultContent.trailingAnchor.constraint(equalTo: contentCell.trailingAnchor),
            
            contentTitle.topAnchor.constraint(equalTo: contentCell.bottomAnchor),
            contentTitle.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            contentTitle.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            contentTitle.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
            
        ])

        profilePicture.layer.borderWidth = 1
        profilePicture.layer.borderColor = UIColor.black.cgColor
        profilePicture.layer.cornerRadius = 15
        profilePicture.layer.masksToBounds = true
        profilePicture.image = UIImage(named: "topnotchShield")
        
        contentCell.layer.borderWidth = 1
        contentCell.layer.cornerRadius = 14
        contentCell.layer.borderColor = UIColor.lightGray.cgColor
        contentCell.layer.masksToBounds = true //content clipped to rounded corners
        //contentCell.layer.shadowOpacity = 1 //range is (0.0, 1.0) = (transparent, opaque)
        contentCell.layer.opacity = 1 // 0.0, 1.0 transparent, opaque. Default is 1
        //contentCell.layer.shadowRadius = 10 //Default is 3.0
        //contentCell.layer.shadowColor = UIColor.green.cgColor

        defaultContent.image = UIImage(named: "topnotchName")
        
        
        contentTitle.layer.borderWidth = 1
        contentTitle.layer.borderColor = UIColor.lightGray.cgColor
        contentTitle.textColor = .lightGray
        contentTitle.backgroundColor = .white

        
        //contentTitle.contentMode = .scaleAspectFill
        //contentCreator.contentMode = .scaleAspectFill
        
        //contentTitle.adjustsFontSizeToFitWidth = true
        //contentTitle.minimumScaleFactor = 0.5
        /*
        let videoPlayer = AVPlayer(url: selectedVideo)
        let playerLayer = AVPlayerLayer(player: videoPlayer)
        playerLayer.frame = contentView.bounds
        contentView.layer.addSublayer(playerLayer)
         */

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
