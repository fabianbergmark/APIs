import java.io.File;
import java.io.IOException;

import se.fbergmark.apis.*;

public class Main {
    public static void main(String argv[]) {
	System.load("/usr/lib/libAPIsJava.so");

	YQLSettings settings = new YQLSettings();
	InputSmhiPmp input = new InputSmhiPmp();
	input.setInputSmhiPmpLat("58.59");
	input.setInputSmhiPmpLon("16.18");
	MaybeOutputSmhiPmp maybe = APIs.smhiPmp(settings, input);
	if (maybe.getJust()) {
	    OutputSmhiPmp output = maybe.getData();
	    OutputSmhiPmpTimeseriesArray array = output.getOutputSmhiPmpTimeseries();
	    for (int i = 0; i < array.getLength(); ++i) {
		OutputSmhiPmpTimeseries item = APIs.OutputSmhiPmpTimeseriesCArray_getitem(array.getArray(), i);
		System.out.println(item.getOutputSmhiPmpTimeseriesValidTime() +
				   ": " +
				   item.getOutputSmhiPmpTimeseriesT());
	    }
	}
    }
}
