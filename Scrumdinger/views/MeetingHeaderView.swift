//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Renato Junior on 30/08/23.
//

import SwiftUI

struct MeetingHeaderView:View{
  let secondsElapsed: Int
  let secondsRemaining: Int
  let theme: Theme

  
  private var totalSeconds:Int {
    secondsElapsed + secondsRemaining
  }
  
  private var progress: Double {
    guard totalSeconds > 0 else { return 1 }
    return Double(secondsElapsed) / Double(totalSeconds)
  }
  
  private var minutesRemaining: Int {
    secondsRemaining / 60
  }
  
  var body: some View{
    VStack{
      ProgressView(value:progress).progressViewStyle(ScrumProgressViewStyle(theme: theme))
        
      HStack{
        
        VStack (alignment: .leading){
          Text("Seconds Elapsed").font(.caption)
          Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
        }
        Spacer()
        VStack(alignment: .trailing) {
          Text("Seconds Remaining").font(.caption)
          Label("\(secondsRemaining)", systemImage: "hourglass.bottomhalf.fill")
        }
      }.accessibilityElement(children: .ignore)
        .accessibilityLabel("tempo restante")
        .accessibilityValue("\(minutesRemaining) minutos")
        .padding([.top, .horizontal])

    }
  }
}


struct MeetingHeaderView_Previews:PreviewProvider {
  static var previews: some View{
    MeetingHeaderView(secondsElapsed: 30, secondsRemaining: 100, theme: .buttercup).previewLayout(.sizeThatFits)
  }
}
