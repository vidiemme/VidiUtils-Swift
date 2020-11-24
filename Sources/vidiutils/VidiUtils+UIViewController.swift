//
//  ViewControllerExtensions.swift
//  MyOffice
//
//  Created by Pascal Ambrosini on 22/11/20.
//

import UIKit

public extension UIViewController {
    
	/// Setup and add to the ViewController's view a vertical scrollable `UIStackview`.
	/// - Returns: The stackView and the parent (the ScrollView)
	func setupScrollableStackView() -> (stackView: UIStackView, scrollView: UIScrollView) {
		let scrollView = UIScrollView()
		let stackView = UIStackView()

		scrollView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(scrollView)

		view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView]|", options: .alignAllCenterX, metrics: nil, views: ["scrollView": scrollView]))
		view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[scrollView]|", options: .alignAllCenterX, metrics: nil, views: ["scrollView": scrollView]))

		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		scrollView.addSubview(stackView)

		scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[stackView]|", options: .alignAllCenterX, metrics: nil, views: ["stackView": stackView]))
		scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[stackView]|", options: .alignAllCenterX, metrics: nil, views: ["stackView": stackView]))
		
		stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
		return (stackView: stackView, scrollView: scrollView)
	}
}
