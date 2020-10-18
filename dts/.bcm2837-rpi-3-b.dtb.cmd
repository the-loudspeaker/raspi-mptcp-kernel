cmd_arch/arm/boot/dts/bcm2837-rpi-3-b.dtb := mkdir -p arch/arm/boot/dts/ ; gcc -E -Wp,-MD,arch/arm/boot/dts/.bcm2837-rpi-3-b.dtb.d.pre.tmp -nostdinc -I./scripts/dtc/include-prefixes -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/boot/dts/.bcm2837-rpi-3-b.dtb.dts.tmp arch/arm/boot/dts/bcm2837-rpi-3-b.dts ; ./scripts/dtc/dtc -O dtb -o arch/arm/boot/dts/bcm2837-rpi-3-b.dtb -b 0 -iarch/arm/boot/dts/ -i./scripts/dtc/include-prefixes -@ -Wno-unit_address_vs_reg -Wno-unit_address_format -Wno-gpios_property -Wno-avoid_unnecessary_addr_size -Wno-alias_paths -Wno-graph_child_address -Wno-simple_bus_reg -Wno-unique_unit_address -Wno-pci_device_reg  -d arch/arm/boot/dts/.bcm2837-rpi-3-b.dtb.d.dtc.tmp arch/arm/boot/dts/.bcm2837-rpi-3-b.dtb.dts.tmp ; cat arch/arm/boot/dts/.bcm2837-rpi-3-b.dtb.d.pre.tmp arch/arm/boot/dts/.bcm2837-rpi-3-b.dtb.d.dtc.tmp > arch/arm/boot/dts/.bcm2837-rpi-3-b.dtb.d

source_arch/arm/boot/dts/bcm2837-rpi-3-b.dtb := arch/arm/boot/dts/bcm2837-rpi-3-b.dts

deps_arch/arm/boot/dts/bcm2837-rpi-3-b.dtb := \
  arch/arm/boot/dts/bcm2837.dtsi \
  arch/arm/boot/dts/bcm283x.dtsi \
  scripts/dtc/include-prefixes/dt-bindings/pinctrl/bcm2835.h \
  scripts/dtc/include-prefixes/dt-bindings/clock/bcm2835.h \
  scripts/dtc/include-prefixes/dt-bindings/clock/bcm2835-aux.h \
  scripts/dtc/include-prefixes/dt-bindings/gpio/gpio.h \
  scripts/dtc/include-prefixes/dt-bindings/interrupt-controller/irq.h \
  scripts/dtc/include-prefixes/dt-bindings/soc/bcm2835-pm.h \
  arch/arm/boot/dts/bcm2835-common.dtsi \
  arch/arm/boot/dts/bcm2836-rpi.dtsi \
  arch/arm/boot/dts/bcm2835-rpi.dtsi \
  scripts/dtc/include-prefixes/dt-bindings/power/raspberrypi-power.h \
  arch/arm/boot/dts/bcm283x-rpi-smsc9514.dtsi \
  arch/arm/boot/dts/bcm283x-rpi-usb-host.dtsi \

arch/arm/boot/dts/bcm2837-rpi-3-b.dtb: $(deps_arch/arm/boot/dts/bcm2837-rpi-3-b.dtb)

$(deps_arch/arm/boot/dts/bcm2837-rpi-3-b.dtb):
