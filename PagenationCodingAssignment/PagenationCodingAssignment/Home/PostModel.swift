//
//  PostModel.swift
//  PagenationCodingAssignment
//
//  Created by Vijay Reddy on 28/05/24.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
