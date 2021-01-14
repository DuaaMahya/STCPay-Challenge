//
//  SenatorJsonManger.swift
//  STCPay-Challenge
//
//  Created by Duaa on 01/06/1442 AH.
//

protocol jsonDelegate {
    func updateData(_ manger: SenatorJsonManger, senator: SenatorsResponse)
}

import Foundation

class SenatorJsonManger {
    
    var delegate: jsonDelegate?
    
    
    func fetchLocalFile(completion: @escaping (Result<SenatorsResponse, Error>) -> Void) {
        guard let url = Bundle.main.url(forResource: "us_senators", withExtension: "json") else {
            fatalError("Couldn't find json")
        }
        do {
            let objectData = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(SenatorsResponse.self, from: objectData)
            print(decodedData.objects)
            self.delegate?.updateData(self, senator: decodedData)
            
        } catch {
            print(error.localizedDescription)
        }
        
    }

}
