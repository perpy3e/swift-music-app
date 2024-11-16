//
//  start.swift
//  musicApp
//
//  Created by Siripoom Jaruphoom on 26/10/23.
//

import UIKit

class start: UIViewController {

    var img=[UIImage]()
    
    func animated() {
        animates.animationImages = img
        animates.animationDuration = 1
        animates.animationRepeatCount=0
        animates.startAnimating()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        img.append(UIImage._01)
        img.append(UIImage._02)
        img.append(UIImage._03)
        img.append(UIImage._04)
        img.append(UIImage._05)
        img.append(UIImage._06)
        img.append(UIImage._07)
        img.append(UIImage._08)
        img.append(UIImage._09)
        animated()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var animates: UIImageView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
