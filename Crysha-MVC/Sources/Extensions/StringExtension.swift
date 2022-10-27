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
               imageAttachment.image = image
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
}
