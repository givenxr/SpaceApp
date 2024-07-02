import SwiftUI
import SceneKit
import RealityKit

struct Mercurry: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @State private var isHovered = false
    var planet: Planets = .Mercury

    var body: some View {
        ZStack {
            // Use the existing StarryBackground
            StarryBackground()
            
            ScrollView {
                VStack(spacing: 30) {
                    Text(planet.planetName)
                        .font(.custom("SpaceGrotesk-Bold", size: 50))
                        .foregroundColor(.white)
                        .padding(.top, 50)
                        .shadow(color: .orange, radius: 2, x: 0, y: 2)
                    
                    PlanetSceneView(scene: SCNScene(named: "\(planet.rawValue).usdz"))
                        .frame(width: 300, height: 300)
                        .background(
                            Circle()
                                .fill(RadialGradient(gradient: Gradient(colors: [.orange, .red, .black]), center: .center, startRadius: 5, endRadius: 150))
                        )
                        .shadow(color: .orange.opacity(0.5), radius: 20, x: 0, y: 0)
                    
                    InfoSection(title: "About Mercury", content: planet.about)
                    
                    FactsGrid()
                    
                    InfoSection(title: "Detailed Information", content: detailedInfo)
                    
                    ExplorationSection()
                }
                .padding()
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
    
    var detailedInfo: String {
        """
        Mercury is the closest planet to the sun and the smallest planet in the solar system — it is only a little larger than Earth's moon. Mercury zips around the sun in only 88 days and because it is so close to our star (about two-fifths the distance between Earth and the sun).

        Mercury experiences dramatic changes in its day and night temperatures. Mercury temperatures can reach a scorching 840 F (450 C) in the day, which is hot enough to melt lead. Meanwhile, on the night side, temperatures drop to minus 290 F (minus 180 C).

        Mercury's atmosphere is very thin and primarily composed of oxygen, sodium, hydrogen, helium and potassium. Because the atmosphere is so thin it cannot incoming meteors, its surface is therefore pockmarked with craters, just like our moon.

        Over its four-year mission, NASA's MESSENGER spacecraft revealed incredible discoveries that challenged astronomers' expectations. Among those findings was the discovery of water ice and frozen organic compounds at Mercury's north pole and that volcanism played a major role in shaping the planet's surface.

        Despite its proximity to the Sun, Mercury is not the hottest planet in our solar system – that title belongs to nearby Venus, thanks to its dense atmosphere. Mercury's elliptical orbit takes the small planet as close as 29 million miles (47 million kilometers) and as far as 43 million miles (70 million kilometers) from the Sun. If one could stand on the scorching surface of Mercury when it is at its closest point to the Sun, the Sun would appear more than three times as large as it does when viewed from Earth.
        """
    }
}

struct InfoSection: View {
    let title: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .font(.custom("SpaceGrotesk-Bold", size: 30))
                .foregroundColor(.white)
            
            Text(content)
                .font(.custom("SpaceGrotesk-Regular", size: 16))
                .foregroundColor(.white.opacity(0.8))
                .lineSpacing(5)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15)
    }
}

struct FactsGrid: View {
    let facts: [(String, String)] = [
        ("Name Meaning", "Messenger of the Roman gods"),
        ("Diameter", "3,031 miles (4,878 km)"),
        ("Surface Gravity", "3.7 m/s²"),
        ("Orbit", "88 Earth days"),
        ("Day Length", "58.6 Earth days"),
        ("Moons", "0"),
        ("Avg. Temperature", "-180°C to 430°C"),
        ("Atmosphere", "Composed mainly of oxygen, sodium, hydrogen, helium, and potassium")
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(facts, id: \.0) { fact in
                    VStack(alignment: .leading, spacing: 5) {
                        Text(fact.0)
                            .font(.custom("SpaceGrotesk-Bold", size: 18))
                            .foregroundColor(.orange)
                        Spacer()
                        Text(fact.1)
                            .font(.custom("SpaceGrotesk-Regular", size: 16))
                            .foregroundColor(.white)
                    }
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}
struct ExplorationSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Exploration Highlights")
                .font(.custom("SpaceGrotesk-Bold", size: 30))
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 10) {
                ExplorationItem(
                    title: "Mariner 10 (1974-1975)",
                    description: "First spacecraft to visit Mercury, mapped about 45% of the surface."
                )
                ExplorationItem(
                    title: "MESSENGER (2011-2015)",
                    description: "First to orbit Mercury, provided comprehensive maps and data."
                )
                ExplorationItem(
                    title: "BepiColombo (Launched 2018)",
                    description: "Joint ESA/JAXA mission, will study Mercury's composition, geophysics, atmosphere, and magnetosphere."
                )
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15)
    }
}

struct ExplorationItem: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.custom("SpaceGrotesk-Bold", size: 18))
                .foregroundColor(.orange)
            Text(description)
                .font(.custom("SpaceGrotesk-Regular", size: 16))
                .foregroundColor(.white.opacity(0.8))
        }
    }
}

#Preview {
    Mercurry()
}
