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
    
    private let dogImageContainer : UIView = {
        let view = UIView()
        return view
    }()
    
    private let dogImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "dog-58")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()


}


// MARK: - LifeCycle Methods
extension NewFactsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        
        addGradientLayer()
        
        self.view.addSubview(dogImageView)
        animateDogImage()
        
        presenter.getNewDogFact()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //dogImageView.frame = CGRect(x: self.view.center.x-50, y: self.view.center.y, width: 100, height: 100)
        //dogImageView.center = self.view.center
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
    
    func animateDogImage() {
        dogImageView.center = self.view.center
        UIView.animate(withDuration: 2, animations: {
            //self.dogImageView.center = newCenter
            self.dogImageView.frame = CGRect(x: self.view.center.x-50, y: self.view.center.y-300, width: 100, height: 100)
        }, completion: { done in
            self.presenter.getNewDogFact()
        })

    }
}

//MARK: - Presenter Methods
extension NewFactsViewController : NewFactsPresenterDelegate {
    func presentDogFact(fact: String) {
        print(fact)
    }
}

