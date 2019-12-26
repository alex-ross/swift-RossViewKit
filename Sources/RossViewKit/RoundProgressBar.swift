import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
public struct RoundProgressBar: View {
    public init(progress: Double = 0, max: Double = 1, color1: Color = .primary, color2: Color = .secondary) {
        self._progress = State(wrappedValue: progress)
        self._max = State(wrappedValue: max)
        self._color1 = State(wrappedValue: color1)
        self._color2 = State(wrappedValue: color2)
    }

    @State private var show = false
    @State public var progress: Double
    @State public var max: Double
    @State public var color1: Color
    @State public var color2: Color

    /// Get the progress factor
    private var progressFactor: Double {
        [progress / max, max].min()!
    }

    public var body: some View {
        GeometryReader { g in
            ZStack {
                Circle()
                    .stroke(LinearGradient(gradient: Gradient(colors: [self.color2, self.color1]), startPoint: .leading, endPoint: .trailing),
                            style: StrokeStyle(lineWidth: self.size(from: g, withFactor: 0.1), lineCap: .round, lineJoin: .round))
                    .opacity(0.1)
                Circle()
                    .trim(from: self.show ? CGFloat(1.0 - self.progressFactor) : 1, to: 1)
                    .stroke(LinearGradient(gradient: Gradient(colors: [self.color2, self.color1]), startPoint: .leading, endPoint: .trailing),
                            style: StrokeStyle(lineWidth: self.size(from: g, withFactor: 0.1), lineCap: .round, lineJoin: .round))
                    .rotationEffect(.degrees(90))
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                    .animation(.easeOut)

                Text(NumberFormatter.localizedString(from: NSNumber(value: self.progressFactor), number: .percent))
                    .font(.system(size: self.size(from: g, withFactor: 0.25)))
                    .bold()

            }
        }
        .onAppear { self.show.toggle() }
        .onTapGesture {
            self.show.toggle()
        }
    }

    private func size(from g: GeometryProxy, withFactor factor: CGFloat) -> CGFloat {
        g.size.height > g.size.width ? g.size.width * factor: g.size.height * factor
    }
}

#if DEBUG
@available(iOS 13.0, macOS 10.15, *)
struct ContentView_Previews: PreviewProvider {
    @State var show = false
    @State var progress = 1.0

    static var previews: some View {
        VStack(spacing: 90) {
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
#endif
