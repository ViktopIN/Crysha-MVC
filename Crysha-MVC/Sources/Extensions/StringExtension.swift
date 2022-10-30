//
//  StringExtension.swift
//  Crysha-MVC
//
//  Created by Виктор on 27.10.2022.
//

import UIKit

extension String {
    func addImageToLabelString(this image: UIImage?,
                               textIsFirst: Bool) -> NSAttributedString {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        let completeText = NSMutableAttributedString(string: "")
        let text = NSAttributedString(string: self)
        let space = NSAttributedString(string: "  ")
        let attachmentImage = NSAttributedString(attachment: imageAttachment)
               
        if textIsFirst {
            completeText.append(text)
            completeText.append(space)
            completeText.append(attachmentImage)
        } else {
            completeText.append(attachmentImage)
            completeText.append(space)
            completeText.append(text)
        }
        return completeText
    }
    
    func superscriptIndex() -> NSMutableAttributedString? {
        var previousCharacter = String()
        var superscriptIndexString = NSMutableAttributedString()
        for (n, i) in self.enumerated() {
            if i == "2" && previousCharacter == "м" {
                superscriptIndexString = NSMutableAttributedString(string: self)
                superscriptIndexString.setAttributes([.font: UIFont.systemFont(ofSize: 12),
                    .baselineOffset: 7], range: NSRange(location: n, length: 1))
                return superscriptIndexString
            } else {
                previousCharacter = String(i)
            }
        }
        return nil
    }
}
