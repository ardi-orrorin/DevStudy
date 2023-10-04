import imple.CurrentConditionDisplay;
import imple.WeatherData;

public class App {
    public static void main(String[] args) {
        WeatherData weatherData = new WeatherData();

        CurrentConditionDisplay conditionDisplay1 = new CurrentConditionDisplay(weatherData);
        CurrentConditionDisplay conditionDisplay2 = new CurrentConditionDisplay(weatherData);
        CurrentConditionDisplay conditionDisplay3 = new CurrentConditionDisplay(weatherData);

        weatherData.setMeasurements(80, 65, 30.4f);
        weatherData.setMeasurements(60, 75, 32.4f);
        weatherData.setMeasurements(90, 80, 35.4f);

        System.out.println("-==================================");

        conditionDisplay3.display();

    }
}
