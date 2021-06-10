# System-Verilog-NES-Receiver
A project created in collaboration with Eric Prather, Nicholas Matsumoto, and James Yang. My contribution to the project was the NES Receiver and documentation.

## Introduction

We are asked to implement an NES (Nintendo Entertainment System) controller and a PS/2 controller that takes in inputs and outputs them onto a seven-segment display on an FPGA board. The NES controller can be programmed by pulsing the latch for the shift register, having a data pin that takes in all of the inputs, and a clock to go through and output each input serially. The PS/2 controller follows the same logic, but with some minor differences. 

## Controller Descriptions
The NES controller has 8 total inputs - A, B, Start, Select, Up, Down, Left, and Right. The data is stored in an 8 bit shift register that has an input of CLK and LATCH with an output to DATA. The shift register will grab the inputs and utilize a latch to transition the logic high and low bits. The duration of logic high must stay at least 12 microseconds in order to register, and the data output will rotate to the next value with every high end of the clock. 

The PS/2 controller has a male and female input/output that is reversed in order based on whether it is a plug or a socket. The plug has the odd numbers on the left with evens on the right, while the socket has the opposite. The 6 pins correlate to the figure described below. They consist of the data, unimplemented, ground, VCC, clock, and unimplemented. The input is a DC 5V with two resistors in parallel with 2 NPN transistors going to a 4 bit input microcontroller with ports A and B being connected to data and clock and ports C and D through a transistor. There are starting, data, parity, stop, and acknowledge bits. Data sent from the device is read through a clock signal, and the data is read on the falling edge of the clock. The frequency that it must be set at ranges from 10-16.7kHz, and timing is crucial in having a functioning PS/2 controller. 
