//
//  HomeViewModelDelegateSpy.swift
//  HolaChicosTests
//
//  Created by Glauco Dantas Beserra on 17/07/22.
//  Copyright © 2022 My Organization. All rights reserved.
//

import Foundation

@testable import HolaChicos

final class HomeViewModelDelegateSpy: HomeViewModelDelegate {
    var didFetchDataResponse: [Chico]?
    
    var didFetchDataCalled: Bool = false
    var didFetchDataCallCount: Int = .zero

    func didFetch(data: [Chico]) {
        didFetchDataCalled = true
        didFetchDataCallCount += 1
        didFetchDataResponse = data
    }
}
