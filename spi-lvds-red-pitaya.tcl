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

part IC1 SOIC8 SN65LVDS9638D
part IC2 SOIC8 SN65LVDT34D
part IC3 SOIC8 SN65LVDS9638D

part CN1 47272 47272-0001
part CN2 2x13 CES-113-01-T-D

puts "  )"
puts "  (nets"

wire VCC C1/1 C2/1 C3/1 IC1/1 IC2/1 IC3/1 CN2/1 CN2/2
wire GND C1/2 C2/2 C3/2 IC1/4 IC2/4 IC3/4 CN2/25 CN2/26 CN1/2 CN1/5 CN1/8 CN1/11 CN1/13 CN1/14 CN1/16

wire SCLK IC1/2 CN2/4
wire MOSI IC1/3 CN2/6
wire MISO IC2/2 CN2/8
wire DCLK IC2/3 CN2/10
wire CS IC3/2 CN2/12
wire LDAT IC3/3 CN2/14

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

puts "  )"
puts ")"
