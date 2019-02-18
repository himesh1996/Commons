//
//  Extension.swift
//  Ios_Code_Structure
//
//  Created by Youngbrainz Infotech on 10/01/19.
//  Copyright © 2019 Youngbrainz Infotech. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

func IS_INTERNET_AVAILABLE()->Bool{
    var Status:Bool = false
    let url = URL(string: "http://google.com/")
    let request = NSMutableURLRequest(url: url!)
    request.httpMethod = "HEAD"
    request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
    request.timeoutInterval = 10.0
    
    var response: URLResponse?
    _ = try? NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: &response) as Data?
    
    if let httpResponse = response as? HTTPURLResponse {
        if httpResponse.statusCode == 200 {
            Status = true
        }
    }
    return Status
}

func findtopViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
    if let navigationController = controller as? UINavigationController {
        return findtopViewController(controller: navigationController.visibleViewController)
    }
    if let tabController = controller as? UITabBarController {
        if let selected = tabController.selectedViewController {
            return findtopViewController(controller: selected)
        }
    }
    if let presented = controller?.presentedViewController {
        return findtopViewController(controller: presented)
    }
    return controller
}


func alertController(message: String , controller: UIViewController)
{
    let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
    
    let action1 = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
        controller.dismiss(animated: true, completion: nil)
    }
    
    alertController.addAction(action1)
    controller.present(alertController, animated: true, completion: nil)
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}

extension UIView
{
    //MARk:- Make Corner radius On Top
    func CorneronTop(cornerRadius: CGFloat, frame: CGRect)
    {
        let path = UIBezierPath(roundedRect:frame,
                                byRoundingCorners:[.topRight, .topLeft],
                                cornerRadii: CGSize(width: cornerRadius, height:  cornerRadius))
        
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    
    //MARk:- Make Corner radius On Top
    func CorneronBottom(cornerRadius: CGFloat, frame: CGRect)
    {
        let path = UIBezierPath(roundedRect:frame,
                                byRoundingCorners:[.bottomRight, .bottomLeft],
                                cornerRadii: CGSize(width: cornerRadius, height:  cornerRadius))
        
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    
    func setShadow(cornerRadius: CGFloat)
    {
        //Create Shadow
        self.layer.cornerRadius = cornerRadius
        // drop shadow
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowRadius = 3.0
    }
    
    func setUpSahadow()
    {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 3
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = true ? UIScreen.main.scale : 1
    }
}

func localegetCountryCOde(forfullCountryName : String) -> String {
    let locales : String = ""
    for localeCode in NSLocale.isoCountryCodes {
        let identifier = NSLocale(localeIdentifier: localeCode)
        let countryName = identifier.displayName(forKey: NSLocale.Key.countryCode, value: localeCode)
        if forfullCountryName.lowercased() == countryName?.lowercased() {
            return localeCode
        }
    }
    return locales
}

extension Locale {
    static let currencies = Dictionary(uniqueKeysWithValues: Locale.isoRegionCodes.map {
        region -> (String, (code: String, symbol: String, locale: Locale)) in
        let locale = Locale(identifier: Locale.identifier(fromComponents: [NSLocale.Key.countryCode.rawValue: region]))
        return (region, (locale.currencyCode ?? "", locale.currencySymbol ?? "", locale))
    })
}
