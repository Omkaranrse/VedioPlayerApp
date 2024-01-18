//
//  StatusBArView.swift
//  VedioPlayerApp
//
//  Created by Omkar Anarse on 18/01/24.
//

import SwiftUI

struct StatusBArView<Content: View>: View {
    
    @ViewBuilder var content : Content
    // Status bar window
    //We can create our own status bar style by simply applying the style to the overlay window, like I did in my previous video, which will cover the status bar of the current app window.
    @State var statusBarWindow : UIWindow?
    
    var body: some View {
        content
            .onAppear(perform: {
                if statusBarWindow == nil {
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                        let statusBarWindow = UIWindow(windowScene: windowScene)
                        statusBarWindow.windowLevel = .statusBar
                        statusBarWindow.tag = 0320 // 0320 -> With the help of this tag, we can identify the overlay window in our window scene.
                        let controller = StatusBarViewController()
                        controller.view.backgroundColor = .clear
                        controller.view.isUserInteractionEnabled = false
                        statusBarWindow.rootViewController = controller
                        statusBarWindow.isHidden = false
                        statusBarWindow.isUserInteractionEnabled = false
                        self.statusBarWindow = statusBarWindow
                        print("Status Window Created")
                    }
                }
            })
    }
}

extension UIApplication {
    func setStatusBarStyle(_ style : UIStatusBarStyle) {
        if let statusBarWindow = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first(where: { $0.tag == 0320 }),
           let statusBarController = statusBarWindow.rootViewController as? StatusBarViewController {
            //Updating status bar style
            statusBarController.statusBarStyle = style
            //Refreshing changes
            statusBarController.setNeedsStatusBarAppearanceUpdate()
        }
    }
}

class StatusBarViewController : UIViewController {
    
    var statusBarStyle : UIStatusBarStyle = .default
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        statusBarStyle
    }
}


