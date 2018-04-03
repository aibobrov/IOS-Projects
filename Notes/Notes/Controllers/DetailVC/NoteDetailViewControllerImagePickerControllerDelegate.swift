//
//  NoteDetailViewControllerImagePickerControllerDelegate.swift
//  Notes
//
//  Created by Artem Bobrov on 12.03.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

extension NoteDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		let newWidth = noteTextView.textContainer.size.width - noteTextView.textContainerInset.right
		guard let image = (info[UIImagePickerControllerOriginalImage] as? UIImage)?.scaleToFit(width: newWidth) else {
			picker.dismiss(animated: true, completion: nil)
			return
		}
		self.noteTextView.textStorage.add(image: image)

		picker.dismiss(animated: true, completion: nil)
	}

	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		picker.dismiss(animated: true, completion: nil)
	}

}
