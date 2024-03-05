import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class App {

    @FieldAnnotaion
    private String fieldTest;

    public static void main(String[] args) throws Exception {
        System.out.println("Hello, World!");
        App app = new App();
        Method[] methods = app.getClass().getMethods();
        for (Method method : methods) {
            if (method.isAnnotationPresent(MyAnotation.class)) {
                MyAnotation myAnotation = method.getAnnotation(MyAnotation.class);
                System.out.println("Value: " + myAnotation.value());
                System.out.println("Number: " + myAnotation.number());
            }
        }

        Field[] fields = app.getClass().getDeclaredFields();
        for (Field field : fields) {
            if (field.isAnnotationPresent(FieldAnnotaion.class)) {
                field.setAccessible(true); // 접근 허용
                field.set(app, "This is my field");
            }
        }

        System.out.println(app.fieldTest);

    }

    @MyAnotation(value = "This is my annotation", number = 5)
    public void myMethod() {
        System.out.println("This is my method");
    }

    @MyAnotation(value = "This is my annotation 2", number = 10)
    public void myMethod2() {
        System.out.println("This is my method 2");
    }
}
