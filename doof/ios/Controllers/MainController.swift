//
//  ViewController.swift
//  mc4
//
//  Created by Emerson Victor on 01/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import SpriteKit
import UIKit

class MainController: UIViewController {
    
    // MARK: Vars
    // Food Timer
    var foodTimer = Timer()
    // Water Timer
    var waterTimer = Timer()
    // Happiness Timer
    var happinessTimer = Timer()
    // Energy Timer
    var energyTimer = Timer()
    // Sleep Bool
    var isSleeping = false
    // User Selected Sleeping Time
    var userSelectedSleepingTime = 8.0 // será selecionado pelo usuário!
    // Slide transition
    lazy var slideTransitioningDelegate = SlidePresentationManager()
    
    
    // MARK: Outlets
    // Outlet Scenery SKView
    @IBOutlet weak var scenerySKView: SKView!
    // Outlet Character SKView
    @IBOutlet weak var characterSKView: SKView!
    // Outlet Food ProgressView
    @IBOutlet weak var foodProgressView: UIProgressView!
    // Outlet Water ProgressView
    @IBOutlet weak var waterProgressView: UIProgressView!
    // Outlet Happiness ProgressView
    @IBOutlet weak var happinessProgressView: UIProgressView!
    // Outlet Energy ProgressView
    @IBOutlet weak var energyProgressView: UIProgressView!
    // Outlet Food Button
    @IBOutlet weak var foodButton: UIButton!
    // Outlet Water Button
    @IBOutlet weak var waterButton: UIButton!
    // Outlet Sleep Button
    @IBOutlet weak var sleepButton: UIButton!
    // Outlet Goals Button
    @IBOutlet weak var goalsButton: UIButton!
    // Outlet Graphics Button
    @IBOutlet weak var graphicsButton: UIButton!
    @IBOutlet weak var shitpost: UILabel!
    
    
    // MARK: Actions & Funcs
    // Action foodButton
    
    func customProgessBars(progressBar: UIProgressView) {
        // Deixar redondo
        progressBar.layer.cornerRadius = 5
        progressBar.clipsToBounds = true
        progressBar.layer.sublayers![1].cornerRadius = 5
        progressBar.subviews[1].clipsToBounds = true
        
        // Deixar o fundo branco
        progressBar.trackTintColor = UIColor.white
    }
    
    @IBAction func foodButtonAction(_ sender: Any) {
        shitpost.isHidden = false
    }
    
    // Action waterButton
    @IBAction func waterButtonAction(_ sender: Any) {
        waterProgressView.progress += 1
    }
    
    // Action sleepButton
    @IBAction func sleepButtonAction(_ sender: Any) {
        isSleeping = !isSleeping
        if isSleeping {
            sleepButton.setTitle("Acordar", for: .normal)
        } else {
            sleepButton.setTitle("Dormir", for: .normal)
        }
    }
    
    // Action pet character
    @IBAction func petTapGesture(_ sender: Any) {
        happinessProgressView.progress += 0.05
    }

    // MARK: Elements time update
    // Food time update
    @objc func foodUpdate() {
        
        // CÁLCULO DO TEMPO DE DECAIMENTO DA FOME:
        // Considerei como base: uma pessoa que dorme 8h por dia deve comer a cada 3,2h. Então, por consideração própria, achei que se ela perder uma refeição, a barra de fome deve estar na metade. Por isso já deixei definido no primeiro if o tempo exato no caso da pessoa dormir 8h. No else, fiz a proporção para essa lógica variando de acordo com o tempo de sono da pessoa.
        
        if userSelectedSleepingTime == 8.0 {
            foodProgressView.progress += (50 / 11.520)
        } else {
            let calc = ((3.2 * self.userSelectedSleepingTime)/8.0) * 360.0
            let calc2 = 5.0 / calc
            foodProgressView.progress += Float(calc2)
        }
        
        
//        let calc = ((24.0 - self.userSelectedSleepingTime)/5.0) * 360.0
//        let calc2 = 5.0 / calc
        
    }
    
    // Water time update
    @objc func waterUpdate() {
        
        // CÁLCULO DO TEMPO DE DECAIMENTO DA SEDE:
        // Considerei como base: uma pessoa que dorme 8h por dia deveria tomar 250mL de água a cada 2h. Então, por consideração própria, achei que se ela passar 3h sem tomar água, a barra de água deve estar na metade. or isso já deixei definido no primeiro if o tempo exato no caso da pessoa dormir 8h. No else, fiz a proporção para essa lógica variando de acordo com o tempo de sono da pessoa.
        
        if userSelectedSleepingTime == 8.0 {
            waterProgressView.progress += (50 / 10.800)
        } else {
            let calc = ((3.0 * self.userSelectedSleepingTime)/8.0) * 360.0
            let calc2 = 5.0 / calc
            waterProgressView.progress += Float(calc2)
        }
    }
    
    // Energy time update
    @objc func energyUpdate() {
        if isSleeping == true {
            energyProgressView.progress += 0.01
        } else {
            energyProgressView.progress -= 0.01
        }
    }
    
    // Happiness time update
    @objc func happinessUpdate() {
        happinessProgressView.progress -= 0.01
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        shitpost.isHidden = true
        
        // Food Progress
        self.foodTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MainController.foodUpdate), userInfo: nil, repeats: true)
        
        // Water Progress
        self.waterTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MainController.waterUpdate), userInfo: nil, repeats: true)
        
        // Energy Progress
        self.waterTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MainController.energyUpdate), userInfo: nil, repeats: true)
        
        // Happiness Progress
        self.happinessTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MainController.happinessUpdate), userInfo: nil, repeats: true)
        
        // Custom Progress Bars
        customProgessBars(progressBar: foodProgressView)
        customProgessBars(progressBar: waterProgressView)
        customProgessBars(progressBar: energyProgressView)
        customProgessBars(progressBar: happinessProgressView)
    }
    
    // Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? FoodController {
            controller.transitioningDelegate = self.slideTransitioningDelegate
            controller.modalPresentationStyle = .custom
        }
    }
}

