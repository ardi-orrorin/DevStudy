import java.lang.reflect.Field;

public class Test {
    public static void main(String[] args) {
        // Field[] fields = TestDTO.class.getDeclaredFields();
        // for (Field field : fields) {
        // System.out.println(field.getName());

        // }

        TestDTO testDTO = new TestDTO("홍길동", 20, "서울시 강남구", "010-1234-5678", "", "", "", "", "", "", "", "");
        Field[] fields2 = testDTO.getClass().getDeclaredFields();
        for (Field field : fields2) {
            field.setAccessible(true);
            try {
                System.out.println(field.get(testDTO));
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
    }
}
