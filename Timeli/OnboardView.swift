//
//  OnboardView.swift
//  Timeli
//
//  Created by Ben on 5/9/24.
//
import SwiftUI

struct Home: View{
    var body: some View {
        VStack {
            Text("Welcome to Timeli")
                .font(.title)
                .fontWeight(.heavy)
            Text("Follow our socials @timeli")
                .font(.body)
                .fontWeight(.medium)
        }
    }
}
struct OnboardingView: View {
    var body: some View {
        ZStack {
            
        }
    }
}

struct ScreenView: View {
    var image: String
    var title: String
    var details: String
    
    var body: some View {
        VStack{
            HStack{
                Text("Timeli ")
                    .font(.title)
                    .fontWeight(.semibold)
                    .kerning(1.4)
                
                Spacer()
                
                Button(action: {}, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                })
            }.padding()
                .foregroundColor(.black)
            
            Spacer(minLength: 0)
            
            Image("")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 16)
                .frame(height: 100)
            
            Spacer(minLength: 80)
            
            Text("Get Started")
                .font(.largeTitle)
                .fontWeight(.bold)
                .kerning(1.2)
                .padding(.top)
                .padding(.bottom, 5)
                .foregroundColor(.blue)
            
            Text("fwjflw jfnn lsefslejfs iljfnoesufnos efcesn vih uitun uihwthowej oweito weio tiowe ioweomwe dweo femfwf weko.")
                .font(.body)
                .fontWeight(.regular)
                .kerning(1.2)
                .padding([.leading, . trailing])
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 0)
            
            Button(action: {}, label: {
                Text("Next")
                    .fontWeight(.semibold)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(.orange))
                    .cornerRadius(40)
                    .padding(.horizontal, 16)
            })
        }
    }
}

#Preview {
    Home()
}
