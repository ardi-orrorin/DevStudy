// 접근 제어

// 모듈과 소스파일
// import를 통해 모듈을 가져올 수 있다.
import SwiftUI

// 접근 수준
// open, public, internal, fileprivate, private
/*
    - open : 클래스와 클래스의 멤버에서만 사용가능, 하위클래스에에서 접근 가능하며, 재정의가 가능
    - public : 다은 모듈에서도 접근가능 하지만, 재정의는 불가능
    - internal : 모듈의 모든 소스내에서 사용가능
    - fileprivate : 소스파일ㄴ 내에서만 사용가능
    - private : 단일 선언내에서만 사용
*/

open class SomeOpenClass {}
public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}



