import SwiftUI

struct ContentView: View {
    var cards: [Card] = cardData
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 10){
                ForEach(cards) { item in
                    CardView(card: item)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cards: cardData)
            .previewDevice("Iphone 11 Pro")
    }
}
