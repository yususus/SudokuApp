//
//  SplashBackGround.swift
//  SudokuApp
//
//  Created by yusuf on 18.04.2024.
//

import SwiftUI

struct SplashBackGround: View {
    @State var rotation1: Double = 0
    @State var rotation2: Double = 30
    @State var rotation3: Double = 60
    @State var rotation4: Double = 90
    @State var rotation5: Double = 45
    
    var body: some View {
        VStack {
                ZStack {
                        VStack {
                            Text("1")
                                .rotationEffect(.degrees(rotation1))
                                .font(.custom("", size: 70)).padding().foregroundStyle(Color.teal)
                                .onAppear {
                                        withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
                                            rotation1 = 4800
                                        }
                                    }
                        }.frame(width: 400, height: 250,alignment: .topTrailing).blur(radius: 3)
                        Spacer()
                        VStack {
                            Text("2").rotationEffect(.degrees(rotation2)).font(.custom("", size: 70)).padding().foregroundStyle(Color.green).onAppear {
                                withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
                                    rotation2 = 4800
                                }
                            }

                        }.frame(width: 400, height: 250,alignment: .bottom).blur(radius: 3)
                        Spacer()
                        VStack {
                            Text("3").rotationEffect(.degrees(rotation3)).font(.custom("", size: 70)).foregroundStyle(Color.orange)
                                .padding().onAppear {
                                    withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
                                        rotation3 = 4800
                                    }
                                }

                        }.frame(width: 400, height: 300,alignment: .topLeading).blur(radius: 3)
                    VStack {
                        Text("8").rotationEffect(.degrees(rotation4)).font(.custom("", size: 70)).padding().foregroundStyle(Color.red).onAppear {
                            withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
                                rotation4 = 3600
                            }
                        }

                    }.frame(width: 400, height: 250,alignment: .bottomTrailing).blur(radius: 3)
                    Spacer()
                    VStack {
                        Text("7").rotationEffect(.degrees(rotation5)).font(.custom("", size: 70)).foregroundStyle(Color.yellow)
                            .padding().onAppear {
                                withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
                                    rotation5 = 3600
                                }
                            }

                    }.frame(width: 400, height: 300,alignment: .bottomLeading).blur(radius: 3)
                     
                }.frame(height: 250)
                
                ZStack {
                    
                        VStack {
                            Text("4").rotationEffect(.degrees(rotation1)).font(.custom("", size: 70)).padding().foregroundStyle(Color.purple).onAppear {
                                withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
                                    rotation1 = 3600
                                }
                            }

                        }.frame(width: 400, height: 300,alignment: .topLeading).blur(radius: 3)
                        Spacer()
                        VStack {
                            Text("5").rotationEffect(.degrees(rotation3)).font(.custom("", size: 70)).padding().foregroundStyle(Color.brown).onAppear {
                                withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
                                    rotation3 = 4800
                                }
                            }

                        }.frame(width: 400, height: 300,alignment: .trailing).blur(radius: 3)
                        Spacer()
                    VStack {
                        Text("3").rotationEffect(.degrees(rotation2)).font(.custom("", size: 70)).padding().foregroundStyle(Color.orange).onAppear {
                            withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
                                rotation2 = 4800
                            }
                        }

                        }.frame(width: 400, height: 250,alignment: .center).blur(radius: 3)
                        VStack {
                            Text("6").rotationEffect(.degrees(rotation4)).font(.custom("", size: 70)).padding().foregroundStyle(Color.indigo).onAppear {
                                withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
                                    rotation4 = 3600
                                }
                            }

                        }.frame(width: 400, height: 300,alignment: .bottomLeading).blur(radius: 3)
                    
                }.frame(height: 250)
                
            ZStack {
                
                    VStack {
                        Text("7").rotationEffect(.degrees(rotation5)).font(.custom("", size: 70)).padding().foregroundStyle(Color.mint).onAppear {
                            withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
                                rotation5 = 3600
                            }
                        }

                    }.frame(width: 400, height: 300,alignment: .bottomLeading).blur(radius: 3)
                    Spacer()
                    VStack {
                        Text("8").rotationEffect(.degrees(rotation3)).font(.custom("", size: 70)).padding().foregroundStyle(Color.yellow).onAppear {
                            withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
                                rotation3 = 3600
                            }
                        }

                    }.frame(width: 400, height: 300,alignment: .trailing).blur(radius: 3)
                    Spacer()
                VStack {
                    Text("5").rotationEffect(.degrees(rotation2)).font(.custom("", size: 70)).padding().foregroundStyle(Color.purple).onAppear {
                        withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
                            rotation2 = 4800
                        }
                    }

                }.frame(width: 400, height: 250,alignment: .bottom).blur(radius: 3)
                VStack {
                    Text("1").rotationEffect(.degrees(rotation4)).font(.custom("", size: 70)).padding().foregroundStyle(Color.green).onAppear {
                        withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
                            rotation4 = 4800
                        }
                    }

                }.frame(width: 400, height: 250,alignment: .topLeading).blur(radius: 3)
                    VStack {
                        Text("9").rotationEffect(.degrees(rotation1)).font(.custom("", size: 70)).padding().foregroundStyle(Color.red).onAppear {
                            withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
                                rotation1 = 4800
                            }
                        }

                    }.frame(width: 400, height: 300,alignment: .top).blur(radius: 3)
                
            }.frame(height: 250)
                
            
        }.background(Color.cyan.opacity(0.4))
        
    }
}

#Preview {
    SplashBackGround()
}
