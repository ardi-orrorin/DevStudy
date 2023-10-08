public class Singleton {

    private volatile static Singleton uniquSingleton;

    public static Singleton getIntance() {
        if (uniquSingleton == null) { // 인스턴트 생성 여부
            synchronized (Singleton.class) { // 처음에만 동기화
                if (uniquSingleton == null) { // 재차 인스턴트 생성 여부 확인
                    uniquSingleton = new Singleton(); // 인스턴트 생성
                }
            }
        }
        return uniquSingleton;
    }
}
