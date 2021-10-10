//
//  ContentView.swift
//  AppClip
//
//  Created by Nikita Arutyunov on 09.10.2021.
//

import SwiftUI
import AVKit

//let url = URL(string: "https://bit.ly/swswift")!
let player = AVPlayer(url: Bundle.main.url(forResource: "IMG_0944", withExtension: "MP4")!)

let duration = TimeInterval(10)

struct ContentView: View {
    
    @State private var isSituationViewExpired = false
    @State private var isNewsViewExpired = false
    @State private var isStocksViewExpired = false
    @State private var isSell1ViewExpired = false
    @State private var isSell2ViewExpired = false
    @State private var isSell3ViewExpired = false
    @State private var isSell4ViewExpired = false
    @State private var isSell5ViewExpired = false
    @State private var isSell6ViewExpired = false
    @State private var isSell7ViewExpired = false
    
    @State private var isBuySelected = false
    @State private var isSellSelected = false
    
    let timer = Timer.publish(every: duration, on: .main, in: .common).autoconnect()
    
    var body: some View {
        if !isSituationViewExpired {
            SituationView().onReceive(timer) { _ in
                isSituationViewExpired = true
            }
        } else if !isNewsViewExpired {
            NewsView().onReceive(timer) { _ in
                isNewsViewExpired = true
            }
        } else if !isStocksViewExpired {
            StocksView().onReceive(timer) { _ in
                isStocksViewExpired = true
            }
        } else if !isSellSelected {
            DecisionView(isBuySelected: $isBuySelected, isSellSelected: $isSellSelected)
        } else if !isSell1ViewExpired {
            Sell1View().onReceive(timer) { _ in
                isSell1ViewExpired = true
            }
        } else if !isSell2ViewExpired {
            Sell2View().onReceive(timer) { _ in
                isSell2ViewExpired = true
            }
        } else if !isSell3ViewExpired {
            Sell3View().onReceive(timer) { _ in
                isSell3ViewExpired = true
            }
        } else if !isSell4ViewExpired {
            Sell4View().onReceive(timer) { _ in
                isSell4ViewExpired = true
            }
        } else if !isSell5ViewExpired {
            Sell5View().onReceive(timer) { _ in
                isSell5ViewExpired = true
            }
        } else if !isSell6ViewExpired {
            Sell6View().onReceive(timer) { _ in
                isSell6ViewExpired = true
            }
        } else if !isSell7ViewExpired {
            Sell7View().onReceive(timer) { _ in
                isSell7ViewExpired = true
            }
        } else {
            ConclusionView().onReceive(timer) { _ in
                UIApplication.shared.open(URL(string: "https://apps.apple.com/ru/app/%D0%B2%D1%82%D0%B1-%D0%BC%D0%BE%D0%B8-%D0%B8%D0%BD%D0%B2%D0%B5%D1%81%D1%82%D0%B8%D1%86%D0%B8%D0%B8/id1364026756")!, options: [:], completionHandler: nil)
            }
        }
    }
}

struct OldFirstView: View {
    
    @State private var animationFlag = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    Color(red: 0.04, green: 0.11, blue: 0.22)
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Кейс 1 из 5")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("2 минуты")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                }
                ZStack {
                    Image("1")
                        .aspectRatio(contentMode: .fill)
                        .scaledToFill()
                    VStack {
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Ситуация")
                                .font(.system(size: 16, weight: .semibold))
                            Text("Вы владеете акциями Facebook, у компании произошел крупный сбой, об это говорят на всех телеканалах и во всех газетах")
                                .font(.system(size: 14, weight: .regular))
                        }.padding(16)
                            .background(Color.white)
                            .cornerRadius(14)
                            .padding(16)
                    }
                }
                
                VStack(alignment: .leading) {
                    Color.white
                        .frame(width: self.animationFlag ? .infinity : 0, height: 4)
                        .cornerRadius(2)
                        .padding(.vertical, 16)
                        .onAppear {
                            withAnimation(.linear(duration: duration)) {
                                self.animationFlag = true
                            }
                        }
                    HStack(spacing: 14) {
                        Spacer()
                        VStack(alignment: .center, spacing: 2) {
                            Text("Контекст")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("Крупный сбой Facebook")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                        Spacer()
                    }.padding(.bottom, 50)
                }.frame(height: 146)
                    .padding(.horizontal, 16)
                    .background(Color(red: 0.04, green: 0.11, blue: 0.22))
                
            }.ignoresSafeArea()
        }
    }
}

struct SituationView: View {
    
    @State private var animationFlag = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    Color(red: 0.04, green: 0.11, blue: 0.22)
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Кейс 1 из 5")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("2 минуты")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                }.fixedSize(horizontal: false, vertical: true)
                
                ZStack {
                    Image("1")
                        .aspectRatio(contentMode: .fill)
                        .frame(width: .infinity, height: .infinity)
                    
                    VStack {
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Ситуация")
                                .font(.system(size: 16, weight: .semibold))
                            Text("Вы владеете акциями Facebook, у компании произошел крупный сбой, об это говорят на всех телеканалах и во всех газетах")
                                .font(.system(size: 14, weight: .regular))
                        }.padding(16)
                            .background(Color.white)
                            .cornerRadius(14)
                            .padding(16)
                            .padding(.bottom, 20)
                    }
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Color.white
                        .frame(width: self.animationFlag ? .infinity : 0, height: 4)
                        .cornerRadius(2)
//                        .padding(.vertical, 16)
                        .onAppear {
                            withAnimation(.linear(duration: duration)) {
                                self.animationFlag = true
                            }
                        }
                    HStack(spacing: 14) {
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 2) {
                            Text("Контекст")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("Крупный сбой Facebook")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                        
                        Spacer()
                    }
                }.frame(height: 146)
                    .padding(.horizontal, 16)
                    .background(Color(red: 0.04, green: 0.11, blue: 0.22))
                
            }.background(Color(red: 0.04, green: 0.11, blue: 0.22))
        }
    }
}

struct NewsView: View {
    
    @State private var animationFlag = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    Color(red: 0.04, green: 0.11, blue: 0.22)
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Кейс 1 из 5")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("2 минуты")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                }.fixedSize(horizontal: false, vertical: true)
                
                Color.black
                
                ZStack {
                    VideoPlayer(player: player)
                        .disabled(true)
                        .onAppear {
                            player.play()
                        }
//                    Image("2")
                        .aspectRatio(contentMode: .fill)
                }
                
                Color.black
                
                VStack(alignment: .leading) {
                    Color.white
                        .frame(width: self.animationFlag ? .infinity : 0, height: 4)
                        .cornerRadius(2)
                        .padding(.vertical, 16)
                        .onAppear {
                            withAnimation(.linear(duration: duration)) {
                                self.animationFlag = true
                            }
                        }
                    HStack(spacing: 14) {
                        Spacer()
                        VStack(alignment: .center, spacing: 2) {
                            Text("Контекст")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("Новость про сбой везде")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                        Spacer()
                    }
                }.frame(height: 146)
                    .padding(.horizontal, 16)
                    .background(Color(red: 0.04, green: 0.11, blue: 0.22))
                
            }.background(Color(red: 0.04, green: 0.11, blue: 0.22))
        }
    }
}

struct StocksView: View {
    
    @State private var animationFlag = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    Color(red: 0.04, green: 0.11, blue: 0.22)
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Кейс 1 из 5")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("2 минуты")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                }.fixedSize(horizontal: false, vertical: true)
                
                Color.white.padding(.horizontal, 7)
                
                ZStack {
                    Image("3")
                        .aspectRatio(contentMode: .fit)
                }
                
                Color.white.padding(.horizontal, 7)
                
                VStack(alignment: .leading) {
                    Color.white
                        .frame(width: self.animationFlag ? .infinity : 0, height: 4)
                        .cornerRadius(2)
                        .padding(.vertical, 16)
                        .onAppear {
                            withAnimation(.linear(duration: duration)) {
                                self.animationFlag = true
                            }
                        }
                    HStack(spacing: 14) {
                        Spacer()
                        VStack(alignment: .center, spacing: 2) {
                            Text("Контекст")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("Акции падают")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                        Spacer()
                    }
                }.frame(height: 146)
                    .padding(.horizontal, 16)
                    .background(Color(red: 0.04, green: 0.11, blue: 0.22))
                
            }.background(Color(red: 0.04, green: 0.11, blue: 0.22))
        }
    }
}

struct DecisionView: View {
    
    @State private var animationFlag = false
    
    @Binding var isBuySelected: Bool
    @Binding var isSellSelected: Bool
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            //            VideoPlayer(player: player)
            //                .disabled(true)
            //                .onAppear {
            //                    player.play()
            //                }
            VStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    Color(red: 0.04, green: 0.11, blue: 0.22)
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Кейс 1 из 5")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("2 минуты")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                }.fixedSize(horizontal: false, vertical: true)
                
                Color.white.padding(.horizontal, 7)
                
                ZStack {
                    Image("4")
                        .aspectRatio(contentMode: .fit)
                        .scaledToFill()
                }
                
                Color.white.padding(.horizontal, 7)
                
                VStack(alignment: .leading) {
                    Color.white
                        .frame(width: self.animationFlag ? .infinity : 0, height: 4)
                        .cornerRadius(2)
                        .padding(.vertical, 16)
                        .onAppear {
                            withAnimation(.linear(duration: duration)) {
                                self.animationFlag = true
                            }
                        }
                    HStack(spacing: 14) {
                        Button {
                            animationFlag = false
                            isBuySelected = true
                        } label: {
                            Text("Купить")
                                .font(.system(size: 20, weight: .semibold, design: Font.Design.default))
                                .foregroundColor(.accentColor)
                                .frame(maxWidth: .infinity, maxHeight: 60)
                        }.background(Color(red: 0.96, green: 0.96, blue: 0.96))
                            .cornerRadius(13)
                        
                        Button {
                            animationFlag = false
                            isSellSelected = true
                        } label: {
                            Text("Продать")
                                .font(.system(size: 20, weight: .semibold, design: Font.Design.default))
                                .foregroundColor(.accentColor)
                                .frame(maxWidth: .infinity, maxHeight: 60)
                        }.background(Color(red: 0.96, green: 0.96, blue: 0.96))
                            .cornerRadius(13)
                    }.padding(.bottom, 50)
                }.frame(height: 146)
                    .padding(.horizontal, 16)
                    .background(Color(red: 0.04, green: 0.11, blue: 0.22))
                
            }.background(Color(red: 0.04, green: 0.11, blue: 0.22))
        }.background(Color(red: 0.04, green: 0.11, blue: 0.22))
    }
}

struct Sell1View: View {
    
    @State private var animationFlag = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    Color(red: 0.04, green: 0.11, blue: 0.22)
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Кейс 1 из 5")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("2 минуты")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                }.fixedSize(horizontal: false, vertical: true)
                
                Color.white.padding(.horizontal, 7)
                
                ZStack {
                    Image("5")
                        .aspectRatio(contentMode: .fit)
                        .scaledToFill()
                }
                
                Color.white.padding(.horizontal, 7)
                
                VStack(alignment: .leading) {
                    Color.white
                        .frame(width: self.animationFlag ? .infinity : 0, height: 4)
                        .cornerRadius(2)
                        .padding(.vertical, 16)
                        .onAppear {
                            withAnimation(.linear(duration: duration)) {
                                self.animationFlag = true
                            }
                        }
                    HStack(spacing: 14) {
                        Spacer()
                        VStack(alignment: .center, spacing: 2) {
                            Text("Ваше решение")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("Продажа")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                        Spacer()
                    }
                }.frame(height: 146)
                    .padding(.horizontal, 16)
                    .background(Color(red: 0.04, green: 0.11, blue: 0.22))
                
            }.background(Color(red: 0.04, green: 0.11, blue: 0.22))
        }.background(Color(red: 0.04, green: 0.11, blue: 0.22))
    }
}

struct Sell2View: View {
    
    @State private var animationFlag = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    Color(red: 0.04, green: 0.11, blue: 0.22)
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Кейс 1 из 5")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("2 минуты")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                }.fixedSize(horizontal: false, vertical: true)
                
                Color.white.padding(.horizontal, 7)
                
                ZStack {
                    Image("6")
                        .aspectRatio(contentMode: .fit)
                        .scaledToFill()
                }
                
                Color.white.padding(.horizontal, 7)
                
                VStack(alignment: .leading) {
                    Color.white
                        .frame(width: self.animationFlag ? .infinity : 0, height: 4)
                        .cornerRadius(2)
                        .padding(.vertical, 16)
                        .onAppear {
                            withAnimation(.linear(duration: duration)) {
                                self.animationFlag = true
                            }
                        }
                    HStack(spacing: 14) {
                        Spacer()
                        VStack(alignment: .center, spacing: 2) {
                            Text("Ваше решение")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("Продажа")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                        Spacer()
                    }
                }.frame(height: 146)
                    .padding(.horizontal, 16)
                    .background(Color(red: 0.04, green: 0.11, blue: 0.22))
                
            }.background(Color(red: 0.04, green: 0.11, blue: 0.22))
        }.background(Color(red: 0.04, green: 0.11, blue: 0.22))
    }
}

struct Sell3View: View {
    
    @State private var animationFlag = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    Color(red: 0.04, green: 0.11, blue: 0.22)
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Кейс 1 из 5")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("2 минуты")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                }.fixedSize(horizontal: false, vertical: true)
                
                Color.white.padding(.horizontal, 7)
                
                ZStack {
                    Image("7")
                        .aspectRatio(contentMode: .fit)
                        .scaledToFill()
                }
                
                Color.white.padding(.horizontal, 7)
                
                VStack(alignment: .leading) {
                    Color.white
                        .frame(width: self.animationFlag ? .infinity : 0, height: 4)
                        .cornerRadius(2)
                        .padding(.vertical, 16)
                        .onAppear {
                            withAnimation(.linear(duration: duration)) {
                                self.animationFlag = true
                            }
                        }
                    HStack(spacing: 14) {
                        Spacer()
                        VStack(alignment: .center, spacing: 2) {
                            Text("Ваше решение")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("Продажа")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                        Spacer()
                    }
                }.frame(height: 146)
                    .padding(.horizontal, 16)
                    .background(Color(red: 0.04, green: 0.11, blue: 0.22))
                
            }.background(Color(red: 0.04, green: 0.11, blue: 0.22))
        }.background(Color(red: 0.04, green: 0.11, blue: 0.22))
    }
}

struct Sell4View: View {
    
    @State private var animationFlag = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    Color(red: 0.04, green: 0.11, blue: 0.22)
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Кейс 1 из 5")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("2 минуты")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                }.fixedSize(horizontal: false, vertical: true)
                
                Color.white.padding(.horizontal, 7)
                
                ZStack {
                    Image("8")
                        .aspectRatio(1, contentMode: .fit)
//                        .aspectRatio(contentMode: .fit)
                        .scaledToFill()
                }
                
                Color.white.padding(.horizontal, 7)
                
                VStack(alignment: .leading) {
                    Color.white
                        .frame(width: self.animationFlag ? .infinity : 0, height: 4)
                        .cornerRadius(2)
                        .padding(.vertical, 16)
                        .onAppear {
                            withAnimation(.linear(duration: duration)) {
                                self.animationFlag = true
                            }
                        }
                    HStack(spacing: 14) {
                        Spacer()
                        VStack(alignment: .center, spacing: 2) {
                            Text("Ваше решение")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("Продажа")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                        Spacer()
                    }
                }.frame(height: 146)
                    .padding(.horizontal, 16)
                    .background(Color(red: 0.04, green: 0.11, blue: 0.22))
                
            }.background(Color(red: 0.04, green: 0.11, blue: 0.22))
        }.background(Color(red: 0.04, green: 0.11, blue: 0.22))
    }
}

struct Sell5View: View {
    
    @State private var animationFlag = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    Color(red: 0.04, green: 0.11, blue: 0.22)
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Кейс 1 из 5")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("2 минуты")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                }.fixedSize(horizontal: false, vertical: true)
                
                Color.white.padding(.horizontal, 7)
                
                ZStack {
                    Image("9")
                        .aspectRatio(contentMode: .fit)
                        .scaledToFill()
                }
                
                Color.white.padding(.horizontal, 7)
                
                VStack(alignment: .leading) {
                    Color.white
                        .frame(width: self.animationFlag ? .infinity : 0, height: 4)
                        .cornerRadius(2)
                        .padding(.vertical, 16)
                        .onAppear {
                            withAnimation(.linear(duration: duration)) {
                                self.animationFlag = true
                            }
                        }
                    HStack(spacing: 14) {
                        Spacer()
                        VStack(alignment: .center, spacing: 2) {
                            Text("Ваше решение")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("Продажа")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                        Spacer()
                    }
                }.frame(height: 146)
                    .padding(.horizontal, 16)
                    .background(Color(red: 0.04, green: 0.11, blue: 0.22))
                
            }.background(Color(red: 0.04, green: 0.11, blue: 0.22))
        }.background(Color(red: 0.04, green: 0.11, blue: 0.22))
    }
}

struct Sell6View: View {
    
    @State private var animationFlag = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    Color(red: 0.04, green: 0.11, blue: 0.22)
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Кейс 1 из 5")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("2 минуты")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                }.fixedSize(horizontal: false, vertical: true)
                
                Color.white.padding(.horizontal, 7)
                
                ZStack {
                    Image("10")
                        .aspectRatio(contentMode: .fit)
                        .scaledToFill()
                }
                
                Color.white.padding(.horizontal, 7)
                
                VStack(alignment: .leading) {
                    Color.white
                        .frame(width: self.animationFlag ? .infinity : 0, height: 4)
                        .cornerRadius(2)
                        .padding(.vertical, 16)
                        .onAppear {
                            withAnimation(.linear(duration: duration)) {
                                self.animationFlag = true
                            }
                        }
                    HStack(spacing: 14) {
                        Spacer()
                        VStack(alignment: .center, spacing: 2) {
                            Text("Ваше решение")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("Продажа")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                        Spacer()
                    }
                }.frame(height: 146)
                    .padding(.horizontal, 16)
                    .background(Color(red: 0.04, green: 0.11, blue: 0.22))
                
            }.background(Color(red: 0.04, green: 0.11, blue: 0.22))
        }.background(Color(red: 0.04, green: 0.11, blue: 0.22))
    }
}

struct Sell7View: View {
    
    @State private var animationFlag = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    Color(red: 0.04, green: 0.11, blue: 0.22)
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Кейс 1 из 5")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("2 минуты")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                }.fixedSize(horizontal: false, vertical: true)
                
                Color.white.padding(.horizontal, 7)
                
                ZStack {
                    Image("11")
                        .aspectRatio(contentMode: .fit)
                        .scaledToFill()
                }
                
                Color.white.padding(.horizontal, 7)
                
                VStack(alignment: .leading) {
                    Color.white
                        .frame(width: self.animationFlag ? .infinity : 0, height: 4)
                        .cornerRadius(2)
                        .padding(.vertical, 16)
                        .onAppear {
                            withAnimation(.linear(duration: duration)) {
                                self.animationFlag = true
                            }
                        }
                    HStack(spacing: 14) {
                        Spacer()
                        VStack(alignment: .center, spacing: 2) {
                            Text("Ваше решение")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("Продажа")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                        Spacer()
                    }
                }.frame(height: 146)
                    .padding(.horizontal, 16)
                    .background(Color(red: 0.04, green: 0.11, blue: 0.22))
                
            }.background(Color(red: 0.04, green: 0.11, blue: 0.22))
        }.background(Color(red: 0.04, green: 0.11, blue: 0.22))
    }
}

struct ConclusionView: View {
    
    @State private var animationFlag = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    Color(red: 0.04, green: 0.11, blue: 0.22)
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Кейс 1 из 5")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("2 минуты")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                        
                        Spacer()
                        
                        Button {
                            UIApplication.shared.open(URL(string: "https://apps.apple.com/ru/app/%D0%B2%D1%82%D0%B1-%D0%BC%D0%BE%D0%B8-%D0%B8%D0%BD%D0%B2%D0%B5%D1%81%D1%82%D0%B8%D1%86%D0%B8%D0%B8/id1364026756")!, options: [:], completionHandler: nil)
                        } label: {
                            Text("Продолжить в приложении")
                                .font(.system(size: 14, weight: .medium, design: Font.Design.default))
                                .foregroundColor(.accentColor)
                                .padding(.horizontal, 20)
                                .frame(maxHeight: 60)
                        }.background(Color(red: 0.96, green: 0.96, blue: 0.96))
                            .cornerRadius(8)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                }.fixedSize(horizontal: false, vertical: true)
                
                ZStack {
                    Image("1")
                        .aspectRatio(contentMode: .fill)
                        .frame(width: .infinity, height: .infinity)
                    
                    VStack {
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Вывод")
                                .font(.system(size: 16, weight: .semibold))
                            Text(
                                """
                                Сбои у подобных компаний имеют короткосрочное влияние, так как:
                                1. Facebook стабильно наращивает аудиторию
                                2. Рекламодателей становится больше
                                3. Выручка ежегодно растет
                                """
                            )
                                .font(.system(size: 14, weight: .regular))
                        }.padding(16)
                            .background(Color.white)
                            .cornerRadius(14)
                            .padding(16)
                            .padding(.bottom, 20)
                    }
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Color.white
                        .frame(width: self.animationFlag ? .infinity : 0, height: 4)
                        .cornerRadius(2)
                    //                        .padding(.vertical, 16)
                        .onAppear {
                            withAnimation(.linear(duration: duration)) {
                                self.animationFlag = true
                            }
                        }
                    HStack(spacing: 40) {
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 2) {
                            Text("Ваше решение")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("Продажа")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                        
                        VStack(alignment: .center, spacing: 2) {
                            Text("Лучшее решение")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                            Text("Покупка")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.96))
                        }
                        
                        Spacer()
                    }
                }.frame(height: 146)
                    .padding(.horizontal, 16)
                    .background(Color(red: 0.04, green: 0.11, blue: 0.22))
                
            }.background(Color(red: 0.04, green: 0.11, blue: 0.22))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
