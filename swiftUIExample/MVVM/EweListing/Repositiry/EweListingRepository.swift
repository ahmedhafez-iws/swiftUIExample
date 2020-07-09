//
//  EweListingRepository.swift
//  swiftUIExample
//
//  Created by user174699 on 7/9/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class EweLisitngRepository {
    
    var dataRequest: DataRequest?
    
    func fetchDataOfPage(page: Int, completion: @escaping (EweListingResponse) -> Void, errorHandler: @escaping (String, Int) -> Void) {
        let userToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijg4NmNmMGY0MDQ1YzhlNTdmMTQxODEyNTE3MjJhOGRhODY3OGM4MmVkOGIzZWY3YTI5MTY4ODk2N2NiMTc5MjQ5OGNlMzQ3MGU3MjliMDMwIn0.eyJhdWQiOiIxIiwianRpIjoiODg2Y2YwZjQwNDVjOGU1N2YxNDE4MTI1MTcyMmE4ZGE4Njc4YzgyZWQ4YjNlZjdhMjkxNjg4OTY3Y2IxNzkyNDk4Y2UzNDcwZTcyOWIwMzAiLCJpYXQiOjE1OTQwMzY0NzgsIm5iZiI6MTU5NDAzNjQ3OCwiZXhwIjoxNjI1NTcyNDc4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.P7vDP1WIbNzPeY9VhfwichBtpQ4hj4Bx6DrB01Llqy-is91ZS8CVubW1lb76WAtF5QkENcmVurRCW8Uz-TZFk8u6AAPZgGfFoDwtoWOF4fyCRNw-hU7u0F8T8rxn6vPypQhNF9GchXsZ_NqgCDHZK1uQ9jrycMwxWEAJ5Ajc80GfvD1AvkcLG84lZUz68CpjMJZqVkjKfPffo24kPXxAlB4-2K5T13775quuJp2bLGWFtzP7mdTbN7rxXt-OEjKqLW51qioEm7yBk3Skfh9_9DIev9KUtoyuolF5G6c_vcM34mXRaEwb8j5eF2jWHIP9kyVLgwusqpnVHf5t_3pB92f-4UQA2eqDTb_e2I4L70mdrXoYWTSKx7nxbX7FUmuEC7u2yV5DukzKM9yMEVnmWy09tKyNonJLpXglnS7yiWJQFXX0bL24IvvoS2qSW8eNfHbStEj_Vi5n8A640vJ2LLAGFPLf8sFH26gDcScWLYtta3faETfRSxgnVvW-1n7CJyxLN-HK7n5rBe0fIuI_0kPEqrak-aD2k_IrlYodDfOss7YEi3cZyL5MwS-CiDrjJMVc5n8muqCfHK9RTJTdxgN2TS0IzWHB9v00JYy0YxYqL8EQcsDKJX78iJUncpVSipqIDl9jT_kgqTELZDPGpL_uXBLK9y6CYw9K9zCbXSc"
                
        let params: [String: String] = ["page": "\(page)"]
        
        let headers: HTTPHeaders = [ "Accept": "application/json",
        "Authorization": "Bearer \(userToken)",
        "Content-Type": "application/json"]
                
        let completion: (Data) -> Void = { (data) in
            let jsonDecoder = JSONDecoder()
            if let eweListingResponse = try? jsonDecoder.decode(EweListingResponse.self, from: data) {
                
                completion(eweListingResponse)
            }
            else {
                errorHandler(NSLocalizedString("server_error", comment: ""), 0)
            }
        }
        
        let handler: (AFError?, JSON?, Int) -> Void = { (error, json,  code) in
            errorHandler(NSLocalizedString("server_error", comment: ""), code)
        }
        
        dataRequest = APIClient.sendRequestWith(path: "eweinfo", method: .get, params: params, encoder: URLEncodedFormParameterEncoder.default, headers: headers, completion: completion, errorHandler: handler)
    }
    
    func cancelCalls() {
        guard let dataRequset = self.dataRequest else {
            return
        }
        
        dataRequset.cancel()
    }
}
