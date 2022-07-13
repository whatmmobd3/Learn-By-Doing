import SwiftUI

struct CardView: View {
    var card: Card
    var body: some View {
        ZStack {
            Image(card.imageName)
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
            .offset(y: -210)
            
            Button(action:{
                print("Button Tapped")
                playSound(sound: "sound-chime", type: ".mp3")
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
            .offset(y: 210)
        }
        .frame(width: 345, height: 545)
        .background(LinearGradient(colors: card.gradientColors, startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[2])
            .previewLayout(.sizeThatFits)
    }
}
