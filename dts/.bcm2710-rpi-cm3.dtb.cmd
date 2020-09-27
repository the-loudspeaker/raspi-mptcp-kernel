cmd_arch/arm/boot/dts/bcm2710-rpi-cm3.dtb := mkdir -p arch/arm/boot/dts/ ; arm-linux-gnueabihf-gcc -E -Wp,-MD,arch/arm/boot/dts/.bcm2710-rpi-cm3.dtb.d.pre.tmp -nostdinc -I./scripts/dtc/include-prefixes -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/boot/dts/.bcm2710-rpi-cm3.dtb.dts.tmp arch/arm/boot/dts/bcm2710-rpi-cm3.dts ; ./scripts/dtc/dtc -O dtb -o arch/arm/boot/dts/bcm2710-rpi-cm3.dtb -b 0 -iarch/arm/boot/dts/ -i./scripts/dtc/include-prefixes -@ -Wno-unit_address_vs_reg -Wno-unit_address_format -Wno-gpios_property -Wno-avoid_unnecessary_addr_size -Wno-alias_paths -Wno-graph_child_address -Wno-graph_port -Wno-simple_bus_reg -Wno-unique_unit_address -Wno-pci_device_reg  -d arch/arm/boot/dts/.bcm2710-rpi-cm3.dtb.d.dtc.tmp arch/arm/boot/dts/.bcm2710-rpi-cm3.dtb.dts.tmp ; cat arch/arm/boot/dts/.bcm2710-rpi-cm3.dtb.d.pre.tmp arch/arm/boot/dts/.bcm2710-rpi-cm3.dtb.d.dtc.tmp > arch/arm/boot/dts/.bcm2710-rpi-cm3.dtb.d

source_arch/arm/boot/dts/bcm2710-rpi-cm3.dtb := arch/arm/boot/dts/bcm2710-rpi-cm3.dts

deps_arch/arm/boot/dts/bcm2710-rpi-cm3.dtb := \
  arch/arm/boot/dts/bcm2710.dtsi \
  arch/arm/boot/dts/bcm2837.dtsi \
  arch/arm/boot/dts/bcm283x.dtsi \
  scripts/dtc/include-prefixes/dt-bindings/pinctrl/bcm2835.h \
  scripts/dtc/include-prefixes/dt-bindings/clock/bcm2835.h \
  scripts/dtc/include-prefixes/dt-bindings/clock/bcm2835-aux.h \
  scripts/dtc/include-prefixes/dt-bindings/gpio/gpio.h \
  scripts/dtc/include-prefixes/dt-bindings/interrupt-controller/irq.h \
  arch/arm/boot/dts/bcm2835-common.dtsi \
  arch/arm/boot/dts/bcm270x.dtsi \
  scripts/dtc/include-prefixes/dt-bindings/power/raspberrypi-power.h \
  arch/arm/boot/dts/bcm2709-rpi.dtsi \
  arch/arm/boot/dts/bcm2708-rpi.dtsi \
  arch/arm/boot/dts/bcm2835-rpi.dtsi \
  arch/arm/boot/dts/bcm283x-rpi-csi0-2lane.dtsi \
  arch/arm/boot/dts/bcm283x-rpi-csi1-4lane.dtsi \

arch/arm/boot/dts/bcm2710-rpi-cm3.dtb: $(deps_arch/arm/boot/dts/bcm2710-rpi-cm3.dtb)

$(deps_arch/arm/boot/dts/bcm2710-rpi-cm3.dtb):
