//
//  NewFactsViewModel.swift
//  Dog Facts
//
//  Created by unthinkable-mac-0025 on 07/08/22.
//

import Foundation

protocol NewFactsPresenterDelegate : AnyObject{
    func presentDogFact(fact : String)
}

class NewFactsPresenter {
 
    weak var delegate : NewFactsPresenterDelegate?
    
    init(withDelegate delegate: NewFactsPresenterDelegate) {
        self.delegate = delegate
    }
}


// MARK: - Public Methods
extension NewFactsPresenter {
    public func getNewDogFact() {
        let urlString = "https://dog-api.kinduff.com/api/facts?number=1"
        let url = URL(string: urlString)
        //make the call
        NetworkManager().getApiData(forUrl: url!, resultType: NewFactsModel.self) { (result) in
            switch result{
            case .success(let dogFacts):
                //print(dogFacts.facts.count)
                self.delegate?.presentDogFact(fact: dogFacts.facts.first ?? "")
                
            case .failure(let error):
                print(error.localizedDescription)
                //self.delegate?.stopAndHideLoader()
                //self.delegate?.presentAlert(title: "Error" , message: error.localizedDescription)
            }
        }
    }
}
