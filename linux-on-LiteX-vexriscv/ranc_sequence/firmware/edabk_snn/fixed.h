#ifndef __EDABK_SNN
#define __EDABK_SNN

#include <stdio.h>

void load_neuron_parameter(uint8_t core_num);
void load_neuron_inst(void);
void load_packet_in(uint32_t num_packet, uint16_t num_pic);
// void handling_packets(const char* path, uint8_t num_inputs);
void test_function(void);
void change_while(void);
#endif 