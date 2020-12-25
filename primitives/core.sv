/**
 * Core primitives for FuTIL.
 * Implements core primitives used by the compiler.
 *
 * Conventions:
 * - All parameter names must be SNAKE_CASE and all caps.
 * - Port names must be snake_case, no caps.
 */
`default_nettype none

module std_mem_d1 #(
    parameter width = 32,
    parameter size = 16,
    parameter idx_size = 4
) (
    input  logic [idx_size-1:0] addr0,
    input  logic [   width-1:0] write_data,
    input  logic                write_en,
    input  logic                clk,
    output logic [   width-1:0] read_data,
    output logic                done
);

  logic [width-1:0] mem[size-1:0];

  /* verilator lint_off WIDTH */
  assign read_data = mem[addr0];
  always_ff @(posedge clk) begin
    if (write_en) begin
      mem[addr0] <= write_data;
      done <= 1'd1;
    end else done <= 1'd0;
  end
endmodule

module std_mem_d2 #(
    parameter width = 32,
    parameter d0_size = 16,
    parameter d1_size = 16,
    parameter d0_idx_size = 4,
    parameter d1_idx_size = 4
) (
    input  logic [d0_idx_size-1:0] addr0,
    input  logic [d1_idx_size-1:0] addr1,
    input  logic [      width-1:0] write_data,
    input  logic                   write_en,
    input  logic                   clk,
    output logic [      width-1:0] read_data,
    output logic                   done
);

  /* verilator lint_off WIDTH */
  logic [width-1:0] mem[d0_size-1:0][d1_size-1:0];

  assign read_data = mem[addr0][addr1];
  always_ff @(posedge clk) begin
    if (write_en) begin
      mem[addr0][addr1] <= write_data;
      done <= 1'd1;
    end else done <= 1'd0;
  end
endmodule

module std_mem_d3 #(
    parameter width = 32,
    parameter d0_size = 16,
    parameter d1_size = 16,
    parameter d2_size = 16,
    parameter d0_idx_size = 4,
    parameter d1_idx_size = 4,
    parameter d2_idx_size = 4
) (
    input  logic [d0_idx_size-1:0] addr0,
    input  logic [d1_idx_size-1:0] addr1,
    input  logic [d2_idx_size-1:0] addr2,
    input  logic [      width-1:0] write_data,
    input  logic                   write_en,
    input  logic                   clk,
    output logic [      width-1:0] read_data,
    output logic                   done
);

  /* verilator lint_off WIDTH */
  logic [width-1:0] mem[d0_size-1:0][d1_size-1:0][d2_size-1:0];

  assign read_data = mem[addr0][addr1][addr2];
  always_ff @(posedge clk) begin
    if (write_en) begin
      mem[addr0][addr1][addr2] <= write_data;
      done <= 1'd1;
    end else done <= 1'd0;
  end
endmodule

module std_mem_d4 #(
    parameter width = 32,
    parameter d0_size = 16,
    parameter d1_size = 16,
    parameter d2_size = 16,
    parameter d3_size = 16,
    parameter d0_idx_size = 4,
    parameter d1_idx_size = 4,
    parameter d2_idx_size = 4,
    parameter d3_idx_size = 4
) (
    input  logic [d0_idx_size-1:0] addr0,
    input  logic [d1_idx_size-1:0] addr1,
    input  logic [d2_idx_size-1:0] addr2,
    input  logic [d3_idx_size-1:0] addr3,
    input  logic [      width-1:0] write_data,
    input  logic                   write_en,
    input  logic                   clk,
    output logic [      width-1:0] read_data,
    output logic                   done
);

  /* verilator lint_off WIDTH */
  logic [width-1:0] mem[d0_size-1:0][d1_size-1:0][d2_size-1:0][d3_size-1:0];

  assign read_data = mem[addr0][addr1][addr2][addr3];
  always_ff @(posedge clk) begin
    if (write_en) begin
      mem[addr0][addr1][addr2][addr3] <= write_data;
      done <= 1'd1;
    end else done <= 1'd0;
  end
endmodule

module std_reg #(
    parameter width = 32
) (
    input  wire  [  width-1:0] in,
    input  wire                write_en,
    input  wire                clk,
    // output
    output logic [width - 1:0] out,
    output logic               done
);

  always_ff @(posedge clk) begin
    if (write_en) begin
      out <= in;
      done <= 1'd1;
    end else done <= 1'd0;
  end
endmodule

module std_const #(
    parameter width = 32,
    parameter value = 0
) (
    output logic [width - 1:0] out
);
  assign out = value;
endmodule

module std_slice #(
    parameter in_width  = 32,
    parameter out_width = 32
) (
    input  logic [ in_width-1:0] in,
    output logic [out_width-1:0] out
);
  assign out = in[out_width-1:0];
endmodule

module std_lsh #(
    parameter width = 32
) (
    input  logic [width-1:0] left,
    input  logic [width-1:0] right,
    output logic [width-1:0] out
);
  assign out = left << right;
endmodule

module std_rsh #(
    parameter width = 32
) (
    input  logic [width-1:0] left,
    input  logic [width-1:0] right,
    output logic [width-1:0] out
);
  assign out = left >> right;
endmodule

module std_add #(
    parameter width = 32
) (
    input  logic [width-1:0] left,
    input  logic [width-1:0] right,
    output logic [width-1:0] out
);
  assign out = left + right;
endmodule

module std_sub #(
    parameter width = 32
) (
    input  logic [width-1:0] left,
    input  logic [width-1:0] right,
    output logic [width-1:0] out
);
  assign out = left - right;
endmodule

module std_not #(
    parameter width = 32
) (
    input  logic [width-1:0] in,
    output logic [width-1:0] out
);
  assign out = ~in;
endmodule

module std_and #(
    parameter width = 32
) (
    input  logic [width-1:0] left,
    input  logic [width-1:0] right,
    output logic [width-1:0] out
);
  assign out = left & right;
endmodule

module std_or #(
    parameter width = 32
) (
    input  logic [width-1:0] left,
    input  logic [width-1:0] right,
    output logic [width-1:0] out
);
  assign out = left | right;
endmodule

module std_xor #(
    parameter width = 32
) (
    input  logic [width-1:0] left,
    input  logic [width-1:0] right,
    output logic [width-1:0] out
);
  assign out = left ^ right;
endmodule

module std_gt #(
    parameter width = 32
) (
    input  logic [width-1:0] left,
    input  logic [width-1:0] right,
    output logic             out
);
  assign out = left > right;
endmodule

module std_lt #(
    parameter width = 32
) (
    input  logic [width-1:0] left,
    input  logic [width-1:0] right,
    output logic             out
);
  assign out = left < right;
endmodule

module std_eq #(
    parameter width = 32
) (
    input  logic [width-1:0] left,
    input  logic [width-1:0] right,
    output logic             out
);
  assign out = left == right;
endmodule

module std_neq #(
    parameter width = 32
) (
    input  logic [width-1:0] left,
    input  logic [width-1:0] right,
    output logic             out
);
  assign out = left != right;
endmodule

module std_ge #(
    parameter width = 32
) (
    input  logic [width-1:0] left,
    input  logic [width-1:0] right,
    output logic             out
);
  assign out = left >= right;
endmodule

module std_le #(
    parameter width = 32
) (
    input  logic [width-1:0] left,
    input  logic [width-1:0] right,
    output logic             out
);
  assign out = left <= right;
endmodule