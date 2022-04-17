//
//  ContentView.swift
//  MyTimer
//
//  Created by 高木克 on 2022/04/05.
//

import SwiftUI

struct ContentView: View {
//    タイマーの変数を作成
    @State var timerHandler : Timer?
//    カウント(経過時間)の変数を作成
    @State var count = 0
//    永続化する秒数設定(初期値は10)
    @AppStorage("timer_value") var timerValue = 10
//    アラート表示有無
    @State var showAlert = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("backgroundTimer")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
                
                VStack(spacing: 30.0){
                    Text("残り\(timerValue - count)秒")
                        .font(.largeTitle)
                    HStack{
                        Button(action: {
//                            ボタンをタップしたときのアクション
//                            タイマーをカウントダウン開始する関数を呼び出す
                            startTimer()
                        }){
                            Text("スタート")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("startColor"))
    //                        円形に切り抜く
                                .clipShape(Circle())
                        }
//                        ストップボタン
                        Button(action: {
//                            ボタンをタップしたときのアクション
//                            timerHandlerをアンラップしてunwrapedTimerHandlerに代入
                            if let unwrapedTimerHandler = timerHandler {
//                                もしタイマーが、実行中だったら停止
                                if unwrapedTimerHandler.isValid == true {
//                                    タイマー停止
                                    unwrapedTimerHandler.invalidate()
                                    
                                }
                            }
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
//            画面が表示されるときに実行される
            .onAppear {
//                カウント(経過時間)の変化を初期化
                count = 0
            } // .onAppear ここまで
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
            
//            状態変数showAlertがtrueになったときに実行される
            .alert(isPresented: $showAlert) {
//                アラート表示するためのレイアウトを記述する
//                アラートを表示する
                Alert(title: Text("終了"),
                      message: Text("タイマー終了時間です"),
                      dismissButton: .default(Text("OK")))
            } // .alert ここまで
        }
//        iPadへ対応
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
//    1秒毎に実行されてカウントダウンする
    func countDownTimer(){
//        count(経過時間)に+1していく
        count += 1
        
//        残り時間が0以下のとき、タイマーを止める
        if timerValue - count <= 0 {
//            タイマー停止
            timerHandler?.invalidate()
//            アラートを表示する
            showAlert = true
        }
    } // countDownTimer() ここまで
    
//    タイマーをカウントダウン開始する関数
    func startTimer(){
        if let unwrapedTimerHandler = timerHandler {
//            もしタイマーが、実行中だったらスタートしない
            if unwrapedTimerHandler.isValid == true {
//                何も処理しない
                return
            }
        }
        
//        残り時間が0以下の時、count(経過時間)を0に初期化する
        if timerValue - count <= 0{
//            count(経過時間)を0に初期化する
            count = 0
        }
        
//        タイマーをスタート
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//            タイマー実行時に呼び出される
//            1秒毎に実行されてカウントダウンする関数を実行する
            countDownTimer()
        }
    } //startTimer()　ここまで
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
