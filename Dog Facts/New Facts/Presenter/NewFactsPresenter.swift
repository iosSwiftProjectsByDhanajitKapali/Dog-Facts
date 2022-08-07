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
    
    ///Use this Method to make an API call to fetch a new Dog Fact
    public func getNewDogFact() {
        let endPoint = "api/facts?number=1"
        //make the call
        NetworkManager().getApiData(forEndPoint: endPoint, resultType: NewFactsModel.self) { [weak self] result in
            switch result{
            case .success(let dogFacts):
                self?.processDogFact(dogFacts: dogFacts)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


// MARK: - Private Methods
extension NewFactsPresenter {
    func processDogFact(dogFacts : NewFactsModel){
        
        let factString = dogFacts.facts.first
        guard factString != nil else{
            return 
        }
        
        let processedString = factString!.trunc(length: 230)
        
        DispatchQueue.main.async {
            self.delegate?.presentDogFact(fact: processedString)
        }
    }
    
    
}

