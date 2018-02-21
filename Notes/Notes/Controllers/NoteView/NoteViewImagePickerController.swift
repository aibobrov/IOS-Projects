//
//  NoteViewImagePickerController.swift
//  Notes
//
//  Created by Artem Bobrov on 29.01.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import Foundation
import UIKit

extension NoteViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		let newWidth = noteTextView.textContainer.size.width - noteTextView.textContainerInset.right
		guard let image = (info[UIImagePickerControllerOriginalImage] as? UIImage)?.scaleToFit(newWidth: newWidth) else {
			picker.dismiss(animated: true, completion: nil)
			return
		}
		DispatchQueue.main.async {
			self.noteTextView.textStorage.add(image: image)

			picker.dismiss(animated: true, completion: nil)
		}
	}

	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		picker.dismiss(animated: true, completion: nil)
	}
}
