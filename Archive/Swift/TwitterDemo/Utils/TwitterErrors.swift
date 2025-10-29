//
//  TwitterErrors.swift
//  TwitterDemo
//
//  Created by Nestor Hernandez on 23/06/22.
//

import Foundation
struct TwitterError: Error {
	var errorId: Int
	var description: String = String()
}
