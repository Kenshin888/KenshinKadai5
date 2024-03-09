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
    @State var answer: String = ""

    var body: some View {
        VStack {
            HStack {
                CustomField(num: $divided)
                Text("÷")
                CustomField(num: $divide)
            }
            Button("計算") {
                guard let firstnum = Float(divided) else {
                    answer = "割られる数を入力してください"
                    return
                }

                guard let secondnum = Float(divide) else {
                    answer = "割る数を入力してください"
                    return
                }

                guard secondnum != 0 else {
                    answer = "割る数には0以外を入力してください"
                    return
                }

                let formatter = NumberFormatter()
                formatter.maximumFractionDigits = 5
                answer = formatter.string(from: NSNumber(value: firstnum / secondnum)) ?? ""
            }
            Text(answer)
        }
    }
}

struct CustomField: View {
    @Binding var num: String
    var body: some View {
        TextField("", text: $num)
            .keyboardType(.numberPad)
            .border(Color.gray, width: 1)
            .padding()
    }
}

#Preview {
    ContentView()
}
