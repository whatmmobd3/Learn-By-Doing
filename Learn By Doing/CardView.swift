import SwiftUI

struct CardView: View {
    var gradient: [Color] = [Color("Color01"), Color("Color02")]
    var body: some View {
        ZStack {
            Image("developer-no1")
            VStack {
                Text("Swift UI")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                Text("Less code. Better app")
                    .fontWeight(.light)
                    .italic()
            }
            .foregroundColor(.white)
            .offset(y: -210)
            
            Button(action:{
                print("Tapped")
            }){
                HStack {
                    Text("learn".uppercased())
                        .fontWeight(.heavy)
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                }
                .foregroundColor(.white)
            }
            .padding(.vertical)
            .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
            .background(LinearGradient(colors: gradient, startPoint: .leading, endPoint: .trailing))
            .clipShape(Capsule())
            .shadow(color: Color("Colorshadow"), radius: 8, x: 0, y: 3)
            .offset(y: 210)
        }
        .frame(width: 345, height: 545)
        .background(LinearGradient(gradient: (Gradient(colors: gradient)), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
            .previewLayout(.sizeThatFits)
    }
}
