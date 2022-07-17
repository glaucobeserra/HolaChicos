//
//  HomeViewModelTests.swift
//  HolaChicosTests
//
//  Created by Glauco Dantas Beserra on 17/07/22.
//  Copyright © 2022 My Organization. All rights reserved.
//

import XCTest

@testable import HolaChicos

final class HomeViewModelTests: XCTestCase {
    private let serviceSpy = ServiceAPISpy()
    private let delegateSpy = HomeViewModelDelegateSpy()
    private lazy var sut: HomeViewModel = {
        return HomeViewModel(service: serviceSpy)
    }()
    
    func test_fetchChicos_shouldCallServiceFetchChicos() {
        // Given
        
        // When
        sut.fetchChicos()
        
        // Then
        XCTAssertTrue(serviceSpy.fetchChicosCalled)
    }
    
    func test_fetchChicos_shouldCallServiceFetchChicosOnce() {
        // Given
        
        // When
        sut.fetchChicos()
        
        // Then
        XCTAssertEqual(serviceSpy.fetchChicosCallCount, 1)
    }
    
    func test_fetchChicos_whenResultIsNil_shouldNotCallDelegate() {
        // Given
        sut.delegate = delegateSpy
        serviceSpy.fetchChicosResponse = nil
        
        // When
        sut.fetchChicos()
        
        // Then
        XCTAssertFalse(delegateSpy.didFetchDataCalled)
    }
    
    func test_fetchChicos_whenResultIsValid_shouldCallDelegate() {
        // Given
        sut.delegate = delegateSpy
        serviceSpy.fetchChicosResponse = nil
        serviceSpy.fetchChicosResponse = [Chico.fixture(name: "Chico 13")]
        
        // When
        sut.fetchChicos()
        
        // Then
        XCTAssertTrue(delegateSpy.didFetchDataCalled)
        XCTAssertEqual(delegateSpy.didFetchDataResponse?.first?.name, "Chico 13")
    }

}
