//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Renato Junior on 29/08/23.
//

import SwiftUI

struct ThemeView: View {
  let theme: Theme
  var body: some View {
    Text(theme.name)
      .padding(4)
      .frame(maxWidth: .infinity)
      .background(theme.mainColor)
      .foregroundColor(theme.accentColor)
      .clipShape(RoundedRectangle(cornerRadius: 4))
  }
}


struct ThemeView_previewProvider: PreviewProvider {
  static var previews: some View{
    ThemeView(theme: .orange)
  }
}
