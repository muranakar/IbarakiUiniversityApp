//
//  LaunchScreenViewController.swift
//  IbarakiUiniversityApp
//
//  Created by HiroakiSaito on 2021/10/07.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    @IBOutlet private weak var logoImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.logoImageView.center = self.view.center
        self.logoImageView.image = UIImage(named: "logo")
        self.view.addSubview(self.logoImageView)
    }

    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3, delay: 1.0, options: .curveEaseOut,
                       animations:
                        {() in self.logoImageView.transform = CGAffineTransform(
                            scaleX: 0.9,
                            y: CGAffineTransform(scaleX: 0.9, y: 0.9)},
                            completion: { _ in }
                        )
        UIView.animate(withDuration: 0.2, delay: 1.3, options: .curveEaseOut) {
            () in
            self.logoImageView.transform = CGAffineTransform(
                scaleX: 1.2,
                y: CGAffineTransformscaleX: y: 1.2)
            self.logoImageView.alpha = 0
        } completion: { _ in
            self.logoImageView.removeFromSuperview()
        }
    }
}
