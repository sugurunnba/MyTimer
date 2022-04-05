//
//  ContentView.swift
//  MyTimer
//
//  Created by 高木克 on 2022/04/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("backgroundTimer")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
                
                VStack(spacing: 30.0){
                    Text("残り10秒")
                        .font(.largeTitle)
                    HStack{
                        Button(action: {
    //
                        }){
                            Text("スタート")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("startColor"))
    //                        円形に切り抜く
                                .clipShape(Circle())
                        }
                        Button(action: {
                            
                        }){
                            Text("ストップ")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("stopColor"))
    //                        円形に切り抜く
                                .clipShape(Circle())
                        }
                    }
                }
                
            }
//            ナビゲーションにボタンを追加
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
//                    ナビゲーション遷移
                    NavigationLink(destination: SettingView()){
//                      テキストを表示
                        Text("秒数設定")
                    }
                }
            }
        }
//        iPadへ対応
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
