//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Renato Junior on 27/08/23.
//

import SwiftUI

struct DetailEditView: View{
  @Binding var scrum: DailyScrum
  @State private var newAttendeeName = ""
  var body: some View{
    Form {
      Section(header:Text("Meeting info")){
        TextField("Title", text:$scrum.title)
        HStack {
          Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
            Text("Lenth")
            
          } .accessibilityValue("\(scrum.lengthInMinutes) minutes")
          Spacer()
          Text("\(scrum.lengthInMinutes) minutes")
        }
        ThemePicker(selection: $scrum.theme)
      }
  
      Section(header: Text("Attendees")) {
        ForEach(scrum.attendees) {
          attendee in Text(attendee.name)
        }.onDelete{
          index in scrum.attendees.remove(atOffsets: index)
        }
        HStack{
          TextField("New ateendeeName", text: $newAttendeeName)
          Button(action: {
            withAnimation {
              let attendee = DailyScrum.Attendee(name: newAttendeeName)
              scrum.attendees.append(attendee)
              newAttendeeName = ""
            }
          }) {
            Image(systemName: "plus.circle.fill")
              .accessibilityLabel("Add attendee")
          }.disabled(newAttendeeName.isEmpty)
        
        }
      }
    }
  }
}


struct DetailEditView_previewProvider: PreviewProvider {
  static var previews: some View{
    DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
  }
}
