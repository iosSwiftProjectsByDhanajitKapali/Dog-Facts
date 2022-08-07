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
        
        //setting self delegate of presenter
        presenter = NewFactsPresenter(withDelegate : self)
        
        presenter.getNewDogFact()
    }


}

//MARK: - Presenter Methods
extension NewFactsViewController : NewFactsPresenterDelegate {
    func presentDogFact(fact: String) {
        print(fact)
    }
}

