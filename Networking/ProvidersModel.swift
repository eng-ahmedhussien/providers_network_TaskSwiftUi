//
//  ProvidersModel.swift
//  AlDwaaNewApp
//
//  Created by ahmed hussien on 02/08/2023.
//

import Foundation

// MARK: - APIResponse
struct ProvidersModel: Codable {
    let providers: [Provider]?
}

// MARK: - Provider
struct Provider: Codable {
    let id, type: String?
    let active, enabledForMobile, enabledForStoreFront: Bool?
}
