set ::env(DESIGN_NAME) "watchdog_timer"

set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]

set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_PERIOD) "10.0"

set ::env(FP_CORE_UTIL) 30
set ::env(FP_ASPECT_RATIO) 1.0
set ::env(FP_SIZING) "relative"

set ::env(PL_TARGET_DENSITY) 0.40
