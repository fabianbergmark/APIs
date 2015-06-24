require './apis'

y = Apis::YQLSettings.new
i = Apis::InputSmhiPmp.new
i.inputSmhiPmpLat = "58.59"
i.inputSmhiPmpLon = "16.18"
maybe = Apis.smhi_pmp(y, i)
if maybe.just
  array = maybe.data.outputSmhiPmpTimeseries
  for i in 0..(array.length-1)
    item = Apis.output_smhi_pmp_timeseries_carray_getitem(array.array, i)
    puts item.outputSmhiPmpTimeseriesValidTime.to_s + ":" + item.outputSmhiPmpTimeseriesT.to_s
  end
end
