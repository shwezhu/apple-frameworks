import SwiftUI


struct ParentView: View {
    @State private var showChild = true
    @State private var childMessage = "Initial Message"
    
    var body: some View {
        VStack {
            if showChild {
                ChildView(message: childMessage, onMessageChange: { newMessage in
                    childMessage = newMessage
                })
            }
            Button("Toggle Child") {
                showChild.toggle()
            }
        }
    }
}

struct ChildView: View {
    let message: String
    let onMessageChange: (String) -> Void
    
    var body: some View {
        VStack {
            Text(message)
            Button("Change Message") {
                onMessageChange("New Message from Child")
            }
        }
    }
}

#Preview {
    ParentView()
}
