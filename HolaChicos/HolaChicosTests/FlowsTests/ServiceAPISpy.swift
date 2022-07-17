//
//  ServiceAPISpy.swift
//  HolaChicosTests
//
//  Created by Glauco Dantas Beserra on 17/07/22.
//  Copyright © 2022 My Organization. All rights reserved.
//

@testable import HolaChicos

final class ServiceAPISpy: ServiceAPIProtocol {
    var fetchChicosResponse: [Chico]?
    var fetchChicosCalled: Bool = false
    var fetchChicosCallCount: Int = .zero
    
    func fetchChicos(_ completion: @escaping ([Chico]?) -> Void) {
        fetchChicosCalled = true
        fetchChicosCallCount += 1
        
        completion(fetchChicosResponse)
    }
}


/*
 https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_markup_formatting_ref/index.html#//apple_ref/doc/uid/TP40016497-CH2-SW1
 */

// MARK: - Padrões/Técnicas de testes unitários

/*
 
Stub: conceito que permite controlar os objetos a serem retornados
`ServiceAPIStub`
Spy: permite ter controle se os métodos foram chamados (ou não) e quantas vezes
`ServiceAPISpy`
 
*/
