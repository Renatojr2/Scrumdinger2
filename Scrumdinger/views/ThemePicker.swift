//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Renato Junior on 29/08/23.
//

import SwiftUI

struct ThemePicker: View{
  @Binding var selection:Theme
  var body: some View{
    Picker("ThemePicker", selection: $selection){
      ForEach(Theme.allCases) {theme in
        ThemeView(theme: theme).tag(theme)
      }
    }.pickerStyle(.navigationLink)
  }
}

struct ThemePicker_previewProvider:PreviewProvider{
  static var previews: some View{
    ThemePicker(selection:  .constant(.periwinkle))
  }
}
