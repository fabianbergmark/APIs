#include <api.hpp>
#include <stddef.h>
#include <iostream>

int main() {
  YQLSettings settings;
  InputSmhiPmp input;
  std::cout << (int) offsetof(InputSmhiPmp,inputSmhiPmpLat) << std::endl;
  std::cout << (int) offsetof(InputSmhiPmp,inputSmhiPmpLon) << std::endl;
  std::string lat("58.59");
  std::string lon("16.18"); 
  input.inputSmhiPmpLat = &lat[0];
  input.inputSmhiPmpLon = &lon[0];
  Maybe<OutputSmhiPmp>* output = smhiPmp(&settings, &input);
  if (output->just) {
    OutputSmhiPmp* data = output->data;
    char* referenceTime = data->outputSmhiPmpReferenceTime;
    std::cout << referenceTime << std::endl;
  }
}
