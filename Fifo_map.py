from sympy.strategies.core import switch

channels = 16
output = ""
type = "altera"


def lattice_fifo():
    global output
    for i in range(0, channels):
        output += "    u_Fifosm" + str(i) + " : entity work.Fifosm \n\
            port map (\n\
                Clock => clk,\n\
                Reset => rst,\n\
                Data => Data,\n\
                RdEn => adc_fifo_rd_en(" + str(i) + "), \n\
                WrEn => Write_En,\n\
                Q => adc_fifo_" + str(i) + "_dout,  \n\
                Full => open,      \n\
                AlmostFull => open,  \n\
                AlmostEmpty => open,  \n\
                Empty => adc_fifo_empty(" + str(i) + ")  \n\
            );\n"

def altera_fifo():
    global output
    print(channels)
    print("output")
    for i in range(0, channels):
        output += "u_Fifosm" + str(i) + " : entity work.Fifo\
    port map (\n\
        aclr         => rst,\n\
        clock        => clk,\n\
        data         => Data,\n\
        rdreq        => adc_fifo_rd_en(" + str(i) + "),\n\
        wrreq        => Write_En,\n\
        q            => adc_fifo_" + str(i) + "_dout,\n\
        full         => open,\n\
        almost_full  => open,\n\
        empty        => adc_fifo_empty(" + str(i) + "),\n\
        almost_empty => open\n\
    );\n"
# switch case for different types of fifos
print(type)

if type == "altera":
    altera_fifo()
elif type == "lattice":
    lattice_fifo()
else:
    print("Invalid type")
# print output to a file
with open("Fifo_map_output.txt", "w") as f:
    f.write(output)
