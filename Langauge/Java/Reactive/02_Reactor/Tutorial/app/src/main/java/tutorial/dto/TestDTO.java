package tutorial.dto;

public class TestDTO {
    private String name;
    private Integer age;

    public TestDTO() {
    }

    public TestDTO(String name, Integer age) {
        this.name = name;
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public Integer getAge() {
        return age;
    }

    public void clear() {
        this.name = null;
        this.age = null;
    }
}
