//
//  Formats.swift
//  Bookshelf
//
//  Created by Камил Хайрутдинов on 26.05.2024.
//

import Foundation

struct Formats: Decodable {
    let textHTML, applicationEpubZip, applicationXMobipocketEbook: String
    let applicationRDFXML: String
    let imageJPEG: String
    let textPlainCharsetUsASCII: String
    let applicationOctetStream: String
    let textHTMLCharsetUTF8: String?
    let textPlainCharsetUTF8, textPlainCharsetISO88591: String?
    let textHTMLCharsetISO88591: String?

    enum CodingKeys: String, CodingKey {
        case textHTML = "text/html"
        case applicationEpubZip = "application/epub+zip"
        case applicationXMobipocketEbook = "application/x-mobipocket-ebook"
        case applicationRDFXML = "application/rdf+xml"
        case imageJPEG = "image/jpeg"
        case textPlainCharsetUsASCII = "text/plain; charset=us-ascii"
        case applicationOctetStream = "application/octet-stream"
        case textHTMLCharsetUTF8 = "text/html; charset=utf-8"
        case textPlainCharsetUTF8 = "text/plain; charset=utf-8"
        case textPlainCharsetISO88591 = "text/plain; charset=iso-8859-1"
        case textHTMLCharsetISO88591 = "text/html; charset=iso-8859-1"
    }
}
