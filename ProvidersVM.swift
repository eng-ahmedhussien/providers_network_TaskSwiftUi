//
//  ProvidersVM.swift
//
//  Created by ahmed hussien on 02/08/2023.
//

import Foundation
import Combine
import SwiftUI


enum providerType: String{
    case APPLE
    case FACEBOOK
    case GOOGLE
    case TWITTER
    
}

class ProvidersVM:ObservableObject{
    private let apiClinet : ProvidersApiClient = ProvidersApiClient()
    
    private var cancellables = Set<AnyCancellable>()
    @Published var ProvidersDataArray:[Provider] = []
    
    init(){
        getProvidersData()

    }
    
    func getProvidersData(){
         apiClinet.getProviders()
            .receive(on:DispatchQueue.main)
            .sink(
                receiveCompletion: handleCompletionError,
                receiveValue: { [weak self] ProvidersData in
                    if let providers =   ProvidersData.providers {
                        self?.ProvidersDataArray = providers
                    }
                    
                    print("count is ",self?.ProvidersDataArray.count ?? "nil")
                }
            )
            .store(in: &cancellables)
    }
    
    func isActiveProvider(type:providerType)->Bool{
        
        
        if let isActive = ProvidersDataArray.first(where: {$0.type == type.rawValue})?.active{
            print("\(type.rawValue ), \(isActive)")
            return isActive
        }else{
            return false
        }

    }
    
    func handleCompletionError(completion:Subscribers.Completion<NetworkError>){
        switch completion {
        case .finished:
            break
        case .failure(let error):
            self.showAppMessage( error.backendErrorModel?.errors?.first?.message ?? "", appearance: .toast(.error))
            
        }
    }
    
}


// enum for 4 types
// create func take type as enum  return bool

