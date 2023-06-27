module Add(Address1,Address2,AddressOut);
 input [31:0] Address1,Address2;
 output [31:0] AddressOut;
 assign AddressOut = Address1+Address2;
endmodule
