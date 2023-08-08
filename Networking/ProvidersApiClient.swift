//
//  ProvidersApiClient.swift
//  AlDwaaNewApp
//
//  Created by ahmed hussien on 02/08/2023.
//

import Foundation
import Combine

protocol ProvidersApiProtocol{
    func getProviders()-> AnyPublisher<ProvidersModel,NetworkError>
}


class ProvidersApiClient:APIClient<ProvidersRouter>,ProvidersApiProtocol{
    func getProviders() -> AnyPublisher<ProvidersModel, NetworkError> {
        request(target: .getProviders, responseClass: ProvidersModel.self, authenticationType: .withAuth)
    }
    
    
}


