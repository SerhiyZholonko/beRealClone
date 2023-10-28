//
//  NotificationButton.swift
//  BeRealClone
//
//  Created by apple on 14.10.2023.
//

import SwiftUI

struct NotificationButton: View {
    var icon: String
    var text: String
    @Binding var toggle: Bool
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .frame (height: 45)
                .foregroundColor (Color(red: 28/255, green: 28/255, blue:
                                            30/255))
            HStack {
                Image (systemName: icon)
                    .foregroundColor(.white)
                Text(text)
                    .foregroundColor (.white)
                    .fontWeight (.medium)
                    .font(.system(size: 14))
                Spacer()
                Toggle("", isOn: $toggle)
            }
            .padding(.horizontal)
        }
    
    }
}

struct NotificationButton_Previews: PreviewProvider {
    static var previews: some View {
        NotificationButton(icon: "face.smiling.fill", text: "RealMojis", toggle: .constant(true))
    }
}
