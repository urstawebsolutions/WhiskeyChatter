//
//  ContentView.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 3/29/23.
//

import SwiftUI

struct WCLoginView: View {
    var body: some View {
        ZStack {
            Image("login-background").resizable().ignoresSafeArea()
        /*
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button{
                    deal()
                }label: {
                    Image("button");
                }
                
                Spacer()
                HStack {
                    Spacer()
                    VStack(){
                        Text("Player")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.bottom, 4.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.bottom, 5.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                    }
                    Spacer()
                }.foregroundColor(.white)
                Spacer()
                
            }*/
        }.background()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WCLoginView()
    }
}
