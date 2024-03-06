//
//  ContentView.swift
//  KenshinKadai5
//
//  Created by Kenshin on 2024/03/06.
//

import SwiftUI

struct ContentView: View {
    @State var divided: String = ""
    @State var divide: String = ""
    @State var anser: String = ""
    var body: some View {
        VStack {
            HStack {
                CustomField(num: $divided)
                Text("÷")
                CustomField(num: $divide)
            }
            Button("計算") {
                guard let firstnum = Float(divided), let secondnum = Float(divide) else {
                    if divided == "" {
                        anser = "割られる数を入力してください"
                    } else if divide == "" {
                        anser = "割る数を入力してください"
                    }
                    return
                }

                if let firstnum = Float(divided) , let secondnum = Float(divide) {
                    if secondnum == 0 {
                        anser = "割る数には0以外を入力してください"
                    } else {
                        anser = "\(round(firstnum / secondnum * 100000) / 100000)"
                    }
                }
            }
            Text(anser)
        }
    }
}

struct CustomField: View {
    @Binding var num: String
    var body: some View {
        TextField("",text: $num)
            .keyboardType(.numberPad)
            .border(Color.gray, width: 1)
            .padding()
    }
}

#Preview {
    ContentView()
}
