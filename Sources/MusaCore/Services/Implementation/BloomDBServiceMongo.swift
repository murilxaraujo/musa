//
//  BloomDBServiceMongo.swift
//  
//
//  Created by Murilo Araujo on 26/02/21.
//

import MongoSwift

class BloomDBServiceMongo: BloomDBService {
    func registerNew(instance instanceID: String, forClient clientID: String) {
        
    }
    
    func disableInstance(_ instanceID: String) {
        
    }
    
    func getAllInstances(forClient clientID: String) {
        
    }
    
    let mongoClient: MongoClient
    
    init(_ mongoClient: MongoClient) {
        self.mongoClient = mongoClient
    }
}
