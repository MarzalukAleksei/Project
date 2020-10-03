//
//  LaunchScreenInteractor.swift
//  Project
//
//  Created by Cyril Romanovsky on 10/3/20.
//  Copyright © 2020 ブラック狼. All rights reserved.
//

class LaunchScreenInteractor: ILaunchScreenInteractor {
    private let csvRepository: ICSVRepository
    private let csvMapper: ICSVMapper
    
    init(csvMapper: ICSVMapper, csvRepository: ICSVRepository) {
        self.csvMapper = csvMapper
        self.csvRepository = csvRepository
    }
}
