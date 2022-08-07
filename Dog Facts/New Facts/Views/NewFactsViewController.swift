//
//  ViewController.swift
//  Dog Facts
//
//  Created by unthinkable-mac-0025 on 07/08/22.
//

import UIKit

class NewFactsViewController: UIViewController {

    // MARK: - Private Data Members
    private var presenter : NewFactsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        
        addGradientLayer()
        
        presenter.getNewDogFact()
    }


}



// MARK: - Private Methods
extension NewFactsViewController {
    func initialSetup() {
        //setting self delegate of presenter
        presenter = NewFactsPresenter(withDelegate : self)
    }
    
    func addGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        let gradientColors = [
            UIColor.systemPurple.cgColor,
            UIColor.systemBlue.cgColor,
            UIColor.systemTeal.cgColor,
        ]
        gradientLayer.colors = gradientColors
        self.view.layer.addSublayer(gradientLayer)
    }
}

//MARK: - Presenter Methods
extension NewFactsViewController : NewFactsPresenterDelegate {
    func presentDogFact(fact: String) {
        print(fact)
    }
}

