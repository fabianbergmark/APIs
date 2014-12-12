from APIs import APIs

settings = APIs.YQLSettings()
settings.yqlSettingsUrl = "http://localhost"
input = APIs.InputSmhiPmp()
input.inputSmhiPmpLat = "58.59"
input.inputSmhiPmpLon = "16.18"
maybe = APIs.smhiPmp(settings, input)
if maybe.just:
    array = maybe.data.outputSmhiPmpTimeseries
    for i in range(0, array.length):
        item = APIs.OutputSmhiPmpTimeseriesCArray_getitem(array.array, i)
        print (item.outputSmhiPmpTimeseriesValidTime,':', item.outputSmhiPmpTimeseriesT)
