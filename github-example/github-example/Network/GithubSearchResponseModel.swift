//
//  GithubSearchResponseModel.swift
//  github-example
//
//  Created by Yusuf Demirkoparan on 11.12.2022.
//

import Foundation


struct GithubSearchResponseModel: Codable {
    let total_count: Int
    let incomplete_results: Bool
    let items: [GithubsearchResponseItemDetail]
}

struct GithubsearchResponseItemDetail: Codable {
    let id: Int
    let node_id: String
    let name: String
}
