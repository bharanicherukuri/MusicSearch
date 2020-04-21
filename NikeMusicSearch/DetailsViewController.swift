//
//  DetailsViewController.swift
//  NikeMusicSearch
//
//  Created by Bharani Cherukuri on 4/21/20.
//  Copyright © 2020 Bharani.Cherukuri. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    let stackView = UIStackView()
    private var data: Music?
    private enum Constants {
        static let height: CGFloat = 250.0
    }
    
    init(data: Music) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 204/255, alpha: 1)
        setUpStackView()
    }
    
    func setUpStackView() {
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 20.0
        
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.heightAnchor.constraint(equalToConstant: Constants.height).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: Constants.height).isActive = true
        stackView.addArrangedSubview(imageView)
        
        guard let dataItem = data else { return }
        if let imageData = dataItem.artworkUrl100 {
            guard let url = URL(string: imageData) else { return }
            if let data = try? Data(contentsOf: url) {
                let image = UIImage(data: data)
                imageView.image = image
            }
        }
        
        guard let artistName = dataItem.artistName,
            let releaseData = dataItem.releaseDate,
            let copyrightData = dataItem.copyright,
            let genreData = dataItem.genres.first?.name else { return }
        
        let artistNameLabel = UILabel()
        stackView.addArrangedSubview(artistNameLabel)
        artistNameLabel.backgroundColor = UIColor.lightGray
        artistNameLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        artistNameLabel.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        artistNameLabel.text  = "ArtistName: " + artistName
        artistNameLabel.textAlignment = .center
        
        let releaseDate = UILabel()
        stackView.addArrangedSubview(releaseDate)
        releaseDate.backgroundColor = UIColor.lightGray
        releaseDate.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        releaseDate.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        releaseDate.text  = "ReleaseDate: " + releaseData
        releaseDate.textAlignment = .center
        
        let copyright = UILabel()
        stackView.addArrangedSubview(copyright)
        copyright.backgroundColor = UIColor.lightGray
        copyright.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        copyright.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        copyright.text  = "Copyright: " + copyrightData
        copyright.lineBreakMode = .byWordWrapping
        copyright.textAlignment = .center
        
        let genre = UILabel()
        stackView.addArrangedSubview(genre)
        genre.backgroundColor = UIColor.lightGray
        genre.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        genre.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        genre.text  = "Genre: " + genreData
        genre.textAlignment = .center
        
        let button = UIButton()
        button.backgroundColor = UIColor.darkGray
        stackView.addArrangedSubview(button)
        button.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        button.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -20.0).isActive = true
        button.setTitle("View in Itunes", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(didTapAlbum), for: .touchUpInside)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20.0).isActive = true
        stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20.0).isActive = true
    }
    
    @objc func didTapAlbum(sender: UIButton!) {
        guard let dataItem = data else { return }
        guard let str = dataItem.url else { return }
        guard let url = URL(string: str) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
