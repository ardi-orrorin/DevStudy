package jmh;

import java.util.ArrayList;
import java.util.HashMap;

public class DummyData {
    HashMap<String, String> data;

    ArrayList<String> list;

    public DummyData(HashMap<String, String> data, ArrayList<String> list) {
        this.data = data;
        this.list = list;
    }
}
