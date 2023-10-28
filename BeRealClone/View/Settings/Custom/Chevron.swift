//
//  Chevron.swift
//  BeRealClone
//
//  Created by apple on 12.10.2023.
//

import SwiftUI

struct Chevron: View {
    var icon: String
    var text: String
    var body: some View {
        ZStack {
            RoundedRectangle (cornerRadius: 10)

                .frame(height: 45)
                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))
            HStack {
                Image (systemName: icon)
                    .foregroundColor (.white)
                Text(text)
                    .foregroundColor(.white)
                    .fontWeight (.semibold)
                Spacer ( )
                Image (systemName: "chevron.right")
                    . foregroundColor (.gray)
                    . font (.system(size: 14))
            }
            .padding (.horizontal, UIScreen.main.bounds .width * 0.05)
        }
    }
}


