//
//  MusicViewController.swift
//  NikeMusicSearch
//
//  Created by Bharani Cherukuri on 4/20/20.
//  Copyright © 2020 Bharani.Cherukuri. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController {
    
    let musicTableView = UITableView()
    private var music: [Music] = []
    private var initialData: InitialData?
    var indicator = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        setUpNavigation()
        activityIndicator()
        indicator.startAnimating()
        indicator.backgroundColor = UIColor.white
        MusicAPI.getMusicList(onCompletion: { json,data, initialData in
            self.music = data
            self.initialData = initialData
            DispatchQueue.main.async {
                self.indicator.stopAnimating()
                self.indicator.hidesWhenStopped = true
                self.setUpTableView()
                self.musicTableView.reloadData()
            }
        })
    }
    
    func setUpNavigation() {
        navigationItem.title = "Music"
        self.navigationController?.navigationBar.barTintColor = UIColor.lightGray
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1)]
    }
    
    func setUpTableView() {
        view.addSubview(musicTableView)
        musicTableView.dataSource = self
        musicTableView.delegate = self
        musicTableView.translatesAutoresizingMaskIntoConstraints = false
        musicTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        musicTableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        musicTableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        musicTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        musicTableView.register(DetailsTableViewCell.self, forCellReuseIdentifier: "detailsCell")
    }
    
    func activityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.style = UIActivityIndicatorView.Style.medium
        indicator.center = self.view.center
        self.view.addSubview(indicator)
    }
}

extension MusicViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if music.count == 0 {
            return 0
        } else {
            return music.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath) as! DetailsTableViewCell
        cell.music = music[indexPath.row]
        return cell
    }
}

extension MusicViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailsController = DetailsViewController(data: music[indexPath.row])
        self.navigationController?.pushViewController(detailsController, animated: true)
    }
}
