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
    
    // MARK: - Properties
    private let serviceSpy = ServiceAPISpy()
    private let delegateSpy = HomeViewModelDelegateSpy()
    
    private lazy var sut: HomeViewModel = {
        return HomeViewModel(service: serviceSpy)
    }()
    
    // MARK: - Tests
    private func test_chicosProperty_shouldInitializeEmpty() {
        XCTAssertEqual(sut.chicos, [])
    }
    
    private func test_fetchChicos_shouldNotCallServiceFetchChicos() {
        XCTAssertFalse(serviceSpy.fetchChicosCalled)
    }
    
    private func test_fetchChicos_shouldCallServiceFetchChicos() {
        // When
        sut.fetchChicos()
        
        // Then
        XCTAssertTrue(serviceSpy.fetchChicosCalled)
    }
    
    private func test_fetchChicos_shouldCallServiceFetchChicosOnce() {
        // When
        sut.fetchChicos()
        
        // Then
        XCTAssertEqual(serviceSpy.fetchChicosCallCount, 1)
    }
    
    private func test_fetchChicos_shouldCallServiceFetchChicosThirteenTimes() {
        // When
        for _ in 1...13 {
            sut.fetchChicos()
        }
        // Then
        XCTAssertEqual(serviceSpy.fetchChicosCallCount, 13)
    }
    
    private func test_fetchChicos_whenResultIsNil_shouldNotCallDelegate() {
        // Given
        sut.delegate = delegateSpy
        serviceSpy.fetchChicosResponse = nil
        
        // When
        sut.fetchChicos()
        
        // Then
        XCTAssertFalse(delegateSpy.didFetchDataCalled)
    }
    
    private func test_fetchChicos_whenResultIsValid_shouldCallDelegate() {
        // Given
        sut.delegate = delegateSpy
        serviceSpy.fetchChicosResponse = nil
        serviceSpy.fetchChicosResponse = [Chico.fixture(name: "Chico 13")]
        
        // When
        sut.fetchChicos()
        
        // Then
        XCTAssertEqual(sut.chicos.count, 1)
        XCTAssertTrue(delegateSpy.didFetchDataCalled)
        XCTAssertEqual(delegateSpy.didFetchDataResponse?.first?.name, "Chico 13")
    }
    
    private func test_getChico_atFirstPosition() {
        // Given
        let chicoList = Chico.fixtureList()
        let firstPosition = 1
        let indexToTest = IndexPath(row: firstPosition, section: .zero)
        sut.chicos = chicoList
        
        // When
        let selectedChico = sut.getChico(at: indexToTest)
        
        // Then
        XCTAssertNotNil(selectedChico)
        XCTAssertEqual(selectedChico, chicoList[firstPosition])
    }
    
    private func test_getChico_atLastPosition() {
        // Given
        let chicoList = Chico.fixtureList()
        let lastPosition = chicoList.count - 1
        let indexToTest = IndexPath(row: lastPosition, section: .zero)
        sut.chicos = chicoList
        
        // When
        let selectedChico = sut.getChico(at: indexToTest)
        
        // Then
        XCTAssertNotNil(selectedChico)
        XCTAssertEqual(selectedChico, chicoList[lastPosition])
    }
    
    private func test_getChico_atRandomPosition() {
        // Given
        let chicoList = Chico.fixtureList()
        let randomPosition = Int.random(in: 0..<chicoList.count)
        let indexToTest = IndexPath(row: randomPosition, section: .zero)
        sut.chicos = chicoList
        
        // When
        let selectedChico = sut.getChico(at: indexToTest)
        
        // Then
        XCTAssertNotNil(selectedChico)
        XCTAssertEqual(selectedChico, chicoList[randomPosition])
        XCTAssertEqual(selectedChico.name, chicoList[randomPosition].name)
    }

}
