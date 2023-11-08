`timescale 1ns / 1ps



//////////////////////////////////////////////////////////////////////////////////
// Company: NATIONAL INSTITUTE OF TECHNOLOGY WARANGAL
// Engineer: NARENDRA KUMAR NEHRA 
// 
// Create Date: 11.07.2023 03:18:14
// Design Name: 
// Module Name: DIFF_FREQ_CLOCK
//////////////////////////////////////////////////////////////////////////////////

module DIFF_FREQ_CLOCK(
                  input CLKIN1,
                  input RST,
                  output CLK_OUT_0,
                  output CLK_OUT_1,
                  output CLK_OUT_2,
                  output CLK_OUT_3,
                  output CLK_OUT_4,
                  output CLK_OUT_5,
                  output CLK_OUT_6
                  );
                  
         wire CLK_OUT0B_unused;
         wire CLK_OUT1B_unused;
         wire CLK_OUT2B_unused;
         wire CLK_OUT3B_unused;
         wire CLK_OUT4B_unused;
         wire clkfbout;
         
         
         wire [15:0] do_unused;
         wire        drdy_unused;
         wire        psdone_unused;
         wire        CLKINBSTOPPED_unused;
         wire        CLKFBSTOPPED_unused;
         wire        CLKINSTOPPED_unused;

   MMCME2_ADV #(
      .BANDWIDTH("OPTIMIZED"),        // Jitter programming (OPTIMIZED, HIGH, LOW)
      .CLKFBOUT_MULT_F(1.0),          // Multiply value for all CLKOUT (2.000-64.000).
      .CLKFBOUT_PHASE(0.0),           // Phase offset in degrees of CLKFB (-360.000-360.000).
      // CLKIN_PERIOD: Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
      .CLKIN1_PERIOD(5.0),
      .CLKIN2_PERIOD(0.0),
      // CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for CLKOUT (1-128)
      .CLKOUT1_DIVIDE(2),
      .CLKOUT2_DIVIDE(3),
      .CLKOUT3_DIVIDE(4),
      .CLKOUT4_DIVIDE(5),
      .CLKOUT5_DIVIDE(6),
      .CLKOUT6_DIVIDE(7),
      .CLKOUT0_DIVIDE_F(1.0),         // Divide amount for CLKOUT0 (1.000-128.000).
      // CLKOUT0_DUTY_CYCLE - CLKOUT6_DUTY_CYCLE: Duty cycle for CLKOUT outputs (0.01-0.99).
      .CLKOUT0_DUTY_CYCLE(0.5),
      .CLKOUT1_DUTY_CYCLE(0.5),
      .CLKOUT2_DUTY_CYCLE(0.5),
      .CLKOUT3_DUTY_CYCLE(0.5),
      .CLKOUT4_DUTY_CYCLE(0.5),
      .CLKOUT5_DUTY_CYCLE(0.5),
      .CLKOUT6_DUTY_CYCLE(0.5),
      // CLKOUT0_PHASE - CLKOUT6_PHASE: Phase offset for CLKOUT outputs (-360.000-360.000).
      .CLKOUT0_PHASE(0.0),
      .CLKOUT1_PHASE(0.0),
      .CLKOUT2_PHASE(0.0),
      .CLKOUT3_PHASE(0.0),
      .CLKOUT4_PHASE(0.0),
      .CLKOUT5_PHASE(0.0),
      .CLKOUT6_PHASE(0.0),
      .CLKOUT4_CASCADE("FALSE"),      // Cascade CLKOUT4 counter with CLKOUT6 (FALSE, TRUE)
      .COMPENSATION("ZHOLD"),         // ZHOLD, BUF_IN, EXTERNAL, INTERNAL
      .DIVCLK_DIVIDE(1),              // Master division value (1-106)
      // REF_JITTER: Reference input jitter in UI (0.000-0.999).
      .REF_JITTER1(0.0),
      .REF_JITTER2(0.0),
      .STARTUP_WAIT("FALSE"),         // Delays DONE until MMCM is locked (FALSE, TRUE)
      // Spread Spectrum: Spread Spectrum Attributes
      .SS_EN("FALSE"),                // Enables spread spectrum (FALSE, TRUE)
      .SS_MODE("CENTER_HIGH"),        // CENTER_HIGH, CENTER_LOW, DOWN_HIGH, DOWN_LOW
      .SS_MOD_PERIOD(10000),          // Spread spectrum modulation period (ns) (VALUES)
      // USE_FINE_PS: Fine phase shift enable (TRUE/FALSE)
      .CLKFBOUT_USE_FINE_PS("FALSE"),
      .CLKOUT0_USE_FINE_PS("FALSE"),
      .CLKOUT1_USE_FINE_PS("FALSE"),
      .CLKOUT2_USE_FINE_PS("FALSE"),
      .CLKOUT3_USE_FINE_PS("FALSE"),
      .CLKOUT4_USE_FINE_PS("FALSE"),
      .CLKOUT5_USE_FINE_PS("FALSE"),
      .CLKOUT6_USE_FINE_PS("FALSE")
   )
   MMCME2_ADV_inst (
      // Clock Outputs: 1-bit (each) output: User configurable clock outputs
      .CLKOUT0(CLK_OUT_0),           // 1-bit output: CLKOUT0
      .CLKOUT0B(CLK_OUT0B_unused),         // 1-bit output: Inverted CLKOUT0
      .CLKOUT1(CLK_OUT_1),           // 1-bit output: CLKOUT1
      .CLKOUT1B(CLK_OUT1B_unused),         // 1-bit output: Inverted CLKOUT1
      .CLKOUT2(CLK_OUT_2),           // 1-bit output: CLKOUT2
      .CLKOUT2B(CLK_OUT2B_unused),         // 1-bit output: Inverted CLKOUT2
      .CLKOUT3(CLK_OUT_3),           // 1-bit output: CLKOUT3
      .CLKOUT3B(CLK_OUT3B_unused),         // 1-bit output: Inverted CLKOUT3
      .CLKOUT4(CLK_OUT_4),           // 1-bit output: CLKOUT4
      .CLKOUT5(CLK_OUT_5),           // 1-bit output: CLKOUT5
      .CLKOUT6(CLK_OUT_6),           // 1-bit output: CLKOUT6
      // DRP Ports: 16-bit (each) output: Dynamic reconfiguration ports
      .DO(do_unused),                     // 16-bit output: DRP data
      .DRDY(drdy_unused),                 // 1-bit output: DRP ready
      // Dynamic Phase Shift Ports: 1-bit (each) output: Ports used for dynamic phase shifting of the outputs
      .PSDONE(psdone_unused),             // 1-bit output: Phase shift done
      // Feedback Clocks: 1-bit (each) output: Clock feedback ports
      .CLKFBOUT(clkfbout),         // 1-bit output: Feedback clock
      .CLKFBOUTB(CLKFBOUTB),       // 1-bit output: Inverted CLKFBOUT
      // Status Ports: 1-bit (each) output: MMCM status ports
      .CLKFBSTOPPED(CLKFBSTOPPED), // 1-bit output: Feedback clock stopped
      .CLKINSTOPPED(CLKINSTOPPED), // 1-bit output: Input clock stopped
      .LOCKED(LOCKED),             // 1-bit output: LOCK
      // Clock Inputs: 1-bit (each) input: Clock inputs
      .CLKIN1(CLKIN1),             // 1-bit input: Primary clock
      .CLKIN2(1'b0),             // 1-bit input: Secondary clock
      // Control Ports: 1-bit (each) input: MMCM control ports
      .CLKINSEL(1'b1),         // 1-bit input: Clock select, High=CLKIN1 Low=CLKIN2
      .PWRDWN(1'b0),             // 1-bit input: Power-down
      .RST(RST),                   // 1-bit input: Reset
      // DRP Ports: 7-bit (each) input: Dynamic reconfiguration ports
      .DADDR(7'b0),               // 7-bit input: DRP address
      .DCLK(1'b0),                 // 1-bit input: DRP clock
      .DEN(1'b0),                   // 1-bit input: DRP enable
      .DI(1'b0),                     // 16-bit input: DRP data
      .DWE(1'b0),                   // 1-bit input: DRP write enable
      // Dynamic Phase Shift Ports: 1-bit (each) input: Ports used for dynamic phase shifting of the outputs
      .PSCLK(1'b0),               // 1-bit input: Phase shift clock
      .PSEN(1'b0),                 // 1-bit input: Phase shift enable
      .PSINCDEC(1'b0),         // 1-bit input: Phase shift increment/decrement
      // Feedback Clocks: 1-bit (each) input: Clock feedback ports
      .CLKFBIN(clkfbout)            // 1-bit input: Feedback clock
   );

   // End of MMCME2_ADV_inst instantiation
					
	endmodule				
