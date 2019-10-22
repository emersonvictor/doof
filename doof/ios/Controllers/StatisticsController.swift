//
//  StatisticsController.swift
//  doof
//
//  Created by Emerson Victor on 28/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import UIKit

class StatisticsController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var statisticsCollectionView: UICollectionView!
    
    // MARK: - Initializers
    override func viewDidLoad() {
        // Set collection view delegate and data source
        self.statisticsCollectionView.delegate = self
        self.statisticsCollectionView.dataSource = self
        
        // Register xib
        self.statisticsCollectionView.register(UINib(nibName: "StatisticsWeekCell", bundle: nil), forCellWithReuseIdentifier: "WeekStatistics")
        self.statisticsCollectionView.register(UINib(nibName: "StatisticsCell", bundle: nil), forCellWithReuseIdentifier: "Statistics")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        super.viewWillAppear(animated)
    }
}

extension StatisticsController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeekStatistics", for: indexPath)
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Statistics", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 32
        
        if indexPath.row == 0 { return CGSize(width: width, height: 255) }
        return CGSize(width: width, height: 135)
    }
}
