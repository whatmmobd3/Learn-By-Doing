import SwiftUI

struct CardView: View {
    var card: Card
    @State var fadeIn = false
    @State var move = false
    @State var showAlert = false
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity(fadeIn ? 1.0 : 0.0)
            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                Text(card.headline)
                    .fontWeight(.light)
                    .italic()
            }
            .foregroundColor(.white)
            .offset(y: move ? -210 : -300)
            Button(action:{
                print("Button Tapped")
                playSound(sound: "sound-chime", type: ".mp3")
                self.hapticImpact.impactOccurred()
                self.showAlert.toggle()
            }){
                HStack {
                    Text(card.callToAction.uppercased())
                        .fontWeight(.heavy)
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                }
                .foregroundColor(.white)
            }
            .padding(.vertical)
            .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
            .background(LinearGradient(colors: card.gradientColors, startPoint: .leading, endPoint: .trailing))
            .clipShape(Capsule())
            .shadow(color: Color("Colorshadow"), radius: 8, x: 0, y: 3)
            .offset(y: move ? 210 : 300)
        }
        .frame(width: 345, height: 545)
        .background(LinearGradient(colors: card.gradientColors, startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 10)
        .onAppear{
            withAnimation(.linear(duration: 1.5)){
                self.fadeIn.toggle()
                self.move.toggle()
            }
        }
        .alert(isPresented: $showAlert){
            Alert(
                title: Text(card.title),
                message: Text(card.message),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[1])
            .previewLayout(.sizeThatFits)
    }
}
