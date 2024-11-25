import Foundation

struct Video {
    let title: String
    let views: Int
    let url: String
}

func generateSampleVideos() -> [Video] {
    return [
        Video(title: "Swift Programming", views: 5000, url: "https://example.com/video1"),
        Video(title: "Swift Basics", views: 3200, url: "https://example.com/video2"),
        Video(title: "Advanced Swift", views: 1200, url: "https://example.com/video3"),
        Video(title: "Intro to Swift", views: 2300, url: "https://example.com/video4"),
        Video(title: "iOS Development", views: 8000, url: "https://example.com/video5"),
        Video(title: "Cats", views: 4200, url: "https://example.com/video6"),
        Video(title: "More cats", views: 5400, url: "https://example.com/video7"),
        Video(title: "SQLite Basics for Beginners", views: 1500, url: "https://example.com/video8"),
        Video(title: "Best Games to Play This Year", views: 2200, url: "https://example.com/video9"),
        Video(title: "Top 5 Travel Tips", views: 7000, url: "https://example.com/video10")
    ]
}

func printVideos(videos: [Video]) {
    print("Список відео:")
    for (index, video) in videos.enumerated() {
        print("\(index + 1). Назва: \(video.title), Перегляди: \(video.views)")
    }
}

func searchVideos(by title: String, in videos: [Video]) -> [Video] {
    return videos.filter { $0.title.lowercased().contains(title.lowercased()) }
}

func main() {
    let videos = generateSampleVideos()
    
    while true {
        print("Оберіть дію:")
        print("1. Показати всі відео")
        print("2. Знайти відео за назвою")
        
        guard let choice = readLine() else { return }
        
        if choice == "1" {
            printVideos(videos: videos)
        } else if choice == "2" {
            print("Введіть назву для пошуку:")
            guard let searchTerm = readLine(), !searchTerm.isEmpty else { return }
            
            let searchResults = searchVideos(by: searchTerm, in: videos)
            if searchResults.isEmpty {
                print("Відео не знайдено.")
            } else {
                print("Результати пошуку:")
                printVideos(videos: searchResults)
            }
        } else {
            print("Невірний вибір.")
        }
    }
}

main()