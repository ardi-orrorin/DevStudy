// 타입캐스팅
/*
    인스턴스의 타입을 확인하거나 해당 인스턴스를 자체 클래스 계층 구조의 다른 곳에서 다른 상위 클래스 또는 하위 클래스로써 취급하는 방법
    is, as 연산자 사용
    is : 인스턴스가 특정 클래스 타입인지 확인
    as : 클래스의 인스턴스를 해당 클래스 계층 구조의 상위 클래스 또는 하위 클래스의 인스턴스로 취급
*/

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem { // MediaItem 상속
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem { // MediaItem 상속
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [ // MediaItem 타입의 배열
    Movie(name: "미션임파서블", director: "브라이언"),
    Song(name: "Love Story", artist: "Taylor Swift"),
    Movie(name: "말할 수 없는 비밀", director: "스티븐")
]

// 타입 검사
var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("MediaItem: \(library.count), Movie: \(movieCount), Song: \(songCount)")


// 다운 캐스팅
// 하위 클래스 타입을 참조 할 수 있다.
// as? : 조건부 다운 캐스팅, 실패하면 nil 반환
// as! : 강제 다운 캐스팅, 실패하면 런타임 오류 발생

for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), \(song.artist)")
    }
}


// Any, AnyObject
var things: [Any] = []

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.141592)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "스타워즈", director: "조지 루카스"))
things.append({ (name: String) -> String in "Hello, \(name)" })

for thing in things {
    switch thing {
    case 0 as Int:
        print("Int 타입의 0")
    case 0 as Double:
        print("Double 타입의 0")
    case let someInt as Int:
        print("Int 타입의 값 \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("Double 타입의 양수 \(someDouble)")
    case is Double:
        print("Double 타입의 값")
    case let someString as String:
        print("String 타입의 값 \(someString)")
    case let (x, y) as (Double, Double):
        print("Double 타입의 (\(x), \(y))")
    case let movie as Movie:
        print("Movie 타입의 \(movie.name), \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Jung"))
    default:
        print("default")
    }
}