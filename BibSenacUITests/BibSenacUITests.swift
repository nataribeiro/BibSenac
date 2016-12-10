//
//  BibSenacUITests.swift
//  BibSenacUITests
//
//  Created by Natanael Ribeiro on 26/11/16.
//  Copyright © 2016 Edm Senac Projeto IOS. All rights reserved.
//

import XCTest

class BibSenacUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let app = XCUIApplication()
        
        let txtTitle = app.textFields["txtTitle"]
        txtTitle.tap()
        txtTitle.typeText("android")
        
        let txtAuthor = app.textFields["txtAuthor"]
        txtAuthor.tap()
        txtAuthor.typeText("lecheta")
        
        XCUIApplication().buttons["btnSearch"].tap()
        
        
        app.tables.cells["Google Android : aprenda a criar aplicações para dispositivos móveis com o Android SDK - 3. ed. rev. ampl. / 2013 - Livro, O Android é a plataforma open-source criada pela Google para o desenvolvimento de aplicações para dispositivos móveis. É a nova sensação do momento e promete revolucionar o desenvolvimento de aplicações. Inclui um sistema operacional baseado no Linux e diversas aplicações, com uma rica interface gráfica, um browser para navegar na internet, integração com o Google Maps, suporte a multimídia, GPS, banco de dados integrado, jogos em 3D e muito mais. A moderna plataforma de desenvolvimento do Android permite desenvolver e integrar aplicações de forma simplificada utilizando a linguagem de programação Java e um ambiente de desenvolvimento de alto nível e produtividade como o Eclipse. Este livro convida o leitor a mergulhar no incrível mundo do Android, onde a imaginação é o limite. A obra traz todos os passos necessários para desenvolver aplicações, desde o básico sobre a instalação do emulador e configuração do ambiente de desenvolvimento até aplicações que utilizem recursos avançados como localização por GPS, reprodução de áudio e vídeo, comunicação com a internet, execução de serviços em segundo plano e banco de dados."].staticTexts["O Android é a plataforma open-source criada pela Google para o desenvolvimento de aplicações para dispositivos móveis. É a nova sensação do momento e promete revolucionar o desenvolvimento de aplicações. Inclui um sistema operacional baseado no Linux e diversas aplicações, com uma rica interface gráfica, um browser para navegar na internet, integração com o Google Maps, suporte a multimídia, GPS, banco de dados integrado, jogos em 3D e muito mais. A moderna plataforma de desenvolvimento do Android permite desenvolver e integrar aplicações de forma simplificada utilizando a linguagem de programação Java e um ambiente de desenvolvimento de alto nível e produtividade como o Eclipse. Este livro convida o leitor a mergulhar no incrível mundo do Android, onde a imaginação é o limite. A obra traz todos os passos necessários para desenvolver aplicações, desde o básico sobre a instalação do emulador e configuração do ambiente de desenvolvimento até aplicações que utilizem recursos avançados como localização por GPS, reprodução de áudio e vídeo, comunicação com a internet, execução de serviços em segundo plano e banco de dados."].tap()
        
        app.buttons["btnAvailability"].tap()
        
        app.tables.cells["Consulta local, Faculdade Senac Porto Alegre"].staticTexts["Faculdade Senac Porto Alegre"].tap()
        
    }
    
}
