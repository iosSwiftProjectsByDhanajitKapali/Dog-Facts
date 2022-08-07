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
        imageView.image = UIImage(named: Constants.Image.AssetImage.DOG_IMAGE)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - IBOutlets
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    
    // MARK: - IBActions
    @IBAction func refreshButtonPressed(_ sender: UIButton) {
        self.presenter.getNewDogFact()
    }
    
}


// MARK: - LifeCycle Methods
extension NewFactsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        addGradientLayer()
        setUpView()
        animateDogImage()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}


// MARK: - Private Methods
extension NewFactsViewController {
    func initialSetup() {
        //setting self delegate of presenter
        presenter = NewFactsPresenter(withDelegate : self)
    }
    
    func setUpView() {
        self.refreshButton.layer.cornerRadius = 10
        self.view.addSubview(dogImageView)
        self.factLabel.layer.zPosition = 1
        self.refreshButton.layer.zPosition = 1
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
            self.dogImageView.frame = CGRect(x: self.view.center.x-50, y: self.view.center.y - (self.view.center.y)/1.2, width: 100, height: 100)
        }, completion: { done in
            self.presenter.getNewDogFact()
        })

    }
}

//MARK: - Presenter Methods
extension NewFactsViewController : NewFactsPresenterDelegate {
    func presentDogFact(fact: String) {
        self.factLabel.text = fact
    }
}

