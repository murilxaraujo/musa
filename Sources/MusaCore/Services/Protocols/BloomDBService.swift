//
//  BloomDBService.swift
//  
//
//  Created by Murilo Araujo on 26/02/21.
//

protocol BloomDBService {
    func registerNew(instance instanceID: String, forClient clientID: String)
    func disableInstance(_ instanceID: String)
    func getAllInstances(forClient clientID: String)
}
