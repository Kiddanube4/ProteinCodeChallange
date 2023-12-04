//
//  LoginTF.swift
//  ProteinCodeChallange
//
//  Created by Namik Karabiyik on 4.12.2023.
//

import UIKit
@IBDesignable
class LoginTF: UITextField {
    //custom label properties
    @IBInspectable var errorLabelColor: UIColor = .red {
        didSet {
            errorLabel.textColor = errorLabelColor
            
        }
    }
    
    @IBInspectable var errorLabelFont: UIFont = .systemFont(ofSize: 8) {
        didSet {
            errorLabel.font = errorLabelFont
            
        }
    }
    
    
    @IBInspectable var topLabelTextColor: UIColor = .black {
        didSet {
            topLabel.textColor = topLabelTextColor
            
        }
    }
    
    @IBInspectable var topLabalFont: UIFont = .systemFont(ofSize: 10) {
        didSet {
            topLabel.font = topLabalFont
            
        }
    }
    
    
    @IBInspectable var topLabelText: String = "TopLabel" {
        didSet {
            topLabel.text = topLabelText
            
        }
    }
    
    @IBInspectable var errorLabeltext: String = "ErrorLabal" {
        didSet {
            errorLabel.text = errorLabeltext
            
        }
    }
    
    @IBInspectable var isToplabelHiiden: Bool = false {
        didSet {
            topLabel.isHidden = isToplabelHiiden
            
        }
    }
    
    @IBInspectable var isErrorLabelHidden: Bool = false {
        didSet {
            errorLabel.isHidden  = isErrorLabelHidden
            
        }
    }
    
    
    
    
    
    // textfield properties
    
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
            didSet {
                layer.cornerRadius = cornerRadius
                layer.masksToBounds = cornerRadius > 0
            }
        }
    
    
    
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = topLabelTextColor
        label.font =  topLabalFont
        label.text = topLabelText
        label.isHidden = isToplabelHiiden
        return label
    }()
    
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = errorLabelColor
        label.font = errorLabelFont
        label.text = errorLabeltext
        label.isHidden = isErrorLabelHidden
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTextField()
    }
    
    
    private func setupTextField() {
        self.borderStyle = .roundedRect
        setupTopLabel()
        setupErrorLabel()
   
    }
    
    private func setupTopLabel() {
        
        addSubview(topLabel)
                NSLayoutConstraint.activate([
                    topLabel.bottomAnchor.constraint(equalTo: self.topAnchor, constant: -5),
                    topLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
                    topLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
             
                ])
                
     
        
    }
    
    private func setupErrorLabel() {
        
        addSubview(errorLabel)
                NSLayoutConstraint.activate([
                    errorLabel.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 5),
                    errorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
                    errorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
             
                ])
                
     
        
    }
       

}
