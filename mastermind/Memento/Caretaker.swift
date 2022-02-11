//
//  Caretaker.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/31/22.
//

import Foundation

class Caretaker {

    enum CaretakerError: Error {
        case noItemInQueue
    }

    private var values: [Data] = []

    func push<T: Encodable>(_ item: T?) throws {
        guard let item = item else { return }
        let data = try JSONEncoder().encode(item)
        values.append(data)
    }

    func pop<T: Decodable>() throws -> T {
        guard !values.isEmpty else { throw CaretakerError.noItemInQueue }
        let data = values.removeLast()
        let item = try JSONDecoder().decode(T.self, from: data)
        return item
    }

    func reset() {
        values = []
    }

}
