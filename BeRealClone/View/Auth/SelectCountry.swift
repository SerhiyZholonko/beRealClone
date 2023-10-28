//
//  SelectCountry.swift
//  BeRealClone
//
//  Created by apple on 15.10.2023.
//

import SwiftUI

struct SelectCountry: View {
    @Environment(\.dismiss) var dismiss
    var countries: [Country] = Country.allCountries
    @Binding var countryChosen: Country
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    ZStack {
                        Text ("Select Country")
                            .fontWeight (.semibold)
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Image (systemName: "xmark")
                                    .font(.system(size: 16))
    
                            }
                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                    .foregroundColor (.white)
                    Spacer()
                    VStack {
                        VStack {
                            List {
                                Section {
                                    ForEach (countries, id: \.isoCode) { country in
                                        HStack {
                                            Text("\(country.flag(country: country.isoCode)) + \(country.localizedName)  (+ \(country.phoneCode))")
                                            if country.isoCode == countryChosen.isoCode{
                                                Image(systemName: "checkmark.circle")
                                        }
                                                                        
                                        }
                                        .onTapGesture {
                                            countryChosen = country
                                            dismiss()
                                        }
                                    }
                                }
                            header: {Text("SUGGESTED")
                                    .padding(.leading, -8)
                            }
                            }
                        }
                    }
                }
            }
            .environment(\.colorScheme, .dark)
        }
    }
}

struct SelectCountry_Previews: PreviewProvider {
    static var previews: some View {
        SelectCountry( countryChosen: .constant(.init(isoCode: "")))
    }
}
