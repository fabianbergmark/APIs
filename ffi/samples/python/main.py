from APIs import API

settings = API.YQLSettings()
settings.yqlSettingsUrl = "http://localhost"
input = API.InputSmhiPmp()
input.inputSmhiPmpLat = "58.59"
input.inputSmhiPmpLon = "16.18"
maybe = API.yqlsmhi_pmpPipe(settings, input)
if maybe.just:
    array = maybe.data.outputSmhiPmpTimeseries
    for i in range(0, array.length):
        item = API.OutputSmhiPmpTimeseriesCArray_getitem(array.array, i)
        print (item.outputSmhiPmpTimeseriesValidTime,':', item.outputSmhiPmpTimeseriesT)
