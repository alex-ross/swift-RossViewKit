import SwiftUI
import RossViewKit

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 90) {
                Text("Round progress bar")
                    .font(.title)
                RoundProgressBar(progress: 0.5, color1: Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)), color2: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)))
                    .frame(width: 100, height: 100)
                HStack {
                    Spacer()
                    RoundProgressBar(progress: 0.3)
                        .frame(width: 100, height: 100)
                    Spacer()
                    RoundProgressBar(progress: 1.00, color1: Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)), color2: Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
                        .frame(width: 100, height: 100)
                    Spacer()
                }
                RoundProgressBar(progress: 0.88, color1: Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)), color2: Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
                    .frame(width: 200, height: 200)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()


            RoundProgressBar(progress: 0.5, color1: .orange, color2: .yellow)
                .frame(width: 100, height: 100)
                .previewLayout(.fixed(width: 150, height: 150))

            RoundProgressBar(progress: 76, max: 250)
                .frame(width: 150, height: 150)
                .previewLayout(.fixed(width: 200, height: 200))

            RoundProgressBar(progress: 1.00, color1: .purple, color2: .red)
                .frame(width: 200, height: 200)
                .previewLayout(.fixed(width: 250, height: 250))

        }
    }
}
