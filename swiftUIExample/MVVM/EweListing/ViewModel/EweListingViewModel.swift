//
//  EweListingViewModel.swift
//  swiftUIExample
//
//  Created by user174699 on 7/9/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import Foundation

class EweListingViewModel: ObservableObject {
    
    @Published var data: [EweInfo]
    private var repository: EweLisitngRepository
    
    @Published private var isFetchingData: Bool
     var currentPage: Int
    private var totalPagesNumber: Int
    let prefetchingLength: Int = 2
    private (set) var totalItems: Int
    @Published private (set) var isError: Bool
    
    var showPrimaryLoader: Bool {
        return currentPage == 1 && !isError
    }
    
    var showLoaderCell: Bool {
        return (isFetchingData && currentPage > 1)
    }
    
    func getViewModelFor(_ item: EweInfo) -> EweListingItemViewModel {
        return EweListingItemViewModel(item)
    }
    
    init() {
        self.data = []
        self.repository = EweLisitngRepository()
        self.totalPagesNumber = 1
        self.currentPage = 1
        self.isFetchingData = false
        self.totalItems = 0
        self.isError = false
    }
    
    func onItemAppear(_ item: EweInfo) {
        guard let index = data.firstIndex(where: { temp in
            return temp.id == item.id
        }) else {
            return
        }
        
        guard index >= data.count - prefetchingLength else {
            return
        }
        
        preFetchData()
    }
    
    func clearData() {
        repository.cancelCalls()
        data = [EweInfo]()
        isFetchingData = false
        currentPage = 1
        totalPagesNumber = 1
        self.totalItems = 0
        self.isError = false
    }
    
    func preFetchData() {
        guard currentPage > 1 else {
            return
        }
        
        fetchData()
    }
    
    func fetchData() {
        guard currentPage <= totalPagesNumber, !isFetchingData else {
            return
        }
        
        isFetchingData = true
        
        let completion: (EweListingResponse) -> Void = { [weak self] eweListingResponse in
            
            self?.totalItems = eweListingResponse.meta.total
            
            guard eweListingResponse.meta.currentPage == self?.currentPage else {
                return
            }
                        
            self?.totalPagesNumber = eweListingResponse.meta.lastPage
            self?.isFetchingData = false
            self?.data += eweListingResponse.data
            self?.currentPage += 1
        }
        
        let errorHandler: (String, Int) -> Void = { [weak self] error, code in
            
            self?.isFetchingData = false
            
            let statusCode = Enums.StatusCode(rawValue: code)
            
            switch statusCode {
            case .UN_AUTHORIZED:
                self?.isError = true
            default:
                if self?.currentPage == 1 {
                    self?.isError = true
//                    self?.communicator.showAlertDialog(title: NSLocalizedString("error", comment: ""), message: NSLocalizedString("server_error", comment: ""))
                }
            }
            
        }
        
        repository.fetchDataOfPage(page: currentPage, completion: completion, errorHandler: errorHandler)
    }
    
}
