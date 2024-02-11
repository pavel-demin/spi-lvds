proc part {ref footprint {mpn ""}} {
  puts "    (comp (ref $ref) (footprint footprints:$footprint) (property (name mpn) (value $mpn)))"
}

set code 1

proc wire {name args} {
  global code
  puts "    (net (code $code) (name $name)"
  foreach element $args {
    set list [split $element /]
    puts "      (node (ref [lindex $list 0]) (pin [lindex $list 1]))"
  }
  puts "    )"
  incr code
}

puts "(export (version E)"
puts "  (components"

part C1 0805 08053C104KAT2A
part C2 0805 08053C104KAT2A
part C3 0805 08053C104KAT2A
part C4 0805 08053C104KAT2A
part C5 0805 08053C104KAT2A

part C6 0805 08053C105KAT2A
part C7 0805 08053C105KAT2A

part R1 0805 50k

part IC1 SOIC8 SN65LVDS9638D
part IC2 SOIC8 SN65LVDT34D
part IC3 SOIC8 SN65LVDS9638D

part IC4 TSSOP16 TXB0106
part IC5 SOT23 MCP1700

part CN1 47272 47272-0001
part CN2 2x15 TSW-115-08-T-D-RA

part M1 M25 hole
part M2 M25 hole

puts "  )"
puts "  (nets"

wire 1V8 C4/1 IC4/2 CN2/54

wire 5V C6/1 IC5/3 CN2/57

wire 3V3 C1/1 C2/1 C3/1 C4/1 C5/1 C7/1 IC1/1 IC2/1 IC3/1 IC5/2 IC4/15
wire GND C1/2 C2/2 C3/2 C4/2 C5/2 C6/2 C7/2 R1/2 IC1/4 IC2/4 IC3/4 IC5/1 IC4/9 CN2/29 CN2/30 CN2/39 CN2/40 CN2/49 CN2/50 CN2/55 CN1/2 CN1/5 CN1/8 CN1/11 CN1/13 CN1/14 CN1/16 CN1/MH1 CN1/MH2 CN1/MH3 CN1/MH4

wire SCLK IC1/2 IC4/16
wire MOSI IC1/3 IC4/14
wire MISO IC2/2 IC4/13
wire DCLK IC2/3 IC4/12
wire CS IC3/2 IC4/11
wire LDAT IC3/3 IC4/10

wire SCLK+ IC1/8 CN1/1
wire SCLK- IC1/7 CN1/3
wire MOSI+ IC1/6 CN1/4
wire MOSI- IC1/5 CN1/6

wire MISO+ IC2/8 CN1/7
wire MISO- IC2/7 CN1/9
wire DCLK+ IC2/6 CN1/10
wire DCLK- IC2/5 CN1/12

wire CS+ IC3/8 CN1/15
wire CS- IC3/7 CN1/17
wire LDAT+ IC3/6 CN1/18
wire LDAT- IC3/5 CN1/19

wire SCLK1V8 IC4/1 CN2/46
wire MOSI1V8 IC4/3 CN2/44
wire MISO1V8 IC4/4 CN2/42
wire DCLK1V8 IC4/5 CN2/38
wire CS1V8 IC4/6 CN2/36
wire LDAT1V8 IC4/7 CN2/34
wire OE1V8 R1/1 IC4/8 CN2/32

puts "  )"
puts ")"
