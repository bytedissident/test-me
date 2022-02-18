//
//  ContentView.swift
//  TestMe
//
//  Created by Derek Bronston on 2/8/22.
//

import SwiftUI


class ViewModel: ObservableObject {
    @Published var me = "yo"
    
    func tell(str: String) {
        me = str
    }
}

public struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    public var body: some View {
        Text(viewModel.me)
            .padding()
            .foregroundColor(Color(uiColor: UIColor(hex: "#ff9900")))
        Button(action: {
            self.viewModel.tell(str: "hello")
        }) {
            Label("Add Folder", systemImage: "folder.badge.plus")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIColor {
    public convenience init(hex: String) {
        let r, g, b, a: CGFloat
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        self.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return
    }
}

