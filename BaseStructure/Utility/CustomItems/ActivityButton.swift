//
//  CustomButton.swift
//  loadingButton
//
//  Created by PHN MAC 1 on 01/01/24.
//

import UIKit


class ActivityButton: UIButton {
    // MARK: - IBInspectable Items
    var cornerRadius: CGFloat = 8.0 {
        didSet {
            clipsToBounds = true
            layer.cornerRadius = cornerRadius
        }
    }
    
    // Variables
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.hidesWhenStopped = true
        indicator.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        return indicator
    }()
    
    var isLoading: Bool = false {
        didSet {
            if isLoading {
                titleLabel?.alpha = 0.0
                activityIndicator.startAnimating()
                isEnabled = false
            } else {
                titleLabel?.alpha = 1.0
                activityIndicator.stopAnimating()
                isEnabled = true
            }
            setNeedsLayout()
        }
    }
    
    // MARK: - Default Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // Configuration
    private func commonInit() {
        addSubview(activityIndicator)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Center the activity indicator
        activityIndicator.center = CGPoint(x: bounds.midX, y: bounds.midY)
    }
}
