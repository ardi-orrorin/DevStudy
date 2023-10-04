package imple;

import java.util.ArrayList;
import java.util.List;

import inter.Observer;
import inter.Subject;

public class WeatherData implements Subject {

    private List<Observer> observers;
    private float temperature;
    private float humidity;
    private float ressure;

    public WeatherData() {
        this.observers = new ArrayList<>();
    }

    public void notifyObserver() {
        for (Observer o : observers) {
            o.update(temperature, humidity, ressure); // update override
        }
    }

    public void registerObserver(Observer o) {
        observers.add(o);
    }

    public void removeObserver(Observer o) {
        observers.remove(o);
    }

    public void measurementsChanged() {
        notifyObserver();
    }

    public void setMeasurements(float temperature, float humidity, float ressure) {
        this.temperature = temperature;
        this.humidity = humidity;
        this.ressure = ressure;
        measurementsChanged();
    }

}
