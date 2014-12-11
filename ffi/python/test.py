import API

settings = API.YQLSettings()
settings.yqlSettingsUrl = "http://localhost"
input = API.InputSmhiPmp()
input.fieldInputSmhiPmplat = "58.59"
input.fieldInputSmhiPmplon = "16.18"
maybe = API.yqlsmhi_pmpPipe(settings, input)
if maybe.just:
    array = maybe.data.resultFieldOutputSmhiPmpresult.resultFieldOutputSmhiPmpresulttimeseries
    for i in range(0, array.length):
        item = API.OutputOutputSmhiPmpresulttimeseriesbCArray_getitem(array.array, i)
        print (item.resultFieldOutputSmhiPmpresulttimeseriesbvalidTime,':', item.resultFieldOutputSmhiPmpresulttimeseriesbt)
