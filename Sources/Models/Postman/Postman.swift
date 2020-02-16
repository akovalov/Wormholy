// Generated by https://quicktype.io
//
// To change quicktype's target language, run command:
//
//   "Set quicktype target language"

import Foundation

struct PostmanCollection: Codable {
    let info: Info
    let item: [ItemItem]
    let protocolProfileBehavior: ProtocolProfileBehavior?
}

struct Info: Codable {
    let postmanID, name: String
    let schema: String
}

struct ItemItem: Codable {
    let name: String
    let item: [ItemItem]?
    let protocolProfileBehavior: ProtocolProfileBehavior?
    let request: Request?
}

struct Request: Codable {
    let method: String
    let header: [Header]
    let body: Body
    let url: PostmanURL
    let description: String?
}

struct Body: Codable {
    let mode: String
    let raw: String
}


struct Header: Codable {
    let key: String
    let value: String
}

struct PostmanURL: Codable {
    let raw: String
    let urlProtocol: String
    let host: [String]
    let path: [String]
}

struct ProtocolProfileBehavior: Codable {
}
