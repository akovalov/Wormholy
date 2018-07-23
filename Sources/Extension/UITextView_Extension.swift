//
//  UITextView_Extension.swift
//  Wormholy-iOS
//
//  Created by Alex Petrarca on 18/07/18.
//  Copyright © 2018 Wormholy. All rights reserved.
//

import UIKit

extension UITextView {
    func highlights(text: String?, with color: UIColor = UIColor.green, font: UIFont = UIFont.boldSystemFont(ofSize: 14)) -> [NSTextCheckingResult] {

        guard let keywordSearch = text?.lowercased(), let textViewText = self.text?.lowercased() else { return [] }

        let attributed = NSMutableAttributedString(string: textViewText)
        attributed.addAttribute(.font, value: UIFont.systemFont(ofSize: 14), range: NSRange(location: 0, length: self.attributedText.length))

        do {
            let regex = try NSRegularExpression(pattern: keywordSearch, options: .caseInsensitive)
            let matches = regex.matches(in: textViewText, options: [], range: NSMakeRange(0, textViewText.count))

            matches.forEach {
                attributed.addAttribute(.backgroundColor, value: color, range: $0.range)
                attributed.addAttribute(.font, value: font, range: $0.range)
            }
            self.attributedText = attributed

            return matches

        } catch let error {
            print(error)
        }
        return []
    }

    func convertRange(range: NSRange) -> UITextRange? {
        let beginning = self.beginningOfDocument
        if let start = self.position(from: beginning, offset: range.location),
            let end = self.position(from: start, offset: range.length) {
            return self.textRange(from: start, to: end)
        }
        return nil
    }
}
