//
//  SocialLoginRouter.swift
//  AlDwaaNewApp
//
//  Created by ahmed hussien on 02/08/2023.
//

import Foundation

enum ProvidersRouter{
    case getProviders
}

extension ProvidersRouter:RouterProtocol{
    var baseURL: String {
        switch self{
        default:
            return "https://stg-api.dwademo.com/"
        }
    }
    
    var path: String {
        switch self {
        case .getProviders:
            return "occ/v2/aldawaa/third-party/providers?fields=DEFAULT"
           // return "occ/v2/aldawaa/cms/components/ids?\(banners)&fields=FULL&lang=\(currentLang)"
        }
    }

    var currentLang: String {
        get {
            return LocalizationManager.shared.currentLanguage.NetworkLanguage
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getProviders:
            return .get
        }
    }

    var task: RouterTask {
        switch self {
        case .getProviders:
            return .requestNoParameters
        }
    }

    var headers: HTTPHeader? {
        switch self {
        case .getProviders:
            return nil
        }
    }
  
}



   
    
   
    
    


