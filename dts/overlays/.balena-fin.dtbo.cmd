cmd_arch/arm/boot/dts/overlays/balena-fin.dtbo := mkdir -p arch/arm/boot/dts/overlays/ ; arm-linux-gnueabihf-gcc -E -Wp,-MD,arch/arm/boot/dts/overlays/.balena-fin.dtbo.d.pre.tmp -nostdinc -I./scripts/dtc/include-prefixes -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/boot/dts/overlays/.balena-fin.dtbo.dts.tmp arch/arm/boot/dts/overlays/balena-fin-overlay.dts ; ./scripts/dtc/dtc -@ -H epapr -O dtb -o arch/arm/boot/dts/overlays/balena-fin.dtbo -b 0 -i arch/arm/boot/dts/overlays/ -Wno-unit_address_vs_reg -Wno-unit_address_format -Wno-gpios_property -Wno-avoid_unnecessary_addr_size -Wno-alias_paths -Wno-graph_child_address -Wno-graph_port -Wno-simple_bus_reg -Wno-unique_unit_address -Wno-pci_device_reg  -Wno-interrupts_property -d arch/arm/boot/dts/overlays/.balena-fin.dtbo.d.dtc.tmp arch/arm/boot/dts/overlays/.balena-fin.dtbo.dts.tmp ; cat arch/arm/boot/dts/overlays/.balena-fin.dtbo.d.pre.tmp arch/arm/boot/dts/overlays/.balena-fin.dtbo.d.dtc.tmp > arch/arm/boot/dts/overlays/.balena-fin.dtbo.d

source_arch/arm/boot/dts/overlays/balena-fin.dtbo := arch/arm/boot/dts/overlays/balena-fin-overlay.dts

deps_arch/arm/boot/dts/overlays/balena-fin.dtbo := \
  scripts/dtc/include-prefixes/dt-bindings/gpio/gpio.h \

arch/arm/boot/dts/overlays/balena-fin.dtbo: $(deps_arch/arm/boot/dts/overlays/balena-fin.dtbo)

$(deps_arch/arm/boot/dts/overlays/balena-fin.dtbo):
