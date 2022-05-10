`timescale 1ns/1ps
module reg_file_tb ();
logic        clk;
logic [ 4:0] a0;
logic [ 4:0] a1;
logic [ 4:0] a2;
logic [ 4:0] a3;
logic [31:0] rd0;
logic [31:0] rd1;
logic [31:0] rd2;
logic [31:0] wd3;
logic        we3;
logic [31:0] vcu_reg_rdata;
reg   [ 9:0] counter;
logic [31:0] testvectors [32:0];
integer i=0;
integer stopcount = 32;
int fd;

reg_file dut (
    .clk           (clk          ),
    .a0            (a0           ),
    .a1            (a1           ),
    .a2            (a2           ),
    .a3            (a3           ),
    .rd0           (rd0          ),
    .rd1           (rd1          ),
    .rd2           (rd2          ),
    .wd3           (wd3          ),
    .we3           (we3          ),
    .vcu_reg_rdata (vcu_reg_rdata)
);

initial begin
    $readmemb ("reg_file_testvectors.tv", testvectors);
    fd=$fopen("reg_file_testlog.txt","w");

    clk           =  1'b0;
    a0            =  5'b0;
    a1            =  5'b0;
    a2            =  5'b0;
    a3            =  5'b0;
    rd0           = 32'b0;
    rd1           = 32'b0;
    rd2           = 32'b0;
    wd3           = 32'b0;
    we3           =  1'b0;
    vcu_reg_rdata = 32'b0;

    #1;
    //loading reg file
    $fdisplay (fd, "Start loading registers of register file\n");
    we3 = 1'b1; //write enable
    #1;
    for (i=0;i<32;i=i+1) begin
        wd3 = testvectors[i];
        a3 = i;
        $fdisplay (fd, "Register %d: %X\n",i,testvectors[i]);
        #2 clk = ~clk;
        #2 clk = ~clk;
    end
    #1;
    we3=1'b0; //write disable
    #1;
    //reading from register file by rd0;
    $fdisplay (fd, "Reading with rd0\n");
    for (i=0;i<32;i=i+1) begin
        a0 = i;
        #2;
        if (rd0 == testvectors [i]) begin
        $fdisplay (fd, "Register %d SUCCESS\n",i);
        end
        else begin
            $fdisplay (fd, "Register %d ERROR\n",i);
        end

    end
    #1;
    a0 = 5'b0;
    #1;
    //reading from register file by rd1;
    $fdisplay (fd, "Reading with rd2\n");
    for (i=0;i<32;i=i+1) begin
        a1 = i;
        #2;
        if (rd1 == testvectors [i]) begin
        $fdisplay (fd, "Register %d SUCCESS\n",i);
        end
        else begin
            $fdisplay (fd, "Register %d ERROR\n",i);
        end
    end
        #1;
        a1 = 5'b0;
        #1;
        //reading from register file by rd2;
        $fdisplay (fd, "Reading with rd1\n");
        for (i=0;i<32;i=i+1) begin
            a2 = i;
            #2;
            if (rd2 == testvectors [i]) begin
            $fdisplay (fd, "Register %d SUCCESS\n",i);
            end
            else begin
                $fdisplay (fd, "Register %d ERROR\n",i);
            end
    
            end
            $fclose(fd);
            $stop;

end

endmodule