//
//  DetailsTableViewCell.swift
//  NikeMusicSearch
//
//  Created by Bharani Cherukuri on 4/20/20.
//  Copyright © 2020 Bharani.Cherukuri. All rights reserved.
//

import UIKit
import Foundation

class DetailsTableViewCell: UITableViewCell {
    
    var music: Music? {
        didSet {
            guard let dataItem = music else { return }
            if let imageData = dataItem.artworkUrl100 {
                guard let url = URL(string: imageData) else { return }
                if let data = try? Data(contentsOf: url) {
                    let image = UIImage(data: data)
                    thumbnailImageView.image = image
                }
            }
            
            if let albumName = dataItem.name, let name = dataItem.artistName {
                albumLabel.text = albumName
                artistNameLabel.text = name
            }
        }
    }
    
    let thumbnailImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        return img
    }()
    
    let artistNameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor =  UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let albumLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor =  UIColor.black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.contentView.addSubview(thumbnailImageView)
        self.contentView.addSubview(containerView)
        
        containerView.addSubview(artistNameLabel)
        containerView.addSubview(albumLabel)
        
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.thumbnailImageView.trailingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant: -10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        thumbnailImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        thumbnailImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        thumbnailImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
        thumbnailImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        artistNameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        artistNameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        artistNameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        artistNameLabel.bottomAnchor.constraint(equalTo:albumLabel.topAnchor, constant: -10).isActive = true
        
        albumLabel.topAnchor.constraint(equalTo:self.artistNameLabel.bottomAnchor).isActive = true
        albumLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        albumLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
