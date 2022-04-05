//
//  SettingView.swift
//  MyTimer
//
//  Created by 高木克 on 2022/04/05.
//

import SwiftUI

struct SettingView: View {
//    秒数設定
    @State var timerValue = 10
    
    var body: some View {
        ZStack {
            Color("backgroundSetting")
//            セーフエリアを超えて画面全体に配置
                .ignoresSafeArea()
            
//            垂直にレイアウト(縦方向にレイアウト)
            VStack {
                Spacer()
                Text("\(timerValue)秒")
                    .font(.largeTitle)
//                Pickerを表示
                Picker(selection: $timerValue){
                    Text("10")
                        .tag(10)
                    Text("20")
                        .tag(20)
                    Text("30")
                        .tag(30)
                    Text("40")
                        .tag(40)
                    Text("50")
                        .tag(50)
                    Text("60")
                        .tag(60)
                } label: {
                    Text("選択")
                }
//                Pickerをホイール表示
                .pickerStyle(.wheel)
                Spacer()
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
