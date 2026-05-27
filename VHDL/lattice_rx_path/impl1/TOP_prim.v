// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.14.0.75.2
// Netlist written on Thu May 21 19:08:04 2026
//
// Verilog Description of module top
//

module top (clk, rst, Data, Write_En, enable, packer_busy, packer_frame_done, 
            rgmii_txd, rgmii_txctl, rgmii_txc);   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(6[8:11])
    input clk;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    input rst;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(15[9:12])
    input [23:0]Data;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    input Write_En;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(17[9:17])
    input enable;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(18[9:15])
    output packer_busy;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(21[9:20])
    output packer_frame_done;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(22[9:26])
    output [3:0]rgmii_txd;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(23[3:12])
    output rgmii_txctl;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(24[9:20])
    output rgmii_txc /* synthesis black_box_pad_pin=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(25[9:18])
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    
    wire GND_net, VCC_net, rst_c, Data_c_23, Data_c_22, Data_c_21, 
        Data_c_20, Data_c_19, Data_c_18, Data_c_17, Data_c_16, Data_c_15, 
        Data_c_14, Data_c_13, Data_c_12, Data_c_11, Data_c_10, Data_c_9, 
        Data_c_8, Data_c_7, Data_c_6, Data_c_5, Data_c_4, Data_c_3, 
        Data_c_2, Data_c_1, Data_c_0, Write_En_c, enable_c, packer_frame_done_c;
    wire [23:0]fifo_dout_to_packer;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(32[12:31])
    wire [3:0]fifo_sel;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(33[12:20])
    wire [15:0]adc_fifo_empty;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(34[12:26])
    wire [15:0]adc_fifo_rd_en;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(35[12:26])
    wire [23:0]adc_fifo_0_dout;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(36[12:27])
    wire [23:0]adc_fifo_1_dout;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(37[12:27])
    wire [23:0]adc_fifo_2_dout;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(38[12:27])
    wire [23:0]adc_fifo_3_dout;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(39[12:27])
    wire [23:0]adc_fifo_4_dout;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(40[12:27])
    wire [23:0]adc_fifo_5_dout;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(41[12:27])
    wire [23:0]adc_fifo_6_dout;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(42[12:27])
    wire [23:0]adc_fifo_7_dout;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(43[12:27])
    wire [23:0]adc_fifo_8_dout;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(44[12:27])
    wire [23:0]adc_fifo_9_dout;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(45[12:27])
    wire [23:0]adc_fifo_10_dout;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(46[12:28])
    wire [23:0]adc_fifo_11_dout;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(47[12:28])
    wire [23:0]adc_fifo_12_dout;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(48[12:28])
    wire [23:0]adc_fifo_13_dout;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(49[12:28])
    wire [23:0]adc_fifo_14_dout;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(50[12:28])
    wire [23:0]adc_fifo_15_dout;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(51[12:28])
    
    wire large_fifo_almost_full;
    wire [7:0]large_fifo_din;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(55[12:26])
    wire [23:0]Data_x2;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(58[12:19])
    wire [23:0]Data_x4;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(60[12:19])
    
    wire n4725, n5017, n4712, n4817, n5044, n5045, n4773, n4779, 
        n4786, n4780, n4785, n4781, n4784, n5043;
    wire [23:0]Data_x6;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(62[12:19])
    wire [23:0]Data_x8;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(64[12:19])
    
    wire n4774, n4693, n4772, n4449, n4448, n4446, n4445, n4444, 
        n4443, n4771, n4442, n4378, n4770, n4622, n4626, n4416, 
        n5046;
    wire [23:0]Data_x10;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(66[12:20])
    
    wire n4377, n4376, n4375, n4374, n4373, n4372, n4447, n4371, 
        n4640, n4739, n4743, n4412;
    wire [23:0]Data_x12;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(68[12:20])
    
    wire n4404, n4331, n5016, n4692, n4673, n4679, n4681, n4690, 
        n4769, n4441, n4438, n4434, n4691, n5047;
    wire [23:0]Data_x14;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(70[12:20])
    wire [7:0]udp_tdata;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(75[12:21])
    wire [7:0]gmii_txd;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(83[12:20])
    
    wire n5048, fifo_almostempty_N_1, fifo_almostempty, fifo_empty;
    wire [7:0]data_out_large_fifo;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(90[9:28])
    
    wire read_large_fifo;
    wire [7:0]reg_fifo_data;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(93[9:22])
    
    wire reg_fifo_empty, reg_fifo_almostfull, fifo_rd_en_in, n4370, 
        n4659, n4946, n4887, n4654, n4653, n4652, n5052, n4651, 
        n5053, n4658, n4666, n4459, n4458, n4457, n4456, n4455, 
        n4454, n4330, n4329, n4328, n4327, n4839, n4846, n4840, 
        n4845, n4841, n4844, n4842, n4843, n4595, n4596, n4597, 
        n4424, n4650, n4988, n5054, n5055, n5056, n5057, n5058, 
        n5059, n5060, n5061, n5062, n4943, n4369, n5063, n4663, 
        n4664, n4660, n4368, n5064, n4367, n5065, n4546, n4944, 
        n4818, n4545, n4816, n4544, n4543, n4542, n4897, n4541, 
        n4896, n4945, n4661, n4540, n4891, n4889, n4539, n4538, 
        n4768, n4405, n4366, n4598, n4747, n4746, n4599, n4537, 
        n4536, n4936, n9006, n4326, n4403, n4872, n4464, n4439, 
        n4612, n4611, n4610, n4767, n4766, n4765, n4764, n4763, 
        n4762, n4761, n4760, n4759, n4758, n4757, n4756, n4755, 
        n4535, n4534, n4533, n4532, n4838, n4837, n4836, n4835, 
        n4834, n4833, n4832, n4745, n4744, n4831, n4531, n4530, 
        n4935, n4529, n4528, n4527, n4526, n4325, n4324, n4323, 
        n4830, n4437, n4829, n4828, n4827, n4682, n4683, n4826, 
        n4436, n4825, n4427, n4435, n4428, n4820, n4694, n4365, 
        n4364, n4363, n4680, n4322, n4525, n4402, n4814, n4524, 
        n4586, n4587, n4782, n4783, n4619, n4620, n4621, n4623, 
        n4624, n4687, n4824, n4625, n4627, n4823, n4628, n4629, 
        n4819, n4630, n4631, n4632, n4633, n4523, n4321, n4634, 
        n4635, n4636, n4637, n4638, n4639, n4641, n4686, n4642, 
        n4727, n4320, n4728, n4729, n4730, n4731, n4319, n4732, 
        n4733, n4362, n4423, n4822, n4422, n4421, n4420, n4419, 
        n4418, n4417, n11947, n4685, n4415, n4414, n4738, n4737, 
        n4736, n4735, n4734, n4871, n4361, n4815, n4884, n4360, 
        n4359, n4358, n4357, n4898, n4938, n4356, n4895, n4894, 
        n4775, n4893, n4355, n4892, n4890, n4354, n15, n4406, 
        n4425, n4407, n4408, n4409, n4410, n4776, n4657, n4965, 
        n4885, n4886, n4883, n4966, n4777, clk_c_enable_15, n4353, 
        n2315, n4318, n4719, n4317, n4723, n2298, n2297, n2296, 
        n4967, n4778, n4352, n4726, n4720, n4878, n4721, n4724, 
        n4877, n4716, n2268, n5018, n4968, n4969, n4876, n4717, 
        n4689, n4718, n4722, n4351, n5459, n5461, n5019, n4715, 
        n4350, n4970, n4426, n5025, n2187, n2186, n2185, n2184, 
        n5020, n4714, n5021, n4713, n4971, n4972, n4349, n5022, 
        n4958, n5023, n4956, n4754, n2131, n4973, n4348, n4710, 
        n5024, n4711, n5026, n4708, n5027, n4707, n5028, n4706, 
        n5029, n4705, n5030, n4704, n5031, n4703, n5032, n4702, 
        n5033, n4701, n5034, n4700, n5035, n4699, n5036, n4347, 
        n4698, n5037, n4697, n5038, n4974, n4882, n4880, n4649, 
        n4648, n4879, n4346, n4696, n4647, n4656, n4952, n4953, 
        n4954, n4955, n4655, n4646, n4939, n4645, n4975, n4957, 
        n4345, n4644, n4643, n4976, n4977, n5089, n4881, n5088, 
        n4662, n8991, n8994, n4937, n4978, n4688, n4695, n4709, 
        n5039, n4344, n4463, n4609, n1847, n1846, n4429, n1844, 
        n4608, n4669, n4979, n4980, n4670, n4671, n4672, n4949, 
        n4674, n4675, n4676, n11379, n4677, n4678, n4440, n4981, 
        n4982, n4983, n4343, n4588, n4984, n4749, n4748, n1, 
        n4947, n5087, n5086, n5085, n5084, n5083, n5082, n4742, 
        n4741, n4607, n4462, n4606, n8998, n4740, n4684, n4389, 
        n4390, n4391, n4392, n4393, n4394, n4395, n4396, n4873, 
        n4605, n4342, n9005, n4341, n4461, n4397, n4398, n4399, 
        n4400, n4401, n4613, n4411, n4413, fifo_rd_en_N_404, clk_c_enable_38, 
        n4604, n4340, clk_c_enable_64, n4460, n4339, n4614, n4615, 
        n4616, n5081, n4433, n4432, n4874;
    wire [1:0]crc_cnt;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(48[12:19])
    
    wire n5080, n11921, n5079, n4940;
    wire [31:0]frame_len;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(51[12:21])
    
    wire n11378;
    wire [31:0]crc_reg;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(55[12:19])
    wire [31:0]crc_next;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(57[12:20])
    
    wire n4338, n4888, n4948, n4985, n5078, n4942, n11377, n5077, 
        n4665, n11372, n4337, n4667, n5091, n4474, n4668, n5042, 
        n5041, n5040, n4336, n5090, n5076, n11945, n4316, n4315, 
        n4950, n5075, n5074, n5073, n4875, n5072, n4617, n4618, 
        n4787, n4788, n4789, n4790, n4791, n4792, n4793, n4794, 
        n4795, n4796, n4797, n4986, n4379, n4798, n4799, n4800, 
        n4801, n399, n4802, n4803, n4804, n4805, n4806, n4807, 
        n4808, n4809, n4431, n4430, n9004, n4810, n4335;
    wire [31:0]next_crc_reg_31__N_594;
    
    wire n8997, n4473, n4811, n4472, n4334, n4380, n11394, n8993, 
        n4471, n4470, n4381, n5071, n5070, n4382, n4951, n4469, 
        n4941, n4468, n4383, n4467, n5069, n4812, n4333, n5068, 
        n4813, n4466, n11919, n4384, n4465, n4987, n4385, n4386, 
        n4387, n4388, n5067, n5066, n4821, n4332, ctl_reg, n4589, 
        n4590, n11393, n11392, n8992, n11391, n8996, clk_c_enable_73, 
        n4591, n4592, n4593, n4594, n4847, n4848, n4849, n4850, 
        n4851, n4852, n4853, n4854, n4855, n4856, n4857, n4858, 
        n4859, n4860, n4861, n4862, n4863, n4864, n4865, n4866, 
        n4867, n4868, n4869, n4870, n4314, buf_clkout, buf_douto4, 
        buf_douto3, buf_douto2, buf_douto1, buf_douto0, n4585, n4584, 
        n4583, n4582, n4581, n4580, n4579, n4578, n4577, n4576, 
        n4575, n4574, n4573, n4572, n4571, n4903, n4904, n4905, 
        n4906, n4899, n4313, n4312, n4311, n4310, n4475, n4476, 
        n4477, n4478, n4479, n4480, n4481, n4482, n4483, n4484, 
        n4485, n4486, n4487, n4488, n4489, n4490, n4491, n4492, 
        n4493, n4494, n4495, n4496, n4497, n4498, n4934, n4309, 
        n4933, n4308, n4932, n4307, n4931, n4306, n4930, n4929, 
        n4928, n4927, n4926, n4925, n4924, n4923, n4922, n4921, 
        n4920, n4919, n4918, n4917, n4916, n4915, n4914, n4913, 
        n4912, n4911, n4910, n4909, n4908, n4907, n4570, n4569, 
        n4568, n4567, n4566, n4565, n4564, n4563, n4562, n4561, 
        n4560, n4559, n4558, n4557, n4556, n4555, n4554, n4553, 
        n4552, n4551, n4550, n4549, n4548, n4547, n4962, n4961, 
        n4963, n4960, n4964, n4959, n4305, n4304, n4499, n4500, 
        n4501, n4502, n4503, n4504, n4505, n4506, n4507, n4508, 
        n4509, n4510, n4511, n4512, n4513, n4514, n4515, n4516, 
        n4517, n4518, n4519, n4520, n4521, n4522, n5015, n5014, 
        n5013, n5012, n5011, n5010, n5009, n5008, n5007, n5006, 
        n5005, n5004, n5003, n5002, n5001, n5000, n4999, n4998, 
        n4997, n4996, n4995, n4994, n4993, n4992, n4991, n4990, 
        n4989, n5092, n5093, n5094, n5095, n5096, n5097, n5098, 
        n5099, n5100, n5101, n5102, n5103, n5104, n5105, n5106, 
        n5107, n5108, n5109, n5110, n5111, n5112, n5113, n5114, 
        n5115, n5116, n5117, n5118, n5119, n5120, n5121, n5122, 
        n5123, n5124, n5125, n5126, n5127, n5128, n5129, n5130, 
        n5131, n5132, n5133, n5134, n5135, n5136, n5137, n5138, 
        n5139, n5140, n5141, n5142, n5143, n5144, n5145, n5146, 
        n5147, n5148, n5149, n5150, n5151, n5152, n5153, n5154, 
        n5155, n5156, n5157, n5158, n5159, n5160, n5161, n5162, 
        n5163, n5164, n5165, n5166, n5167, n5168, n5169, n5170, 
        n5171, n5172, n5173, n5174, n5175, n5176, n5177, n5178, 
        n5179, n5180, n5181, n5182, n5183, n5184, n5185, n5186, 
        n5187, n5188, n5189, n5190, n5191, n5192, n5193, n5194, 
        n5195, n5196, n5197, n5200, n5201, n5202, n5203, n5204, 
        n5205, n5206, n5207, n5208, n5209, n5210, n5211, n5212, 
        n5213, n5214, n5215, n5216, n5217, n5218, n5219, n5220, 
        n5221, n5222, n5223, n5224, n5225, n5226, n5227, n5228, 
        n5229, n5230, n5231, n5232, n5233, n5234, n5235, n5236, 
        n5237, n5238, n5239, n5240, n5241, n5242, n5243, n5244, 
        n5245, n5246, n5247, n5248, n5249, n5250, n5251, n5252, 
        n5253, n5254, n5255, n5256, n5257, n5258, n5259, n5260, 
        n5261, n5262, n5263, n5264, n5265, n5266, n5267, n5268, 
        n5269, n5270, n5271, n5272, n5273, n5274, n5275, n5276, 
        n5277, n5278, n5279, n5280, n5281, n5282, n5283, n5284, 
        n5285, n5286, n5287, n5288, n5289, n5290, n5291, n5292, 
        n5293, n5294, n5295, n5296, n5297, n5298, n5299, n5300, 
        n5301, n5302, n5303, n5304, n5305, n5306, n5307, n5308, 
        n5309, n5310, n5311, n5312, n5313, n5314, n5315, n5316, 
        n5317, n5318, n5319, n5320, n5321, n5322, n5323, n5324, 
        n5325, n5326, n5327, n5328, n5329, n5330, n5331, n5332, 
        n5333, n5334, n5335, n5336, n5337, n5338, n5339, n5340, 
        n5341, n5342, n5343, n5344, n5345, n9003, n5703, n9002, 
        n11390, n9742, n11376, n11389, n11942, n11388, n11387, 
        n9001, n8995, n11386, n11385, n9000, n11931, n11929, n11384, 
        n11383, n11839, n8999, n11382, n11381, n11375, n31, n11918, 
        n11380, n11917, n10056, n11984, n11978, n11977, n11916, 
        n11374, n11373, n11968, n11915, n11913, n11954, n11912, 
        n11911, n11923, n11907;
    
    VHI i2 (.Z(VCC_net));
    ALU54B lat_alu_13 (.CE3(GND_net), .CE2(GND_net), .CE1(GND_net), .CE0(VCC_net), 
           .CLK3(GND_net), .CLK2(GND_net), .CLK1(GND_net), .CLK0(GND_net), 
           .RST3(GND_net), .RST2(GND_net), .RST1(GND_net), .RST0(GND_net), 
           .SIGNEDIA(n5236), .SIGNEDIB(n5309), .SIGNEDCIN(GND_net), .A35(n5235), 
           .A34(n5234), .A33(n5233), .A32(n5232), .A31(n5231), .A30(n5230), 
           .A29(n5229), .A28(n5228), .A27(n5227), .A26(n5226), .A25(n5225), 
           .A24(n5224), .A23(n5223), .A22(n5222), .A21(n5221), .A20(n5220), 
           .A19(n5219), .A18(n5218), .A17(n5217), .A16(n5216), .A15(n5215), 
           .A14(n5214), .A13(n5213), .A12(n5212), .A11(n5211), .A10(n5210), 
           .A9(n5209), .A8(n5208), .A7(n5207), .A6(n5206), .A5(n5205), 
           .A4(n5204), .A3(n5203), .A2(n5202), .A1(n5201), .A0(n5200), 
           .B35(n5308), .B34(n5307), .B33(n5306), .B32(n5305), .B31(n5304), 
           .B30(n5303), .B29(n5302), .B28(n5301), .B27(n5300), .B26(n5299), 
           .B25(n5298), .B24(n5297), .B23(n5296), .B22(n5295), .B21(n5294), 
           .B20(n5293), .B19(n5292), .B18(n5291), .B17(n5290), .B16(n5289), 
           .B15(n5288), .B14(n5287), .B13(n5286), .B12(n5285), .B11(n5284), 
           .B10(n5283), .B9(n5282), .B8(n5281), .B7(n5280), .B6(n5279), 
           .B5(n5278), .B4(n5277), .B3(n5276), .B2(n5275), .B1(n5274), 
           .B0(n5273), .C53(GND_net), .C52(GND_net), .C51(GND_net), 
           .C50(GND_net), .C49(GND_net), .C48(GND_net), .C47(GND_net), 
           .C46(GND_net), .C45(GND_net), .C44(GND_net), .C43(GND_net), 
           .C42(GND_net), .C41(GND_net), .C40(GND_net), .C39(GND_net), 
           .C38(GND_net), .C37(GND_net), .C36(GND_net), .C35(GND_net), 
           .C34(GND_net), .C33(GND_net), .C32(GND_net), .C31(GND_net), 
           .C30(GND_net), .C29(GND_net), .C28(GND_net), .C27(GND_net), 
           .C26(GND_net), .C25(GND_net), .C24(GND_net), .C23(GND_net), 
           .C22(GND_net), .C21(GND_net), .C20(GND_net), .C19(GND_net), 
           .C18(GND_net), .C17(GND_net), .C16(GND_net), .C15(GND_net), 
           .C14(GND_net), .C13(GND_net), .C12(GND_net), .C11(GND_net), 
           .C10(GND_net), .C9(GND_net), .C8(GND_net), .C7(GND_net), 
           .C6(GND_net), .C5(GND_net), .C4(GND_net), .C3(GND_net), .C2(GND_net), 
           .C1(GND_net), .C0(GND_net), .CFB53(GND_net), .CFB52(GND_net), 
           .CFB51(GND_net), .CFB50(GND_net), .CFB49(GND_net), .CFB48(GND_net), 
           .CFB47(GND_net), .CFB46(GND_net), .CFB45(GND_net), .CFB44(GND_net), 
           .CFB43(GND_net), .CFB42(GND_net), .CFB41(GND_net), .CFB40(GND_net), 
           .CFB39(GND_net), .CFB38(GND_net), .CFB37(GND_net), .CFB36(GND_net), 
           .CFB35(GND_net), .CFB34(GND_net), .CFB33(GND_net), .CFB32(GND_net), 
           .CFB31(GND_net), .CFB30(GND_net), .CFB29(GND_net), .CFB28(GND_net), 
           .CFB27(GND_net), .CFB26(GND_net), .CFB25(GND_net), .CFB24(GND_net), 
           .CFB23(GND_net), .CFB22(GND_net), .CFB21(GND_net), .CFB20(GND_net), 
           .CFB19(GND_net), .CFB18(GND_net), .CFB17(GND_net), .CFB16(GND_net), 
           .CFB15(GND_net), .CFB14(GND_net), .CFB13(GND_net), .CFB12(GND_net), 
           .CFB11(GND_net), .CFB10(GND_net), .CFB9(GND_net), .CFB8(GND_net), 
           .CFB7(GND_net), .CFB6(GND_net), .CFB5(GND_net), .CFB4(GND_net), 
           .CFB3(GND_net), .CFB2(GND_net), .CFB1(GND_net), .CFB0(GND_net), 
           .MA35(n5272), .MA34(n5271), .MA33(n5270), .MA32(n5269), .MA31(n5268), 
           .MA30(n5267), .MA29(n5266), .MA28(n5265), .MA27(n5264), .MA26(n5263), 
           .MA25(n5262), .MA24(n5261), .MA23(n5260), .MA22(n5259), .MA21(n5258), 
           .MA20(n5257), .MA19(n5256), .MA18(n5255), .MA17(n5254), .MA16(n5253), 
           .MA15(n5252), .MA14(n5251), .MA13(n5250), .MA12(n5249), .MA11(n5248), 
           .MA10(n5247), .MA9(n5246), .MA8(n5245), .MA7(n5244), .MA6(n5243), 
           .MA5(n5242), .MA4(n5241), .MA3(n5240), .MA2(n5239), .MA1(n5238), 
           .MA0(n5237), .MB35(n5345), .MB34(n5344), .MB33(n5343), .MB32(n5342), 
           .MB31(n5341), .MB30(n5340), .MB29(n5339), .MB28(n5338), .MB27(n5337), 
           .MB26(n5336), .MB25(n5335), .MB24(n5334), .MB23(n5333), .MB22(n5332), 
           .MB21(n5331), .MB20(n5330), .MB19(n5329), .MB18(n5328), .MB17(n5327), 
           .MB16(n5326), .MB15(n5325), .MB14(n5324), .MB13(n5323), .MB12(n5322), 
           .MB11(n5321), .MB10(n5320), .MB9(n5319), .MB8(n5318), .MB7(n5317), 
           .MB6(n5316), .MB5(n5315), .MB4(n5314), .MB3(n5313), .MB2(n5312), 
           .MB1(n5311), .MB0(n5310), .CIN53(GND_net), .CIN52(GND_net), 
           .CIN51(GND_net), .CIN50(GND_net), .CIN49(GND_net), .CIN48(GND_net), 
           .CIN47(GND_net), .CIN46(GND_net), .CIN45(GND_net), .CIN44(GND_net), 
           .CIN43(GND_net), .CIN42(GND_net), .CIN41(GND_net), .CIN40(GND_net), 
           .CIN39(GND_net), .CIN38(GND_net), .CIN37(GND_net), .CIN36(GND_net), 
           .CIN35(GND_net), .CIN34(GND_net), .CIN33(GND_net), .CIN32(GND_net), 
           .CIN31(GND_net), .CIN30(GND_net), .CIN29(GND_net), .CIN28(GND_net), 
           .CIN27(GND_net), .CIN26(GND_net), .CIN25(GND_net), .CIN24(GND_net), 
           .CIN23(GND_net), .CIN22(GND_net), .CIN21(GND_net), .CIN20(GND_net), 
           .CIN19(GND_net), .CIN18(GND_net), .CIN17(GND_net), .CIN16(GND_net), 
           .CIN15(GND_net), .CIN14(GND_net), .CIN13(GND_net), .CIN12(GND_net), 
           .CIN11(GND_net), .CIN10(GND_net), .CIN9(GND_net), .CIN8(GND_net), 
           .CIN7(GND_net), .CIN6(GND_net), .CIN5(GND_net), .CIN4(GND_net), 
           .CIN3(GND_net), .CIN2(GND_net), .CIN1(GND_net), .CIN0(GND_net), 
           .OP10(GND_net), .OP9(VCC_net), .OP8(GND_net), .OP7(GND_net), 
           .OP6(GND_net), .OP5(GND_net), .OP4(GND_net), .OP3(GND_net), 
           .OP2(GND_net), .OP1(GND_net), .OP0(VCC_net), .R23(Data_x2[23]), 
           .R22(Data_x2[22]), .R21(Data_x2[21]), .R20(Data_x2[20]), .R19(Data_x2[19]), 
           .R18(Data_x2[18]), .R17(Data_x2[17]), .R16(Data_x2[16]), .R15(Data_x2[15]), 
           .R14(Data_x2[14]), .R13(Data_x2[13]), .R12(Data_x2[12]), .R11(Data_x2[11]), 
           .R10(Data_x2[10]), .R9(Data_x2[9]), .R8(Data_x2[8]), .R7(Data_x2[7]), 
           .R6(Data_x2[6]), .R5(Data_x2[5]), .R4(Data_x2[4]), .R3(Data_x2[3]), 
           .R2(Data_x2[2]), .R1(Data_x2[1]), .R0(Data_x2[0]));   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2398[16:40])
    defparam lat_alu_13.REG_INPUTC0_CLK = "NONE";
    defparam lat_alu_13.REG_INPUTC0_CE = "CE0";
    defparam lat_alu_13.REG_INPUTC0_RST = "RST0";
    defparam lat_alu_13.REG_INPUTC1_CLK = "NONE";
    defparam lat_alu_13.REG_INPUTC1_CE = "CE0";
    defparam lat_alu_13.REG_INPUTC1_RST = "RST0";
    defparam lat_alu_13.REG_OPCODEOP0_0_CLK = "NONE";
    defparam lat_alu_13.REG_OPCODEOP0_0_CE = "CE0";
    defparam lat_alu_13.REG_OPCODEOP0_0_RST = "RST0";
    defparam lat_alu_13.REG_OPCODEOP1_0_CLK = "NONE";
    defparam lat_alu_13.REG_OPCODEOP0_1_CLK = "NONE";
    defparam lat_alu_13.REG_OPCODEOP0_1_CE = "CE0";
    defparam lat_alu_13.REG_OPCODEOP0_1_RST = "RST0";
    defparam lat_alu_13.REG_OPCODEOP1_1_CLK = "NONE";
    defparam lat_alu_13.REG_OPCODEIN_0_CLK = "NONE";
    defparam lat_alu_13.REG_OPCODEIN_0_CE = "CE0";
    defparam lat_alu_13.REG_OPCODEIN_0_RST = "RST0";
    defparam lat_alu_13.REG_OPCODEIN_1_CLK = "NONE";
    defparam lat_alu_13.REG_OPCODEIN_1_CE = "CE0";
    defparam lat_alu_13.REG_OPCODEIN_1_RST = "RST0";
    defparam lat_alu_13.REG_OUTPUT0_CLK = "NONE";
    defparam lat_alu_13.REG_OUTPUT0_CE = "CE0";
    defparam lat_alu_13.REG_OUTPUT0_RST = "RST0";
    defparam lat_alu_13.REG_OUTPUT1_CLK = "NONE";
    defparam lat_alu_13.REG_OUTPUT1_CE = "CE0";
    defparam lat_alu_13.REG_OUTPUT1_RST = "RST0";
    defparam lat_alu_13.REG_FLAG_CLK = "NONE";
    defparam lat_alu_13.REG_FLAG_CE = "CE0";
    defparam lat_alu_13.REG_FLAG_RST = "RST0";
    defparam lat_alu_13.MCPAT_SOURCE = "STATIC";
    defparam lat_alu_13.MASKPAT_SOURCE = "STATIC";
    defparam lat_alu_13.MASK01 = "0x00000000000000";
    defparam lat_alu_13.REG_INPUTCFB_CLK = "NONE";
    defparam lat_alu_13.REG_INPUTCFB_CE = "CE0";
    defparam lat_alu_13.REG_INPUTCFB_RST = "RST0";
    defparam lat_alu_13.CLK0_DIV = "ENABLED";
    defparam lat_alu_13.CLK1_DIV = "ENABLED";
    defparam lat_alu_13.CLK2_DIV = "ENABLED";
    defparam lat_alu_13.CLK3_DIV = "ENABLED";
    defparam lat_alu_13.MCPAT = "0x00000000000000";
    defparam lat_alu_13.MASKPAT = "0x00000000000000";
    defparam lat_alu_13.RNDPAT = "0x00000000000000";
    defparam lat_alu_13.GSR = "DISABLED";
    defparam lat_alu_13.RESETMODE = "SYNC";
    defparam lat_alu_13.MULT9_MODE = "DISABLED";
    defparam lat_alu_13.LEGACY = "DISABLED";
    MULT18X18D lat_mult_12 (.A17(GND_net), .A16(GND_net), .A15(GND_net), 
            .A14(GND_net), .A13(GND_net), .A12(GND_net), .A11(GND_net), 
            .A10(GND_net), .A9(GND_net), .A8(GND_net), .A7(GND_net), 
            .A6(GND_net), .A5(Data_c_23), .A4(Data_c_22), .A3(Data_c_21), 
            .A2(Data_c_20), .A1(Data_c_19), .A0(Data_c_18), .B17(GND_net), 
            .B16(GND_net), .B15(GND_net), .B14(GND_net), .B13(GND_net), 
            .B12(GND_net), .B11(GND_net), .B10(GND_net), .B9(GND_net), 
            .B8(GND_net), .B7(GND_net), .B6(GND_net), .B5(GND_net), 
            .B4(GND_net), .B3(GND_net), .B2(GND_net), .B1(VCC_net), 
            .B0(VCC_net), .C17(GND_net), .C16(GND_net), .C15(GND_net), 
            .C14(GND_net), .C13(GND_net), .C12(GND_net), .C11(GND_net), 
            .C10(GND_net), .C9(GND_net), .C8(GND_net), .C7(GND_net), 
            .C6(GND_net), .C5(GND_net), .C4(GND_net), .C3(GND_net), 
            .C2(GND_net), .C1(GND_net), .C0(GND_net), .SIGNEDA(GND_net), 
            .SIGNEDB(GND_net), .SOURCEA(GND_net), .SOURCEB(GND_net), .CLK3(GND_net), 
            .CLK2(GND_net), .CLK1(GND_net), .CLK0(GND_net), .CE3(GND_net), 
            .CE2(GND_net), .CE1(GND_net), .CE0(VCC_net), .RST3(GND_net), 
            .RST2(GND_net), .RST1(GND_net), .RST0(GND_net), .SRIA17(GND_net), 
            .SRIA16(GND_net), .SRIA15(GND_net), .SRIA14(GND_net), .SRIA13(GND_net), 
            .SRIA12(GND_net), .SRIA11(GND_net), .SRIA10(GND_net), .SRIA9(GND_net), 
            .SRIA8(GND_net), .SRIA7(GND_net), .SRIA6(GND_net), .SRIA5(GND_net), 
            .SRIA4(GND_net), .SRIA3(GND_net), .SRIA2(GND_net), .SRIA1(GND_net), 
            .SRIA0(GND_net), .SRIB17(GND_net), .SRIB16(GND_net), .SRIB15(GND_net), 
            .SRIB14(GND_net), .SRIB13(GND_net), .SRIB12(GND_net), .SRIB11(GND_net), 
            .SRIB10(GND_net), .SRIB9(GND_net), .SRIB8(GND_net), .SRIB7(GND_net), 
            .SRIB6(GND_net), .SRIB5(GND_net), .SRIB4(GND_net), .SRIB3(GND_net), 
            .SRIB2(GND_net), .SRIB1(GND_net), .SRIB0(GND_net), .ROA17(n5290), 
            .ROA16(n5289), .ROA15(n5288), .ROA14(n5287), .ROA13(n5286), 
            .ROA12(n5285), .ROA11(n5284), .ROA10(n5283), .ROA9(n5282), 
            .ROA8(n5281), .ROA7(n5280), .ROA6(n5279), .ROA5(n5278), 
            .ROA4(n5277), .ROA3(n5276), .ROA2(n5275), .ROA1(n5274), 
            .ROA0(n5273), .ROB17(n5308), .ROB16(n5307), .ROB15(n5306), 
            .ROB14(n5305), .ROB13(n5304), .ROB12(n5303), .ROB11(n5302), 
            .ROB10(n5301), .ROB9(n5300), .ROB8(n5299), .ROB7(n5298), 
            .ROB6(n5297), .ROB5(n5296), .ROB4(n5295), .ROB3(n5294), 
            .ROB2(n5293), .ROB1(n5292), .ROB0(n5291), .P35(n5345), .P34(n5344), 
            .P33(n5343), .P32(n5342), .P31(n5341), .P30(n5340), .P29(n5339), 
            .P28(n5338), .P27(n5337), .P26(n5336), .P25(n5335), .P24(n5334), 
            .P23(n5333), .P22(n5332), .P21(n5331), .P20(n5330), .P19(n5329), 
            .P18(n5328), .P17(n5327), .P16(n5326), .P15(n5325), .P14(n5324), 
            .P13(n5323), .P12(n5322), .P11(n5321), .P10(n5320), .P9(n5319), 
            .P8(n5318), .P7(n5317), .P6(n5316), .P5(n5315), .P4(n5314), 
            .P3(n5313), .P2(n5312), .P1(n5311), .P0(n5310), .SIGNEDP(n5309));   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2398[16:40])
    defparam lat_mult_12.REG_INPUTA_CLK = "NONE";
    defparam lat_mult_12.REG_INPUTA_CE = "CE0";
    defparam lat_mult_12.REG_INPUTA_RST = "RST0";
    defparam lat_mult_12.REG_INPUTB_CLK = "NONE";
    defparam lat_mult_12.REG_INPUTB_CE = "CE0";
    defparam lat_mult_12.REG_INPUTB_RST = "RST0";
    defparam lat_mult_12.REG_INPUTC_CLK = "NONE";
    defparam lat_mult_12.REG_INPUTC_CE = "CE0";
    defparam lat_mult_12.REG_INPUTC_RST = "RST0";
    defparam lat_mult_12.REG_PIPELINE_CLK = "NONE";
    defparam lat_mult_12.REG_PIPELINE_CE = "CE0";
    defparam lat_mult_12.REG_PIPELINE_RST = "RST0";
    defparam lat_mult_12.REG_OUTPUT_CLK = "NONE";
    defparam lat_mult_12.REG_OUTPUT_CE = "CE0";
    defparam lat_mult_12.REG_OUTPUT_RST = "RST0";
    defparam lat_mult_12.CLK0_DIV = "ENABLED";
    defparam lat_mult_12.CLK1_DIV = "ENABLED";
    defparam lat_mult_12.CLK2_DIV = "ENABLED";
    defparam lat_mult_12.CLK3_DIV = "ENABLED";
    defparam lat_mult_12.HIGHSPEED_CLK = "NONE";
    defparam lat_mult_12.GSR = "DISABLED";
    defparam lat_mult_12.CAS_MATCH_REG = "FALSE";
    defparam lat_mult_12.SOURCEB_MODE = "B_SHIFT";
    defparam lat_mult_12.MULT_BYPASS = "DISABLED";
    defparam lat_mult_12.RESETMODE = "SYNC";
    MULT18X18D Data_23__I_0_22_mult_2 (.A17(Data_c_17), .A16(Data_c_16), 
            .A15(Data_c_15), .A14(Data_c_14), .A13(Data_c_13), .A12(Data_c_12), 
            .A11(Data_c_11), .A10(Data_c_10), .A9(Data_c_9), .A8(Data_c_8), 
            .A7(Data_c_7), .A6(Data_c_6), .A5(Data_c_5), .A4(Data_c_4), 
            .A3(Data_c_3), .A2(Data_c_2), .A1(Data_c_1), .A0(Data_c_0), 
            .B17(GND_net), .B16(GND_net), .B15(GND_net), .B14(GND_net), 
            .B13(GND_net), .B12(GND_net), .B11(GND_net), .B10(GND_net), 
            .B9(GND_net), .B8(GND_net), .B7(GND_net), .B6(GND_net), 
            .B5(GND_net), .B4(GND_net), .B3(VCC_net), .B2(GND_net), 
            .B1(VCC_net), .B0(VCC_net), .C17(GND_net), .C16(GND_net), 
            .C15(GND_net), .C14(GND_net), .C13(GND_net), .C12(GND_net), 
            .C11(GND_net), .C10(GND_net), .C9(GND_net), .C8(GND_net), 
            .C7(GND_net), .C6(GND_net), .C5(GND_net), .C4(GND_net), 
            .C3(GND_net), .C2(GND_net), .C1(GND_net), .C0(GND_net), 
            .SIGNEDA(GND_net), .SIGNEDB(GND_net), .SOURCEA(GND_net), .SOURCEB(GND_net), 
            .CLK3(GND_net), .CLK2(GND_net), .CLK1(GND_net), .CLK0(GND_net), 
            .CE3(GND_net), .CE2(GND_net), .CE1(GND_net), .CE0(VCC_net), 
            .RST3(GND_net), .RST2(GND_net), .RST1(GND_net), .RST0(GND_net), 
            .SRIA17(GND_net), .SRIA16(GND_net), .SRIA15(GND_net), .SRIA14(GND_net), 
            .SRIA13(GND_net), .SRIA12(GND_net), .SRIA11(GND_net), .SRIA10(GND_net), 
            .SRIA9(GND_net), .SRIA8(GND_net), .SRIA7(GND_net), .SRIA6(GND_net), 
            .SRIA5(GND_net), .SRIA4(GND_net), .SRIA3(GND_net), .SRIA2(GND_net), 
            .SRIA1(GND_net), .SRIA0(GND_net), .SRIB17(GND_net), .SRIB16(GND_net), 
            .SRIB15(GND_net), .SRIB14(GND_net), .SRIB13(GND_net), .SRIB12(GND_net), 
            .SRIB11(GND_net), .SRIB10(GND_net), .SRIB9(GND_net), .SRIB8(GND_net), 
            .SRIB7(GND_net), .SRIB6(GND_net), .SRIB5(GND_net), .SRIB4(GND_net), 
            .SRIB3(GND_net), .SRIB2(GND_net), .SRIB1(GND_net), .SRIB0(GND_net), 
            .ROA17(n4621), .ROA16(n4620), .ROA15(n4619), .ROA14(n4618), 
            .ROA13(n4617), .ROA12(n4616), .ROA11(n4615), .ROA10(n4614), 
            .ROA9(n4613), .ROA8(n4612), .ROA7(n4611), .ROA6(n4610), 
            .ROA5(n4609), .ROA4(n4608), .ROA3(n4607), .ROA2(n4606), 
            .ROA1(n4605), .ROA0(n4604), .ROB17(n4639), .ROB16(n4638), 
            .ROB15(n4637), .ROB14(n4636), .ROB13(n4635), .ROB12(n4634), 
            .ROB11(n4633), .ROB10(n4632), .ROB9(n4631), .ROB8(n4630), 
            .ROB7(n4629), .ROB6(n4628), .ROB5(n4627), .ROB4(n4626), 
            .ROB3(n4625), .ROB2(n4624), .ROB1(n4623), .ROB0(n4622), 
            .P35(n4676), .P34(n4675), .P33(n4674), .P32(n4673), .P31(n4672), 
            .P30(n4671), .P29(n4670), .P28(n4669), .P27(n4668), .P26(n4667), 
            .P25(n4666), .P24(n4665), .P23(n4664), .P22(n4663), .P21(n4662), 
            .P20(n4661), .P19(n4660), .P18(n4659), .P17(n4658), .P16(n4657), 
            .P15(n4656), .P14(n4655), .P13(n4654), .P12(n4653), .P11(n4652), 
            .P10(n4651), .P9(n4650), .P8(n4649), .P7(n4648), .P6(n4647), 
            .P5(n4646), .P4(n4645), .P3(n4644), .P2(n4643), .P1(n4642), 
            .P0(n4641), .SIGNEDP(n4640));   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2398[16:40])
    defparam Data_23__I_0_22_mult_2.REG_INPUTA_CLK = "NONE";
    defparam Data_23__I_0_22_mult_2.REG_INPUTA_CE = "CE0";
    defparam Data_23__I_0_22_mult_2.REG_INPUTA_RST = "RST0";
    defparam Data_23__I_0_22_mult_2.REG_INPUTB_CLK = "NONE";
    defparam Data_23__I_0_22_mult_2.REG_INPUTB_CE = "CE0";
    defparam Data_23__I_0_22_mult_2.REG_INPUTB_RST = "RST0";
    defparam Data_23__I_0_22_mult_2.REG_INPUTC_CLK = "NONE";
    defparam Data_23__I_0_22_mult_2.REG_INPUTC_CE = "CE0";
    defparam Data_23__I_0_22_mult_2.REG_INPUTC_RST = "RST0";
    defparam Data_23__I_0_22_mult_2.REG_PIPELINE_CLK = "NONE";
    defparam Data_23__I_0_22_mult_2.REG_PIPELINE_CE = "CE0";
    defparam Data_23__I_0_22_mult_2.REG_PIPELINE_RST = "RST0";
    defparam Data_23__I_0_22_mult_2.REG_OUTPUT_CLK = "NONE";
    defparam Data_23__I_0_22_mult_2.REG_OUTPUT_CE = "CE0";
    defparam Data_23__I_0_22_mult_2.REG_OUTPUT_RST = "RST0";
    defparam Data_23__I_0_22_mult_2.CLK0_DIV = "ENABLED";
    defparam Data_23__I_0_22_mult_2.CLK1_DIV = "ENABLED";
    defparam Data_23__I_0_22_mult_2.CLK2_DIV = "ENABLED";
    defparam Data_23__I_0_22_mult_2.CLK3_DIV = "ENABLED";
    defparam Data_23__I_0_22_mult_2.HIGHSPEED_CLK = "NONE";
    defparam Data_23__I_0_22_mult_2.GSR = "DISABLED";
    defparam Data_23__I_0_22_mult_2.CAS_MATCH_REG = "FALSE";
    defparam Data_23__I_0_22_mult_2.SOURCEB_MODE = "B_SHIFT";
    defparam Data_23__I_0_22_mult_2.MULT_BYPASS = "DISABLED";
    defparam Data_23__I_0_22_mult_2.RESETMODE = "SYNC";
    MULT18X18D Data_23__I_0_16_mult_2 (.A17(Data_c_17), .A16(Data_c_16), 
            .A15(Data_c_15), .A14(Data_c_14), .A13(Data_c_13), .A12(Data_c_12), 
            .A11(Data_c_11), .A10(Data_c_10), .A9(Data_c_9), .A8(Data_c_8), 
            .A7(Data_c_7), .A6(Data_c_6), .A5(Data_c_5), .A4(Data_c_4), 
            .A3(Data_c_3), .A2(Data_c_2), .A1(Data_c_1), .A0(Data_c_0), 
            .B17(GND_net), .B16(GND_net), .B15(GND_net), .B14(GND_net), 
            .B13(GND_net), .B12(GND_net), .B11(GND_net), .B10(GND_net), 
            .B9(GND_net), .B8(GND_net), .B7(GND_net), .B6(GND_net), 
            .B5(GND_net), .B4(GND_net), .B3(GND_net), .B2(GND_net), 
            .B1(VCC_net), .B0(VCC_net), .C17(GND_net), .C16(GND_net), 
            .C15(GND_net), .C14(GND_net), .C13(GND_net), .C12(GND_net), 
            .C11(GND_net), .C10(GND_net), .C9(GND_net), .C8(GND_net), 
            .C7(GND_net), .C6(GND_net), .C5(GND_net), .C4(GND_net), 
            .C3(GND_net), .C2(GND_net), .C1(GND_net), .C0(GND_net), 
            .SIGNEDA(GND_net), .SIGNEDB(GND_net), .SOURCEA(GND_net), .SOURCEB(GND_net), 
            .CLK3(GND_net), .CLK2(GND_net), .CLK1(GND_net), .CLK0(GND_net), 
            .CE3(GND_net), .CE2(GND_net), .CE1(GND_net), .CE0(VCC_net), 
            .RST3(GND_net), .RST2(GND_net), .RST1(GND_net), .RST0(GND_net), 
            .SRIA17(GND_net), .SRIA16(GND_net), .SRIA15(GND_net), .SRIA14(GND_net), 
            .SRIA13(GND_net), .SRIA12(GND_net), .SRIA11(GND_net), .SRIA10(GND_net), 
            .SRIA9(GND_net), .SRIA8(GND_net), .SRIA7(GND_net), .SRIA6(GND_net), 
            .SRIA5(GND_net), .SRIA4(GND_net), .SRIA3(GND_net), .SRIA2(GND_net), 
            .SRIA1(GND_net), .SRIA0(GND_net), .SRIB17(GND_net), .SRIB16(GND_net), 
            .SRIB15(GND_net), .SRIB14(GND_net), .SRIB13(GND_net), .SRIB12(GND_net), 
            .SRIB11(GND_net), .SRIB10(GND_net), .SRIB9(GND_net), .SRIB8(GND_net), 
            .SRIB7(GND_net), .SRIB6(GND_net), .SRIB5(GND_net), .SRIB4(GND_net), 
            .SRIB3(GND_net), .SRIB2(GND_net), .SRIB1(GND_net), .SRIB0(GND_net), 
            .ROA17(n5217), .ROA16(n5216), .ROA15(n5215), .ROA14(n5214), 
            .ROA13(n5213), .ROA12(n5212), .ROA11(n5211), .ROA10(n5210), 
            .ROA9(n5209), .ROA8(n5208), .ROA7(n5207), .ROA6(n5206), 
            .ROA5(n5205), .ROA4(n5204), .ROA3(n5203), .ROA2(n5202), 
            .ROA1(n5201), .ROA0(n5200), .ROB17(n5235), .ROB16(n5234), 
            .ROB15(n5233), .ROB14(n5232), .ROB13(n5231), .ROB12(n5230), 
            .ROB11(n5229), .ROB10(n5228), .ROB9(n5227), .ROB8(n5226), 
            .ROB7(n5225), .ROB6(n5224), .ROB5(n5223), .ROB4(n5222), 
            .ROB3(n5221), .ROB2(n5220), .ROB1(n5219), .ROB0(n5218), 
            .P35(n5272), .P34(n5271), .P33(n5270), .P32(n5269), .P31(n5268), 
            .P30(n5267), .P29(n5266), .P28(n5265), .P27(n5264), .P26(n5263), 
            .P25(n5262), .P24(n5261), .P23(n5260), .P22(n5259), .P21(n5258), 
            .P20(n5257), .P19(n5256), .P18(n5255), .P17(n5254), .P16(n5253), 
            .P15(n5252), .P14(n5251), .P13(n5250), .P12(n5249), .P11(n5248), 
            .P10(n5247), .P9(n5246), .P8(n5245), .P7(n5244), .P6(n5243), 
            .P5(n5242), .P4(n5241), .P3(n5240), .P2(n5239), .P1(n5238), 
            .P0(n5237), .SIGNEDP(n5236));   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2398[16:40])
    defparam Data_23__I_0_16_mult_2.REG_INPUTA_CLK = "NONE";
    defparam Data_23__I_0_16_mult_2.REG_INPUTA_CE = "CE0";
    defparam Data_23__I_0_16_mult_2.REG_INPUTA_RST = "RST0";
    defparam Data_23__I_0_16_mult_2.REG_INPUTB_CLK = "NONE";
    defparam Data_23__I_0_16_mult_2.REG_INPUTB_CE = "CE0";
    defparam Data_23__I_0_16_mult_2.REG_INPUTB_RST = "RST0";
    defparam Data_23__I_0_16_mult_2.REG_INPUTC_CLK = "NONE";
    defparam Data_23__I_0_16_mult_2.REG_INPUTC_CE = "CE0";
    defparam Data_23__I_0_16_mult_2.REG_INPUTC_RST = "RST0";
    defparam Data_23__I_0_16_mult_2.REG_PIPELINE_CLK = "NONE";
    defparam Data_23__I_0_16_mult_2.REG_PIPELINE_CE = "CE0";
    defparam Data_23__I_0_16_mult_2.REG_PIPELINE_RST = "RST0";
    defparam Data_23__I_0_16_mult_2.REG_OUTPUT_CLK = "NONE";
    defparam Data_23__I_0_16_mult_2.REG_OUTPUT_CE = "CE0";
    defparam Data_23__I_0_16_mult_2.REG_OUTPUT_RST = "RST0";
    defparam Data_23__I_0_16_mult_2.CLK0_DIV = "ENABLED";
    defparam Data_23__I_0_16_mult_2.CLK1_DIV = "ENABLED";
    defparam Data_23__I_0_16_mult_2.CLK2_DIV = "ENABLED";
    defparam Data_23__I_0_16_mult_2.CLK3_DIV = "ENABLED";
    defparam Data_23__I_0_16_mult_2.HIGHSPEED_CLK = "NONE";
    defparam Data_23__I_0_16_mult_2.GSR = "DISABLED";
    defparam Data_23__I_0_16_mult_2.CAS_MATCH_REG = "FALSE";
    defparam Data_23__I_0_16_mult_2.SOURCEB_MODE = "B_SHIFT";
    defparam Data_23__I_0_16_mult_2.MULT_BYPASS = "DISABLED";
    defparam Data_23__I_0_16_mult_2.RESETMODE = "SYNC";
    OB packer_frame_done_pad (.I(packer_frame_done_c), .O(packer_frame_done));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(22[9:26])
    FIFOsm_U8 u_Fifosm15 (.clk_c(clk_c), .\adc_fifo_empty[15] (adc_fifo_empty[15]), 
            .GND_net(GND_net), .VCC_net(VCC_net), .Write_En_c(Write_En_c), 
            .\adc_fifo_rd_en[15] (adc_fifo_rd_en[15]), .Data_c_19(Data_c_19), 
            .Data_c_18(Data_c_18), .Data_c_17(Data_c_17), .Data_c_16(Data_c_16), 
            .Data_c_15(Data_c_15), .Data_c_14(Data_c_14), .Data_c_13(Data_c_13), 
            .Data_c_12(Data_c_12), .Data_c_11(Data_c_11), .Data_c_10(Data_c_10), 
            .Data_c_9(Data_c_9), .Data_c_8(Data_c_8), .Data_c_7(Data_c_7), 
            .Data_c_6(Data_c_6), .Data_c_5(Data_c_5), .Data_c_4(Data_c_4), 
            .Data_c_3(Data_c_3), .Data_c_2(Data_c_2), .Data_c_1(Data_c_1), 
            .Data_c_0(Data_c_0), .rst_c(rst_c), .adc_fifo_15_dout({adc_fifo_15_dout})) /* synthesis NGD_DRC_MASK=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(365[18:36])
    FIFOsm_U7 u_Fifosm1 (.clk_c(clk_c), .\adc_fifo_empty[1] (adc_fifo_empty[1]), 
            .GND_net(GND_net), .VCC_net(VCC_net), .Write_En_c(Write_En_c), 
            .\adc_fifo_rd_en[1] (adc_fifo_rd_en[1]), .Data_c_22(Data_c_22), 
            .Data_c_21(Data_c_21), .Data_c_20(Data_c_20), .Data_c_19(Data_c_19), 
            .Data_c_18(Data_c_18), .Data_c_17(Data_c_17), .Data_c_16(Data_c_16), 
            .Data_c_15(Data_c_15), .Data_c_14(Data_c_14), .Data_c_13(Data_c_13), 
            .Data_c_12(Data_c_12), .Data_c_11(Data_c_11), .Data_c_10(Data_c_10), 
            .Data_c_9(Data_c_9), .Data_c_8(Data_c_8), .Data_c_7(Data_c_7), 
            .Data_c_6(Data_c_6), .Data_c_5(Data_c_5), .Data_c_4(Data_c_4), 
            .Data_c_3(Data_c_3), .Data_c_2(Data_c_2), .Data_c_1(Data_c_1), 
            .Data_c_0(Data_c_0), .rst_c(rst_c), .adc_fifo_1_dout({adc_fifo_1_dout})) /* synthesis NGD_DRC_MASK=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(169[17:35])
    FIFOsm_U6 u_Fifosm2 (.clk_c(clk_c), .\adc_fifo_empty[2] (adc_fifo_empty[2]), 
            .GND_net(GND_net), .VCC_net(VCC_net), .Write_En_c(Write_En_c), 
            .\adc_fifo_rd_en[2] (adc_fifo_rd_en[2]), .Data_x2({Data_x2}), 
            .rst_c(rst_c), .adc_fifo_2_dout({adc_fifo_2_dout})) /* synthesis NGD_DRC_MASK=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(183[17:35])
    ALU54B lat_alu_11 (.CE3(GND_net), .CE2(GND_net), .CE1(GND_net), .CE0(VCC_net), 
           .CLK3(GND_net), .CLK2(GND_net), .CLK1(GND_net), .CLK0(GND_net), 
           .RST3(GND_net), .RST2(GND_net), .RST1(GND_net), .RST0(GND_net), 
           .SIGNEDIA(n5088), .SIGNEDIB(n5161), .SIGNEDCIN(GND_net), .A35(n5087), 
           .A34(n5086), .A33(n5085), .A32(n5084), .A31(n5083), .A30(n5082), 
           .A29(n5081), .A28(n5080), .A27(n5079), .A26(n5078), .A25(n5077), 
           .A24(n5076), .A23(n5075), .A22(n5074), .A21(n5073), .A20(n5072), 
           .A19(n5071), .A18(n5070), .A17(n5069), .A16(n5068), .A15(n5067), 
           .A14(n5066), .A13(n5065), .A12(n5064), .A11(n5063), .A10(n5062), 
           .A9(n5061), .A8(n5060), .A7(n5059), .A6(n5058), .A5(n5057), 
           .A4(n5056), .A3(n5055), .A2(n5054), .A1(n5053), .A0(n5052), 
           .B35(n5160), .B34(n5159), .B33(n5158), .B32(n5157), .B31(n5156), 
           .B30(n5155), .B29(n5154), .B28(n5153), .B27(n5152), .B26(n5151), 
           .B25(n5150), .B24(n5149), .B23(n5148), .B22(n5147), .B21(n5146), 
           .B20(n5145), .B19(n5144), .B18(n5143), .B17(n5142), .B16(n5141), 
           .B15(n5140), .B14(n5139), .B13(n5138), .B12(n5137), .B11(n5136), 
           .B10(n5135), .B9(n5134), .B8(n5133), .B7(n5132), .B6(n5131), 
           .B5(n5130), .B4(n5129), .B3(n5128), .B2(n5127), .B1(n5126), 
           .B0(n5125), .C53(GND_net), .C52(GND_net), .C51(GND_net), 
           .C50(GND_net), .C49(GND_net), .C48(GND_net), .C47(GND_net), 
           .C46(GND_net), .C45(GND_net), .C44(GND_net), .C43(GND_net), 
           .C42(GND_net), .C41(GND_net), .C40(GND_net), .C39(GND_net), 
           .C38(GND_net), .C37(GND_net), .C36(GND_net), .C35(GND_net), 
           .C34(GND_net), .C33(GND_net), .C32(GND_net), .C31(GND_net), 
           .C30(GND_net), .C29(GND_net), .C28(GND_net), .C27(GND_net), 
           .C26(GND_net), .C25(GND_net), .C24(GND_net), .C23(GND_net), 
           .C22(GND_net), .C21(GND_net), .C20(GND_net), .C19(GND_net), 
           .C18(GND_net), .C17(GND_net), .C16(GND_net), .C15(GND_net), 
           .C14(GND_net), .C13(GND_net), .C12(GND_net), .C11(GND_net), 
           .C10(GND_net), .C9(GND_net), .C8(GND_net), .C7(GND_net), 
           .C6(GND_net), .C5(GND_net), .C4(GND_net), .C3(GND_net), .C2(GND_net), 
           .C1(GND_net), .C0(GND_net), .CFB53(GND_net), .CFB52(GND_net), 
           .CFB51(GND_net), .CFB50(GND_net), .CFB49(GND_net), .CFB48(GND_net), 
           .CFB47(GND_net), .CFB46(GND_net), .CFB45(GND_net), .CFB44(GND_net), 
           .CFB43(GND_net), .CFB42(GND_net), .CFB41(GND_net), .CFB40(GND_net), 
           .CFB39(GND_net), .CFB38(GND_net), .CFB37(GND_net), .CFB36(GND_net), 
           .CFB35(GND_net), .CFB34(GND_net), .CFB33(GND_net), .CFB32(GND_net), 
           .CFB31(GND_net), .CFB30(GND_net), .CFB29(GND_net), .CFB28(GND_net), 
           .CFB27(GND_net), .CFB26(GND_net), .CFB25(GND_net), .CFB24(GND_net), 
           .CFB23(GND_net), .CFB22(GND_net), .CFB21(GND_net), .CFB20(GND_net), 
           .CFB19(GND_net), .CFB18(GND_net), .CFB17(GND_net), .CFB16(GND_net), 
           .CFB15(GND_net), .CFB14(GND_net), .CFB13(GND_net), .CFB12(GND_net), 
           .CFB11(GND_net), .CFB10(GND_net), .CFB9(GND_net), .CFB8(GND_net), 
           .CFB7(GND_net), .CFB6(GND_net), .CFB5(GND_net), .CFB4(GND_net), 
           .CFB3(GND_net), .CFB2(GND_net), .CFB1(GND_net), .CFB0(GND_net), 
           .MA35(n5124), .MA34(n5123), .MA33(n5122), .MA32(n5121), .MA31(n5120), 
           .MA30(n5119), .MA29(n5118), .MA28(n5117), .MA27(n5116), .MA26(n5115), 
           .MA25(n5114), .MA24(n5113), .MA23(n5112), .MA22(n5111), .MA21(n5110), 
           .MA20(n5109), .MA19(n5108), .MA18(n5107), .MA17(n5106), .MA16(n5105), 
           .MA15(n5104), .MA14(n5103), .MA13(n5102), .MA12(n5101), .MA11(n5100), 
           .MA10(n5099), .MA9(n5098), .MA8(n5097), .MA7(n5096), .MA6(n5095), 
           .MA5(n5094), .MA4(n5093), .MA3(n5092), .MA2(n5091), .MA1(n5090), 
           .MA0(n5089), .MB35(n5197), .MB34(n5196), .MB33(n5195), .MB32(n5194), 
           .MB31(n5193), .MB30(n5192), .MB29(n5191), .MB28(n5190), .MB27(n5189), 
           .MB26(n5188), .MB25(n5187), .MB24(n5186), .MB23(n5185), .MB22(n5184), 
           .MB21(n5183), .MB20(n5182), .MB19(n5181), .MB18(n5180), .MB17(n5179), 
           .MB16(n5178), .MB15(n5177), .MB14(n5176), .MB13(n5175), .MB12(n5174), 
           .MB11(n5173), .MB10(n5172), .MB9(n5171), .MB8(n5170), .MB7(n5169), 
           .MB6(n5168), .MB5(n5167), .MB4(n5166), .MB3(n5165), .MB2(n5164), 
           .MB1(n5163), .MB0(n5162), .CIN53(GND_net), .CIN52(GND_net), 
           .CIN51(GND_net), .CIN50(GND_net), .CIN49(GND_net), .CIN48(GND_net), 
           .CIN47(GND_net), .CIN46(GND_net), .CIN45(GND_net), .CIN44(GND_net), 
           .CIN43(GND_net), .CIN42(GND_net), .CIN41(GND_net), .CIN40(GND_net), 
           .CIN39(GND_net), .CIN38(GND_net), .CIN37(GND_net), .CIN36(GND_net), 
           .CIN35(GND_net), .CIN34(GND_net), .CIN33(GND_net), .CIN32(GND_net), 
           .CIN31(GND_net), .CIN30(GND_net), .CIN29(GND_net), .CIN28(GND_net), 
           .CIN27(GND_net), .CIN26(GND_net), .CIN25(GND_net), .CIN24(GND_net), 
           .CIN23(GND_net), .CIN22(GND_net), .CIN21(GND_net), .CIN20(GND_net), 
           .CIN19(GND_net), .CIN18(GND_net), .CIN17(GND_net), .CIN16(GND_net), 
           .CIN15(GND_net), .CIN14(GND_net), .CIN13(GND_net), .CIN12(GND_net), 
           .CIN11(GND_net), .CIN10(GND_net), .CIN9(GND_net), .CIN8(GND_net), 
           .CIN7(GND_net), .CIN6(GND_net), .CIN5(GND_net), .CIN4(GND_net), 
           .CIN3(GND_net), .CIN2(GND_net), .CIN1(GND_net), .CIN0(GND_net), 
           .OP10(GND_net), .OP9(VCC_net), .OP8(GND_net), .OP7(GND_net), 
           .OP6(GND_net), .OP5(GND_net), .OP4(GND_net), .OP3(GND_net), 
           .OP2(GND_net), .OP1(GND_net), .OP0(VCC_net), .R23(Data_x6[23]), 
           .R22(Data_x6[22]), .R21(Data_x6[21]), .R20(Data_x6[20]), .R19(Data_x6[19]), 
           .R18(Data_x6[18]), .R17(Data_x6[17]), .R16(Data_x6[16]), .R15(Data_x6[15]), 
           .R14(Data_x6[14]), .R13(Data_x6[13]), .R12(Data_x6[12]), .R11(Data_x6[11]), 
           .R10(Data_x6[10]), .R9(Data_x6[9]), .R8(Data_x6[8]), .R7(Data_x6[7]), 
           .R6(Data_x6[6]), .R5(Data_x6[5]), .R4(Data_x6[4]), .R3(Data_x6[3]), 
           .R2(Data_x6[2]), .R1(Data_x6[1]), .R0(Data_x6[0]));   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2398[16:40])
    defparam lat_alu_11.REG_INPUTC0_CLK = "NONE";
    defparam lat_alu_11.REG_INPUTC0_CE = "CE0";
    defparam lat_alu_11.REG_INPUTC0_RST = "RST0";
    defparam lat_alu_11.REG_INPUTC1_CLK = "NONE";
    defparam lat_alu_11.REG_INPUTC1_CE = "CE0";
    defparam lat_alu_11.REG_INPUTC1_RST = "RST0";
    defparam lat_alu_11.REG_OPCODEOP0_0_CLK = "NONE";
    defparam lat_alu_11.REG_OPCODEOP0_0_CE = "CE0";
    defparam lat_alu_11.REG_OPCODEOP0_0_RST = "RST0";
    defparam lat_alu_11.REG_OPCODEOP1_0_CLK = "NONE";
    defparam lat_alu_11.REG_OPCODEOP0_1_CLK = "NONE";
    defparam lat_alu_11.REG_OPCODEOP0_1_CE = "CE0";
    defparam lat_alu_11.REG_OPCODEOP0_1_RST = "RST0";
    defparam lat_alu_11.REG_OPCODEOP1_1_CLK = "NONE";
    defparam lat_alu_11.REG_OPCODEIN_0_CLK = "NONE";
    defparam lat_alu_11.REG_OPCODEIN_0_CE = "CE0";
    defparam lat_alu_11.REG_OPCODEIN_0_RST = "RST0";
    defparam lat_alu_11.REG_OPCODEIN_1_CLK = "NONE";
    defparam lat_alu_11.REG_OPCODEIN_1_CE = "CE0";
    defparam lat_alu_11.REG_OPCODEIN_1_RST = "RST0";
    defparam lat_alu_11.REG_OUTPUT0_CLK = "NONE";
    defparam lat_alu_11.REG_OUTPUT0_CE = "CE0";
    defparam lat_alu_11.REG_OUTPUT0_RST = "RST0";
    defparam lat_alu_11.REG_OUTPUT1_CLK = "NONE";
    defparam lat_alu_11.REG_OUTPUT1_CE = "CE0";
    defparam lat_alu_11.REG_OUTPUT1_RST = "RST0";
    defparam lat_alu_11.REG_FLAG_CLK = "NONE";
    defparam lat_alu_11.REG_FLAG_CE = "CE0";
    defparam lat_alu_11.REG_FLAG_RST = "RST0";
    defparam lat_alu_11.MCPAT_SOURCE = "STATIC";
    defparam lat_alu_11.MASKPAT_SOURCE = "STATIC";
    defparam lat_alu_11.MASK01 = "0x00000000000000";
    defparam lat_alu_11.REG_INPUTCFB_CLK = "NONE";
    defparam lat_alu_11.REG_INPUTCFB_CE = "CE0";
    defparam lat_alu_11.REG_INPUTCFB_RST = "RST0";
    defparam lat_alu_11.CLK0_DIV = "ENABLED";
    defparam lat_alu_11.CLK1_DIV = "ENABLED";
    defparam lat_alu_11.CLK2_DIV = "ENABLED";
    defparam lat_alu_11.CLK3_DIV = "ENABLED";
    defparam lat_alu_11.MCPAT = "0x00000000000000";
    defparam lat_alu_11.MASKPAT = "0x00000000000000";
    defparam lat_alu_11.RNDPAT = "0x00000000000000";
    defparam lat_alu_11.GSR = "DISABLED";
    defparam lat_alu_11.RESETMODE = "SYNC";
    defparam lat_alu_11.MULT9_MODE = "DISABLED";
    defparam lat_alu_11.LEGACY = "DISABLED";
    FIFOsm_U5 u_Fifosm3 (.clk_c(clk_c), .\adc_fifo_empty[3] (adc_fifo_empty[3]), 
            .GND_net(GND_net), .VCC_net(VCC_net), .Write_En_c(Write_En_c), 
            .\adc_fifo_rd_en[3] (adc_fifo_rd_en[3]), .Data_c_21(Data_c_21), 
            .Data_c_20(Data_c_20), .Data_c_19(Data_c_19), .Data_c_18(Data_c_18), 
            .Data_c_17(Data_c_17), .Data_c_16(Data_c_16), .Data_c_15(Data_c_15), 
            .Data_c_14(Data_c_14), .Data_c_13(Data_c_13), .Data_c_12(Data_c_12), 
            .Data_c_11(Data_c_11), .Data_c_10(Data_c_10), .Data_c_9(Data_c_9), 
            .Data_c_8(Data_c_8), .Data_c_7(Data_c_7), .Data_c_6(Data_c_6), 
            .Data_c_5(Data_c_5), .Data_c_4(Data_c_4), .Data_c_3(Data_c_3), 
            .Data_c_2(Data_c_2), .Data_c_1(Data_c_1), .Data_c_0(Data_c_0), 
            .rst_c(rst_c), .adc_fifo_3_dout({adc_fifo_3_dout})) /* synthesis NGD_DRC_MASK=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(197[17:35])
    FIFOsm_U4 u_Fifosm4 (.clk_c(clk_c), .\adc_fifo_empty[4] (adc_fifo_empty[4]), 
            .GND_net(GND_net), .VCC_net(VCC_net), .Write_En_c(Write_En_c), 
            .\adc_fifo_rd_en[4] (adc_fifo_rd_en[4]), .Data_x4({Data_x4}), 
            .rst_c(rst_c), .adc_fifo_4_dout({adc_fifo_4_dout})) /* synthesis NGD_DRC_MASK=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(211[17:35])
    LUT4 fifo_almostempty_I_0_1_lut (.A(fifo_almostempty), .Z(fifo_almostempty_N_1)) /* synthesis lut_function=(!(A)) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(390[21:41])
    defparam fifo_almostempty_I_0_1_lut.init = 16'h5555;
    FIFOsm_U3 u_Fifosm5 (.clk_c(clk_c), .\adc_fifo_empty[5] (adc_fifo_empty[5]), 
            .GND_net(GND_net), .VCC_net(VCC_net), .Write_En_c(Write_En_c), 
            .\adc_fifo_rd_en[5] (adc_fifo_rd_en[5]), .\Data_x2[22] (Data_x2[22]), 
            .\Data_x2[21] (Data_x2[21]), .\Data_x2[20] (Data_x2[20]), .\Data_x2[19] (Data_x2[19]), 
            .\Data_x2[18] (Data_x2[18]), .\Data_x2[17] (Data_x2[17]), .\Data_x2[16] (Data_x2[16]), 
            .\Data_x2[15] (Data_x2[15]), .\Data_x2[14] (Data_x2[14]), .\Data_x2[13] (Data_x2[13]), 
            .\Data_x2[12] (Data_x2[12]), .\Data_x2[11] (Data_x2[11]), .\Data_x2[10] (Data_x2[10]), 
            .\Data_x2[9] (Data_x2[9]), .\Data_x2[8] (Data_x2[8]), .\Data_x2[7] (Data_x2[7]), 
            .\Data_x2[6] (Data_x2[6]), .\Data_x2[5] (Data_x2[5]), .\Data_x2[4] (Data_x2[4]), 
            .\Data_x2[3] (Data_x2[3]), .\Data_x2[2] (Data_x2[2]), .\Data_x2[1] (Data_x2[1]), 
            .\Data_x2[0] (Data_x2[0]), .rst_c(rst_c), .adc_fifo_5_dout({adc_fifo_5_dout})) /* synthesis NGD_DRC_MASK=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(225[17:35])
    MULT18X18D lat_mult_10 (.A17(GND_net), .A16(GND_net), .A15(GND_net), 
            .A14(GND_net), .A13(GND_net), .A12(GND_net), .A11(GND_net), 
            .A10(GND_net), .A9(GND_net), .A8(GND_net), .A7(GND_net), 
            .A6(GND_net), .A5(Data_c_23), .A4(Data_c_22), .A3(Data_c_21), 
            .A2(Data_c_20), .A1(Data_c_19), .A0(Data_c_18), .B17(GND_net), 
            .B16(GND_net), .B15(GND_net), .B14(GND_net), .B13(GND_net), 
            .B12(GND_net), .B11(GND_net), .B10(GND_net), .B9(GND_net), 
            .B8(GND_net), .B7(GND_net), .B6(GND_net), .B5(GND_net), 
            .B4(GND_net), .B3(GND_net), .B2(VCC_net), .B1(VCC_net), 
            .B0(VCC_net), .C17(GND_net), .C16(GND_net), .C15(GND_net), 
            .C14(GND_net), .C13(GND_net), .C12(GND_net), .C11(GND_net), 
            .C10(GND_net), .C9(GND_net), .C8(GND_net), .C7(GND_net), 
            .C6(GND_net), .C5(GND_net), .C4(GND_net), .C3(GND_net), 
            .C2(GND_net), .C1(GND_net), .C0(GND_net), .SIGNEDA(GND_net), 
            .SIGNEDB(GND_net), .SOURCEA(GND_net), .SOURCEB(GND_net), .CLK3(GND_net), 
            .CLK2(GND_net), .CLK1(GND_net), .CLK0(GND_net), .CE3(GND_net), 
            .CE2(GND_net), .CE1(GND_net), .CE0(VCC_net), .RST3(GND_net), 
            .RST2(GND_net), .RST1(GND_net), .RST0(GND_net), .SRIA17(GND_net), 
            .SRIA16(GND_net), .SRIA15(GND_net), .SRIA14(GND_net), .SRIA13(GND_net), 
            .SRIA12(GND_net), .SRIA11(GND_net), .SRIA10(GND_net), .SRIA9(GND_net), 
            .SRIA8(GND_net), .SRIA7(GND_net), .SRIA6(GND_net), .SRIA5(GND_net), 
            .SRIA4(GND_net), .SRIA3(GND_net), .SRIA2(GND_net), .SRIA1(GND_net), 
            .SRIA0(GND_net), .SRIB17(GND_net), .SRIB16(GND_net), .SRIB15(GND_net), 
            .SRIB14(GND_net), .SRIB13(GND_net), .SRIB12(GND_net), .SRIB11(GND_net), 
            .SRIB10(GND_net), .SRIB9(GND_net), .SRIB8(GND_net), .SRIB7(GND_net), 
            .SRIB6(GND_net), .SRIB5(GND_net), .SRIB4(GND_net), .SRIB3(GND_net), 
            .SRIB2(GND_net), .SRIB1(GND_net), .SRIB0(GND_net), .ROA17(n5142), 
            .ROA16(n5141), .ROA15(n5140), .ROA14(n5139), .ROA13(n5138), 
            .ROA12(n5137), .ROA11(n5136), .ROA10(n5135), .ROA9(n5134), 
            .ROA8(n5133), .ROA7(n5132), .ROA6(n5131), .ROA5(n5130), 
            .ROA4(n5129), .ROA3(n5128), .ROA2(n5127), .ROA1(n5126), 
            .ROA0(n5125), .ROB17(n5160), .ROB16(n5159), .ROB15(n5158), 
            .ROB14(n5157), .ROB13(n5156), .ROB12(n5155), .ROB11(n5154), 
            .ROB10(n5153), .ROB9(n5152), .ROB8(n5151), .ROB7(n5150), 
            .ROB6(n5149), .ROB5(n5148), .ROB4(n5147), .ROB3(n5146), 
            .ROB2(n5145), .ROB1(n5144), .ROB0(n5143), .P35(n5197), .P34(n5196), 
            .P33(n5195), .P32(n5194), .P31(n5193), .P30(n5192), .P29(n5191), 
            .P28(n5190), .P27(n5189), .P26(n5188), .P25(n5187), .P24(n5186), 
            .P23(n5185), .P22(n5184), .P21(n5183), .P20(n5182), .P19(n5181), 
            .P18(n5180), .P17(n5179), .P16(n5178), .P15(n5177), .P14(n5176), 
            .P13(n5175), .P12(n5174), .P11(n5173), .P10(n5172), .P9(n5171), 
            .P8(n5170), .P7(n5169), .P6(n5168), .P5(n5167), .P4(n5166), 
            .P3(n5165), .P2(n5164), .P1(n5163), .P0(n5162), .SIGNEDP(n5161));   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2398[16:40])
    defparam lat_mult_10.REG_INPUTA_CLK = "NONE";
    defparam lat_mult_10.REG_INPUTA_CE = "CE0";
    defparam lat_mult_10.REG_INPUTA_RST = "RST0";
    defparam lat_mult_10.REG_INPUTB_CLK = "NONE";
    defparam lat_mult_10.REG_INPUTB_CE = "CE0";
    defparam lat_mult_10.REG_INPUTB_RST = "RST0";
    defparam lat_mult_10.REG_INPUTC_CLK = "NONE";
    defparam lat_mult_10.REG_INPUTC_CE = "CE0";
    defparam lat_mult_10.REG_INPUTC_RST = "RST0";
    defparam lat_mult_10.REG_PIPELINE_CLK = "NONE";
    defparam lat_mult_10.REG_PIPELINE_CE = "CE0";
    defparam lat_mult_10.REG_PIPELINE_RST = "RST0";
    defparam lat_mult_10.REG_OUTPUT_CLK = "NONE";
    defparam lat_mult_10.REG_OUTPUT_CE = "CE0";
    defparam lat_mult_10.REG_OUTPUT_RST = "RST0";
    defparam lat_mult_10.CLK0_DIV = "ENABLED";
    defparam lat_mult_10.CLK1_DIV = "ENABLED";
    defparam lat_mult_10.CLK2_DIV = "ENABLED";
    defparam lat_mult_10.CLK3_DIV = "ENABLED";
    defparam lat_mult_10.HIGHSPEED_CLK = "NONE";
    defparam lat_mult_10.GSR = "DISABLED";
    defparam lat_mult_10.CAS_MATCH_REG = "FALSE";
    defparam lat_mult_10.SOURCEB_MODE = "B_SHIFT";
    defparam lat_mult_10.MULT_BYPASS = "DISABLED";
    defparam lat_mult_10.RESETMODE = "SYNC";
    FIFOsm_U2 u_Fifosm6 (.clk_c(clk_c), .\adc_fifo_empty[6] (adc_fifo_empty[6]), 
            .GND_net(GND_net), .VCC_net(VCC_net), .Write_En_c(Write_En_c), 
            .\adc_fifo_rd_en[6] (adc_fifo_rd_en[6]), .Data_x6({Data_x6}), 
            .rst_c(rst_c), .adc_fifo_6_dout({adc_fifo_6_dout})) /* synthesis NGD_DRC_MASK=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(239[17:35])
    FIFOsm_U1 u_Fifosm7 (.clk_c(clk_c), .\adc_fifo_empty[7] (adc_fifo_empty[7]), 
            .GND_net(GND_net), .VCC_net(VCC_net), .Write_En_c(Write_En_c), 
            .\adc_fifo_rd_en[7] (adc_fifo_rd_en[7]), .Data_c_20(Data_c_20), 
            .Data_c_19(Data_c_19), .Data_c_18(Data_c_18), .Data_c_17(Data_c_17), 
            .Data_c_16(Data_c_16), .Data_c_15(Data_c_15), .Data_c_14(Data_c_14), 
            .Data_c_13(Data_c_13), .Data_c_12(Data_c_12), .Data_c_11(Data_c_11), 
            .Data_c_10(Data_c_10), .Data_c_9(Data_c_9), .Data_c_8(Data_c_8), 
            .Data_c_7(Data_c_7), .Data_c_6(Data_c_6), .Data_c_5(Data_c_5), 
            .Data_c_4(Data_c_4), .Data_c_3(Data_c_3), .Data_c_2(Data_c_2), 
            .Data_c_1(Data_c_1), .Data_c_0(Data_c_0), .rst_c(rst_c), .adc_fifo_7_dout({adc_fifo_7_dout})) /* synthesis NGD_DRC_MASK=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(253[17:35])
    FIFOsm_U0 u_Fifosm8 (.clk_c(clk_c), .\adc_fifo_empty[8] (adc_fifo_empty[8]), 
            .GND_net(GND_net), .VCC_net(VCC_net), .Write_En_c(Write_En_c), 
            .\adc_fifo_rd_en[8] (adc_fifo_rd_en[8]), .Data_x8({Data_x8}), 
            .rst_c(rst_c), .adc_fifo_8_dout({adc_fifo_8_dout})) /* synthesis NGD_DRC_MASK=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(267[17:35])
    CCU2C add_1040_add_4_cout (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(GND_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n9006), .S0(n399));
    defparam add_1040_add_4_cout.INIT0 = 16'h0000;
    defparam add_1040_add_4_cout.INIT1 = 16'h0000;
    defparam add_1040_add_4_cout.INJECT1_0 = "NO";
    defparam add_1040_add_4_cout.INJECT1_1 = "NO";
    FIFOsm_U14 u_Fifosm0 (.clk_c(clk_c), .\adc_fifo_empty[0] (adc_fifo_empty[0]), 
            .GND_net(GND_net), .VCC_net(VCC_net), .Write_En_c(Write_En_c), 
            .\adc_fifo_rd_en[0] (adc_fifo_rd_en[0]), .Data_c_23(Data_c_23), 
            .Data_c_22(Data_c_22), .Data_c_21(Data_c_21), .Data_c_20(Data_c_20), 
            .Data_c_19(Data_c_19), .Data_c_18(Data_c_18), .Data_c_17(Data_c_17), 
            .Data_c_16(Data_c_16), .Data_c_15(Data_c_15), .Data_c_14(Data_c_14), 
            .Data_c_13(Data_c_13), .Data_c_12(Data_c_12), .Data_c_11(Data_c_11), 
            .Data_c_10(Data_c_10), .Data_c_9(Data_c_9), .Data_c_8(Data_c_8), 
            .Data_c_7(Data_c_7), .Data_c_6(Data_c_6), .Data_c_5(Data_c_5), 
            .Data_c_4(Data_c_4), .Data_c_3(Data_c_3), .Data_c_2(Data_c_2), 
            .Data_c_1(Data_c_1), .Data_c_0(Data_c_0), .rst_c(rst_c), .adc_fifo_0_dout({adc_fifo_0_dout})) /* synthesis NGD_DRC_MASK=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(155[17:35])
    FIFOsm_U13 u_Fifosm10 (.clk_c(clk_c), .\adc_fifo_empty[10] (adc_fifo_empty[10]), 
            .GND_net(GND_net), .VCC_net(VCC_net), .Write_En_c(Write_En_c), 
            .\adc_fifo_rd_en[10] (adc_fifo_rd_en[10]), .Data_x10({Data_x10}), 
            .rst_c(rst_c), .adc_fifo_10_dout({adc_fifo_10_dout})) /* synthesis NGD_DRC_MASK=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(295[18:36])
    LUT4 i717_4_lut (.A(n2131), .B(rst_c), .C(n31), .D(n1844), .Z(clk_c_enable_64)) /* synthesis lut_function=(A (B)+!A (B+!(C+(D)))) */ ;
    defparam i717_4_lut.init = 16'hcccd;
    FIFOsm_U12 u_Fifosm11 (.clk_c(clk_c), .\adc_fifo_empty[11] (adc_fifo_empty[11]), 
            .GND_net(GND_net), .VCC_net(VCC_net), .Write_En_c(Write_En_c), 
            .\adc_fifo_rd_en[11] (adc_fifo_rd_en[11]), .\Data_x2[21] (Data_x2[21]), 
            .\Data_x2[20] (Data_x2[20]), .\Data_x2[19] (Data_x2[19]), .\Data_x2[18] (Data_x2[18]), 
            .\Data_x2[17] (Data_x2[17]), .\Data_x2[16] (Data_x2[16]), .\Data_x2[15] (Data_x2[15]), 
            .\Data_x2[14] (Data_x2[14]), .\Data_x2[13] (Data_x2[13]), .\Data_x2[12] (Data_x2[12]), 
            .\Data_x2[11] (Data_x2[11]), .\Data_x2[10] (Data_x2[10]), .\Data_x2[9] (Data_x2[9]), 
            .\Data_x2[8] (Data_x2[8]), .\Data_x2[7] (Data_x2[7]), .\Data_x2[6] (Data_x2[6]), 
            .\Data_x2[5] (Data_x2[5]), .\Data_x2[4] (Data_x2[4]), .\Data_x2[3] (Data_x2[3]), 
            .\Data_x2[2] (Data_x2[2]), .\Data_x2[1] (Data_x2[1]), .\Data_x2[0] (Data_x2[0]), 
            .rst_c(rst_c), .adc_fifo_11_dout({adc_fifo_11_dout})) /* synthesis NGD_DRC_MASK=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(309[18:36])
    MULT18X18D Data_23__I_0_19_mult_2 (.A17(Data_c_17), .A16(Data_c_16), 
            .A15(Data_c_15), .A14(Data_c_14), .A13(Data_c_13), .A12(Data_c_12), 
            .A11(Data_c_11), .A10(Data_c_10), .A9(Data_c_9), .A8(Data_c_8), 
            .A7(Data_c_7), .A6(Data_c_6), .A5(Data_c_5), .A4(Data_c_4), 
            .A3(Data_c_3), .A2(Data_c_2), .A1(Data_c_1), .A0(Data_c_0), 
            .B17(GND_net), .B16(GND_net), .B15(GND_net), .B14(GND_net), 
            .B13(GND_net), .B12(GND_net), .B11(GND_net), .B10(GND_net), 
            .B9(GND_net), .B8(GND_net), .B7(GND_net), .B6(GND_net), 
            .B5(GND_net), .B4(GND_net), .B3(GND_net), .B2(VCC_net), 
            .B1(VCC_net), .B0(VCC_net), .C17(GND_net), .C16(GND_net), 
            .C15(GND_net), .C14(GND_net), .C13(GND_net), .C12(GND_net), 
            .C11(GND_net), .C10(GND_net), .C9(GND_net), .C8(GND_net), 
            .C7(GND_net), .C6(GND_net), .C5(GND_net), .C4(GND_net), 
            .C3(GND_net), .C2(GND_net), .C1(GND_net), .C0(GND_net), 
            .SIGNEDA(GND_net), .SIGNEDB(GND_net), .SOURCEA(GND_net), .SOURCEB(GND_net), 
            .CLK3(GND_net), .CLK2(GND_net), .CLK1(GND_net), .CLK0(GND_net), 
            .CE3(GND_net), .CE2(GND_net), .CE1(GND_net), .CE0(VCC_net), 
            .RST3(GND_net), .RST2(GND_net), .RST1(GND_net), .RST0(GND_net), 
            .SRIA17(GND_net), .SRIA16(GND_net), .SRIA15(GND_net), .SRIA14(GND_net), 
            .SRIA13(GND_net), .SRIA12(GND_net), .SRIA11(GND_net), .SRIA10(GND_net), 
            .SRIA9(GND_net), .SRIA8(GND_net), .SRIA7(GND_net), .SRIA6(GND_net), 
            .SRIA5(GND_net), .SRIA4(GND_net), .SRIA3(GND_net), .SRIA2(GND_net), 
            .SRIA1(GND_net), .SRIA0(GND_net), .SRIB17(GND_net), .SRIB16(GND_net), 
            .SRIB15(GND_net), .SRIB14(GND_net), .SRIB13(GND_net), .SRIB12(GND_net), 
            .SRIB11(GND_net), .SRIB10(GND_net), .SRIB9(GND_net), .SRIB8(GND_net), 
            .SRIB7(GND_net), .SRIB6(GND_net), .SRIB5(GND_net), .SRIB4(GND_net), 
            .SRIB3(GND_net), .SRIB2(GND_net), .SRIB1(GND_net), .SRIB0(GND_net), 
            .ROA17(n5069), .ROA16(n5068), .ROA15(n5067), .ROA14(n5066), 
            .ROA13(n5065), .ROA12(n5064), .ROA11(n5063), .ROA10(n5062), 
            .ROA9(n5061), .ROA8(n5060), .ROA7(n5059), .ROA6(n5058), 
            .ROA5(n5057), .ROA4(n5056), .ROA3(n5055), .ROA2(n5054), 
            .ROA1(n5053), .ROA0(n5052), .ROB17(n5087), .ROB16(n5086), 
            .ROB15(n5085), .ROB14(n5084), .ROB13(n5083), .ROB12(n5082), 
            .ROB11(n5081), .ROB10(n5080), .ROB9(n5079), .ROB8(n5078), 
            .ROB7(n5077), .ROB6(n5076), .ROB5(n5075), .ROB4(n5074), 
            .ROB3(n5073), .ROB2(n5072), .ROB1(n5071), .ROB0(n5070), 
            .P35(n5124), .P34(n5123), .P33(n5122), .P32(n5121), .P31(n5120), 
            .P30(n5119), .P29(n5118), .P28(n5117), .P27(n5116), .P26(n5115), 
            .P25(n5114), .P24(n5113), .P23(n5112), .P22(n5111), .P21(n5110), 
            .P20(n5109), .P19(n5108), .P18(n5107), .P17(n5106), .P16(n5105), 
            .P15(n5104), .P14(n5103), .P13(n5102), .P12(n5101), .P11(n5100), 
            .P10(n5099), .P9(n5098), .P8(n5097), .P7(n5096), .P6(n5095), 
            .P5(n5094), .P4(n5093), .P3(n5092), .P2(n5091), .P1(n5090), 
            .P0(n5089), .SIGNEDP(n5088));   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2398[16:40])
    defparam Data_23__I_0_19_mult_2.REG_INPUTA_CLK = "NONE";
    defparam Data_23__I_0_19_mult_2.REG_INPUTA_CE = "CE0";
    defparam Data_23__I_0_19_mult_2.REG_INPUTA_RST = "RST0";
    defparam Data_23__I_0_19_mult_2.REG_INPUTB_CLK = "NONE";
    defparam Data_23__I_0_19_mult_2.REG_INPUTB_CE = "CE0";
    defparam Data_23__I_0_19_mult_2.REG_INPUTB_RST = "RST0";
    defparam Data_23__I_0_19_mult_2.REG_INPUTC_CLK = "NONE";
    defparam Data_23__I_0_19_mult_2.REG_INPUTC_CE = "CE0";
    defparam Data_23__I_0_19_mult_2.REG_INPUTC_RST = "RST0";
    defparam Data_23__I_0_19_mult_2.REG_PIPELINE_CLK = "NONE";
    defparam Data_23__I_0_19_mult_2.REG_PIPELINE_CE = "CE0";
    defparam Data_23__I_0_19_mult_2.REG_PIPELINE_RST = "RST0";
    defparam Data_23__I_0_19_mult_2.REG_OUTPUT_CLK = "NONE";
    defparam Data_23__I_0_19_mult_2.REG_OUTPUT_CE = "CE0";
    defparam Data_23__I_0_19_mult_2.REG_OUTPUT_RST = "RST0";
    defparam Data_23__I_0_19_mult_2.CLK0_DIV = "ENABLED";
    defparam Data_23__I_0_19_mult_2.CLK1_DIV = "ENABLED";
    defparam Data_23__I_0_19_mult_2.CLK2_DIV = "ENABLED";
    defparam Data_23__I_0_19_mult_2.CLK3_DIV = "ENABLED";
    defparam Data_23__I_0_19_mult_2.HIGHSPEED_CLK = "NONE";
    defparam Data_23__I_0_19_mult_2.GSR = "DISABLED";
    defparam Data_23__I_0_19_mult_2.CAS_MATCH_REG = "FALSE";
    defparam Data_23__I_0_19_mult_2.SOURCEB_MODE = "B_SHIFT";
    defparam Data_23__I_0_19_mult_2.MULT_BYPASS = "DISABLED";
    defparam Data_23__I_0_19_mult_2.RESETMODE = "SYNC";
    FIFOsm_U11 u_Fifosm12 (.clk_c(clk_c), .\adc_fifo_empty[12] (adc_fifo_empty[12]), 
            .GND_net(GND_net), .VCC_net(VCC_net), .Write_En_c(Write_En_c), 
            .\adc_fifo_rd_en[12] (adc_fifo_rd_en[12]), .Data_x12({Data_x12}), 
            .rst_c(rst_c), .adc_fifo_12_dout({adc_fifo_12_dout})) /* synthesis NGD_DRC_MASK=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(323[18:36])
    FIFOsm_U10 u_Fifosm13 (.clk_c(clk_c), .\adc_fifo_empty[13] (adc_fifo_empty[13]), 
            .GND_net(GND_net), .VCC_net(VCC_net), .Write_En_c(Write_En_c), 
            .\adc_fifo_rd_en[13] (adc_fifo_rd_en[13]), .\Data_x6[22] (Data_x6[22]), 
            .\Data_x6[21] (Data_x6[21]), .\Data_x6[20] (Data_x6[20]), .\Data_x6[19] (Data_x6[19]), 
            .\Data_x6[18] (Data_x6[18]), .\Data_x6[17] (Data_x6[17]), .\Data_x6[16] (Data_x6[16]), 
            .\Data_x6[15] (Data_x6[15]), .\Data_x6[14] (Data_x6[14]), .\Data_x6[13] (Data_x6[13]), 
            .\Data_x6[12] (Data_x6[12]), .\Data_x6[11] (Data_x6[11]), .\Data_x6[10] (Data_x6[10]), 
            .\Data_x6[9] (Data_x6[9]), .\Data_x6[8] (Data_x6[8]), .\Data_x6[7] (Data_x6[7]), 
            .\Data_x6[6] (Data_x6[6]), .\Data_x6[5] (Data_x6[5]), .\Data_x6[4] (Data_x6[4]), 
            .\Data_x6[3] (Data_x6[3]), .\Data_x6[2] (Data_x6[2]), .\Data_x6[1] (Data_x6[1]), 
            .\Data_x6[0] (Data_x6[0]), .rst_c(rst_c), .adc_fifo_13_dout({adc_fifo_13_dout})) /* synthesis NGD_DRC_MASK=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(337[18:36])
    ALU54B lat_alu_9 (.CE3(GND_net), .CE2(GND_net), .CE1(GND_net), .CE0(VCC_net), 
           .CLK3(GND_net), .CLK2(GND_net), .CLK1(GND_net), .CLK0(GND_net), 
           .RST3(GND_net), .RST2(GND_net), .RST1(GND_net), .RST0(GND_net), 
           .SIGNEDIA(n4939), .SIGNEDIB(n5012), .SIGNEDCIN(GND_net), .A35(n4938), 
           .A34(n4937), .A33(n4936), .A32(n4935), .A31(n4934), .A30(n4933), 
           .A29(n4932), .A28(n4931), .A27(n4930), .A26(n4929), .A25(n4928), 
           .A24(n4927), .A23(n4926), .A22(n4925), .A21(n4924), .A20(n4923), 
           .A19(n4922), .A18(n4921), .A17(n4920), .A16(n4919), .A15(n4918), 
           .A14(n4917), .A13(n4916), .A12(n4915), .A11(n4914), .A10(n4913), 
           .A9(n4912), .A8(n4911), .A7(n4910), .A6(n4909), .A5(n4908), 
           .A4(n4907), .A3(n4906), .A2(n4905), .A1(n4904), .A0(n4903), 
           .B35(n5011), .B34(n5010), .B33(n5009), .B32(n5008), .B31(n5007), 
           .B30(n5006), .B29(n5005), .B28(n5004), .B27(n5003), .B26(n5002), 
           .B25(n5001), .B24(n5000), .B23(n4999), .B22(n4998), .B21(n4997), 
           .B20(n4996), .B19(n4995), .B18(n4994), .B17(n4993), .B16(n4992), 
           .B15(n4991), .B14(n4990), .B13(n4989), .B12(n4988), .B11(n4987), 
           .B10(n4986), .B9(n4985), .B8(n4984), .B7(n4983), .B6(n4982), 
           .B5(n4981), .B4(n4980), .B3(n4979), .B2(n4978), .B1(n4977), 
           .B0(n4976), .C53(GND_net), .C52(GND_net), .C51(GND_net), 
           .C50(GND_net), .C49(GND_net), .C48(GND_net), .C47(GND_net), 
           .C46(GND_net), .C45(GND_net), .C44(GND_net), .C43(GND_net), 
           .C42(GND_net), .C41(GND_net), .C40(GND_net), .C39(GND_net), 
           .C38(GND_net), .C37(GND_net), .C36(GND_net), .C35(GND_net), 
           .C34(GND_net), .C33(GND_net), .C32(GND_net), .C31(GND_net), 
           .C30(GND_net), .C29(GND_net), .C28(GND_net), .C27(GND_net), 
           .C26(GND_net), .C25(GND_net), .C24(GND_net), .C23(GND_net), 
           .C22(GND_net), .C21(GND_net), .C20(GND_net), .C19(GND_net), 
           .C18(GND_net), .C17(GND_net), .C16(GND_net), .C15(GND_net), 
           .C14(GND_net), .C13(GND_net), .C12(GND_net), .C11(GND_net), 
           .C10(GND_net), .C9(GND_net), .C8(GND_net), .C7(GND_net), 
           .C6(GND_net), .C5(GND_net), .C4(GND_net), .C3(GND_net), .C2(GND_net), 
           .C1(GND_net), .C0(GND_net), .CFB53(GND_net), .CFB52(GND_net), 
           .CFB51(GND_net), .CFB50(GND_net), .CFB49(GND_net), .CFB48(GND_net), 
           .CFB47(GND_net), .CFB46(GND_net), .CFB45(GND_net), .CFB44(GND_net), 
           .CFB43(GND_net), .CFB42(GND_net), .CFB41(GND_net), .CFB40(GND_net), 
           .CFB39(GND_net), .CFB38(GND_net), .CFB37(GND_net), .CFB36(GND_net), 
           .CFB35(GND_net), .CFB34(GND_net), .CFB33(GND_net), .CFB32(GND_net), 
           .CFB31(GND_net), .CFB30(GND_net), .CFB29(GND_net), .CFB28(GND_net), 
           .CFB27(GND_net), .CFB26(GND_net), .CFB25(GND_net), .CFB24(GND_net), 
           .CFB23(GND_net), .CFB22(GND_net), .CFB21(GND_net), .CFB20(GND_net), 
           .CFB19(GND_net), .CFB18(GND_net), .CFB17(GND_net), .CFB16(GND_net), 
           .CFB15(GND_net), .CFB14(GND_net), .CFB13(GND_net), .CFB12(GND_net), 
           .CFB11(GND_net), .CFB10(GND_net), .CFB9(GND_net), .CFB8(GND_net), 
           .CFB7(GND_net), .CFB6(GND_net), .CFB5(GND_net), .CFB4(GND_net), 
           .CFB3(GND_net), .CFB2(GND_net), .CFB1(GND_net), .CFB0(GND_net), 
           .MA35(n4975), .MA34(n4974), .MA33(n4973), .MA32(n4972), .MA31(n4971), 
           .MA30(n4970), .MA29(n4969), .MA28(n4968), .MA27(n4967), .MA26(n4966), 
           .MA25(n4965), .MA24(n4964), .MA23(n4963), .MA22(n4962), .MA21(n4961), 
           .MA20(n4960), .MA19(n4959), .MA18(n4958), .MA17(n4957), .MA16(n4956), 
           .MA15(n4955), .MA14(n4954), .MA13(n4953), .MA12(n4952), .MA11(n4951), 
           .MA10(n4950), .MA9(n4949), .MA8(n4948), .MA7(n4947), .MA6(n4946), 
           .MA5(n4945), .MA4(n4944), .MA3(n4943), .MA2(n4942), .MA1(n4941), 
           .MA0(n4940), .MB35(n5048), .MB34(n5047), .MB33(n5046), .MB32(n5045), 
           .MB31(n5044), .MB30(n5043), .MB29(n5042), .MB28(n5041), .MB27(n5040), 
           .MB26(n5039), .MB25(n5038), .MB24(n5037), .MB23(n5036), .MB22(n5035), 
           .MB21(n5034), .MB20(n5033), .MB19(n5032), .MB18(n5031), .MB17(n5030), 
           .MB16(n5029), .MB15(n5028), .MB14(n5027), .MB13(n5026), .MB12(n5025), 
           .MB11(n5024), .MB10(n5023), .MB9(n5022), .MB8(n5021), .MB7(n5020), 
           .MB6(n5019), .MB5(n5018), .MB4(n5017), .MB3(n5016), .MB2(n5015), 
           .MB1(n5014), .MB0(n5013), .CIN53(GND_net), .CIN52(GND_net), 
           .CIN51(GND_net), .CIN50(GND_net), .CIN49(GND_net), .CIN48(GND_net), 
           .CIN47(GND_net), .CIN46(GND_net), .CIN45(GND_net), .CIN44(GND_net), 
           .CIN43(GND_net), .CIN42(GND_net), .CIN41(GND_net), .CIN40(GND_net), 
           .CIN39(GND_net), .CIN38(GND_net), .CIN37(GND_net), .CIN36(GND_net), 
           .CIN35(GND_net), .CIN34(GND_net), .CIN33(GND_net), .CIN32(GND_net), 
           .CIN31(GND_net), .CIN30(GND_net), .CIN29(GND_net), .CIN28(GND_net), 
           .CIN27(GND_net), .CIN26(GND_net), .CIN25(GND_net), .CIN24(GND_net), 
           .CIN23(GND_net), .CIN22(GND_net), .CIN21(GND_net), .CIN20(GND_net), 
           .CIN19(GND_net), .CIN18(GND_net), .CIN17(GND_net), .CIN16(GND_net), 
           .CIN15(GND_net), .CIN14(GND_net), .CIN13(GND_net), .CIN12(GND_net), 
           .CIN11(GND_net), .CIN10(GND_net), .CIN9(GND_net), .CIN8(GND_net), 
           .CIN7(GND_net), .CIN6(GND_net), .CIN5(GND_net), .CIN4(GND_net), 
           .CIN3(GND_net), .CIN2(GND_net), .CIN1(GND_net), .CIN0(GND_net), 
           .OP10(GND_net), .OP9(VCC_net), .OP8(GND_net), .OP7(GND_net), 
           .OP6(GND_net), .OP5(GND_net), .OP4(GND_net), .OP3(GND_net), 
           .OP2(GND_net), .OP1(GND_net), .OP0(VCC_net), .R23(Data_x4[23]), 
           .R22(Data_x4[22]), .R21(Data_x4[21]), .R20(Data_x4[20]), .R19(Data_x4[19]), 
           .R18(Data_x4[18]), .R17(Data_x4[17]), .R16(Data_x4[16]), .R15(Data_x4[15]), 
           .R14(Data_x4[14]), .R13(Data_x4[13]), .R12(Data_x4[12]), .R11(Data_x4[11]), 
           .R10(Data_x4[10]), .R9(Data_x4[9]), .R8(Data_x4[8]), .R7(Data_x4[7]), 
           .R6(Data_x4[6]), .R5(Data_x4[5]), .R4(Data_x4[4]), .R3(Data_x4[3]), 
           .R2(Data_x4[2]), .R1(Data_x4[1]), .R0(Data_x4[0]));   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2398[16:40])
    defparam lat_alu_9.REG_INPUTC0_CLK = "NONE";
    defparam lat_alu_9.REG_INPUTC0_CE = "CE0";
    defparam lat_alu_9.REG_INPUTC0_RST = "RST0";
    defparam lat_alu_9.REG_INPUTC1_CLK = "NONE";
    defparam lat_alu_9.REG_INPUTC1_CE = "CE0";
    defparam lat_alu_9.REG_INPUTC1_RST = "RST0";
    defparam lat_alu_9.REG_OPCODEOP0_0_CLK = "NONE";
    defparam lat_alu_9.REG_OPCODEOP0_0_CE = "CE0";
    defparam lat_alu_9.REG_OPCODEOP0_0_RST = "RST0";
    defparam lat_alu_9.REG_OPCODEOP1_0_CLK = "NONE";
    defparam lat_alu_9.REG_OPCODEOP0_1_CLK = "NONE";
    defparam lat_alu_9.REG_OPCODEOP0_1_CE = "CE0";
    defparam lat_alu_9.REG_OPCODEOP0_1_RST = "RST0";
    defparam lat_alu_9.REG_OPCODEOP1_1_CLK = "NONE";
    defparam lat_alu_9.REG_OPCODEIN_0_CLK = "NONE";
    defparam lat_alu_9.REG_OPCODEIN_0_CE = "CE0";
    defparam lat_alu_9.REG_OPCODEIN_0_RST = "RST0";
    defparam lat_alu_9.REG_OPCODEIN_1_CLK = "NONE";
    defparam lat_alu_9.REG_OPCODEIN_1_CE = "CE0";
    defparam lat_alu_9.REG_OPCODEIN_1_RST = "RST0";
    defparam lat_alu_9.REG_OUTPUT0_CLK = "NONE";
    defparam lat_alu_9.REG_OUTPUT0_CE = "CE0";
    defparam lat_alu_9.REG_OUTPUT0_RST = "RST0";
    defparam lat_alu_9.REG_OUTPUT1_CLK = "NONE";
    defparam lat_alu_9.REG_OUTPUT1_CE = "CE0";
    defparam lat_alu_9.REG_OUTPUT1_RST = "RST0";
    defparam lat_alu_9.REG_FLAG_CLK = "NONE";
    defparam lat_alu_9.REG_FLAG_CE = "CE0";
    defparam lat_alu_9.REG_FLAG_RST = "RST0";
    defparam lat_alu_9.MCPAT_SOURCE = "STATIC";
    defparam lat_alu_9.MASKPAT_SOURCE = "STATIC";
    defparam lat_alu_9.MASK01 = "0x00000000000000";
    defparam lat_alu_9.REG_INPUTCFB_CLK = "NONE";
    defparam lat_alu_9.REG_INPUTCFB_CE = "CE0";
    defparam lat_alu_9.REG_INPUTCFB_RST = "RST0";
    defparam lat_alu_9.CLK0_DIV = "ENABLED";
    defparam lat_alu_9.CLK1_DIV = "ENABLED";
    defparam lat_alu_9.CLK2_DIV = "ENABLED";
    defparam lat_alu_9.CLK3_DIV = "ENABLED";
    defparam lat_alu_9.MCPAT = "0x00000000000000";
    defparam lat_alu_9.MASKPAT = "0x00000000000000";
    defparam lat_alu_9.RNDPAT = "0x00000000000000";
    defparam lat_alu_9.GSR = "DISABLED";
    defparam lat_alu_9.RESETMODE = "SYNC";
    defparam lat_alu_9.MULT9_MODE = "DISABLED";
    defparam lat_alu_9.LEGACY = "DISABLED";
    ALU54B lat_alu_3 (.CE3(GND_net), .CE2(GND_net), .CE1(GND_net), .CE0(VCC_net), 
           .CLK3(GND_net), .CLK2(GND_net), .CLK1(GND_net), .CLK0(GND_net), 
           .RST3(GND_net), .RST2(GND_net), .RST1(GND_net), .RST0(GND_net), 
           .SIGNEDIA(n4490), .SIGNEDIB(n4563), .SIGNEDCIN(GND_net), .A35(n4489), 
           .A34(n4488), .A33(n4487), .A32(n4486), .A31(n4485), .A30(n4484), 
           .A29(n4483), .A28(n4482), .A27(n4481), .A26(n4480), .A25(n4479), 
           .A24(n4478), .A23(n4477), .A22(n4476), .A21(n4475), .A20(n4474), 
           .A19(n4473), .A18(n4472), .A17(n4471), .A16(n4470), .A15(n4469), 
           .A14(n4468), .A13(n4467), .A12(n4466), .A11(n4465), .A10(n4464), 
           .A9(n4463), .A8(n4462), .A7(n4461), .A6(n4460), .A5(n4459), 
           .A4(n4458), .A3(n4457), .A2(n4456), .A1(n4455), .A0(n4454), 
           .B35(n4562), .B34(n4561), .B33(n4560), .B32(n4559), .B31(n4558), 
           .B30(n4557), .B29(n4556), .B28(n4555), .B27(n4554), .B26(n4553), 
           .B25(n4552), .B24(n4551), .B23(n4550), .B22(n4549), .B21(n4548), 
           .B20(n4547), .B19(n4546), .B18(n4545), .B17(n4544), .B16(n4543), 
           .B15(n4542), .B14(n4541), .B13(n4540), .B12(n4539), .B11(n4538), 
           .B10(n4537), .B9(n4536), .B8(n4535), .B7(n4534), .B6(n4533), 
           .B5(n4532), .B4(n4531), .B3(n4530), .B2(n4529), .B1(n4528), 
           .B0(n4527), .C53(GND_net), .C52(GND_net), .C51(GND_net), 
           .C50(GND_net), .C49(GND_net), .C48(GND_net), .C47(GND_net), 
           .C46(GND_net), .C45(GND_net), .C44(GND_net), .C43(GND_net), 
           .C42(GND_net), .C41(GND_net), .C40(GND_net), .C39(GND_net), 
           .C38(GND_net), .C37(GND_net), .C36(GND_net), .C35(GND_net), 
           .C34(GND_net), .C33(GND_net), .C32(GND_net), .C31(GND_net), 
           .C30(GND_net), .C29(GND_net), .C28(GND_net), .C27(GND_net), 
           .C26(GND_net), .C25(GND_net), .C24(GND_net), .C23(GND_net), 
           .C22(GND_net), .C21(GND_net), .C20(GND_net), .C19(GND_net), 
           .C18(GND_net), .C17(GND_net), .C16(GND_net), .C15(GND_net), 
           .C14(GND_net), .C13(GND_net), .C12(GND_net), .C11(GND_net), 
           .C10(GND_net), .C9(GND_net), .C8(GND_net), .C7(GND_net), 
           .C6(GND_net), .C5(GND_net), .C4(GND_net), .C3(GND_net), .C2(GND_net), 
           .C1(GND_net), .C0(GND_net), .CFB53(GND_net), .CFB52(GND_net), 
           .CFB51(GND_net), .CFB50(GND_net), .CFB49(GND_net), .CFB48(GND_net), 
           .CFB47(GND_net), .CFB46(GND_net), .CFB45(GND_net), .CFB44(GND_net), 
           .CFB43(GND_net), .CFB42(GND_net), .CFB41(GND_net), .CFB40(GND_net), 
           .CFB39(GND_net), .CFB38(GND_net), .CFB37(GND_net), .CFB36(GND_net), 
           .CFB35(GND_net), .CFB34(GND_net), .CFB33(GND_net), .CFB32(GND_net), 
           .CFB31(GND_net), .CFB30(GND_net), .CFB29(GND_net), .CFB28(GND_net), 
           .CFB27(GND_net), .CFB26(GND_net), .CFB25(GND_net), .CFB24(GND_net), 
           .CFB23(GND_net), .CFB22(GND_net), .CFB21(GND_net), .CFB20(GND_net), 
           .CFB19(GND_net), .CFB18(GND_net), .CFB17(GND_net), .CFB16(GND_net), 
           .CFB15(GND_net), .CFB14(GND_net), .CFB13(GND_net), .CFB12(GND_net), 
           .CFB11(GND_net), .CFB10(GND_net), .CFB9(GND_net), .CFB8(GND_net), 
           .CFB7(GND_net), .CFB6(GND_net), .CFB5(GND_net), .CFB4(GND_net), 
           .CFB3(GND_net), .CFB2(GND_net), .CFB1(GND_net), .CFB0(GND_net), 
           .MA35(n4526), .MA34(n4525), .MA33(n4524), .MA32(n4523), .MA31(n4522), 
           .MA30(n4521), .MA29(n4520), .MA28(n4519), .MA27(n4518), .MA26(n4517), 
           .MA25(n4516), .MA24(n4515), .MA23(n4514), .MA22(n4513), .MA21(n4512), 
           .MA20(n4511), .MA19(n4510), .MA18(n4509), .MA17(n4508), .MA16(n4507), 
           .MA15(n4506), .MA14(n4505), .MA13(n4504), .MA12(n4503), .MA11(n4502), 
           .MA10(n4501), .MA9(n4500), .MA8(n4499), .MA7(n4498), .MA6(n4497), 
           .MA5(n4496), .MA4(n4495), .MA3(n4494), .MA2(n4493), .MA1(n4492), 
           .MA0(n4491), .MB35(n4599), .MB34(n4598), .MB33(n4597), .MB32(n4596), 
           .MB31(n4595), .MB30(n4594), .MB29(n4593), .MB28(n4592), .MB27(n4591), 
           .MB26(n4590), .MB25(n4589), .MB24(n4588), .MB23(n4587), .MB22(n4586), 
           .MB21(n4585), .MB20(n4584), .MB19(n4583), .MB18(n4582), .MB17(n4581), 
           .MB16(n4580), .MB15(n4579), .MB14(n4578), .MB13(n4577), .MB12(n4576), 
           .MB11(n4575), .MB10(n4574), .MB9(n4573), .MB8(n4572), .MB7(n4571), 
           .MB6(n4570), .MB5(n4569), .MB4(n4568), .MB3(n4567), .MB2(n4566), 
           .MB1(n4565), .MB0(n4564), .CIN53(GND_net), .CIN52(GND_net), 
           .CIN51(GND_net), .CIN50(GND_net), .CIN49(GND_net), .CIN48(GND_net), 
           .CIN47(GND_net), .CIN46(GND_net), .CIN45(GND_net), .CIN44(GND_net), 
           .CIN43(GND_net), .CIN42(GND_net), .CIN41(GND_net), .CIN40(GND_net), 
           .CIN39(GND_net), .CIN38(GND_net), .CIN37(GND_net), .CIN36(GND_net), 
           .CIN35(GND_net), .CIN34(GND_net), .CIN33(GND_net), .CIN32(GND_net), 
           .CIN31(GND_net), .CIN30(GND_net), .CIN29(GND_net), .CIN28(GND_net), 
           .CIN27(GND_net), .CIN26(GND_net), .CIN25(GND_net), .CIN24(GND_net), 
           .CIN23(GND_net), .CIN22(GND_net), .CIN21(GND_net), .CIN20(GND_net), 
           .CIN19(GND_net), .CIN18(GND_net), .CIN17(GND_net), .CIN16(GND_net), 
           .CIN15(GND_net), .CIN14(GND_net), .CIN13(GND_net), .CIN12(GND_net), 
           .CIN11(GND_net), .CIN10(GND_net), .CIN9(GND_net), .CIN8(GND_net), 
           .CIN7(GND_net), .CIN6(GND_net), .CIN5(GND_net), .CIN4(GND_net), 
           .CIN3(GND_net), .CIN2(GND_net), .CIN1(GND_net), .CIN0(GND_net), 
           .OP10(GND_net), .OP9(VCC_net), .OP8(GND_net), .OP7(GND_net), 
           .OP6(GND_net), .OP5(GND_net), .OP4(GND_net), .OP3(GND_net), 
           .OP2(GND_net), .OP1(GND_net), .OP0(VCC_net), .R23(Data_x12[23]), 
           .R22(Data_x12[22]), .R21(Data_x12[21]), .R20(Data_x12[20]), 
           .R19(Data_x12[19]), .R18(Data_x12[18]), .R17(Data_x12[17]), 
           .R16(Data_x12[16]), .R15(Data_x12[15]), .R14(Data_x12[14]), 
           .R13(Data_x12[13]), .R12(Data_x12[12]), .R11(Data_x12[11]), 
           .R10(Data_x12[10]), .R9(Data_x12[9]), .R8(Data_x12[8]), .R7(Data_x12[7]), 
           .R6(Data_x12[6]), .R5(Data_x12[5]), .R4(Data_x12[4]), .R3(Data_x12[3]), 
           .R2(Data_x12[2]), .R1(Data_x12[1]), .R0(Data_x12[0]));   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2398[16:40])
    defparam lat_alu_3.REG_INPUTC0_CLK = "NONE";
    defparam lat_alu_3.REG_INPUTC0_CE = "CE0";
    defparam lat_alu_3.REG_INPUTC0_RST = "RST0";
    defparam lat_alu_3.REG_INPUTC1_CLK = "NONE";
    defparam lat_alu_3.REG_INPUTC1_CE = "CE0";
    defparam lat_alu_3.REG_INPUTC1_RST = "RST0";
    defparam lat_alu_3.REG_OPCODEOP0_0_CLK = "NONE";
    defparam lat_alu_3.REG_OPCODEOP0_0_CE = "CE0";
    defparam lat_alu_3.REG_OPCODEOP0_0_RST = "RST0";
    defparam lat_alu_3.REG_OPCODEOP1_0_CLK = "NONE";
    defparam lat_alu_3.REG_OPCODEOP0_1_CLK = "NONE";
    defparam lat_alu_3.REG_OPCODEOP0_1_CE = "CE0";
    defparam lat_alu_3.REG_OPCODEOP0_1_RST = "RST0";
    defparam lat_alu_3.REG_OPCODEOP1_1_CLK = "NONE";
    defparam lat_alu_3.REG_OPCODEIN_0_CLK = "NONE";
    defparam lat_alu_3.REG_OPCODEIN_0_CE = "CE0";
    defparam lat_alu_3.REG_OPCODEIN_0_RST = "RST0";
    defparam lat_alu_3.REG_OPCODEIN_1_CLK = "NONE";
    defparam lat_alu_3.REG_OPCODEIN_1_CE = "CE0";
    defparam lat_alu_3.REG_OPCODEIN_1_RST = "RST0";
    defparam lat_alu_3.REG_OUTPUT0_CLK = "NONE";
    defparam lat_alu_3.REG_OUTPUT0_CE = "CE0";
    defparam lat_alu_3.REG_OUTPUT0_RST = "RST0";
    defparam lat_alu_3.REG_OUTPUT1_CLK = "NONE";
    defparam lat_alu_3.REG_OUTPUT1_CE = "CE0";
    defparam lat_alu_3.REG_OUTPUT1_RST = "RST0";
    defparam lat_alu_3.REG_FLAG_CLK = "NONE";
    defparam lat_alu_3.REG_FLAG_CE = "CE0";
    defparam lat_alu_3.REG_FLAG_RST = "RST0";
    defparam lat_alu_3.MCPAT_SOURCE = "STATIC";
    defparam lat_alu_3.MASKPAT_SOURCE = "STATIC";
    defparam lat_alu_3.MASK01 = "0x00000000000000";
    defparam lat_alu_3.REG_INPUTCFB_CLK = "NONE";
    defparam lat_alu_3.REG_INPUTCFB_CE = "CE0";
    defparam lat_alu_3.REG_INPUTCFB_RST = "RST0";
    defparam lat_alu_3.CLK0_DIV = "ENABLED";
    defparam lat_alu_3.CLK1_DIV = "ENABLED";
    defparam lat_alu_3.CLK2_DIV = "ENABLED";
    defparam lat_alu_3.CLK3_DIV = "ENABLED";
    defparam lat_alu_3.MCPAT = "0x00000000000000";
    defparam lat_alu_3.MASKPAT = "0x00000000000000";
    defparam lat_alu_3.RNDPAT = "0x00000000000000";
    defparam lat_alu_3.GSR = "DISABLED";
    defparam lat_alu_3.RESETMODE = "SYNC";
    defparam lat_alu_3.MULT9_MODE = "DISABLED";
    defparam lat_alu_3.LEGACY = "DISABLED";
    MULT18X18D lat_mult_8 (.A17(GND_net), .A16(GND_net), .A15(GND_net), 
            .A14(GND_net), .A13(GND_net), .A12(GND_net), .A11(GND_net), 
            .A10(GND_net), .A9(GND_net), .A8(GND_net), .A7(GND_net), 
            .A6(GND_net), .A5(Data_c_23), .A4(Data_c_22), .A3(Data_c_21), 
            .A2(Data_c_20), .A1(Data_c_19), .A0(Data_c_18), .B17(GND_net), 
            .B16(GND_net), .B15(GND_net), .B14(GND_net), .B13(GND_net), 
            .B12(GND_net), .B11(GND_net), .B10(GND_net), .B9(GND_net), 
            .B8(GND_net), .B7(GND_net), .B6(GND_net), .B5(GND_net), 
            .B4(GND_net), .B3(GND_net), .B2(VCC_net), .B1(GND_net), 
            .B0(VCC_net), .C17(GND_net), .C16(GND_net), .C15(GND_net), 
            .C14(GND_net), .C13(GND_net), .C12(GND_net), .C11(GND_net), 
            .C10(GND_net), .C9(GND_net), .C8(GND_net), .C7(GND_net), 
            .C6(GND_net), .C5(GND_net), .C4(GND_net), .C3(GND_net), 
            .C2(GND_net), .C1(GND_net), .C0(GND_net), .SIGNEDA(GND_net), 
            .SIGNEDB(GND_net), .SOURCEA(GND_net), .SOURCEB(GND_net), .CLK3(GND_net), 
            .CLK2(GND_net), .CLK1(GND_net), .CLK0(GND_net), .CE3(GND_net), 
            .CE2(GND_net), .CE1(GND_net), .CE0(VCC_net), .RST3(GND_net), 
            .RST2(GND_net), .RST1(GND_net), .RST0(GND_net), .SRIA17(GND_net), 
            .SRIA16(GND_net), .SRIA15(GND_net), .SRIA14(GND_net), .SRIA13(GND_net), 
            .SRIA12(GND_net), .SRIA11(GND_net), .SRIA10(GND_net), .SRIA9(GND_net), 
            .SRIA8(GND_net), .SRIA7(GND_net), .SRIA6(GND_net), .SRIA5(GND_net), 
            .SRIA4(GND_net), .SRIA3(GND_net), .SRIA2(GND_net), .SRIA1(GND_net), 
            .SRIA0(GND_net), .SRIB17(GND_net), .SRIB16(GND_net), .SRIB15(GND_net), 
            .SRIB14(GND_net), .SRIB13(GND_net), .SRIB12(GND_net), .SRIB11(GND_net), 
            .SRIB10(GND_net), .SRIB9(GND_net), .SRIB8(GND_net), .SRIB7(GND_net), 
            .SRIB6(GND_net), .SRIB5(GND_net), .SRIB4(GND_net), .SRIB3(GND_net), 
            .SRIB2(GND_net), .SRIB1(GND_net), .SRIB0(GND_net), .ROA17(n4993), 
            .ROA16(n4992), .ROA15(n4991), .ROA14(n4990), .ROA13(n4989), 
            .ROA12(n4988), .ROA11(n4987), .ROA10(n4986), .ROA9(n4985), 
            .ROA8(n4984), .ROA7(n4983), .ROA6(n4982), .ROA5(n4981), 
            .ROA4(n4980), .ROA3(n4979), .ROA2(n4978), .ROA1(n4977), 
            .ROA0(n4976), .ROB17(n5011), .ROB16(n5010), .ROB15(n5009), 
            .ROB14(n5008), .ROB13(n5007), .ROB12(n5006), .ROB11(n5005), 
            .ROB10(n5004), .ROB9(n5003), .ROB8(n5002), .ROB7(n5001), 
            .ROB6(n5000), .ROB5(n4999), .ROB4(n4998), .ROB3(n4997), 
            .ROB2(n4996), .ROB1(n4995), .ROB0(n4994), .P35(n5048), .P34(n5047), 
            .P33(n5046), .P32(n5045), .P31(n5044), .P30(n5043), .P29(n5042), 
            .P28(n5041), .P27(n5040), .P26(n5039), .P25(n5038), .P24(n5037), 
            .P23(n5036), .P22(n5035), .P21(n5034), .P20(n5033), .P19(n5032), 
            .P18(n5031), .P17(n5030), .P16(n5029), .P15(n5028), .P14(n5027), 
            .P13(n5026), .P12(n5025), .P11(n5024), .P10(n5023), .P9(n5022), 
            .P8(n5021), .P7(n5020), .P6(n5019), .P5(n5018), .P4(n5017), 
            .P3(n5016), .P2(n5015), .P1(n5014), .P0(n5013), .SIGNEDP(n5012));   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2398[16:40])
    defparam lat_mult_8.REG_INPUTA_CLK = "NONE";
    defparam lat_mult_8.REG_INPUTA_CE = "CE0";
    defparam lat_mult_8.REG_INPUTA_RST = "RST0";
    defparam lat_mult_8.REG_INPUTB_CLK = "NONE";
    defparam lat_mult_8.REG_INPUTB_CE = "CE0";
    defparam lat_mult_8.REG_INPUTB_RST = "RST0";
    defparam lat_mult_8.REG_INPUTC_CLK = "NONE";
    defparam lat_mult_8.REG_INPUTC_CE = "CE0";
    defparam lat_mult_8.REG_INPUTC_RST = "RST0";
    defparam lat_mult_8.REG_PIPELINE_CLK = "NONE";
    defparam lat_mult_8.REG_PIPELINE_CE = "CE0";
    defparam lat_mult_8.REG_PIPELINE_RST = "RST0";
    defparam lat_mult_8.REG_OUTPUT_CLK = "NONE";
    defparam lat_mult_8.REG_OUTPUT_CE = "CE0";
    defparam lat_mult_8.REG_OUTPUT_RST = "RST0";
    defparam lat_mult_8.CLK0_DIV = "ENABLED";
    defparam lat_mult_8.CLK1_DIV = "ENABLED";
    defparam lat_mult_8.CLK2_DIV = "ENABLED";
    defparam lat_mult_8.CLK3_DIV = "ENABLED";
    defparam lat_mult_8.HIGHSPEED_CLK = "NONE";
    defparam lat_mult_8.GSR = "DISABLED";
    defparam lat_mult_8.CAS_MATCH_REG = "FALSE";
    defparam lat_mult_8.SOURCEB_MODE = "B_SHIFT";
    defparam lat_mult_8.MULT_BYPASS = "DISABLED";
    defparam lat_mult_8.RESETMODE = "SYNC";
    MULT18X18D Data_23__I_0_17_mult_2 (.A17(Data_c_17), .A16(Data_c_16), 
            .A15(Data_c_15), .A14(Data_c_14), .A13(Data_c_13), .A12(Data_c_12), 
            .A11(Data_c_11), .A10(Data_c_10), .A9(Data_c_9), .A8(Data_c_8), 
            .A7(Data_c_7), .A6(Data_c_6), .A5(Data_c_5), .A4(Data_c_4), 
            .A3(Data_c_3), .A2(Data_c_2), .A1(Data_c_1), .A0(Data_c_0), 
            .B17(GND_net), .B16(GND_net), .B15(GND_net), .B14(GND_net), 
            .B13(GND_net), .B12(GND_net), .B11(GND_net), .B10(GND_net), 
            .B9(GND_net), .B8(GND_net), .B7(GND_net), .B6(GND_net), 
            .B5(GND_net), .B4(GND_net), .B3(GND_net), .B2(VCC_net), 
            .B1(GND_net), .B0(VCC_net), .C17(GND_net), .C16(GND_net), 
            .C15(GND_net), .C14(GND_net), .C13(GND_net), .C12(GND_net), 
            .C11(GND_net), .C10(GND_net), .C9(GND_net), .C8(GND_net), 
            .C7(GND_net), .C6(GND_net), .C5(GND_net), .C4(GND_net), 
            .C3(GND_net), .C2(GND_net), .C1(GND_net), .C0(GND_net), 
            .SIGNEDA(GND_net), .SIGNEDB(GND_net), .SOURCEA(GND_net), .SOURCEB(GND_net), 
            .CLK3(GND_net), .CLK2(GND_net), .CLK1(GND_net), .CLK0(GND_net), 
            .CE3(GND_net), .CE2(GND_net), .CE1(GND_net), .CE0(VCC_net), 
            .RST3(GND_net), .RST2(GND_net), .RST1(GND_net), .RST0(GND_net), 
            .SRIA17(GND_net), .SRIA16(GND_net), .SRIA15(GND_net), .SRIA14(GND_net), 
            .SRIA13(GND_net), .SRIA12(GND_net), .SRIA11(GND_net), .SRIA10(GND_net), 
            .SRIA9(GND_net), .SRIA8(GND_net), .SRIA7(GND_net), .SRIA6(GND_net), 
            .SRIA5(GND_net), .SRIA4(GND_net), .SRIA3(GND_net), .SRIA2(GND_net), 
            .SRIA1(GND_net), .SRIA0(GND_net), .SRIB17(GND_net), .SRIB16(GND_net), 
            .SRIB15(GND_net), .SRIB14(GND_net), .SRIB13(GND_net), .SRIB12(GND_net), 
            .SRIB11(GND_net), .SRIB10(GND_net), .SRIB9(GND_net), .SRIB8(GND_net), 
            .SRIB7(GND_net), .SRIB6(GND_net), .SRIB5(GND_net), .SRIB4(GND_net), 
            .SRIB3(GND_net), .SRIB2(GND_net), .SRIB1(GND_net), .SRIB0(GND_net), 
            .ROA17(n4920), .ROA16(n4919), .ROA15(n4918), .ROA14(n4917), 
            .ROA13(n4916), .ROA12(n4915), .ROA11(n4914), .ROA10(n4913), 
            .ROA9(n4912), .ROA8(n4911), .ROA7(n4910), .ROA6(n4909), 
            .ROA5(n4908), .ROA4(n4907), .ROA3(n4906), .ROA2(n4905), 
            .ROA1(n4904), .ROA0(n4903), .ROB17(n4938), .ROB16(n4937), 
            .ROB15(n4936), .ROB14(n4935), .ROB13(n4934), .ROB12(n4933), 
            .ROB11(n4932), .ROB10(n4931), .ROB9(n4930), .ROB8(n4929), 
            .ROB7(n4928), .ROB6(n4927), .ROB5(n4926), .ROB4(n4925), 
            .ROB3(n4924), .ROB2(n4923), .ROB1(n4922), .ROB0(n4921), 
            .P35(n4975), .P34(n4974), .P33(n4973), .P32(n4972), .P31(n4971), 
            .P30(n4970), .P29(n4969), .P28(n4968), .P27(n4967), .P26(n4966), 
            .P25(n4965), .P24(n4964), .P23(n4963), .P22(n4962), .P21(n4961), 
            .P20(n4960), .P19(n4959), .P18(n4958), .P17(n4957), .P16(n4956), 
            .P15(n4955), .P14(n4954), .P13(n4953), .P12(n4952), .P11(n4951), 
            .P10(n4950), .P9(n4949), .P8(n4948), .P7(n4947), .P6(n4946), 
            .P5(n4945), .P4(n4944), .P3(n4943), .P2(n4942), .P1(n4941), 
            .P0(n4940), .SIGNEDP(n4939));   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2398[16:40])
    defparam Data_23__I_0_17_mult_2.REG_INPUTA_CLK = "NONE";
    defparam Data_23__I_0_17_mult_2.REG_INPUTA_CE = "CE0";
    defparam Data_23__I_0_17_mult_2.REG_INPUTA_RST = "RST0";
    defparam Data_23__I_0_17_mult_2.REG_INPUTB_CLK = "NONE";
    defparam Data_23__I_0_17_mult_2.REG_INPUTB_CE = "CE0";
    defparam Data_23__I_0_17_mult_2.REG_INPUTB_RST = "RST0";
    defparam Data_23__I_0_17_mult_2.REG_INPUTC_CLK = "NONE";
    defparam Data_23__I_0_17_mult_2.REG_INPUTC_CE = "CE0";
    defparam Data_23__I_0_17_mult_2.REG_INPUTC_RST = "RST0";
    defparam Data_23__I_0_17_mult_2.REG_PIPELINE_CLK = "NONE";
    defparam Data_23__I_0_17_mult_2.REG_PIPELINE_CE = "CE0";
    defparam Data_23__I_0_17_mult_2.REG_PIPELINE_RST = "RST0";
    defparam Data_23__I_0_17_mult_2.REG_OUTPUT_CLK = "NONE";
    defparam Data_23__I_0_17_mult_2.REG_OUTPUT_CE = "CE0";
    defparam Data_23__I_0_17_mult_2.REG_OUTPUT_RST = "RST0";
    defparam Data_23__I_0_17_mult_2.CLK0_DIV = "ENABLED";
    defparam Data_23__I_0_17_mult_2.CLK1_DIV = "ENABLED";
    defparam Data_23__I_0_17_mult_2.CLK2_DIV = "ENABLED";
    defparam Data_23__I_0_17_mult_2.CLK3_DIV = "ENABLED";
    defparam Data_23__I_0_17_mult_2.HIGHSPEED_CLK = "NONE";
    defparam Data_23__I_0_17_mult_2.GSR = "DISABLED";
    defparam Data_23__I_0_17_mult_2.CAS_MATCH_REG = "FALSE";
    defparam Data_23__I_0_17_mult_2.SOURCEB_MODE = "B_SHIFT";
    defparam Data_23__I_0_17_mult_2.MULT_BYPASS = "DISABLED";
    defparam Data_23__I_0_17_mult_2.RESETMODE = "SYNC";
    MULT18X18D lat_mult_2 (.A17(GND_net), .A16(GND_net), .A15(GND_net), 
            .A14(GND_net), .A13(GND_net), .A12(GND_net), .A11(GND_net), 
            .A10(GND_net), .A9(GND_net), .A8(GND_net), .A7(GND_net), 
            .A6(GND_net), .A5(Data_c_23), .A4(Data_c_22), .A3(Data_c_21), 
            .A2(Data_c_20), .A1(Data_c_19), .A0(Data_c_18), .B17(GND_net), 
            .B16(GND_net), .B15(GND_net), .B14(GND_net), .B13(GND_net), 
            .B12(GND_net), .B11(GND_net), .B10(GND_net), .B9(GND_net), 
            .B8(GND_net), .B7(GND_net), .B6(GND_net), .B5(GND_net), 
            .B4(GND_net), .B3(VCC_net), .B2(VCC_net), .B1(GND_net), 
            .B0(VCC_net), .C17(GND_net), .C16(GND_net), .C15(GND_net), 
            .C14(GND_net), .C13(GND_net), .C12(GND_net), .C11(GND_net), 
            .C10(GND_net), .C9(GND_net), .C8(GND_net), .C7(GND_net), 
            .C6(GND_net), .C5(GND_net), .C4(GND_net), .C3(GND_net), 
            .C2(GND_net), .C1(GND_net), .C0(GND_net), .SIGNEDA(GND_net), 
            .SIGNEDB(GND_net), .SOURCEA(GND_net), .SOURCEB(GND_net), .CLK3(GND_net), 
            .CLK2(GND_net), .CLK1(GND_net), .CLK0(GND_net), .CE3(GND_net), 
            .CE2(GND_net), .CE1(GND_net), .CE0(VCC_net), .RST3(GND_net), 
            .RST2(GND_net), .RST1(GND_net), .RST0(GND_net), .SRIA17(GND_net), 
            .SRIA16(GND_net), .SRIA15(GND_net), .SRIA14(GND_net), .SRIA13(GND_net), 
            .SRIA12(GND_net), .SRIA11(GND_net), .SRIA10(GND_net), .SRIA9(GND_net), 
            .SRIA8(GND_net), .SRIA7(GND_net), .SRIA6(GND_net), .SRIA5(GND_net), 
            .SRIA4(GND_net), .SRIA3(GND_net), .SRIA2(GND_net), .SRIA1(GND_net), 
            .SRIA0(GND_net), .SRIB17(GND_net), .SRIB16(GND_net), .SRIB15(GND_net), 
            .SRIB14(GND_net), .SRIB13(GND_net), .SRIB12(GND_net), .SRIB11(GND_net), 
            .SRIB10(GND_net), .SRIB9(GND_net), .SRIB8(GND_net), .SRIB7(GND_net), 
            .SRIB6(GND_net), .SRIB5(GND_net), .SRIB4(GND_net), .SRIB3(GND_net), 
            .SRIB2(GND_net), .SRIB1(GND_net), .SRIB0(GND_net), .ROA17(n4544), 
            .ROA16(n4543), .ROA15(n4542), .ROA14(n4541), .ROA13(n4540), 
            .ROA12(n4539), .ROA11(n4538), .ROA10(n4537), .ROA9(n4536), 
            .ROA8(n4535), .ROA7(n4534), .ROA6(n4533), .ROA5(n4532), 
            .ROA4(n4531), .ROA3(n4530), .ROA2(n4529), .ROA1(n4528), 
            .ROA0(n4527), .ROB17(n4562), .ROB16(n4561), .ROB15(n4560), 
            .ROB14(n4559), .ROB13(n4558), .ROB12(n4557), .ROB11(n4556), 
            .ROB10(n4555), .ROB9(n4554), .ROB8(n4553), .ROB7(n4552), 
            .ROB6(n4551), .ROB5(n4550), .ROB4(n4549), .ROB3(n4548), 
            .ROB2(n4547), .ROB1(n4546), .ROB0(n4545), .P35(n4599), .P34(n4598), 
            .P33(n4597), .P32(n4596), .P31(n4595), .P30(n4594), .P29(n4593), 
            .P28(n4592), .P27(n4591), .P26(n4590), .P25(n4589), .P24(n4588), 
            .P23(n4587), .P22(n4586), .P21(n4585), .P20(n4584), .P19(n4583), 
            .P18(n4582), .P17(n4581), .P16(n4580), .P15(n4579), .P14(n4578), 
            .P13(n4577), .P12(n4576), .P11(n4575), .P10(n4574), .P9(n4573), 
            .P8(n4572), .P7(n4571), .P6(n4570), .P5(n4569), .P4(n4568), 
            .P3(n4567), .P2(n4566), .P1(n4565), .P0(n4564), .SIGNEDP(n4563));   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2398[16:40])
    defparam lat_mult_2.REG_INPUTA_CLK = "NONE";
    defparam lat_mult_2.REG_INPUTA_CE = "CE0";
    defparam lat_mult_2.REG_INPUTA_RST = "RST0";
    defparam lat_mult_2.REG_INPUTB_CLK = "NONE";
    defparam lat_mult_2.REG_INPUTB_CE = "CE0";
    defparam lat_mult_2.REG_INPUTB_RST = "RST0";
    defparam lat_mult_2.REG_INPUTC_CLK = "NONE";
    defparam lat_mult_2.REG_INPUTC_CE = "CE0";
    defparam lat_mult_2.REG_INPUTC_RST = "RST0";
    defparam lat_mult_2.REG_PIPELINE_CLK = "NONE";
    defparam lat_mult_2.REG_PIPELINE_CE = "CE0";
    defparam lat_mult_2.REG_PIPELINE_RST = "RST0";
    defparam lat_mult_2.REG_OUTPUT_CLK = "NONE";
    defparam lat_mult_2.REG_OUTPUT_CE = "CE0";
    defparam lat_mult_2.REG_OUTPUT_RST = "RST0";
    defparam lat_mult_2.CLK0_DIV = "ENABLED";
    defparam lat_mult_2.CLK1_DIV = "ENABLED";
    defparam lat_mult_2.CLK2_DIV = "ENABLED";
    defparam lat_mult_2.CLK3_DIV = "ENABLED";
    defparam lat_mult_2.HIGHSPEED_CLK = "NONE";
    defparam lat_mult_2.GSR = "DISABLED";
    defparam lat_mult_2.CAS_MATCH_REG = "FALSE";
    defparam lat_mult_2.SOURCEB_MODE = "B_SHIFT";
    defparam lat_mult_2.MULT_BYPASS = "DISABLED";
    defparam lat_mult_2.RESETMODE = "SYNC";
    ALU54B lat_alu_7 (.CE3(GND_net), .CE2(GND_net), .CE1(GND_net), .CE0(VCC_net), 
           .CLK3(GND_net), .CLK2(GND_net), .CLK1(GND_net), .CLK0(GND_net), 
           .RST3(GND_net), .RST2(GND_net), .RST1(GND_net), .RST0(GND_net), 
           .SIGNEDIA(n4790), .SIGNEDIB(n4863), .SIGNEDCIN(GND_net), .A35(n4789), 
           .A34(n4788), .A33(n4787), .A32(n4786), .A31(n4785), .A30(n4784), 
           .A29(n4783), .A28(n4782), .A27(n4781), .A26(n4780), .A25(n4779), 
           .A24(n4778), .A23(n4777), .A22(n4776), .A21(n4775), .A20(n4774), 
           .A19(n4773), .A18(n4772), .A17(n4771), .A16(n4770), .A15(n4769), 
           .A14(n4768), .A13(n4767), .A12(n4766), .A11(n4765), .A10(n4764), 
           .A9(n4763), .A8(n4762), .A7(n4761), .A6(n4760), .A5(n4759), 
           .A4(n4758), .A3(n4757), .A2(n4756), .A1(n4755), .A0(n4754), 
           .B35(n4862), .B34(n4861), .B33(n4860), .B32(n4859), .B31(n4858), 
           .B30(n4857), .B29(n4856), .B28(n4855), .B27(n4854), .B26(n4853), 
           .B25(n4852), .B24(n4851), .B23(n4850), .B22(n4849), .B21(n4848), 
           .B20(n4847), .B19(n4846), .B18(n4845), .B17(n4844), .B16(n4843), 
           .B15(n4842), .B14(n4841), .B13(n4840), .B12(n4839), .B11(n4838), 
           .B10(n4837), .B9(n4836), .B8(n4835), .B7(n4834), .B6(n4833), 
           .B5(n4832), .B4(n4831), .B3(n4830), .B2(n4829), .B1(n4828), 
           .B0(n4827), .C53(GND_net), .C52(GND_net), .C51(GND_net), 
           .C50(GND_net), .C49(GND_net), .C48(GND_net), .C47(GND_net), 
           .C46(GND_net), .C45(GND_net), .C44(GND_net), .C43(GND_net), 
           .C42(GND_net), .C41(GND_net), .C40(GND_net), .C39(GND_net), 
           .C38(GND_net), .C37(GND_net), .C36(GND_net), .C35(GND_net), 
           .C34(GND_net), .C33(GND_net), .C32(GND_net), .C31(GND_net), 
           .C30(GND_net), .C29(GND_net), .C28(GND_net), .C27(GND_net), 
           .C26(GND_net), .C25(GND_net), .C24(GND_net), .C23(GND_net), 
           .C22(GND_net), .C21(GND_net), .C20(GND_net), .C19(GND_net), 
           .C18(GND_net), .C17(GND_net), .C16(GND_net), .C15(GND_net), 
           .C14(GND_net), .C13(GND_net), .C12(GND_net), .C11(GND_net), 
           .C10(GND_net), .C9(GND_net), .C8(GND_net), .C7(GND_net), 
           .C6(GND_net), .C5(GND_net), .C4(GND_net), .C3(GND_net), .C2(GND_net), 
           .C1(GND_net), .C0(GND_net), .CFB53(GND_net), .CFB52(GND_net), 
           .CFB51(GND_net), .CFB50(GND_net), .CFB49(GND_net), .CFB48(GND_net), 
           .CFB47(GND_net), .CFB46(GND_net), .CFB45(GND_net), .CFB44(GND_net), 
           .CFB43(GND_net), .CFB42(GND_net), .CFB41(GND_net), .CFB40(GND_net), 
           .CFB39(GND_net), .CFB38(GND_net), .CFB37(GND_net), .CFB36(GND_net), 
           .CFB35(GND_net), .CFB34(GND_net), .CFB33(GND_net), .CFB32(GND_net), 
           .CFB31(GND_net), .CFB30(GND_net), .CFB29(GND_net), .CFB28(GND_net), 
           .CFB27(GND_net), .CFB26(GND_net), .CFB25(GND_net), .CFB24(GND_net), 
           .CFB23(GND_net), .CFB22(GND_net), .CFB21(GND_net), .CFB20(GND_net), 
           .CFB19(GND_net), .CFB18(GND_net), .CFB17(GND_net), .CFB16(GND_net), 
           .CFB15(GND_net), .CFB14(GND_net), .CFB13(GND_net), .CFB12(GND_net), 
           .CFB11(GND_net), .CFB10(GND_net), .CFB9(GND_net), .CFB8(GND_net), 
           .CFB7(GND_net), .CFB6(GND_net), .CFB5(GND_net), .CFB4(GND_net), 
           .CFB3(GND_net), .CFB2(GND_net), .CFB1(GND_net), .CFB0(GND_net), 
           .MA35(n4826), .MA34(n4825), .MA33(n4824), .MA32(n4823), .MA31(n4822), 
           .MA30(n4821), .MA29(n4820), .MA28(n4819), .MA27(n4818), .MA26(n4817), 
           .MA25(n4816), .MA24(n4815), .MA23(n4814), .MA22(n4813), .MA21(n4812), 
           .MA20(n4811), .MA19(n4810), .MA18(n4809), .MA17(n4808), .MA16(n4807), 
           .MA15(n4806), .MA14(n4805), .MA13(n4804), .MA12(n4803), .MA11(n4802), 
           .MA10(n4801), .MA9(n4800), .MA8(n4799), .MA7(n4798), .MA6(n4797), 
           .MA5(n4796), .MA4(n4795), .MA3(n4794), .MA2(n4793), .MA1(n4792), 
           .MA0(n4791), .MB35(n4899), .MB34(n4898), .MB33(n4897), .MB32(n4896), 
           .MB31(n4895), .MB30(n4894), .MB29(n4893), .MB28(n4892), .MB27(n4891), 
           .MB26(n4890), .MB25(n4889), .MB24(n4888), .MB23(n4887), .MB22(n4886), 
           .MB21(n4885), .MB20(n4884), .MB19(n4883), .MB18(n4882), .MB17(n4881), 
           .MB16(n4880), .MB15(n4879), .MB14(n4878), .MB13(n4877), .MB12(n4876), 
           .MB11(n4875), .MB10(n4874), .MB9(n4873), .MB8(n4872), .MB7(n4871), 
           .MB6(n4870), .MB5(n4869), .MB4(n4868), .MB3(n4867), .MB2(n4866), 
           .MB1(n4865), .MB0(n4864), .CIN53(GND_net), .CIN52(GND_net), 
           .CIN51(GND_net), .CIN50(GND_net), .CIN49(GND_net), .CIN48(GND_net), 
           .CIN47(GND_net), .CIN46(GND_net), .CIN45(GND_net), .CIN44(GND_net), 
           .CIN43(GND_net), .CIN42(GND_net), .CIN41(GND_net), .CIN40(GND_net), 
           .CIN39(GND_net), .CIN38(GND_net), .CIN37(GND_net), .CIN36(GND_net), 
           .CIN35(GND_net), .CIN34(GND_net), .CIN33(GND_net), .CIN32(GND_net), 
           .CIN31(GND_net), .CIN30(GND_net), .CIN29(GND_net), .CIN28(GND_net), 
           .CIN27(GND_net), .CIN26(GND_net), .CIN25(GND_net), .CIN24(GND_net), 
           .CIN23(GND_net), .CIN22(GND_net), .CIN21(GND_net), .CIN20(GND_net), 
           .CIN19(GND_net), .CIN18(GND_net), .CIN17(GND_net), .CIN16(GND_net), 
           .CIN15(GND_net), .CIN14(GND_net), .CIN13(GND_net), .CIN12(GND_net), 
           .CIN11(GND_net), .CIN10(GND_net), .CIN9(GND_net), .CIN8(GND_net), 
           .CIN7(GND_net), .CIN6(GND_net), .CIN5(GND_net), .CIN4(GND_net), 
           .CIN3(GND_net), .CIN2(GND_net), .CIN1(GND_net), .CIN0(GND_net), 
           .OP10(GND_net), .OP9(VCC_net), .OP8(GND_net), .OP7(GND_net), 
           .OP6(GND_net), .OP5(GND_net), .OP4(GND_net), .OP3(GND_net), 
           .OP2(GND_net), .OP1(GND_net), .OP0(VCC_net), .R23(Data_x8[23]), 
           .R22(Data_x8[22]), .R21(Data_x8[21]), .R20(Data_x8[20]), .R19(Data_x8[19]), 
           .R18(Data_x8[18]), .R17(Data_x8[17]), .R16(Data_x8[16]), .R15(Data_x8[15]), 
           .R14(Data_x8[14]), .R13(Data_x8[13]), .R12(Data_x8[12]), .R11(Data_x8[11]), 
           .R10(Data_x8[10]), .R9(Data_x8[9]), .R8(Data_x8[8]), .R7(Data_x8[7]), 
           .R6(Data_x8[6]), .R5(Data_x8[5]), .R4(Data_x8[4]), .R3(Data_x8[3]), 
           .R2(Data_x8[2]), .R1(Data_x8[1]), .R0(Data_x8[0]));   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2398[16:40])
    defparam lat_alu_7.REG_INPUTC0_CLK = "NONE";
    defparam lat_alu_7.REG_INPUTC0_CE = "CE0";
    defparam lat_alu_7.REG_INPUTC0_RST = "RST0";
    defparam lat_alu_7.REG_INPUTC1_CLK = "NONE";
    defparam lat_alu_7.REG_INPUTC1_CE = "CE0";
    defparam lat_alu_7.REG_INPUTC1_RST = "RST0";
    defparam lat_alu_7.REG_OPCODEOP0_0_CLK = "NONE";
    defparam lat_alu_7.REG_OPCODEOP0_0_CE = "CE0";
    defparam lat_alu_7.REG_OPCODEOP0_0_RST = "RST0";
    defparam lat_alu_7.REG_OPCODEOP1_0_CLK = "NONE";
    defparam lat_alu_7.REG_OPCODEOP0_1_CLK = "NONE";
    defparam lat_alu_7.REG_OPCODEOP0_1_CE = "CE0";
    defparam lat_alu_7.REG_OPCODEOP0_1_RST = "RST0";
    defparam lat_alu_7.REG_OPCODEOP1_1_CLK = "NONE";
    defparam lat_alu_7.REG_OPCODEIN_0_CLK = "NONE";
    defparam lat_alu_7.REG_OPCODEIN_0_CE = "CE0";
    defparam lat_alu_7.REG_OPCODEIN_0_RST = "RST0";
    defparam lat_alu_7.REG_OPCODEIN_1_CLK = "NONE";
    defparam lat_alu_7.REG_OPCODEIN_1_CE = "CE0";
    defparam lat_alu_7.REG_OPCODEIN_1_RST = "RST0";
    defparam lat_alu_7.REG_OUTPUT0_CLK = "NONE";
    defparam lat_alu_7.REG_OUTPUT0_CE = "CE0";
    defparam lat_alu_7.REG_OUTPUT0_RST = "RST0";
    defparam lat_alu_7.REG_OUTPUT1_CLK = "NONE";
    defparam lat_alu_7.REG_OUTPUT1_CE = "CE0";
    defparam lat_alu_7.REG_OUTPUT1_RST = "RST0";
    defparam lat_alu_7.REG_FLAG_CLK = "NONE";
    defparam lat_alu_7.REG_FLAG_CE = "CE0";
    defparam lat_alu_7.REG_FLAG_RST = "RST0";
    defparam lat_alu_7.MCPAT_SOURCE = "STATIC";
    defparam lat_alu_7.MASKPAT_SOURCE = "STATIC";
    defparam lat_alu_7.MASK01 = "0x00000000000000";
    defparam lat_alu_7.REG_INPUTCFB_CLK = "NONE";
    defparam lat_alu_7.REG_INPUTCFB_CE = "CE0";
    defparam lat_alu_7.REG_INPUTCFB_RST = "RST0";
    defparam lat_alu_7.CLK0_DIV = "ENABLED";
    defparam lat_alu_7.CLK1_DIV = "ENABLED";
    defparam lat_alu_7.CLK2_DIV = "ENABLED";
    defparam lat_alu_7.CLK3_DIV = "ENABLED";
    defparam lat_alu_7.MCPAT = "0x00000000000000";
    defparam lat_alu_7.MASKPAT = "0x00000000000000";
    defparam lat_alu_7.RNDPAT = "0x00000000000000";
    defparam lat_alu_7.GSR = "DISABLED";
    defparam lat_alu_7.RESETMODE = "SYNC";
    defparam lat_alu_7.MULT9_MODE = "DISABLED";
    defparam lat_alu_7.LEGACY = "DISABLED";
    FIFOsm_U9 u_Fifosm14 (.clk_c(clk_c), .\adc_fifo_empty[14] (adc_fifo_empty[14]), 
            .GND_net(GND_net), .VCC_net(VCC_net), .Write_En_c(Write_En_c), 
            .\adc_fifo_rd_en[14] (adc_fifo_rd_en[14]), .Data_x14({Data_x14}), 
            .rst_c(rst_c), .adc_fifo_14_dout({adc_fifo_14_dout})) /* synthesis NGD_DRC_MASK=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(351[18:36])
    MULT18X18D lat_mult_6 (.A17(GND_net), .A16(GND_net), .A15(GND_net), 
            .A14(GND_net), .A13(GND_net), .A12(GND_net), .A11(GND_net), 
            .A10(GND_net), .A9(GND_net), .A8(GND_net), .A7(GND_net), 
            .A6(GND_net), .A5(Data_c_23), .A4(Data_c_22), .A3(Data_c_21), 
            .A2(Data_c_20), .A1(Data_c_19), .A0(Data_c_18), .B17(GND_net), 
            .B16(GND_net), .B15(GND_net), .B14(GND_net), .B13(GND_net), 
            .B12(GND_net), .B11(GND_net), .B10(GND_net), .B9(GND_net), 
            .B8(GND_net), .B7(GND_net), .B6(GND_net), .B5(GND_net), 
            .B4(GND_net), .B3(VCC_net), .B2(GND_net), .B1(GND_net), 
            .B0(VCC_net), .C17(GND_net), .C16(GND_net), .C15(GND_net), 
            .C14(GND_net), .C13(GND_net), .C12(GND_net), .C11(GND_net), 
            .C10(GND_net), .C9(GND_net), .C8(GND_net), .C7(GND_net), 
            .C6(GND_net), .C5(GND_net), .C4(GND_net), .C3(GND_net), 
            .C2(GND_net), .C1(GND_net), .C0(GND_net), .SIGNEDA(GND_net), 
            .SIGNEDB(GND_net), .SOURCEA(GND_net), .SOURCEB(GND_net), .CLK3(GND_net), 
            .CLK2(GND_net), .CLK1(GND_net), .CLK0(GND_net), .CE3(GND_net), 
            .CE2(GND_net), .CE1(GND_net), .CE0(VCC_net), .RST3(GND_net), 
            .RST2(GND_net), .RST1(GND_net), .RST0(GND_net), .SRIA17(GND_net), 
            .SRIA16(GND_net), .SRIA15(GND_net), .SRIA14(GND_net), .SRIA13(GND_net), 
            .SRIA12(GND_net), .SRIA11(GND_net), .SRIA10(GND_net), .SRIA9(GND_net), 
            .SRIA8(GND_net), .SRIA7(GND_net), .SRIA6(GND_net), .SRIA5(GND_net), 
            .SRIA4(GND_net), .SRIA3(GND_net), .SRIA2(GND_net), .SRIA1(GND_net), 
            .SRIA0(GND_net), .SRIB17(GND_net), .SRIB16(GND_net), .SRIB15(GND_net), 
            .SRIB14(GND_net), .SRIB13(GND_net), .SRIB12(GND_net), .SRIB11(GND_net), 
            .SRIB10(GND_net), .SRIB9(GND_net), .SRIB8(GND_net), .SRIB7(GND_net), 
            .SRIB6(GND_net), .SRIB5(GND_net), .SRIB4(GND_net), .SRIB3(GND_net), 
            .SRIB2(GND_net), .SRIB1(GND_net), .SRIB0(GND_net), .ROA17(n4844), 
            .ROA16(n4843), .ROA15(n4842), .ROA14(n4841), .ROA13(n4840), 
            .ROA12(n4839), .ROA11(n4838), .ROA10(n4837), .ROA9(n4836), 
            .ROA8(n4835), .ROA7(n4834), .ROA6(n4833), .ROA5(n4832), 
            .ROA4(n4831), .ROA3(n4830), .ROA2(n4829), .ROA1(n4828), 
            .ROA0(n4827), .ROB17(n4862), .ROB16(n4861), .ROB15(n4860), 
            .ROB14(n4859), .ROB13(n4858), .ROB12(n4857), .ROB11(n4856), 
            .ROB10(n4855), .ROB9(n4854), .ROB8(n4853), .ROB7(n4852), 
            .ROB6(n4851), .ROB5(n4850), .ROB4(n4849), .ROB3(n4848), 
            .ROB2(n4847), .ROB1(n4846), .ROB0(n4845), .P35(n4899), .P34(n4898), 
            .P33(n4897), .P32(n4896), .P31(n4895), .P30(n4894), .P29(n4893), 
            .P28(n4892), .P27(n4891), .P26(n4890), .P25(n4889), .P24(n4888), 
            .P23(n4887), .P22(n4886), .P21(n4885), .P20(n4884), .P19(n4883), 
            .P18(n4882), .P17(n4881), .P16(n4880), .P15(n4879), .P14(n4878), 
            .P13(n4877), .P12(n4876), .P11(n4875), .P10(n4874), .P9(n4873), 
            .P8(n4872), .P7(n4871), .P6(n4870), .P5(n4869), .P4(n4868), 
            .P3(n4867), .P2(n4866), .P1(n4865), .P0(n4864), .SIGNEDP(n4863));   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2398[16:40])
    defparam lat_mult_6.REG_INPUTA_CLK = "NONE";
    defparam lat_mult_6.REG_INPUTA_CE = "CE0";
    defparam lat_mult_6.REG_INPUTA_RST = "RST0";
    defparam lat_mult_6.REG_INPUTB_CLK = "NONE";
    defparam lat_mult_6.REG_INPUTB_CE = "CE0";
    defparam lat_mult_6.REG_INPUTB_RST = "RST0";
    defparam lat_mult_6.REG_INPUTC_CLK = "NONE";
    defparam lat_mult_6.REG_INPUTC_CE = "CE0";
    defparam lat_mult_6.REG_INPUTC_RST = "RST0";
    defparam lat_mult_6.REG_PIPELINE_CLK = "NONE";
    defparam lat_mult_6.REG_PIPELINE_CE = "CE0";
    defparam lat_mult_6.REG_PIPELINE_RST = "RST0";
    defparam lat_mult_6.REG_OUTPUT_CLK = "NONE";
    defparam lat_mult_6.REG_OUTPUT_CE = "CE0";
    defparam lat_mult_6.REG_OUTPUT_RST = "RST0";
    defparam lat_mult_6.CLK0_DIV = "ENABLED";
    defparam lat_mult_6.CLK1_DIV = "ENABLED";
    defparam lat_mult_6.CLK2_DIV = "ENABLED";
    defparam lat_mult_6.CLK3_DIV = "ENABLED";
    defparam lat_mult_6.HIGHSPEED_CLK = "NONE";
    defparam lat_mult_6.GSR = "DISABLED";
    defparam lat_mult_6.CAS_MATCH_REG = "FALSE";
    defparam lat_mult_6.SOURCEB_MODE = "B_SHIFT";
    defparam lat_mult_6.MULT_BYPASS = "DISABLED";
    defparam lat_mult_6.RESETMODE = "SYNC";
    MULT18X18D Data_23__I_0_24_mult_2 (.A17(Data_c_17), .A16(Data_c_16), 
            .A15(Data_c_15), .A14(Data_c_14), .A13(Data_c_13), .A12(Data_c_12), 
            .A11(Data_c_11), .A10(Data_c_10), .A9(Data_c_9), .A8(Data_c_8), 
            .A7(Data_c_7), .A6(Data_c_6), .A5(Data_c_5), .A4(Data_c_4), 
            .A3(Data_c_3), .A2(Data_c_2), .A1(Data_c_1), .A0(Data_c_0), 
            .B17(GND_net), .B16(GND_net), .B15(GND_net), .B14(GND_net), 
            .B13(GND_net), .B12(GND_net), .B11(GND_net), .B10(GND_net), 
            .B9(GND_net), .B8(GND_net), .B7(GND_net), .B6(GND_net), 
            .B5(GND_net), .B4(GND_net), .B3(VCC_net), .B2(VCC_net), 
            .B1(GND_net), .B0(VCC_net), .C17(GND_net), .C16(GND_net), 
            .C15(GND_net), .C14(GND_net), .C13(GND_net), .C12(GND_net), 
            .C11(GND_net), .C10(GND_net), .C9(GND_net), .C8(GND_net), 
            .C7(GND_net), .C6(GND_net), .C5(GND_net), .C4(GND_net), 
            .C3(GND_net), .C2(GND_net), .C1(GND_net), .C0(GND_net), 
            .SIGNEDA(GND_net), .SIGNEDB(GND_net), .SOURCEA(GND_net), .SOURCEB(GND_net), 
            .CLK3(GND_net), .CLK2(GND_net), .CLK1(GND_net), .CLK0(GND_net), 
            .CE3(GND_net), .CE2(GND_net), .CE1(GND_net), .CE0(VCC_net), 
            .RST3(GND_net), .RST2(GND_net), .RST1(GND_net), .RST0(GND_net), 
            .SRIA17(GND_net), .SRIA16(GND_net), .SRIA15(GND_net), .SRIA14(GND_net), 
            .SRIA13(GND_net), .SRIA12(GND_net), .SRIA11(GND_net), .SRIA10(GND_net), 
            .SRIA9(GND_net), .SRIA8(GND_net), .SRIA7(GND_net), .SRIA6(GND_net), 
            .SRIA5(GND_net), .SRIA4(GND_net), .SRIA3(GND_net), .SRIA2(GND_net), 
            .SRIA1(GND_net), .SRIA0(GND_net), .SRIB17(GND_net), .SRIB16(GND_net), 
            .SRIB15(GND_net), .SRIB14(GND_net), .SRIB13(GND_net), .SRIB12(GND_net), 
            .SRIB11(GND_net), .SRIB10(GND_net), .SRIB9(GND_net), .SRIB8(GND_net), 
            .SRIB7(GND_net), .SRIB6(GND_net), .SRIB5(GND_net), .SRIB4(GND_net), 
            .SRIB3(GND_net), .SRIB2(GND_net), .SRIB1(GND_net), .SRIB0(GND_net), 
            .ROA17(n4471), .ROA16(n4470), .ROA15(n4469), .ROA14(n4468), 
            .ROA13(n4467), .ROA12(n4466), .ROA11(n4465), .ROA10(n4464), 
            .ROA9(n4463), .ROA8(n4462), .ROA7(n4461), .ROA6(n4460), 
            .ROA5(n4459), .ROA4(n4458), .ROA3(n4457), .ROA2(n4456), 
            .ROA1(n4455), .ROA0(n4454), .ROB17(n4489), .ROB16(n4488), 
            .ROB15(n4487), .ROB14(n4486), .ROB13(n4485), .ROB12(n4484), 
            .ROB11(n4483), .ROB10(n4482), .ROB9(n4481), .ROB8(n4480), 
            .ROB7(n4479), .ROB6(n4478), .ROB5(n4477), .ROB4(n4476), 
            .ROB3(n4475), .ROB2(n4474), .ROB1(n4473), .ROB0(n4472), 
            .P35(n4526), .P34(n4525), .P33(n4524), .P32(n4523), .P31(n4522), 
            .P30(n4521), .P29(n4520), .P28(n4519), .P27(n4518), .P26(n4517), 
            .P25(n4516), .P24(n4515), .P23(n4514), .P22(n4513), .P21(n4512), 
            .P20(n4511), .P19(n4510), .P18(n4509), .P17(n4508), .P16(n4507), 
            .P15(n4506), .P14(n4505), .P13(n4504), .P12(n4503), .P11(n4502), 
            .P10(n4501), .P9(n4500), .P8(n4499), .P7(n4498), .P6(n4497), 
            .P5(n4496), .P4(n4495), .P3(n4494), .P2(n4493), .P1(n4492), 
            .P0(n4491), .SIGNEDP(n4490));   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2398[16:40])
    defparam Data_23__I_0_24_mult_2.REG_INPUTA_CLK = "NONE";
    defparam Data_23__I_0_24_mult_2.REG_INPUTA_CE = "CE0";
    defparam Data_23__I_0_24_mult_2.REG_INPUTA_RST = "RST0";
    defparam Data_23__I_0_24_mult_2.REG_INPUTB_CLK = "NONE";
    defparam Data_23__I_0_24_mult_2.REG_INPUTB_CE = "CE0";
    defparam Data_23__I_0_24_mult_2.REG_INPUTB_RST = "RST0";
    defparam Data_23__I_0_24_mult_2.REG_INPUTC_CLK = "NONE";
    defparam Data_23__I_0_24_mult_2.REG_INPUTC_CE = "CE0";
    defparam Data_23__I_0_24_mult_2.REG_INPUTC_RST = "RST0";
    defparam Data_23__I_0_24_mult_2.REG_PIPELINE_CLK = "NONE";
    defparam Data_23__I_0_24_mult_2.REG_PIPELINE_CE = "CE0";
    defparam Data_23__I_0_24_mult_2.REG_PIPELINE_RST = "RST0";
    defparam Data_23__I_0_24_mult_2.REG_OUTPUT_CLK = "NONE";
    defparam Data_23__I_0_24_mult_2.REG_OUTPUT_CE = "CE0";
    defparam Data_23__I_0_24_mult_2.REG_OUTPUT_RST = "RST0";
    defparam Data_23__I_0_24_mult_2.CLK0_DIV = "ENABLED";
    defparam Data_23__I_0_24_mult_2.CLK1_DIV = "ENABLED";
    defparam Data_23__I_0_24_mult_2.CLK2_DIV = "ENABLED";
    defparam Data_23__I_0_24_mult_2.CLK3_DIV = "ENABLED";
    defparam Data_23__I_0_24_mult_2.HIGHSPEED_CLK = "NONE";
    defparam Data_23__I_0_24_mult_2.GSR = "DISABLED";
    defparam Data_23__I_0_24_mult_2.CAS_MATCH_REG = "FALSE";
    defparam Data_23__I_0_24_mult_2.SOURCEB_MODE = "B_SHIFT";
    defparam Data_23__I_0_24_mult_2.MULT_BYPASS = "DISABLED";
    defparam Data_23__I_0_24_mult_2.RESETMODE = "SYNC";
    rgmii_tx_ddr rgmii_inst (.clk_c(clk_c), .rst_c(rst_c), .gmii_txd({gmii_txd}), 
            .buf_douto3(buf_douto3), .buf_douto2(buf_douto2), .buf_douto1(buf_douto1), 
            .buf_douto0(buf_douto0), .GND_net(GND_net), .VCC_net(VCC_net), 
            .buf_clkout(buf_clkout), .ctl_reg(ctl_reg), .buf_douto4(buf_douto4));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(465[18:42])
    MULT18X18D Data_23__I_0_20_mult_2 (.A17(Data_c_17), .A16(Data_c_16), 
            .A15(Data_c_15), .A14(Data_c_14), .A13(Data_c_13), .A12(Data_c_12), 
            .A11(Data_c_11), .A10(Data_c_10), .A9(Data_c_9), .A8(Data_c_8), 
            .A7(Data_c_7), .A6(Data_c_6), .A5(Data_c_5), .A4(Data_c_4), 
            .A3(Data_c_3), .A2(Data_c_2), .A1(Data_c_1), .A0(Data_c_0), 
            .B17(GND_net), .B16(GND_net), .B15(GND_net), .B14(GND_net), 
            .B13(GND_net), .B12(GND_net), .B11(GND_net), .B10(GND_net), 
            .B9(GND_net), .B8(GND_net), .B7(GND_net), .B6(GND_net), 
            .B5(GND_net), .B4(GND_net), .B3(VCC_net), .B2(GND_net), 
            .B1(GND_net), .B0(VCC_net), .C17(GND_net), .C16(GND_net), 
            .C15(GND_net), .C14(GND_net), .C13(GND_net), .C12(GND_net), 
            .C11(GND_net), .C10(GND_net), .C9(GND_net), .C8(GND_net), 
            .C7(GND_net), .C6(GND_net), .C5(GND_net), .C4(GND_net), 
            .C3(GND_net), .C2(GND_net), .C1(GND_net), .C0(GND_net), 
            .SIGNEDA(GND_net), .SIGNEDB(GND_net), .SOURCEA(GND_net), .SOURCEB(GND_net), 
            .CLK3(GND_net), .CLK2(GND_net), .CLK1(GND_net), .CLK0(GND_net), 
            .CE3(GND_net), .CE2(GND_net), .CE1(GND_net), .CE0(VCC_net), 
            .RST3(GND_net), .RST2(GND_net), .RST1(GND_net), .RST0(GND_net), 
            .SRIA17(GND_net), .SRIA16(GND_net), .SRIA15(GND_net), .SRIA14(GND_net), 
            .SRIA13(GND_net), .SRIA12(GND_net), .SRIA11(GND_net), .SRIA10(GND_net), 
            .SRIA9(GND_net), .SRIA8(GND_net), .SRIA7(GND_net), .SRIA6(GND_net), 
            .SRIA5(GND_net), .SRIA4(GND_net), .SRIA3(GND_net), .SRIA2(GND_net), 
            .SRIA1(GND_net), .SRIA0(GND_net), .SRIB17(GND_net), .SRIB16(GND_net), 
            .SRIB15(GND_net), .SRIB14(GND_net), .SRIB13(GND_net), .SRIB12(GND_net), 
            .SRIB11(GND_net), .SRIB10(GND_net), .SRIB9(GND_net), .SRIB8(GND_net), 
            .SRIB7(GND_net), .SRIB6(GND_net), .SRIB5(GND_net), .SRIB4(GND_net), 
            .SRIB3(GND_net), .SRIB2(GND_net), .SRIB1(GND_net), .SRIB0(GND_net), 
            .ROA17(n4771), .ROA16(n4770), .ROA15(n4769), .ROA14(n4768), 
            .ROA13(n4767), .ROA12(n4766), .ROA11(n4765), .ROA10(n4764), 
            .ROA9(n4763), .ROA8(n4762), .ROA7(n4761), .ROA6(n4760), 
            .ROA5(n4759), .ROA4(n4758), .ROA3(n4757), .ROA2(n4756), 
            .ROA1(n4755), .ROA0(n4754), .ROB17(n4789), .ROB16(n4788), 
            .ROB15(n4787), .ROB14(n4786), .ROB13(n4785), .ROB12(n4784), 
            .ROB11(n4783), .ROB10(n4782), .ROB9(n4781), .ROB8(n4780), 
            .ROB7(n4779), .ROB6(n4778), .ROB5(n4777), .ROB4(n4776), 
            .ROB3(n4775), .ROB2(n4774), .ROB1(n4773), .ROB0(n4772), 
            .P35(n4826), .P34(n4825), .P33(n4824), .P32(n4823), .P31(n4822), 
            .P30(n4821), .P29(n4820), .P28(n4819), .P27(n4818), .P26(n4817), 
            .P25(n4816), .P24(n4815), .P23(n4814), .P22(n4813), .P21(n4812), 
            .P20(n4811), .P19(n4810), .P18(n4809), .P17(n4808), .P16(n4807), 
            .P15(n4806), .P14(n4805), .P13(n4804), .P12(n4803), .P11(n4802), 
            .P10(n4801), .P9(n4800), .P8(n4799), .P7(n4798), .P6(n4797), 
            .P5(n4796), .P4(n4795), .P3(n4794), .P2(n4793), .P1(n4792), 
            .P0(n4791), .SIGNEDP(n4790));   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2398[16:40])
    defparam Data_23__I_0_20_mult_2.REG_INPUTA_CLK = "NONE";
    defparam Data_23__I_0_20_mult_2.REG_INPUTA_CE = "CE0";
    defparam Data_23__I_0_20_mult_2.REG_INPUTA_RST = "RST0";
    defparam Data_23__I_0_20_mult_2.REG_INPUTB_CLK = "NONE";
    defparam Data_23__I_0_20_mult_2.REG_INPUTB_CE = "CE0";
    defparam Data_23__I_0_20_mult_2.REG_INPUTB_RST = "RST0";
    defparam Data_23__I_0_20_mult_2.REG_INPUTC_CLK = "NONE";
    defparam Data_23__I_0_20_mult_2.REG_INPUTC_CE = "CE0";
    defparam Data_23__I_0_20_mult_2.REG_INPUTC_RST = "RST0";
    defparam Data_23__I_0_20_mult_2.REG_PIPELINE_CLK = "NONE";
    defparam Data_23__I_0_20_mult_2.REG_PIPELINE_CE = "CE0";
    defparam Data_23__I_0_20_mult_2.REG_PIPELINE_RST = "RST0";
    defparam Data_23__I_0_20_mult_2.REG_OUTPUT_CLK = "NONE";
    defparam Data_23__I_0_20_mult_2.REG_OUTPUT_CE = "CE0";
    defparam Data_23__I_0_20_mult_2.REG_OUTPUT_RST = "RST0";
    defparam Data_23__I_0_20_mult_2.CLK0_DIV = "ENABLED";
    defparam Data_23__I_0_20_mult_2.CLK1_DIV = "ENABLED";
    defparam Data_23__I_0_20_mult_2.CLK2_DIV = "ENABLED";
    defparam Data_23__I_0_20_mult_2.CLK3_DIV = "ENABLED";
    defparam Data_23__I_0_20_mult_2.HIGHSPEED_CLK = "NONE";
    defparam Data_23__I_0_20_mult_2.GSR = "DISABLED";
    defparam Data_23__I_0_20_mult_2.CAS_MATCH_REG = "FALSE";
    defparam Data_23__I_0_20_mult_2.SOURCEB_MODE = "B_SHIFT";
    defparam Data_23__I_0_20_mult_2.MULT_BYPASS = "DISABLED";
    defparam Data_23__I_0_20_mult_2.RESETMODE = "SYNC";
    ALU54B lat_alu_5 (.CE3(GND_net), .CE2(GND_net), .CE1(GND_net), .CE0(VCC_net), 
           .CLK3(GND_net), .CLK2(GND_net), .CLK1(GND_net), .CLK0(GND_net), 
           .RST3(GND_net), .RST2(GND_net), .RST1(GND_net), .RST0(GND_net), 
           .SIGNEDIA(n4640), .SIGNEDIB(n4713), .SIGNEDCIN(GND_net), .A35(n4639), 
           .A34(n4638), .A33(n4637), .A32(n4636), .A31(n4635), .A30(n4634), 
           .A29(n4633), .A28(n4632), .A27(n4631), .A26(n4630), .A25(n4629), 
           .A24(n4628), .A23(n4627), .A22(n4626), .A21(n4625), .A20(n4624), 
           .A19(n4623), .A18(n4622), .A17(n4621), .A16(n4620), .A15(n4619), 
           .A14(n4618), .A13(n4617), .A12(n4616), .A11(n4615), .A10(n4614), 
           .A9(n4613), .A8(n4612), .A7(n4611), .A6(n4610), .A5(n4609), 
           .A4(n4608), .A3(n4607), .A2(n4606), .A1(n4605), .A0(n4604), 
           .B35(n4712), .B34(n4711), .B33(n4710), .B32(n4709), .B31(n4708), 
           .B30(n4707), .B29(n4706), .B28(n4705), .B27(n4704), .B26(n4703), 
           .B25(n4702), .B24(n4701), .B23(n4700), .B22(n4699), .B21(n4698), 
           .B20(n4697), .B19(n4696), .B18(n4695), .B17(n4694), .B16(n4693), 
           .B15(n4692), .B14(n4691), .B13(n4690), .B12(n4689), .B11(n4688), 
           .B10(n4687), .B9(n4686), .B8(n4685), .B7(n4684), .B6(n4683), 
           .B5(n4682), .B4(n4681), .B3(n4680), .B2(n4679), .B1(n4678), 
           .B0(n4677), .C53(GND_net), .C52(GND_net), .C51(GND_net), 
           .C50(GND_net), .C49(GND_net), .C48(GND_net), .C47(GND_net), 
           .C46(GND_net), .C45(GND_net), .C44(GND_net), .C43(GND_net), 
           .C42(GND_net), .C41(GND_net), .C40(GND_net), .C39(GND_net), 
           .C38(GND_net), .C37(GND_net), .C36(GND_net), .C35(GND_net), 
           .C34(GND_net), .C33(GND_net), .C32(GND_net), .C31(GND_net), 
           .C30(GND_net), .C29(GND_net), .C28(GND_net), .C27(GND_net), 
           .C26(GND_net), .C25(GND_net), .C24(GND_net), .C23(GND_net), 
           .C22(GND_net), .C21(GND_net), .C20(GND_net), .C19(GND_net), 
           .C18(GND_net), .C17(GND_net), .C16(GND_net), .C15(GND_net), 
           .C14(GND_net), .C13(GND_net), .C12(GND_net), .C11(GND_net), 
           .C10(GND_net), .C9(GND_net), .C8(GND_net), .C7(GND_net), 
           .C6(GND_net), .C5(GND_net), .C4(GND_net), .C3(GND_net), .C2(GND_net), 
           .C1(GND_net), .C0(GND_net), .CFB53(GND_net), .CFB52(GND_net), 
           .CFB51(GND_net), .CFB50(GND_net), .CFB49(GND_net), .CFB48(GND_net), 
           .CFB47(GND_net), .CFB46(GND_net), .CFB45(GND_net), .CFB44(GND_net), 
           .CFB43(GND_net), .CFB42(GND_net), .CFB41(GND_net), .CFB40(GND_net), 
           .CFB39(GND_net), .CFB38(GND_net), .CFB37(GND_net), .CFB36(GND_net), 
           .CFB35(GND_net), .CFB34(GND_net), .CFB33(GND_net), .CFB32(GND_net), 
           .CFB31(GND_net), .CFB30(GND_net), .CFB29(GND_net), .CFB28(GND_net), 
           .CFB27(GND_net), .CFB26(GND_net), .CFB25(GND_net), .CFB24(GND_net), 
           .CFB23(GND_net), .CFB22(GND_net), .CFB21(GND_net), .CFB20(GND_net), 
           .CFB19(GND_net), .CFB18(GND_net), .CFB17(GND_net), .CFB16(GND_net), 
           .CFB15(GND_net), .CFB14(GND_net), .CFB13(GND_net), .CFB12(GND_net), 
           .CFB11(GND_net), .CFB10(GND_net), .CFB9(GND_net), .CFB8(GND_net), 
           .CFB7(GND_net), .CFB6(GND_net), .CFB5(GND_net), .CFB4(GND_net), 
           .CFB3(GND_net), .CFB2(GND_net), .CFB1(GND_net), .CFB0(GND_net), 
           .MA35(n4676), .MA34(n4675), .MA33(n4674), .MA32(n4673), .MA31(n4672), 
           .MA30(n4671), .MA29(n4670), .MA28(n4669), .MA27(n4668), .MA26(n4667), 
           .MA25(n4666), .MA24(n4665), .MA23(n4664), .MA22(n4663), .MA21(n4662), 
           .MA20(n4661), .MA19(n4660), .MA18(n4659), .MA17(n4658), .MA16(n4657), 
           .MA15(n4656), .MA14(n4655), .MA13(n4654), .MA12(n4653), .MA11(n4652), 
           .MA10(n4651), .MA9(n4650), .MA8(n4649), .MA7(n4648), .MA6(n4647), 
           .MA5(n4646), .MA4(n4645), .MA3(n4644), .MA2(n4643), .MA1(n4642), 
           .MA0(n4641), .MB35(n4749), .MB34(n4748), .MB33(n4747), .MB32(n4746), 
           .MB31(n4745), .MB30(n4744), .MB29(n4743), .MB28(n4742), .MB27(n4741), 
           .MB26(n4740), .MB25(n4739), .MB24(n4738), .MB23(n4737), .MB22(n4736), 
           .MB21(n4735), .MB20(n4734), .MB19(n4733), .MB18(n4732), .MB17(n4731), 
           .MB16(n4730), .MB15(n4729), .MB14(n4728), .MB13(n4727), .MB12(n4726), 
           .MB11(n4725), .MB10(n4724), .MB9(n4723), .MB8(n4722), .MB7(n4721), 
           .MB6(n4720), .MB5(n4719), .MB4(n4718), .MB3(n4717), .MB2(n4716), 
           .MB1(n4715), .MB0(n4714), .CIN53(GND_net), .CIN52(GND_net), 
           .CIN51(GND_net), .CIN50(GND_net), .CIN49(GND_net), .CIN48(GND_net), 
           .CIN47(GND_net), .CIN46(GND_net), .CIN45(GND_net), .CIN44(GND_net), 
           .CIN43(GND_net), .CIN42(GND_net), .CIN41(GND_net), .CIN40(GND_net), 
           .CIN39(GND_net), .CIN38(GND_net), .CIN37(GND_net), .CIN36(GND_net), 
           .CIN35(GND_net), .CIN34(GND_net), .CIN33(GND_net), .CIN32(GND_net), 
           .CIN31(GND_net), .CIN30(GND_net), .CIN29(GND_net), .CIN28(GND_net), 
           .CIN27(GND_net), .CIN26(GND_net), .CIN25(GND_net), .CIN24(GND_net), 
           .CIN23(GND_net), .CIN22(GND_net), .CIN21(GND_net), .CIN20(GND_net), 
           .CIN19(GND_net), .CIN18(GND_net), .CIN17(GND_net), .CIN16(GND_net), 
           .CIN15(GND_net), .CIN14(GND_net), .CIN13(GND_net), .CIN12(GND_net), 
           .CIN11(GND_net), .CIN10(GND_net), .CIN9(GND_net), .CIN8(GND_net), 
           .CIN7(GND_net), .CIN6(GND_net), .CIN5(GND_net), .CIN4(GND_net), 
           .CIN3(GND_net), .CIN2(GND_net), .CIN1(GND_net), .CIN0(GND_net), 
           .OP10(GND_net), .OP9(VCC_net), .OP8(GND_net), .OP7(GND_net), 
           .OP6(GND_net), .OP5(GND_net), .OP4(GND_net), .OP3(GND_net), 
           .OP2(GND_net), .OP1(GND_net), .OP0(VCC_net), .R23(Data_x10[23]), 
           .R22(Data_x10[22]), .R21(Data_x10[21]), .R20(Data_x10[20]), 
           .R19(Data_x10[19]), .R18(Data_x10[18]), .R17(Data_x10[17]), 
           .R16(Data_x10[16]), .R15(Data_x10[15]), .R14(Data_x10[14]), 
           .R13(Data_x10[13]), .R12(Data_x10[12]), .R11(Data_x10[11]), 
           .R10(Data_x10[10]), .R9(Data_x10[9]), .R8(Data_x10[8]), .R7(Data_x10[7]), 
           .R6(Data_x10[6]), .R5(Data_x10[5]), .R4(Data_x10[4]), .R3(Data_x10[3]), 
           .R2(Data_x10[2]), .R1(Data_x10[1]), .R0(Data_x10[0]));   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2398[16:40])
    defparam lat_alu_5.REG_INPUTC0_CLK = "NONE";
    defparam lat_alu_5.REG_INPUTC0_CE = "CE0";
    defparam lat_alu_5.REG_INPUTC0_RST = "RST0";
    defparam lat_alu_5.REG_INPUTC1_CLK = "NONE";
    defparam lat_alu_5.REG_INPUTC1_CE = "CE0";
    defparam lat_alu_5.REG_INPUTC1_RST = "RST0";
    defparam lat_alu_5.REG_OPCODEOP0_0_CLK = "NONE";
    defparam lat_alu_5.REG_OPCODEOP0_0_CE = "CE0";
    defparam lat_alu_5.REG_OPCODEOP0_0_RST = "RST0";
    defparam lat_alu_5.REG_OPCODEOP1_0_CLK = "NONE";
    defparam lat_alu_5.REG_OPCODEOP0_1_CLK = "NONE";
    defparam lat_alu_5.REG_OPCODEOP0_1_CE = "CE0";
    defparam lat_alu_5.REG_OPCODEOP0_1_RST = "RST0";
    defparam lat_alu_5.REG_OPCODEOP1_1_CLK = "NONE";
    defparam lat_alu_5.REG_OPCODEIN_0_CLK = "NONE";
    defparam lat_alu_5.REG_OPCODEIN_0_CE = "CE0";
    defparam lat_alu_5.REG_OPCODEIN_0_RST = "RST0";
    defparam lat_alu_5.REG_OPCODEIN_1_CLK = "NONE";
    defparam lat_alu_5.REG_OPCODEIN_1_CE = "CE0";
    defparam lat_alu_5.REG_OPCODEIN_1_RST = "RST0";
    defparam lat_alu_5.REG_OUTPUT0_CLK = "NONE";
    defparam lat_alu_5.REG_OUTPUT0_CE = "CE0";
    defparam lat_alu_5.REG_OUTPUT0_RST = "RST0";
    defparam lat_alu_5.REG_OUTPUT1_CLK = "NONE";
    defparam lat_alu_5.REG_OUTPUT1_CE = "CE0";
    defparam lat_alu_5.REG_OUTPUT1_RST = "RST0";
    defparam lat_alu_5.REG_FLAG_CLK = "NONE";
    defparam lat_alu_5.REG_FLAG_CE = "CE0";
    defparam lat_alu_5.REG_FLAG_RST = "RST0";
    defparam lat_alu_5.MCPAT_SOURCE = "STATIC";
    defparam lat_alu_5.MASKPAT_SOURCE = "STATIC";
    defparam lat_alu_5.MASK01 = "0x00000000000000";
    defparam lat_alu_5.REG_INPUTCFB_CLK = "NONE";
    defparam lat_alu_5.REG_INPUTCFB_CE = "CE0";
    defparam lat_alu_5.REG_INPUTCFB_RST = "RST0";
    defparam lat_alu_5.CLK0_DIV = "ENABLED";
    defparam lat_alu_5.CLK1_DIV = "ENABLED";
    defparam lat_alu_5.CLK2_DIV = "ENABLED";
    defparam lat_alu_5.CLK3_DIV = "ENABLED";
    defparam lat_alu_5.MCPAT = "0x00000000000000";
    defparam lat_alu_5.MASKPAT = "0x00000000000000";
    defparam lat_alu_5.RNDPAT = "0x00000000000000";
    defparam lat_alu_5.GSR = "DISABLED";
    defparam lat_alu_5.RESETMODE = "SYNC";
    defparam lat_alu_5.MULT9_MODE = "DISABLED";
    defparam lat_alu_5.LEGACY = "DISABLED";
    ALU54B lat_alu_1 (.CE3(GND_net), .CE2(GND_net), .CE1(GND_net), .CE0(VCC_net), 
           .CLK3(GND_net), .CLK2(GND_net), .CLK1(GND_net), .CLK0(GND_net), 
           .RST3(GND_net), .RST2(GND_net), .RST1(GND_net), .RST0(GND_net), 
           .SIGNEDIA(n4340), .SIGNEDIB(n4413), .SIGNEDCIN(GND_net), .A35(n4339), 
           .A34(n4338), .A33(n4337), .A32(n4336), .A31(n4335), .A30(n4334), 
           .A29(n4333), .A28(n4332), .A27(n4331), .A26(n4330), .A25(n4329), 
           .A24(n4328), .A23(n4327), .A22(n4326), .A21(n4325), .A20(n4324), 
           .A19(n4323), .A18(n4322), .A17(n4321), .A16(n4320), .A15(n4319), 
           .A14(n4318), .A13(n4317), .A12(n4316), .A11(n4315), .A10(n4314), 
           .A9(n4313), .A8(n4312), .A7(n4311), .A6(n4310), .A5(n4309), 
           .A4(n4308), .A3(n4307), .A2(n4306), .A1(n4305), .A0(n4304), 
           .B35(n4412), .B34(n4411), .B33(n4410), .B32(n4409), .B31(n4408), 
           .B30(n4407), .B29(n4406), .B28(n4405), .B27(n4404), .B26(n4403), 
           .B25(n4402), .B24(n4401), .B23(n4400), .B22(n4399), .B21(n4398), 
           .B20(n4397), .B19(n4396), .B18(n4395), .B17(n4394), .B16(n4393), 
           .B15(n4392), .B14(n4391), .B13(n4390), .B12(n4389), .B11(n4388), 
           .B10(n4387), .B9(n4386), .B8(n4385), .B7(n4384), .B6(n4383), 
           .B5(n4382), .B4(n4381), .B3(n4380), .B2(n4379), .B1(n4378), 
           .B0(n4377), .C53(GND_net), .C52(GND_net), .C51(GND_net), 
           .C50(GND_net), .C49(GND_net), .C48(GND_net), .C47(GND_net), 
           .C46(GND_net), .C45(GND_net), .C44(GND_net), .C43(GND_net), 
           .C42(GND_net), .C41(GND_net), .C40(GND_net), .C39(GND_net), 
           .C38(GND_net), .C37(GND_net), .C36(GND_net), .C35(GND_net), 
           .C34(GND_net), .C33(GND_net), .C32(GND_net), .C31(GND_net), 
           .C30(GND_net), .C29(GND_net), .C28(GND_net), .C27(GND_net), 
           .C26(GND_net), .C25(GND_net), .C24(GND_net), .C23(GND_net), 
           .C22(GND_net), .C21(GND_net), .C20(GND_net), .C19(GND_net), 
           .C18(GND_net), .C17(GND_net), .C16(GND_net), .C15(GND_net), 
           .C14(GND_net), .C13(GND_net), .C12(GND_net), .C11(GND_net), 
           .C10(GND_net), .C9(GND_net), .C8(GND_net), .C7(GND_net), 
           .C6(GND_net), .C5(GND_net), .C4(GND_net), .C3(GND_net), .C2(GND_net), 
           .C1(GND_net), .C0(GND_net), .CFB53(GND_net), .CFB52(GND_net), 
           .CFB51(GND_net), .CFB50(GND_net), .CFB49(GND_net), .CFB48(GND_net), 
           .CFB47(GND_net), .CFB46(GND_net), .CFB45(GND_net), .CFB44(GND_net), 
           .CFB43(GND_net), .CFB42(GND_net), .CFB41(GND_net), .CFB40(GND_net), 
           .CFB39(GND_net), .CFB38(GND_net), .CFB37(GND_net), .CFB36(GND_net), 
           .CFB35(GND_net), .CFB34(GND_net), .CFB33(GND_net), .CFB32(GND_net), 
           .CFB31(GND_net), .CFB30(GND_net), .CFB29(GND_net), .CFB28(GND_net), 
           .CFB27(GND_net), .CFB26(GND_net), .CFB25(GND_net), .CFB24(GND_net), 
           .CFB23(GND_net), .CFB22(GND_net), .CFB21(GND_net), .CFB20(GND_net), 
           .CFB19(GND_net), .CFB18(GND_net), .CFB17(GND_net), .CFB16(GND_net), 
           .CFB15(GND_net), .CFB14(GND_net), .CFB13(GND_net), .CFB12(GND_net), 
           .CFB11(GND_net), .CFB10(GND_net), .CFB9(GND_net), .CFB8(GND_net), 
           .CFB7(GND_net), .CFB6(GND_net), .CFB5(GND_net), .CFB4(GND_net), 
           .CFB3(GND_net), .CFB2(GND_net), .CFB1(GND_net), .CFB0(GND_net), 
           .MA35(n4376), .MA34(n4375), .MA33(n4374), .MA32(n4373), .MA31(n4372), 
           .MA30(n4371), .MA29(n4370), .MA28(n4369), .MA27(n4368), .MA26(n4367), 
           .MA25(n4366), .MA24(n4365), .MA23(n4364), .MA22(n4363), .MA21(n4362), 
           .MA20(n4361), .MA19(n4360), .MA18(n4359), .MA17(n4358), .MA16(n4357), 
           .MA15(n4356), .MA14(n4355), .MA13(n4354), .MA12(n4353), .MA11(n4352), 
           .MA10(n4351), .MA9(n4350), .MA8(n4349), .MA7(n4348), .MA6(n4347), 
           .MA5(n4346), .MA4(n4345), .MA3(n4344), .MA2(n4343), .MA1(n4342), 
           .MA0(n4341), .MB35(n4449), .MB34(n4448), .MB33(n4447), .MB32(n4446), 
           .MB31(n4445), .MB30(n4444), .MB29(n4443), .MB28(n4442), .MB27(n4441), 
           .MB26(n4440), .MB25(n4439), .MB24(n4438), .MB23(n4437), .MB22(n4436), 
           .MB21(n4435), .MB20(n4434), .MB19(n4433), .MB18(n4432), .MB17(n4431), 
           .MB16(n4430), .MB15(n4429), .MB14(n4428), .MB13(n4427), .MB12(n4426), 
           .MB11(n4425), .MB10(n4424), .MB9(n4423), .MB8(n4422), .MB7(n4421), 
           .MB6(n4420), .MB5(n4419), .MB4(n4418), .MB3(n4417), .MB2(n4416), 
           .MB1(n4415), .MB0(n4414), .CIN53(GND_net), .CIN52(GND_net), 
           .CIN51(GND_net), .CIN50(GND_net), .CIN49(GND_net), .CIN48(GND_net), 
           .CIN47(GND_net), .CIN46(GND_net), .CIN45(GND_net), .CIN44(GND_net), 
           .CIN43(GND_net), .CIN42(GND_net), .CIN41(GND_net), .CIN40(GND_net), 
           .CIN39(GND_net), .CIN38(GND_net), .CIN37(GND_net), .CIN36(GND_net), 
           .CIN35(GND_net), .CIN34(GND_net), .CIN33(GND_net), .CIN32(GND_net), 
           .CIN31(GND_net), .CIN30(GND_net), .CIN29(GND_net), .CIN28(GND_net), 
           .CIN27(GND_net), .CIN26(GND_net), .CIN25(GND_net), .CIN24(GND_net), 
           .CIN23(GND_net), .CIN22(GND_net), .CIN21(GND_net), .CIN20(GND_net), 
           .CIN19(GND_net), .CIN18(GND_net), .CIN17(GND_net), .CIN16(GND_net), 
           .CIN15(GND_net), .CIN14(GND_net), .CIN13(GND_net), .CIN12(GND_net), 
           .CIN11(GND_net), .CIN10(GND_net), .CIN9(GND_net), .CIN8(GND_net), 
           .CIN7(GND_net), .CIN6(GND_net), .CIN5(GND_net), .CIN4(GND_net), 
           .CIN3(GND_net), .CIN2(GND_net), .CIN1(GND_net), .CIN0(GND_net), 
           .OP10(GND_net), .OP9(VCC_net), .OP8(GND_net), .OP7(GND_net), 
           .OP6(GND_net), .OP5(GND_net), .OP4(GND_net), .OP3(GND_net), 
           .OP2(GND_net), .OP1(GND_net), .OP0(VCC_net), .R23(Data_x14[23]), 
           .R22(Data_x14[22]), .R21(Data_x14[21]), .R20(Data_x14[20]), 
           .R19(Data_x14[19]), .R18(Data_x14[18]), .R17(Data_x14[17]), 
           .R16(Data_x14[16]), .R15(Data_x14[15]), .R14(Data_x14[14]), 
           .R13(Data_x14[13]), .R12(Data_x14[12]), .R11(Data_x14[11]), 
           .R10(Data_x14[10]), .R9(Data_x14[9]), .R8(Data_x14[8]), .R7(Data_x14[7]), 
           .R6(Data_x14[6]), .R5(Data_x14[5]), .R4(Data_x14[4]), .R3(Data_x14[3]), 
           .R2(Data_x14[2]), .R1(Data_x14[1]), .R0(Data_x14[0]));   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2398[16:40])
    defparam lat_alu_1.REG_INPUTC0_CLK = "NONE";
    defparam lat_alu_1.REG_INPUTC0_CE = "CE0";
    defparam lat_alu_1.REG_INPUTC0_RST = "RST0";
    defparam lat_alu_1.REG_INPUTC1_CLK = "NONE";
    defparam lat_alu_1.REG_INPUTC1_CE = "CE0";
    defparam lat_alu_1.REG_INPUTC1_RST = "RST0";
    defparam lat_alu_1.REG_OPCODEOP0_0_CLK = "NONE";
    defparam lat_alu_1.REG_OPCODEOP0_0_CE = "CE0";
    defparam lat_alu_1.REG_OPCODEOP0_0_RST = "RST0";
    defparam lat_alu_1.REG_OPCODEOP1_0_CLK = "NONE";
    defparam lat_alu_1.REG_OPCODEOP0_1_CLK = "NONE";
    defparam lat_alu_1.REG_OPCODEOP0_1_CE = "CE0";
    defparam lat_alu_1.REG_OPCODEOP0_1_RST = "RST0";
    defparam lat_alu_1.REG_OPCODEOP1_1_CLK = "NONE";
    defparam lat_alu_1.REG_OPCODEIN_0_CLK = "NONE";
    defparam lat_alu_1.REG_OPCODEIN_0_CE = "CE0";
    defparam lat_alu_1.REG_OPCODEIN_0_RST = "RST0";
    defparam lat_alu_1.REG_OPCODEIN_1_CLK = "NONE";
    defparam lat_alu_1.REG_OPCODEIN_1_CE = "CE0";
    defparam lat_alu_1.REG_OPCODEIN_1_RST = "RST0";
    defparam lat_alu_1.REG_OUTPUT0_CLK = "NONE";
    defparam lat_alu_1.REG_OUTPUT0_CE = "CE0";
    defparam lat_alu_1.REG_OUTPUT0_RST = "RST0";
    defparam lat_alu_1.REG_OUTPUT1_CLK = "NONE";
    defparam lat_alu_1.REG_OUTPUT1_CE = "CE0";
    defparam lat_alu_1.REG_OUTPUT1_RST = "RST0";
    defparam lat_alu_1.REG_FLAG_CLK = "NONE";
    defparam lat_alu_1.REG_FLAG_CE = "CE0";
    defparam lat_alu_1.REG_FLAG_RST = "RST0";
    defparam lat_alu_1.MCPAT_SOURCE = "STATIC";
    defparam lat_alu_1.MASKPAT_SOURCE = "STATIC";
    defparam lat_alu_1.MASK01 = "0x00000000000000";
    defparam lat_alu_1.REG_INPUTCFB_CLK = "NONE";
    defparam lat_alu_1.REG_INPUTCFB_CE = "CE0";
    defparam lat_alu_1.REG_INPUTCFB_RST = "RST0";
    defparam lat_alu_1.CLK0_DIV = "ENABLED";
    defparam lat_alu_1.CLK1_DIV = "ENABLED";
    defparam lat_alu_1.CLK2_DIV = "ENABLED";
    defparam lat_alu_1.CLK3_DIV = "ENABLED";
    defparam lat_alu_1.MCPAT = "0x00000000000000";
    defparam lat_alu_1.MASKPAT = "0x00000000000000";
    defparam lat_alu_1.RNDPAT = "0x00000000000000";
    defparam lat_alu_1.GSR = "DISABLED";
    defparam lat_alu_1.RESETMODE = "SYNC";
    defparam lat_alu_1.MULT9_MODE = "DISABLED";
    defparam lat_alu_1.LEGACY = "DISABLED";
    MULT18X18D lat_mult_4 (.A17(GND_net), .A16(GND_net), .A15(GND_net), 
            .A14(GND_net), .A13(GND_net), .A12(GND_net), .A11(GND_net), 
            .A10(GND_net), .A9(GND_net), .A8(GND_net), .A7(GND_net), 
            .A6(GND_net), .A5(Data_c_23), .A4(Data_c_22), .A3(Data_c_21), 
            .A2(Data_c_20), .A1(Data_c_19), .A0(Data_c_18), .B17(GND_net), 
            .B16(GND_net), .B15(GND_net), .B14(GND_net), .B13(GND_net), 
            .B12(GND_net), .B11(GND_net), .B10(GND_net), .B9(GND_net), 
            .B8(GND_net), .B7(GND_net), .B6(GND_net), .B5(GND_net), 
            .B4(GND_net), .B3(VCC_net), .B2(GND_net), .B1(VCC_net), 
            .B0(VCC_net), .C17(GND_net), .C16(GND_net), .C15(GND_net), 
            .C14(GND_net), .C13(GND_net), .C12(GND_net), .C11(GND_net), 
            .C10(GND_net), .C9(GND_net), .C8(GND_net), .C7(GND_net), 
            .C6(GND_net), .C5(GND_net), .C4(GND_net), .C3(GND_net), 
            .C2(GND_net), .C1(GND_net), .C0(GND_net), .SIGNEDA(GND_net), 
            .SIGNEDB(GND_net), .SOURCEA(GND_net), .SOURCEB(GND_net), .CLK3(GND_net), 
            .CLK2(GND_net), .CLK1(GND_net), .CLK0(GND_net), .CE3(GND_net), 
            .CE2(GND_net), .CE1(GND_net), .CE0(VCC_net), .RST3(GND_net), 
            .RST2(GND_net), .RST1(GND_net), .RST0(GND_net), .SRIA17(GND_net), 
            .SRIA16(GND_net), .SRIA15(GND_net), .SRIA14(GND_net), .SRIA13(GND_net), 
            .SRIA12(GND_net), .SRIA11(GND_net), .SRIA10(GND_net), .SRIA9(GND_net), 
            .SRIA8(GND_net), .SRIA7(GND_net), .SRIA6(GND_net), .SRIA5(GND_net), 
            .SRIA4(GND_net), .SRIA3(GND_net), .SRIA2(GND_net), .SRIA1(GND_net), 
            .SRIA0(GND_net), .SRIB17(GND_net), .SRIB16(GND_net), .SRIB15(GND_net), 
            .SRIB14(GND_net), .SRIB13(GND_net), .SRIB12(GND_net), .SRIB11(GND_net), 
            .SRIB10(GND_net), .SRIB9(GND_net), .SRIB8(GND_net), .SRIB7(GND_net), 
            .SRIB6(GND_net), .SRIB5(GND_net), .SRIB4(GND_net), .SRIB3(GND_net), 
            .SRIB2(GND_net), .SRIB1(GND_net), .SRIB0(GND_net), .ROA17(n4694), 
            .ROA16(n4693), .ROA15(n4692), .ROA14(n4691), .ROA13(n4690), 
            .ROA12(n4689), .ROA11(n4688), .ROA10(n4687), .ROA9(n4686), 
            .ROA8(n4685), .ROA7(n4684), .ROA6(n4683), .ROA5(n4682), 
            .ROA4(n4681), .ROA3(n4680), .ROA2(n4679), .ROA1(n4678), 
            .ROA0(n4677), .ROB17(n4712), .ROB16(n4711), .ROB15(n4710), 
            .ROB14(n4709), .ROB13(n4708), .ROB12(n4707), .ROB11(n4706), 
            .ROB10(n4705), .ROB9(n4704), .ROB8(n4703), .ROB7(n4702), 
            .ROB6(n4701), .ROB5(n4700), .ROB4(n4699), .ROB3(n4698), 
            .ROB2(n4697), .ROB1(n4696), .ROB0(n4695), .P35(n4749), .P34(n4748), 
            .P33(n4747), .P32(n4746), .P31(n4745), .P30(n4744), .P29(n4743), 
            .P28(n4742), .P27(n4741), .P26(n4740), .P25(n4739), .P24(n4738), 
            .P23(n4737), .P22(n4736), .P21(n4735), .P20(n4734), .P19(n4733), 
            .P18(n4732), .P17(n4731), .P16(n4730), .P15(n4729), .P14(n4728), 
            .P13(n4727), .P12(n4726), .P11(n4725), .P10(n4724), .P9(n4723), 
            .P8(n4722), .P7(n4721), .P6(n4720), .P5(n4719), .P4(n4718), 
            .P3(n4717), .P2(n4716), .P1(n4715), .P0(n4714), .SIGNEDP(n4713));   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2398[16:40])
    defparam lat_mult_4.REG_INPUTA_CLK = "NONE";
    defparam lat_mult_4.REG_INPUTA_CE = "CE0";
    defparam lat_mult_4.REG_INPUTA_RST = "RST0";
    defparam lat_mult_4.REG_INPUTB_CLK = "NONE";
    defparam lat_mult_4.REG_INPUTB_CE = "CE0";
    defparam lat_mult_4.REG_INPUTB_RST = "RST0";
    defparam lat_mult_4.REG_INPUTC_CLK = "NONE";
    defparam lat_mult_4.REG_INPUTC_CE = "CE0";
    defparam lat_mult_4.REG_INPUTC_RST = "RST0";
    defparam lat_mult_4.REG_PIPELINE_CLK = "NONE";
    defparam lat_mult_4.REG_PIPELINE_CE = "CE0";
    defparam lat_mult_4.REG_PIPELINE_RST = "RST0";
    defparam lat_mult_4.REG_OUTPUT_CLK = "NONE";
    defparam lat_mult_4.REG_OUTPUT_CE = "CE0";
    defparam lat_mult_4.REG_OUTPUT_RST = "RST0";
    defparam lat_mult_4.CLK0_DIV = "ENABLED";
    defparam lat_mult_4.CLK1_DIV = "ENABLED";
    defparam lat_mult_4.CLK2_DIV = "ENABLED";
    defparam lat_mult_4.CLK3_DIV = "ENABLED";
    defparam lat_mult_4.HIGHSPEED_CLK = "NONE";
    defparam lat_mult_4.GSR = "DISABLED";
    defparam lat_mult_4.CAS_MATCH_REG = "FALSE";
    defparam lat_mult_4.SOURCEB_MODE = "B_SHIFT";
    defparam lat_mult_4.MULT_BYPASS = "DISABLED";
    defparam lat_mult_4.RESETMODE = "SYNC";
    OB packer_busy_pad (.I(n11977), .O(packer_busy));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(21[9:20])
    MULT18X18D lat_mult_0 (.A17(GND_net), .A16(GND_net), .A15(GND_net), 
            .A14(GND_net), .A13(GND_net), .A12(GND_net), .A11(GND_net), 
            .A10(GND_net), .A9(GND_net), .A8(GND_net), .A7(GND_net), 
            .A6(GND_net), .A5(Data_c_23), .A4(Data_c_22), .A3(Data_c_21), 
            .A2(Data_c_20), .A1(Data_c_19), .A0(Data_c_18), .B17(GND_net), 
            .B16(GND_net), .B15(GND_net), .B14(GND_net), .B13(GND_net), 
            .B12(GND_net), .B11(GND_net), .B10(GND_net), .B9(GND_net), 
            .B8(GND_net), .B7(GND_net), .B6(GND_net), .B5(GND_net), 
            .B4(GND_net), .B3(VCC_net), .B2(VCC_net), .B1(VCC_net), 
            .B0(VCC_net), .C17(GND_net), .C16(GND_net), .C15(GND_net), 
            .C14(GND_net), .C13(GND_net), .C12(GND_net), .C11(GND_net), 
            .C10(GND_net), .C9(GND_net), .C8(GND_net), .C7(GND_net), 
            .C6(GND_net), .C5(GND_net), .C4(GND_net), .C3(GND_net), 
            .C2(GND_net), .C1(GND_net), .C0(GND_net), .SIGNEDA(GND_net), 
            .SIGNEDB(GND_net), .SOURCEA(GND_net), .SOURCEB(GND_net), .CLK3(GND_net), 
            .CLK2(GND_net), .CLK1(GND_net), .CLK0(GND_net), .CE3(GND_net), 
            .CE2(GND_net), .CE1(GND_net), .CE0(VCC_net), .RST3(GND_net), 
            .RST2(GND_net), .RST1(GND_net), .RST0(GND_net), .SRIA17(GND_net), 
            .SRIA16(GND_net), .SRIA15(GND_net), .SRIA14(GND_net), .SRIA13(GND_net), 
            .SRIA12(GND_net), .SRIA11(GND_net), .SRIA10(GND_net), .SRIA9(GND_net), 
            .SRIA8(GND_net), .SRIA7(GND_net), .SRIA6(GND_net), .SRIA5(GND_net), 
            .SRIA4(GND_net), .SRIA3(GND_net), .SRIA2(GND_net), .SRIA1(GND_net), 
            .SRIA0(GND_net), .SRIB17(GND_net), .SRIB16(GND_net), .SRIB15(GND_net), 
            .SRIB14(GND_net), .SRIB13(GND_net), .SRIB12(GND_net), .SRIB11(GND_net), 
            .SRIB10(GND_net), .SRIB9(GND_net), .SRIB8(GND_net), .SRIB7(GND_net), 
            .SRIB6(GND_net), .SRIB5(GND_net), .SRIB4(GND_net), .SRIB3(GND_net), 
            .SRIB2(GND_net), .SRIB1(GND_net), .SRIB0(GND_net), .ROA17(n4394), 
            .ROA16(n4393), .ROA15(n4392), .ROA14(n4391), .ROA13(n4390), 
            .ROA12(n4389), .ROA11(n4388), .ROA10(n4387), .ROA9(n4386), 
            .ROA8(n4385), .ROA7(n4384), .ROA6(n4383), .ROA5(n4382), 
            .ROA4(n4381), .ROA3(n4380), .ROA2(n4379), .ROA1(n4378), 
            .ROA0(n4377), .ROB17(n4412), .ROB16(n4411), .ROB15(n4410), 
            .ROB14(n4409), .ROB13(n4408), .ROB12(n4407), .ROB11(n4406), 
            .ROB10(n4405), .ROB9(n4404), .ROB8(n4403), .ROB7(n4402), 
            .ROB6(n4401), .ROB5(n4400), .ROB4(n4399), .ROB3(n4398), 
            .ROB2(n4397), .ROB1(n4396), .ROB0(n4395), .P35(n4449), .P34(n4448), 
            .P33(n4447), .P32(n4446), .P31(n4445), .P30(n4444), .P29(n4443), 
            .P28(n4442), .P27(n4441), .P26(n4440), .P25(n4439), .P24(n4438), 
            .P23(n4437), .P22(n4436), .P21(n4435), .P20(n4434), .P19(n4433), 
            .P18(n4432), .P17(n4431), .P16(n4430), .P15(n4429), .P14(n4428), 
            .P13(n4427), .P12(n4426), .P11(n4425), .P10(n4424), .P9(n4423), 
            .P8(n4422), .P7(n4421), .P6(n4420), .P5(n4419), .P4(n4418), 
            .P3(n4417), .P2(n4416), .P1(n4415), .P0(n4414), .SIGNEDP(n4413));   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2398[16:40])
    defparam lat_mult_0.REG_INPUTA_CLK = "NONE";
    defparam lat_mult_0.REG_INPUTA_CE = "CE0";
    defparam lat_mult_0.REG_INPUTA_RST = "RST0";
    defparam lat_mult_0.REG_INPUTB_CLK = "NONE";
    defparam lat_mult_0.REG_INPUTB_CE = "CE0";
    defparam lat_mult_0.REG_INPUTB_RST = "RST0";
    defparam lat_mult_0.REG_INPUTC_CLK = "NONE";
    defparam lat_mult_0.REG_INPUTC_CE = "CE0";
    defparam lat_mult_0.REG_INPUTC_RST = "RST0";
    defparam lat_mult_0.REG_PIPELINE_CLK = "NONE";
    defparam lat_mult_0.REG_PIPELINE_CE = "CE0";
    defparam lat_mult_0.REG_PIPELINE_RST = "RST0";
    defparam lat_mult_0.REG_OUTPUT_CLK = "NONE";
    defparam lat_mult_0.REG_OUTPUT_CE = "CE0";
    defparam lat_mult_0.REG_OUTPUT_RST = "RST0";
    defparam lat_mult_0.CLK0_DIV = "ENABLED";
    defparam lat_mult_0.CLK1_DIV = "ENABLED";
    defparam lat_mult_0.CLK2_DIV = "ENABLED";
    defparam lat_mult_0.CLK3_DIV = "ENABLED";
    defparam lat_mult_0.HIGHSPEED_CLK = "NONE";
    defparam lat_mult_0.GSR = "DISABLED";
    defparam lat_mult_0.CAS_MATCH_REG = "FALSE";
    defparam lat_mult_0.SOURCEB_MODE = "B_SHIFT";
    defparam lat_mult_0.MULT_BYPASS = "DISABLED";
    defparam lat_mult_0.RESETMODE = "SYNC";
    CCU2C add_1040_add_4_32 (.A0(frame_len[30]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[31]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n9005), .COUT(n9006));
    defparam add_1040_add_4_32.INIT0 = 16'h555f;
    defparam add_1040_add_4_32.INIT1 = 16'h5555;
    defparam add_1040_add_4_32.INJECT1_0 = "NO";
    defparam add_1040_add_4_32.INJECT1_1 = "NO";
    OB Inst2_OB (.I(buf_clkout), .O(rgmii_txc)) /* synthesis syn_black_box=true, IO_TYPE="LVCMOS18", syn_instantiated=1, LSE_LINE_FILE_ID=48, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/lattice_projecten/ddr_forrgmii.vhd(89[15:17])
    OB Inst1_OB4 (.I(buf_douto4), .O(rgmii_txctl)) /* synthesis syn_black_box=true, IO_TYPE="LVCMOS18", syn_instantiated=1, LSE_LINE_FILE_ID=48, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/lattice_projecten/ddr_forrgmii.vhd(92[16:18])
    OB Inst1_OB3 (.I(buf_douto3), .O(rgmii_txd[3])) /* synthesis syn_black_box=true, IO_TYPE="LVCMOS18", syn_instantiated=1, LSE_LINE_FILE_ID=48, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/lattice_projecten/ddr_forrgmii.vhd(95[16:18])
    OB Inst1_OB2 (.I(buf_douto2), .O(rgmii_txd[2])) /* synthesis syn_black_box=true, IO_TYPE="LVCMOS18", syn_instantiated=1, LSE_LINE_FILE_ID=48, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/lattice_projecten/ddr_forrgmii.vhd(98[16:18])
    OB Inst1_OB1 (.I(buf_douto1), .O(rgmii_txd[1])) /* synthesis syn_black_box=true, IO_TYPE="LVCMOS18", syn_instantiated=1, LSE_LINE_FILE_ID=48, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/lattice_projecten/ddr_forrgmii.vhd(101[16:18])
    OB Inst1_OB0 (.I(buf_douto0), .O(rgmii_txd[0])) /* synthesis syn_black_box=true, IO_TYPE="LVCMOS18", syn_instantiated=1, LSE_LINE_FILE_ID=48, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/lattice_projecten/ddr_forrgmii.vhd(104[16:18])
    MULT18X18D Data_23__I_0_mult_2 (.A17(Data_c_17), .A16(Data_c_16), .A15(Data_c_15), 
            .A14(Data_c_14), .A13(Data_c_13), .A12(Data_c_12), .A11(Data_c_11), 
            .A10(Data_c_10), .A9(Data_c_9), .A8(Data_c_8), .A7(Data_c_7), 
            .A6(Data_c_6), .A5(Data_c_5), .A4(Data_c_4), .A3(Data_c_3), 
            .A2(Data_c_2), .A1(Data_c_1), .A0(Data_c_0), .B17(GND_net), 
            .B16(GND_net), .B15(GND_net), .B14(GND_net), .B13(GND_net), 
            .B12(GND_net), .B11(GND_net), .B10(GND_net), .B9(GND_net), 
            .B8(GND_net), .B7(GND_net), .B6(GND_net), .B5(GND_net), 
            .B4(GND_net), .B3(VCC_net), .B2(VCC_net), .B1(VCC_net), 
            .B0(VCC_net), .C17(GND_net), .C16(GND_net), .C15(GND_net), 
            .C14(GND_net), .C13(GND_net), .C12(GND_net), .C11(GND_net), 
            .C10(GND_net), .C9(GND_net), .C8(GND_net), .C7(GND_net), 
            .C6(GND_net), .C5(GND_net), .C4(GND_net), .C3(GND_net), 
            .C2(GND_net), .C1(GND_net), .C0(GND_net), .SIGNEDA(GND_net), 
            .SIGNEDB(GND_net), .SOURCEA(GND_net), .SOURCEB(GND_net), .CLK3(GND_net), 
            .CLK2(GND_net), .CLK1(GND_net), .CLK0(GND_net), .CE3(GND_net), 
            .CE2(GND_net), .CE1(GND_net), .CE0(VCC_net), .RST3(GND_net), 
            .RST2(GND_net), .RST1(GND_net), .RST0(GND_net), .SRIA17(GND_net), 
            .SRIA16(GND_net), .SRIA15(GND_net), .SRIA14(GND_net), .SRIA13(GND_net), 
            .SRIA12(GND_net), .SRIA11(GND_net), .SRIA10(GND_net), .SRIA9(GND_net), 
            .SRIA8(GND_net), .SRIA7(GND_net), .SRIA6(GND_net), .SRIA5(GND_net), 
            .SRIA4(GND_net), .SRIA3(GND_net), .SRIA2(GND_net), .SRIA1(GND_net), 
            .SRIA0(GND_net), .SRIB17(GND_net), .SRIB16(GND_net), .SRIB15(GND_net), 
            .SRIB14(GND_net), .SRIB13(GND_net), .SRIB12(GND_net), .SRIB11(GND_net), 
            .SRIB10(GND_net), .SRIB9(GND_net), .SRIB8(GND_net), .SRIB7(GND_net), 
            .SRIB6(GND_net), .SRIB5(GND_net), .SRIB4(GND_net), .SRIB3(GND_net), 
            .SRIB2(GND_net), .SRIB1(GND_net), .SRIB0(GND_net), .ROA17(n4321), 
            .ROA16(n4320), .ROA15(n4319), .ROA14(n4318), .ROA13(n4317), 
            .ROA12(n4316), .ROA11(n4315), .ROA10(n4314), .ROA9(n4313), 
            .ROA8(n4312), .ROA7(n4311), .ROA6(n4310), .ROA5(n4309), 
            .ROA4(n4308), .ROA3(n4307), .ROA2(n4306), .ROA1(n4305), 
            .ROA0(n4304), .ROB17(n4339), .ROB16(n4338), .ROB15(n4337), 
            .ROB14(n4336), .ROB13(n4335), .ROB12(n4334), .ROB11(n4333), 
            .ROB10(n4332), .ROB9(n4331), .ROB8(n4330), .ROB7(n4329), 
            .ROB6(n4328), .ROB5(n4327), .ROB4(n4326), .ROB3(n4325), 
            .ROB2(n4324), .ROB1(n4323), .ROB0(n4322), .P35(n4376), .P34(n4375), 
            .P33(n4374), .P32(n4373), .P31(n4372), .P30(n4371), .P29(n4370), 
            .P28(n4369), .P27(n4368), .P26(n4367), .P25(n4366), .P24(n4365), 
            .P23(n4364), .P22(n4363), .P21(n4362), .P20(n4361), .P19(n4360), 
            .P18(n4359), .P17(n4358), .P16(n4357), .P15(n4356), .P14(n4355), 
            .P13(n4354), .P12(n4353), .P11(n4352), .P10(n4351), .P9(n4350), 
            .P8(n4349), .P7(n4348), .P6(n4347), .P5(n4346), .P4(n4345), 
            .P3(n4344), .P2(n4343), .P1(n4342), .P0(n4341), .SIGNEDP(n4340));   // D:/lscc/diamond/3.14/ispfpga/vhdl_packages/vh2008/ieee/numeric_std_2008.vhd(2398[16:40])
    defparam Data_23__I_0_mult_2.REG_INPUTA_CLK = "NONE";
    defparam Data_23__I_0_mult_2.REG_INPUTA_CE = "CE0";
    defparam Data_23__I_0_mult_2.REG_INPUTA_RST = "RST0";
    defparam Data_23__I_0_mult_2.REG_INPUTB_CLK = "NONE";
    defparam Data_23__I_0_mult_2.REG_INPUTB_CE = "CE0";
    defparam Data_23__I_0_mult_2.REG_INPUTB_RST = "RST0";
    defparam Data_23__I_0_mult_2.REG_INPUTC_CLK = "NONE";
    defparam Data_23__I_0_mult_2.REG_INPUTC_CE = "CE0";
    defparam Data_23__I_0_mult_2.REG_INPUTC_RST = "RST0";
    defparam Data_23__I_0_mult_2.REG_PIPELINE_CLK = "NONE";
    defparam Data_23__I_0_mult_2.REG_PIPELINE_CE = "CE0";
    defparam Data_23__I_0_mult_2.REG_PIPELINE_RST = "RST0";
    defparam Data_23__I_0_mult_2.REG_OUTPUT_CLK = "NONE";
    defparam Data_23__I_0_mult_2.REG_OUTPUT_CE = "CE0";
    defparam Data_23__I_0_mult_2.REG_OUTPUT_RST = "RST0";
    defparam Data_23__I_0_mult_2.CLK0_DIV = "ENABLED";
    defparam Data_23__I_0_mult_2.CLK1_DIV = "ENABLED";
    defparam Data_23__I_0_mult_2.CLK2_DIV = "ENABLED";
    defparam Data_23__I_0_mult_2.CLK3_DIV = "ENABLED";
    defparam Data_23__I_0_mult_2.HIGHSPEED_CLK = "NONE";
    defparam Data_23__I_0_mult_2.GSR = "DISABLED";
    defparam Data_23__I_0_mult_2.CAS_MATCH_REG = "FALSE";
    defparam Data_23__I_0_mult_2.SOURCEB_MODE = "B_SHIFT";
    defparam Data_23__I_0_mult_2.MULT_BYPASS = "DISABLED";
    defparam Data_23__I_0_mult_2.RESETMODE = "SYNC";
    IB clk_pad (.I(clk), .O(clk_c));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    CCU2C add_1040_add_4_8 (.A0(frame_len[6]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[7]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n8993), .COUT(n8994));
    defparam add_1040_add_4_8.INIT0 = 16'h555f;
    defparam add_1040_add_4_8.INIT1 = 16'h555f;
    defparam add_1040_add_4_8.INJECT1_0 = "NO";
    defparam add_1040_add_4_8.INJECT1_1 = "NO";
    CCU2C add_1040_add_4_16 (.A0(frame_len[14]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[15]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n8997), .COUT(n8998));
    defparam add_1040_add_4_16.INIT0 = 16'h555f;
    defparam add_1040_add_4_16.INIT1 = 16'h555f;
    defparam add_1040_add_4_16.INJECT1_0 = "NO";
    defparam add_1040_add_4_16.INJECT1_1 = "NO";
    CCU2C add_1040_add_4_30 (.A0(frame_len[28]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[29]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n9004), .COUT(n9005));
    defparam add_1040_add_4_30.INIT0 = 16'h555f;
    defparam add_1040_add_4_30.INIT1 = 16'h555f;
    defparam add_1040_add_4_30.INJECT1_0 = "NO";
    defparam add_1040_add_4_30.INJECT1_1 = "NO";
    IB rst_pad (.I(rst), .O(rst_c));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(15[9:12])
    IB Data_pad_23 (.I(Data[23]), .O(Data_c_23));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Data_pad_22 (.I(Data[22]), .O(Data_c_22));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Data_pad_21 (.I(Data[21]), .O(Data_c_21));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Data_pad_20 (.I(Data[20]), .O(Data_c_20));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Data_pad_19 (.I(Data[19]), .O(Data_c_19));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Data_pad_18 (.I(Data[18]), .O(Data_c_18));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Data_pad_17 (.I(Data[17]), .O(Data_c_17));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Data_pad_16 (.I(Data[16]), .O(Data_c_16));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Data_pad_15 (.I(Data[15]), .O(Data_c_15));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Data_pad_14 (.I(Data[14]), .O(Data_c_14));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Data_pad_13 (.I(Data[13]), .O(Data_c_13));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Data_pad_12 (.I(Data[12]), .O(Data_c_12));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Data_pad_11 (.I(Data[11]), .O(Data_c_11));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Data_pad_10 (.I(Data[10]), .O(Data_c_10));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Data_pad_9 (.I(Data[9]), .O(Data_c_9));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Data_pad_8 (.I(Data[8]), .O(Data_c_8));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Data_pad_7 (.I(Data[7]), .O(Data_c_7));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Data_pad_6 (.I(Data[6]), .O(Data_c_6));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Data_pad_5 (.I(Data[5]), .O(Data_c_5));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Data_pad_4 (.I(Data[4]), .O(Data_c_4));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Data_pad_3 (.I(Data[3]), .O(Data_c_3));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Data_pad_2 (.I(Data[2]), .O(Data_c_2));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Data_pad_1 (.I(Data[1]), .O(Data_c_1));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Data_pad_0 (.I(Data[0]), .O(Data_c_0));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(16[9:13])
    IB Write_En_pad (.I(Write_En), .O(Write_En_c));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(17[9:17])
    IB enable_pad (.I(enable), .O(enable_c));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(18[9:15])
    CCU2C add_1040_add_4_14 (.A0(frame_len[12]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[13]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n8996), .COUT(n8997));
    defparam add_1040_add_4_14.INIT0 = 16'h555f;
    defparam add_1040_add_4_14.INIT1 = 16'h555f;
    defparam add_1040_add_4_14.INJECT1_0 = "NO";
    defparam add_1040_add_4_14.INJECT1_1 = "NO";
    CCU2C add_1040_add_4_2 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[1]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .COUT(n8991));
    defparam add_1040_add_4_2.INIT0 = 16'h000f;
    defparam add_1040_add_4_2.INIT1 = 16'haaa0;
    defparam add_1040_add_4_2.INJECT1_0 = "NO";
    defparam add_1040_add_4_2.INJECT1_1 = "NO";
    CCU2C add_1040_add_4_6 (.A0(frame_len[4]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[5]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n8992), .COUT(n8993));
    defparam add_1040_add_4_6.INIT0 = 16'haaa0;
    defparam add_1040_add_4_6.INIT1 = 16'haaa0;
    defparam add_1040_add_4_6.INJECT1_0 = "NO";
    defparam add_1040_add_4_6.INJECT1_1 = "NO";
    CCU2C add_1040_add_4_28 (.A0(frame_len[26]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[27]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n9003), .COUT(n9004));
    defparam add_1040_add_4_28.INIT0 = 16'h555f;
    defparam add_1040_add_4_28.INIT1 = 16'h555f;
    defparam add_1040_add_4_28.INJECT1_0 = "NO";
    defparam add_1040_add_4_28.INJECT1_1 = "NO";
    MAC_AXItoRGMII mac_inst (.rst_c(rst_c), .clk_c(clk_c), .n2296(n2296), 
            .n11984(n11984), .clk_c_enable_15(clk_c_enable_15), .crc_cnt({crc_cnt}), 
            .n11907(n11907), .n2298(n2298), .n399(n399), .n11929(n11929), 
            .frame_len({Open_0, Open_1, Open_2, Open_3, Open_4, Open_5, 
            Open_6, Open_7, Open_8, frame_len[22:15], Open_9, Open_10, 
            Open_11, Open_12, Open_13, Open_14, Open_15, Open_16, 
            Open_17, Open_18, frame_len[4:1], Open_19}), .GND_net(GND_net), 
            .VCC_net(VCC_net), .n11945(n11945), .\udp_tdata[2] (udp_tdata[2]), 
            .\udp_tdata[0] (udp_tdata[0]), .\crc_reg[1] (crc_reg[1]), .\crc_reg[2] (crc_reg[2]), 
            .\udp_tdata[5] (udp_tdata[5]), .\udp_tdata[4] (udp_tdata[4]), 
            .gmii_txd({gmii_txd}), .n11931(n11931), .n11921(n11921), .n11942(n11942), 
            .n11919(n11919), .n2297(n2297), .\udp_tdata[1] (udp_tdata[1]), 
            .n2268(n2268), .\frame_len[5] (frame_len[5]), .\crc_reg[12] (crc_reg[12]), 
            .\frame_len[13] (frame_len[13]), .\frame_len[14] (frame_len[14]), 
            .\crc_reg[17] (crc_reg[17]), .n11911(n11911), .fifo_rd_en_N_404(fifo_rd_en_N_404), 
            .n2186(n2186), .n5459(n5459), .\crc_reg[25] (crc_reg[25]), 
            .\frame_len[11] (frame_len[11]), .\frame_len[12] (frame_len[12]), 
            .\crc_reg[9] (crc_reg[9]), .n15(n15), .n2187(n2187), .n5461(n5461), 
            .n11839(n11839), .\frame_len[9] (frame_len[9]), .\frame_len[10] (frame_len[10]), 
            .\frame_len[7] (frame_len[7]), .\frame_len[8] (frame_len[8]), 
            .ctl_reg(ctl_reg), .\frame_len[6] (frame_len[6]), .n11954(n11954), 
            .\frame_len[23] (frame_len[23]), .\frame_len[24] (frame_len[24]), 
            .\frame_len[25] (frame_len[25]), .\frame_len[26] (frame_len[26]), 
            .\frame_len[27] (frame_len[27]), .\frame_len[28] (frame_len[28]), 
            .\frame_len[29] (frame_len[29]), .\frame_len[30] (frame_len[30]), 
            .\frame_len[31] (frame_len[31]), .n5703(n5703), .\reg_fifo_data[3] (reg_fifo_data[3]), 
            .n2185(n2185), .n11968(n11968), .\next_crc_reg_31__N_594[2] (next_crc_reg_31__N_594[2]), 
            .\crc_next[2] (crc_next[2]), .n9742(n9742), .n11923(n11923), 
            .n2315(n2315), .\next_crc_reg_31__N_594[9] (next_crc_reg_31__N_594[9]), 
            .\next_crc_reg_31__N_594[12] (next_crc_reg_31__N_594[12]), .\crc_next[12] (crc_next[12]), 
            .n11918(n11918), .n11917(n11917), .n11913(n11913), .n11912(n11912), 
            .n11915(n11915), .n11916(n11916));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(440[16:42])
    CCU2C add_1040_add_4_26 (.A0(frame_len[24]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[25]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n9002), .COUT(n9003));
    defparam add_1040_add_4_26.INIT0 = 16'h555f;
    defparam add_1040_add_4_26.INIT1 = 16'h555f;
    defparam add_1040_add_4_26.INJECT1_0 = "NO";
    defparam add_1040_add_4_26.INJECT1_1 = "NO";
    CCU2C add_1040_add_4_12 (.A0(frame_len[10]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[11]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n8995), .COUT(n8996));
    defparam add_1040_add_4_12.INIT0 = 16'h555f;
    defparam add_1040_add_4_12.INIT1 = 16'h555f;
    defparam add_1040_add_4_12.INJECT1_0 = "NO";
    defparam add_1040_add_4_12.INJECT1_1 = "NO";
    CCU2C add_1040_add_4_4 (.A0(frame_len[2]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[3]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n8991), .COUT(n8992));
    defparam add_1040_add_4_4.INIT0 = 16'h555f;
    defparam add_1040_add_4_4.INIT1 = 16'haaa0;
    defparam add_1040_add_4_4.INJECT1_0 = "NO";
    defparam add_1040_add_4_4.INJECT1_1 = "NO";
    fifo_udp_reg reg_inst (.reg_fifo_data({reg_fifo_data}), .clk_c(clk_c), 
            .data_out_large_fifo({data_out_large_fifo}), .reg_fifo_almostfull(reg_fifo_almostfull), 
            .fifo_almostempty_N_1(fifo_almostempty_N_1), .read_large_fifo(read_large_fifo), 
            .fifo_rd_en_in(fifo_rd_en_in), .reg_fifo_empty(reg_fifo_empty), 
            .fifo_empty(fifo_empty));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(393[12:36])
    CCU2C add_1040_add_4_24 (.A0(frame_len[22]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[23]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n9001), .COUT(n9002));
    defparam add_1040_add_4_24.INIT0 = 16'h555f;
    defparam add_1040_add_4_24.INIT1 = 16'h555f;
    defparam add_1040_add_4_24.INJECT1_0 = "NO";
    defparam add_1040_add_4_24.INJECT1_1 = "NO";
    CCU2C add_1040_add_4_22 (.A0(frame_len[20]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[21]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n9000), .COUT(n9001));
    defparam add_1040_add_4_22.INIT0 = 16'h555f;
    defparam add_1040_add_4_22.INIT1 = 16'h555f;
    defparam add_1040_add_4_22.INJECT1_0 = "NO";
    defparam add_1040_add_4_22.INJECT1_1 = "NO";
    CCU2C add_1040_add_4_20 (.A0(frame_len[18]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[19]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n8999), .COUT(n9000));
    defparam add_1040_add_4_20.INIT0 = 16'h555f;
    defparam add_1040_add_4_20.INIT1 = 16'h555f;
    defparam add_1040_add_4_20.INJECT1_0 = "NO";
    defparam add_1040_add_4_20.INJECT1_1 = "NO";
    CCU2C add_1040_add_4_10 (.A0(frame_len[8]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[9]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n8994), .COUT(n8995));
    defparam add_1040_add_4_10.INIT0 = 16'h555f;
    defparam add_1040_add_4_10.INIT1 = 16'h555f;
    defparam add_1040_add_4_10.INJECT1_0 = "NO";
    defparam add_1040_add_4_10.INJECT1_1 = "NO";
    Fifolg u_Fifo_large (.clk_c(clk_c), .n11947(n11947), .fifo_empty(fifo_empty), 
           .fifo_almostempty(fifo_almostempty), .large_fifo_almost_full(large_fifo_almost_full), 
           .VCC_net(VCC_net), .GND_net(GND_net), .read_large_fifo(read_large_fifo), 
           .large_fifo_din({large_fifo_din}), .rst_c(rst_c), .data_out_large_fifo({data_out_large_fifo})) /* synthesis NGD_DRC_MASK=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(378[20:38])
    GSR GSR_INST (.GSR(n1));
    CCU2C add_1040_add_4_18 (.A0(frame_len[16]), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[17]), .B1(GND_net), .C1(GND_net), 
          .D1(VCC_net), .CIN(n8998), .COUT(n8999));
    defparam add_1040_add_4_18.INIT0 = 16'h555f;
    defparam add_1040_add_4_18.INIT1 = 16'h555f;
    defparam add_1040_add_4_18.INJECT1_0 = "NO";
    defparam add_1040_add_4_18.INJECT1_1 = "NO";
    LUT4 i1_4_lut (.A(rst_c), .B(n2315), .C(n11954), .D(n2297), .Z(clk_c_enable_15)) /* synthesis lut_function=(A+!(B (C (D))+!B (C+!(D)))) */ ;
    defparam i1_4_lut.init = 16'hafee;
    FIFOsm u_Fifosm9 (.clk_c(clk_c), .\adc_fifo_empty[9] (adc_fifo_empty[9]), 
           .GND_net(GND_net), .VCC_net(VCC_net), .Write_En_c(Write_En_c), 
           .\adc_fifo_rd_en[9] (adc_fifo_rd_en[9]), .\Data_x4[22] (Data_x4[22]), 
           .\Data_x4[21] (Data_x4[21]), .\Data_x4[20] (Data_x4[20]), .\Data_x4[19] (Data_x4[19]), 
           .\Data_x4[18] (Data_x4[18]), .\Data_x4[17] (Data_x4[17]), .\Data_x4[16] (Data_x4[16]), 
           .\Data_x4[15] (Data_x4[15]), .\Data_x4[14] (Data_x4[14]), .\Data_x4[13] (Data_x4[13]), 
           .\Data_x4[12] (Data_x4[12]), .\Data_x4[11] (Data_x4[11]), .\Data_x4[10] (Data_x4[10]), 
           .\Data_x4[9] (Data_x4[9]), .\Data_x4[8] (Data_x4[8]), .\Data_x4[7] (Data_x4[7]), 
           .\Data_x4[6] (Data_x4[6]), .\Data_x4[5] (Data_x4[5]), .\Data_x4[4] (Data_x4[4]), 
           .\Data_x4[3] (Data_x4[3]), .\Data_x4[2] (Data_x4[2]), .\Data_x4[1] (Data_x4[1]), 
           .\Data_x4[0] (Data_x4[0]), .rst_c(rst_c), .adc_fifo_9_dout({adc_fifo_9_dout})) /* synthesis NGD_DRC_MASK=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(281[17:35])
    LUT4 i718_4_lut (.A(n1847), .B(rst_c), .C(n11978), .D(n1846), .Z(clk_c_enable_38)) /* synthesis lut_function=(A (B+!(C (D)))+!A (B+!(C+!(D)))) */ ;
    defparam i718_4_lut.init = 16'hcfee;
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    VLO i1 (.Z(GND_net));
    UDP_FIFO_AXI udp_inst (.n2187(n2187), .rst_c(rst_c), .n2186(n2186), 
            .fifo_rd_en_N_404(fifo_rd_en_N_404), .GND_net(GND_net), .VCC_net(VCC_net), 
            .n2296(n2296), .n11984(n11984), .n399(n399), .n11968(n11968), 
            .n11907(n11907), .\reg_fifo_data[7] (reg_fifo_data[7]), .n2185(n2185), 
            .n11921(n11921), .n11945(n11945), .n11917(n11917), .crc_cnt({crc_cnt}), 
            .n11839(n11839), .\reg_fifo_data[1] (reg_fifo_data[1]), .\udp_tdata[1] (udp_tdata[1]), 
            .reg_fifo_empty(reg_fifo_empty), .n11929(n11929), .clk_c(clk_c), 
            .n5703(n5703), .n9742(n9742), .n2297(n2297), .n11954(n11954), 
            .n1(n1), .clk_c_enable_73(clk_c_enable_73), .n11931(n11931), 
            .n10056(n10056), .n11923(n11923), .\reg_fifo_data[5] (reg_fifo_data[5]), 
            .\udp_tdata[5] (udp_tdata[5]), .\reg_fifo_data[4] (reg_fifo_data[4]), 
            .\udp_tdata[4] (udp_tdata[4]), .\reg_fifo_data[0] (reg_fifo_data[0]), 
            .\udp_tdata[0] (udp_tdata[0]), .\reg_fifo_data[2] (reg_fifo_data[2]), 
            .\udp_tdata[2] (udp_tdata[2]), .\reg_fifo_data[6] (reg_fifo_data[6]), 
            .n11919(n11919), .n2184(n2184), .n11912(n11912), .reg_fifo_almostfull(reg_fifo_almostfull), 
            .n11913(n11913), .n2298(n2298), .n2315(n2315), .n11915(n11915), 
            .\crc_next[2] (crc_next[2]), .\crc_reg[2] (crc_reg[2]), .\next_crc_reg_31__N_594[2] (next_crc_reg_31__N_594[2]), 
            .fifo_rd_en_in(fifo_rd_en_in), .n11916(n11916), .n11918(n11918), 
            .n5461(n5461), .n11911(n11911), .\crc_reg[9] (crc_reg[9]), 
            .\next_crc_reg_31__N_594[9] (next_crc_reg_31__N_594[9]), .n15(n15), 
            .\crc_next[12] (crc_next[12]), .\crc_reg[12] (crc_reg[12]), 
            .\next_crc_reg_31__N_594[12] (next_crc_reg_31__N_594[12]), .n11942(n11942), 
            .n2268(n2268), .n5459(n5459), .\crc_reg[25] (crc_reg[25]), 
            .\crc_reg[1] (crc_reg[1]), .\crc_reg[17] (crc_reg[17]));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(414[16:40])
    \Controller(16,24,8,16)  u_adc_fifo_frame_packer (.adc_fifo_rd_en({adc_fifo_rd_en}), 
            .n1844(n1844), .n1846(n1846), .large_fifo_din({large_fifo_din}), 
            .rst_c(rst_c), .clk_c(clk_c), .clk_c_enable_38(clk_c_enable_38), 
            .adc_fifo_empty({adc_fifo_empty}), .fifo_sel({fifo_sel}), .fifo_dout_to_packer({fifo_dout_to_packer}), 
            .enable_c(enable_c), .packer_frame_done_c(packer_frame_done_c), 
            .n2131(n2131), .n11978(n11978), .clk_c_enable_64(clk_c_enable_64), 
            .n11977(n11977), .n11386(n11386), .n11393(n11393), .n2185(n2185), 
            .n10056(n10056), .n2184(n2184), .clk_c_enable_73(clk_c_enable_73), 
            .n11389(n11389), .large_fifo_almost_full(large_fifo_almost_full), 
            .n11378(n11378), .n11376(n11376), .n11947(n11947), .n11372(n11372), 
            .n11377(n11377), .n11375(n11375), .n11373(n11373), .n1847(n1847), 
            .n11394(n11394), .n11391(n11391), .n11385(n11385), .n11387(n11387), 
            .n11384(n11384), .n11374(n11374), .n11383(n11383), .n11382(n11382), 
            .n11388(n11388), .n11381(n11381), .n11392(n11392), .n11380(n11380), 
            .n11379(n11379), .n11390(n11390), .n31(n31));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(98[31:53])
    \fifo_16ch_mux(24)  u_MuxFifo (.adc_fifo_6_dout({adc_fifo_6_dout}), .adc_fifo_7_dout({adc_fifo_7_dout}), 
            .fifo_sel({fifo_sel}), .fifo_dout_to_packer({fifo_dout_to_packer}), 
            .adc_fifo_4_dout({adc_fifo_4_dout}), .adc_fifo_5_dout({adc_fifo_5_dout}), 
            .adc_fifo_14_dout({adc_fifo_14_dout}), .adc_fifo_15_dout({adc_fifo_15_dout}), 
            .adc_fifo_12_dout({adc_fifo_12_dout}), .adc_fifo_13_dout({adc_fifo_13_dout}), 
            .adc_fifo_10_dout({adc_fifo_10_dout}), .adc_fifo_11_dout({adc_fifo_11_dout}), 
            .adc_fifo_8_dout({adc_fifo_8_dout}), .adc_fifo_9_dout({adc_fifo_9_dout}), 
            .adc_fifo_2_dout({adc_fifo_2_dout}), .adc_fifo_3_dout({adc_fifo_3_dout}), 
            .adc_fifo_0_dout({adc_fifo_0_dout}), .adc_fifo_1_dout({adc_fifo_1_dout}), 
            .n11386(n11386), .n11393(n11393), .n11389(n11389), .n11378(n11378), 
            .n11376(n11376), .n11372(n11372), .n11377(n11377), .n11375(n11375), 
            .n11373(n11373), .n11394(n11394), .n11391(n11391), .n11385(n11385), 
            .n11387(n11387), .n11384(n11384), .n11374(n11374), .n11383(n11383), 
            .n11382(n11382), .n11388(n11388), .n11381(n11381), .n11392(n11392), 
            .n11380(n11380), .n11379(n11379), .n11390(n11390));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(128[17:42])
    
endmodule
//
// Verilog Description of module FIFOsm_U8
//

module FIFOsm_U8 (clk_c, \adc_fifo_empty[15] , GND_net, VCC_net, Write_En_c, 
            \adc_fifo_rd_en[15] , Data_c_19, Data_c_18, Data_c_17, Data_c_16, 
            Data_c_15, Data_c_14, Data_c_13, Data_c_12, Data_c_11, 
            Data_c_10, Data_c_9, Data_c_8, Data_c_7, Data_c_6, Data_c_5, 
            Data_c_4, Data_c_3, Data_c_2, Data_c_1, Data_c_0, rst_c, 
            adc_fifo_15_dout) /* synthesis NGD_DRC_MASK=1 */ ;
    input clk_c;
    output \adc_fifo_empty[15] ;
    input GND_net;
    input VCC_net;
    input Write_En_c;
    input \adc_fifo_rd_en[15] ;
    input Data_c_19;
    input Data_c_18;
    input Data_c_17;
    input Data_c_16;
    input Data_c_15;
    input Data_c_14;
    input Data_c_13;
    input Data_c_12;
    input Data_c_11;
    input Data_c_10;
    input Data_c_9;
    input Data_c_8;
    input Data_c_7;
    input Data_c_6;
    input Data_c_5;
    input Data_c_4;
    input Data_c_3;
    input Data_c_2;
    input Data_c_1;
    input Data_c_0;
    input rst_c;
    output [23:0]adc_fifo_15_dout;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    
    wire fcount_1, fcnt_en, ifcount_1, fcount_2, ifcount_2, empty_d, 
        Full, full_d, wcount_0, wren_i, iwcount_0, wcount_1, iwcount_1, 
        rcount_0, rden_i, ircount_0, rcount_1, ircount_1, fcount_0, 
        ifcount_0, bdcnt_bctr_ci, cnt_con, co0, cmp_ci, co0_1, cmp_le_1_c, 
        cmp_le_1, cmp_ci_1, co0_2, wren_i_inv, cmp_ge_d1_c, cmp_ge_d1, 
        w_ctr_ci, r_ctr_ci, invout_2, invout_1, rden_i_inv;
    
    FD1P3AX FF_11 (.D(ifcount_1), .SP(fcnt_en), .CK(clk_c), .Q(fcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(232[12:19])
    defparam FF_11.GSR = "ENABLED";
    FD1P3AX FF_10 (.D(ifcount_2), .SP(fcnt_en), .CK(clk_c), .Q(fcount_2)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(236[12:19])
    defparam FF_10.GSR = "ENABLED";
    FD1S3AY FF_9 (.D(empty_d), .CK(clk_c), .Q(\adc_fifo_empty[15] )) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(240[11:18])
    defparam FF_9.GSR = "ENABLED";
    FD1S3AX FF_8 (.D(full_d), .CK(clk_c), .Q(Full)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(243[11:18])
    defparam FF_8.GSR = "ENABLED";
    FD1P3AX FF_7 (.D(iwcount_0), .SP(wren_i), .CK(clk_c), .Q(wcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(246[11:18])
    defparam FF_7.GSR = "ENABLED";
    FD1P3AX FF_6 (.D(iwcount_1), .SP(wren_i), .CK(clk_c), .Q(wcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(250[11:18])
    defparam FF_6.GSR = "ENABLED";
    FD1P3AX FF_4 (.D(ircount_0), .SP(rden_i), .CK(clk_c), .Q(rcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(258[11:18])
    defparam FF_4.GSR = "ENABLED";
    FD1P3AX FF_3 (.D(ircount_1), .SP(rden_i), .CK(clk_c), .Q(rcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(262[11:18])
    defparam FF_3.GSR = "ENABLED";
    FD1P3AX FF_12 (.D(ifcount_0), .SP(fcnt_en), .CK(clk_c), .Q(fcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(228[12:19])
    defparam FF_12.GSR = "ENABLED";
    CCU2C bdcnt_bctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(cnt_con), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .COUT(bdcnt_bctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(276[21:26])
    defparam bdcnt_bctr_cia.INIT0 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INIT1 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INJECT1_0 = "NO";
    defparam bdcnt_bctr_cia.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_0 (.A0(fcount_0), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(bdcnt_bctr_ci), 
          .COUT(co0), .S0(ifcount_0), .S1(ifcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(283[19:24])
    defparam bdcnt_bctr_0.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INJECT1_0 = "NO";
    defparam bdcnt_bctr_0.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_1 (.A0(fcount_2), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(co0), 
          .S0(ifcount_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(290[19:24])
    defparam bdcnt_bctr_1.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INJECT1_0 = "NO";
    defparam bdcnt_bctr_1.INJECT1_1 = "NO";
    CCU2C e_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(297[17:22])
    defparam e_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INJECT1_0 = "NO";
    defparam e_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C e_cmp_0 (.A0(rden_i), .B0(fcount_0), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_1), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci), 
          .COUT(co0_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(304[14:19])
    defparam e_cmp_0.INIT0 = 16'b1001100110101010;
    defparam e_cmp_0.INIT1 = 16'b1001100110101010;
    defparam e_cmp_0.INJECT1_0 = "NO";
    defparam e_cmp_0.INJECT1_1 = "NO";
    CCU2C e_cmp_1 (.A0(GND_net), .B0(fcount_2), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_1), 
          .COUT(cmp_le_1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(311[14:19])
    defparam e_cmp_1.INIT0 = 16'b1001100110101010;
    defparam e_cmp_1.INIT1 = 16'b1001100110101010;
    defparam e_cmp_1.INJECT1_0 = "NO";
    defparam e_cmp_1.INJECT1_1 = "NO";
    CCU2C a0 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_le_1_c), 
          .S0(cmp_le_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(319[9:14])
    defparam a0.INIT0 = 16'b0110011010101010;
    defparam a0.INIT1 = 16'b0110011010101010;
    defparam a0.INJECT1_0 = "NO";
    defparam a0.INJECT1_1 = "NO";
    CCU2C g_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(327[17:22])
    defparam g_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INJECT1_0 = "NO";
    defparam g_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C g_cmp_0 (.A0(fcount_0), .B0(wren_i), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(wren_i), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci_1), 
          .COUT(co0_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(334[14:19])
    defparam g_cmp_0.INIT0 = 16'b1001100110101010;
    defparam g_cmp_0.INIT1 = 16'b1001100110101010;
    defparam g_cmp_0.INJECT1_0 = "NO";
    defparam g_cmp_0.INJECT1_1 = "NO";
    CCU2C g_cmp_1 (.A0(fcount_2), .B0(wren_i_inv), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_2), 
          .COUT(cmp_ge_d1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(341[14:19])
    defparam g_cmp_1.INIT0 = 16'b1001100110101010;
    defparam g_cmp_1.INIT1 = 16'b1001100110101010;
    defparam g_cmp_1.INJECT1_0 = "NO";
    defparam g_cmp_1.INJECT1_1 = "NO";
    CCU2C a1 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ge_d1_c), 
          .S0(cmp_ge_d1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(349[9:14])
    defparam a1.INIT0 = 16'b0110011010101010;
    defparam a1.INIT1 = 16'b0110011010101010;
    defparam a1.INJECT1_0 = "NO";
    defparam a1.INJECT1_1 = "NO";
    CCU2C w_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(w_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(357[16:21])
    defparam w_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam w_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam w_ctr_cia.INJECT1_0 = "NO";
    defparam w_ctr_cia.INJECT1_1 = "NO";
    CCU2C w_ctr_0 (.A0(wcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(wcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(w_ctr_ci), 
          .S0(iwcount_0), .S1(iwcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(364[14:19])
    defparam w_ctr_0.INIT0 = 16'b0110011010101010;
    defparam w_ctr_0.INIT1 = 16'b0110011010101010;
    defparam w_ctr_0.INJECT1_0 = "NO";
    defparam w_ctr_0.INJECT1_1 = "NO";
    CCU2C r_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(r_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(380[16:21])
    defparam r_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam r_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam r_ctr_cia.INJECT1_0 = "NO";
    defparam r_ctr_cia.INJECT1_1 = "NO";
    CCU2C r_ctr_0 (.A0(rcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(rcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(r_ctr_ci), 
          .S0(ircount_0), .S1(ircount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(387[14:19])
    defparam r_ctr_0.INIT0 = 16'b0110011010101010;
    defparam r_ctr_0.INIT1 = 16'b0110011010101010;
    defparam r_ctr_0.INJECT1_0 = "NO";
    defparam r_ctr_0.INJECT1_1 = "NO";
    AND2 AND2_t4 (.A(Write_En_c), .B(invout_2), .Z(wren_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(129[14:18])
    INV INV_8 (.A(Full), .Z(invout_2)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(365[18:36])
    AND2 AND2_t3 (.A(\adc_fifo_rd_en[15] ), .B(invout_1), .Z(rden_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(135[14:18])
    INV INV_7 (.A(\adc_fifo_empty[15] ), .Z(invout_1)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(365[18:36])
    AND2 AND2_t2 (.A(wren_i), .B(rden_i_inv), .Z(cnt_con)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(141[14:18])
    XOR2 XOR2_t1 (.A(wren_i), .B(rden_i), .Z(fcnt_en)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(144[14:18])
    INV INV_6 (.A(rden_i), .Z(rden_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(365[18:36])
    INV INV_5 (.A(wren_i), .Z(wren_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(365[18:36])
    ROM16X1A LUT4_3 (.AD0(\adc_fifo_empty[15] ), .AD1(wren_i), .AD2(cmp_le_1), 
            .AD3(GND_net), .DO0(empty_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(365[18:36])
    defparam LUT4_3.initval = 16'b0011001000110010;
    ROM16X1A LUT4_2 (.AD0(Full), .AD1(rden_i), .AD2(cmp_ge_d1), .AD3(GND_net), 
            .DO0(full_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(365[18:36])
    defparam LUT4_2.initval = 16'b0011001000110010;
    PDPW16KD pdp_ram_0_0_0 (.DI0(GND_net), .DI1(GND_net), .DI2(GND_net), 
            .DI3(GND_net), .DI4(Data_c_0), .DI5(Data_c_1), .DI6(Data_c_2), 
            .DI7(Data_c_3), .DI8(Data_c_4), .DI9(Data_c_5), .DI10(Data_c_6), 
            .DI11(Data_c_7), .DI12(Data_c_8), .DI13(Data_c_9), .DI14(Data_c_10), 
            .DI15(Data_c_11), .DI16(Data_c_12), .DI17(Data_c_13), .DI18(Data_c_14), 
            .DI19(Data_c_15), .DI20(Data_c_16), .DI21(Data_c_17), .DI22(Data_c_18), 
            .DI23(Data_c_19), .DI24(GND_net), .DI25(GND_net), .DI26(GND_net), 
            .DI27(GND_net), .DI28(GND_net), .DI29(GND_net), .DI30(GND_net), 
            .DI31(GND_net), .DI32(GND_net), .DI33(GND_net), .DI34(GND_net), 
            .DI35(GND_net), .ADW0(wcount_0), .ADW1(wcount_1), .ADW2(GND_net), 
            .ADW3(GND_net), .ADW4(GND_net), .ADW5(GND_net), .ADW6(GND_net), 
            .ADW7(GND_net), .ADW8(GND_net), .BE0(VCC_net), .BE1(VCC_net), 
            .BE2(VCC_net), .BE3(VCC_net), .CEW(wren_i), .CLKW(clk_c), 
            .CSW0(VCC_net), .CSW1(GND_net), .CSW2(GND_net), .ADR0(GND_net), 
            .ADR1(GND_net), .ADR2(GND_net), .ADR3(GND_net), .ADR4(GND_net), 
            .ADR5(rcount_0), .ADR6(rcount_1), .ADR7(GND_net), .ADR8(GND_net), 
            .ADR9(GND_net), .ADR10(GND_net), .ADR11(GND_net), .ADR12(GND_net), 
            .ADR13(GND_net), .CER(rden_i), .OCER(rden_i), .CLKR(clk_c), 
            .CSR0(GND_net), .CSR1(GND_net), .CSR2(GND_net), .RST(rst_c), 
            .DO0(adc_fifo_15_dout[18]), .DO1(adc_fifo_15_dout[19]), .DO2(adc_fifo_15_dout[20]), 
            .DO3(adc_fifo_15_dout[21]), .DO4(adc_fifo_15_dout[22]), .DO5(adc_fifo_15_dout[23]), 
            .DO18(adc_fifo_15_dout[0]), .DO19(adc_fifo_15_dout[1]), .DO20(adc_fifo_15_dout[2]), 
            .DO21(adc_fifo_15_dout[3]), .DO22(adc_fifo_15_dout[4]), .DO23(adc_fifo_15_dout[5]), 
            .DO24(adc_fifo_15_dout[6]), .DO25(adc_fifo_15_dout[7]), .DO26(adc_fifo_15_dout[8]), 
            .DO27(adc_fifo_15_dout[9]), .DO28(adc_fifo_15_dout[10]), .DO29(adc_fifo_15_dout[11]), 
            .DO30(adc_fifo_15_dout[12]), .DO31(adc_fifo_15_dout[13]), .DO32(adc_fifo_15_dout[14]), 
            .DO33(adc_fifo_15_dout[15]), .DO34(adc_fifo_15_dout[16]), .DO35(adc_fifo_15_dout[17])) /* synthesis syn_black_box=true, MEM_LPC_FILE="FIFOsm.lpc", MEM_INIT_FILE="", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=365, LSE_RLINE=365 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(365[18:36])
    defparam pdp_ram_0_0_0.DATA_WIDTH_W = 36;
    defparam pdp_ram_0_0_0.DATA_WIDTH_R = 36;
    defparam pdp_ram_0_0_0.GSR = "ENABLED";
    defparam pdp_ram_0_0_0.REGMODE = "NOREG";
    defparam pdp_ram_0_0_0.RESETMODE = "ASYNC";
    defparam pdp_ram_0_0_0.ASYNC_RESET_RELEASE = "SYNC";
    defparam pdp_ram_0_0_0.CSDECODE_W = "0b001";
    defparam pdp_ram_0_0_0.CSDECODE_R = "0b000";
    defparam pdp_ram_0_0_0.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_20 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_21 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_22 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_23 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_24 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_25 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_26 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_27 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_28 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_29 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_30 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_31 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_32 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_33 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_34 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_35 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_36 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_37 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_38 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_39 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INIT_DATA = "STATIC";
    
endmodule
//
// Verilog Description of module FIFOsm_U7
//

module FIFOsm_U7 (clk_c, \adc_fifo_empty[1] , GND_net, VCC_net, Write_En_c, 
            \adc_fifo_rd_en[1] , Data_c_22, Data_c_21, Data_c_20, Data_c_19, 
            Data_c_18, Data_c_17, Data_c_16, Data_c_15, Data_c_14, 
            Data_c_13, Data_c_12, Data_c_11, Data_c_10, Data_c_9, 
            Data_c_8, Data_c_7, Data_c_6, Data_c_5, Data_c_4, Data_c_3, 
            Data_c_2, Data_c_1, Data_c_0, rst_c, adc_fifo_1_dout) /* synthesis NGD_DRC_MASK=1 */ ;
    input clk_c;
    output \adc_fifo_empty[1] ;
    input GND_net;
    input VCC_net;
    input Write_En_c;
    input \adc_fifo_rd_en[1] ;
    input Data_c_22;
    input Data_c_21;
    input Data_c_20;
    input Data_c_19;
    input Data_c_18;
    input Data_c_17;
    input Data_c_16;
    input Data_c_15;
    input Data_c_14;
    input Data_c_13;
    input Data_c_12;
    input Data_c_11;
    input Data_c_10;
    input Data_c_9;
    input Data_c_8;
    input Data_c_7;
    input Data_c_6;
    input Data_c_5;
    input Data_c_4;
    input Data_c_3;
    input Data_c_2;
    input Data_c_1;
    input Data_c_0;
    input rst_c;
    output [23:0]adc_fifo_1_dout;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    
    wire fcount_1, fcnt_en, ifcount_1, fcount_2, ifcount_2, empty_d, 
        Full, full_d, wcount_0, wren_i, iwcount_0, wcount_1, iwcount_1, 
        rcount_0, rden_i, ircount_0, rcount_1, ircount_1, fcount_0, 
        ifcount_0, bdcnt_bctr_ci, cnt_con, co0, cmp_ci, co0_1, cmp_le_1_c, 
        cmp_le_1, cmp_ci_1, co0_2, wren_i_inv, cmp_ge_d1_c, cmp_ge_d1, 
        w_ctr_ci, r_ctr_ci, invout_2, invout_1, rden_i_inv;
    
    FD1P3AX FF_11 (.D(ifcount_1), .SP(fcnt_en), .CK(clk_c), .Q(fcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(232[12:19])
    defparam FF_11.GSR = "ENABLED";
    FD1P3AX FF_10 (.D(ifcount_2), .SP(fcnt_en), .CK(clk_c), .Q(fcount_2)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(236[12:19])
    defparam FF_10.GSR = "ENABLED";
    FD1S3AY FF_9 (.D(empty_d), .CK(clk_c), .Q(\adc_fifo_empty[1] )) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(240[11:18])
    defparam FF_9.GSR = "ENABLED";
    FD1S3AX FF_8 (.D(full_d), .CK(clk_c), .Q(Full)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(243[11:18])
    defparam FF_8.GSR = "ENABLED";
    FD1P3AX FF_7 (.D(iwcount_0), .SP(wren_i), .CK(clk_c), .Q(wcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(246[11:18])
    defparam FF_7.GSR = "ENABLED";
    FD1P3AX FF_6 (.D(iwcount_1), .SP(wren_i), .CK(clk_c), .Q(wcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(250[11:18])
    defparam FF_6.GSR = "ENABLED";
    FD1P3AX FF_4 (.D(ircount_0), .SP(rden_i), .CK(clk_c), .Q(rcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(258[11:18])
    defparam FF_4.GSR = "ENABLED";
    FD1P3AX FF_3 (.D(ircount_1), .SP(rden_i), .CK(clk_c), .Q(rcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(262[11:18])
    defparam FF_3.GSR = "ENABLED";
    FD1P3AX FF_12 (.D(ifcount_0), .SP(fcnt_en), .CK(clk_c), .Q(fcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(228[12:19])
    defparam FF_12.GSR = "ENABLED";
    CCU2C bdcnt_bctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(cnt_con), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .COUT(bdcnt_bctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(276[21:26])
    defparam bdcnt_bctr_cia.INIT0 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INIT1 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INJECT1_0 = "NO";
    defparam bdcnt_bctr_cia.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_0 (.A0(fcount_0), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(bdcnt_bctr_ci), 
          .COUT(co0), .S0(ifcount_0), .S1(ifcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(283[19:24])
    defparam bdcnt_bctr_0.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INJECT1_0 = "NO";
    defparam bdcnt_bctr_0.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_1 (.A0(fcount_2), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(co0), 
          .S0(ifcount_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(290[19:24])
    defparam bdcnt_bctr_1.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INJECT1_0 = "NO";
    defparam bdcnt_bctr_1.INJECT1_1 = "NO";
    CCU2C e_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(297[17:22])
    defparam e_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INJECT1_0 = "NO";
    defparam e_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C e_cmp_0 (.A0(rden_i), .B0(fcount_0), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_1), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci), 
          .COUT(co0_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(304[14:19])
    defparam e_cmp_0.INIT0 = 16'b1001100110101010;
    defparam e_cmp_0.INIT1 = 16'b1001100110101010;
    defparam e_cmp_0.INJECT1_0 = "NO";
    defparam e_cmp_0.INJECT1_1 = "NO";
    CCU2C e_cmp_1 (.A0(GND_net), .B0(fcount_2), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_1), 
          .COUT(cmp_le_1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(311[14:19])
    defparam e_cmp_1.INIT0 = 16'b1001100110101010;
    defparam e_cmp_1.INIT1 = 16'b1001100110101010;
    defparam e_cmp_1.INJECT1_0 = "NO";
    defparam e_cmp_1.INJECT1_1 = "NO";
    CCU2C a0 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_le_1_c), 
          .S0(cmp_le_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(319[9:14])
    defparam a0.INIT0 = 16'b0110011010101010;
    defparam a0.INIT1 = 16'b0110011010101010;
    defparam a0.INJECT1_0 = "NO";
    defparam a0.INJECT1_1 = "NO";
    CCU2C g_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(327[17:22])
    defparam g_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INJECT1_0 = "NO";
    defparam g_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C g_cmp_0 (.A0(fcount_0), .B0(wren_i), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(wren_i), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci_1), 
          .COUT(co0_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(334[14:19])
    defparam g_cmp_0.INIT0 = 16'b1001100110101010;
    defparam g_cmp_0.INIT1 = 16'b1001100110101010;
    defparam g_cmp_0.INJECT1_0 = "NO";
    defparam g_cmp_0.INJECT1_1 = "NO";
    CCU2C g_cmp_1 (.A0(fcount_2), .B0(wren_i_inv), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_2), 
          .COUT(cmp_ge_d1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(341[14:19])
    defparam g_cmp_1.INIT0 = 16'b1001100110101010;
    defparam g_cmp_1.INIT1 = 16'b1001100110101010;
    defparam g_cmp_1.INJECT1_0 = "NO";
    defparam g_cmp_1.INJECT1_1 = "NO";
    CCU2C a1 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ge_d1_c), 
          .S0(cmp_ge_d1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(349[9:14])
    defparam a1.INIT0 = 16'b0110011010101010;
    defparam a1.INIT1 = 16'b0110011010101010;
    defparam a1.INJECT1_0 = "NO";
    defparam a1.INJECT1_1 = "NO";
    CCU2C w_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(w_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(357[16:21])
    defparam w_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam w_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam w_ctr_cia.INJECT1_0 = "NO";
    defparam w_ctr_cia.INJECT1_1 = "NO";
    CCU2C w_ctr_0 (.A0(wcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(wcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(w_ctr_ci), 
          .S0(iwcount_0), .S1(iwcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(364[14:19])
    defparam w_ctr_0.INIT0 = 16'b0110011010101010;
    defparam w_ctr_0.INIT1 = 16'b0110011010101010;
    defparam w_ctr_0.INJECT1_0 = "NO";
    defparam w_ctr_0.INJECT1_1 = "NO";
    CCU2C r_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(r_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(380[16:21])
    defparam r_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam r_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam r_ctr_cia.INJECT1_0 = "NO";
    defparam r_ctr_cia.INJECT1_1 = "NO";
    CCU2C r_ctr_0 (.A0(rcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(rcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(r_ctr_ci), 
          .S0(ircount_0), .S1(ircount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(387[14:19])
    defparam r_ctr_0.INIT0 = 16'b0110011010101010;
    defparam r_ctr_0.INIT1 = 16'b0110011010101010;
    defparam r_ctr_0.INJECT1_0 = "NO";
    defparam r_ctr_0.INJECT1_1 = "NO";
    AND2 AND2_t4 (.A(Write_En_c), .B(invout_2), .Z(wren_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(129[14:18])
    INV INV_8 (.A(Full), .Z(invout_2)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(169[17:35])
    AND2 AND2_t3 (.A(\adc_fifo_rd_en[1] ), .B(invout_1), .Z(rden_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(135[14:18])
    INV INV_7 (.A(\adc_fifo_empty[1] ), .Z(invout_1)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(169[17:35])
    AND2 AND2_t2 (.A(wren_i), .B(rden_i_inv), .Z(cnt_con)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(141[14:18])
    XOR2 XOR2_t1 (.A(wren_i), .B(rden_i), .Z(fcnt_en)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(144[14:18])
    INV INV_6 (.A(rden_i), .Z(rden_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(169[17:35])
    INV INV_5 (.A(wren_i), .Z(wren_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(169[17:35])
    ROM16X1A LUT4_3 (.AD0(\adc_fifo_empty[1] ), .AD1(wren_i), .AD2(cmp_le_1), 
            .AD3(GND_net), .DO0(empty_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(169[17:35])
    defparam LUT4_3.initval = 16'b0011001000110010;
    ROM16X1A LUT4_2 (.AD0(Full), .AD1(rden_i), .AD2(cmp_ge_d1), .AD3(GND_net), 
            .DO0(full_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(169[17:35])
    defparam LUT4_2.initval = 16'b0011001000110010;
    PDPW16KD pdp_ram_0_0_0 (.DI0(GND_net), .DI1(Data_c_0), .DI2(Data_c_1), 
            .DI3(Data_c_2), .DI4(Data_c_3), .DI5(Data_c_4), .DI6(Data_c_5), 
            .DI7(Data_c_6), .DI8(Data_c_7), .DI9(Data_c_8), .DI10(Data_c_9), 
            .DI11(Data_c_10), .DI12(Data_c_11), .DI13(Data_c_12), .DI14(Data_c_13), 
            .DI15(Data_c_14), .DI16(Data_c_15), .DI17(Data_c_16), .DI18(Data_c_17), 
            .DI19(Data_c_18), .DI20(Data_c_19), .DI21(Data_c_20), .DI22(Data_c_21), 
            .DI23(Data_c_22), .DI24(GND_net), .DI25(GND_net), .DI26(GND_net), 
            .DI27(GND_net), .DI28(GND_net), .DI29(GND_net), .DI30(GND_net), 
            .DI31(GND_net), .DI32(GND_net), .DI33(GND_net), .DI34(GND_net), 
            .DI35(GND_net), .ADW0(wcount_0), .ADW1(wcount_1), .ADW2(GND_net), 
            .ADW3(GND_net), .ADW4(GND_net), .ADW5(GND_net), .ADW6(GND_net), 
            .ADW7(GND_net), .ADW8(GND_net), .BE0(VCC_net), .BE1(VCC_net), 
            .BE2(VCC_net), .BE3(VCC_net), .CEW(wren_i), .CLKW(clk_c), 
            .CSW0(VCC_net), .CSW1(GND_net), .CSW2(GND_net), .ADR0(GND_net), 
            .ADR1(GND_net), .ADR2(GND_net), .ADR3(GND_net), .ADR4(GND_net), 
            .ADR5(rcount_0), .ADR6(rcount_1), .ADR7(GND_net), .ADR8(GND_net), 
            .ADR9(GND_net), .ADR10(GND_net), .ADR11(GND_net), .ADR12(GND_net), 
            .ADR13(GND_net), .CER(rden_i), .OCER(rden_i), .CLKR(clk_c), 
            .CSR0(GND_net), .CSR1(GND_net), .CSR2(GND_net), .RST(rst_c), 
            .DO0(adc_fifo_1_dout[18]), .DO1(adc_fifo_1_dout[19]), .DO2(adc_fifo_1_dout[20]), 
            .DO3(adc_fifo_1_dout[21]), .DO4(adc_fifo_1_dout[22]), .DO5(adc_fifo_1_dout[23]), 
            .DO18(adc_fifo_1_dout[0]), .DO19(adc_fifo_1_dout[1]), .DO20(adc_fifo_1_dout[2]), 
            .DO21(adc_fifo_1_dout[3]), .DO22(adc_fifo_1_dout[4]), .DO23(adc_fifo_1_dout[5]), 
            .DO24(adc_fifo_1_dout[6]), .DO25(adc_fifo_1_dout[7]), .DO26(adc_fifo_1_dout[8]), 
            .DO27(adc_fifo_1_dout[9]), .DO28(adc_fifo_1_dout[10]), .DO29(adc_fifo_1_dout[11]), 
            .DO30(adc_fifo_1_dout[12]), .DO31(adc_fifo_1_dout[13]), .DO32(adc_fifo_1_dout[14]), 
            .DO33(adc_fifo_1_dout[15]), .DO34(adc_fifo_1_dout[16]), .DO35(adc_fifo_1_dout[17])) /* synthesis syn_black_box=true, MEM_LPC_FILE="FIFOsm.lpc", MEM_INIT_FILE="", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=169, LSE_RLINE=169 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(169[17:35])
    defparam pdp_ram_0_0_0.DATA_WIDTH_W = 36;
    defparam pdp_ram_0_0_0.DATA_WIDTH_R = 36;
    defparam pdp_ram_0_0_0.GSR = "ENABLED";
    defparam pdp_ram_0_0_0.REGMODE = "NOREG";
    defparam pdp_ram_0_0_0.RESETMODE = "ASYNC";
    defparam pdp_ram_0_0_0.ASYNC_RESET_RELEASE = "SYNC";
    defparam pdp_ram_0_0_0.CSDECODE_W = "0b001";
    defparam pdp_ram_0_0_0.CSDECODE_R = "0b000";
    defparam pdp_ram_0_0_0.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_20 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_21 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_22 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_23 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_24 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_25 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_26 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_27 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_28 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_29 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_30 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_31 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_32 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_33 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_34 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_35 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_36 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_37 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_38 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_39 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INIT_DATA = "STATIC";
    
endmodule
//
// Verilog Description of module FIFOsm_U6
//

module FIFOsm_U6 (clk_c, \adc_fifo_empty[2] , GND_net, VCC_net, Write_En_c, 
            \adc_fifo_rd_en[2] , Data_x2, rst_c, adc_fifo_2_dout) /* synthesis NGD_DRC_MASK=1 */ ;
    input clk_c;
    output \adc_fifo_empty[2] ;
    input GND_net;
    input VCC_net;
    input Write_En_c;
    input \adc_fifo_rd_en[2] ;
    input [23:0]Data_x2;
    input rst_c;
    output [23:0]adc_fifo_2_dout;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    
    wire fcount_1, fcnt_en, ifcount_1, fcount_2, ifcount_2, empty_d, 
        Full, full_d, wcount_0, wren_i, iwcount_0, wcount_1, iwcount_1, 
        rcount_0, rden_i, ircount_0, rcount_1, ircount_1, fcount_0, 
        ifcount_0, bdcnt_bctr_ci, cnt_con, co0, cmp_ci, co0_1, cmp_le_1_c, 
        cmp_le_1, cmp_ci_1, co0_2, wren_i_inv, cmp_ge_d1_c, cmp_ge_d1, 
        w_ctr_ci, r_ctr_ci, invout_2, invout_1, rden_i_inv;
    
    FD1P3AX FF_11 (.D(ifcount_1), .SP(fcnt_en), .CK(clk_c), .Q(fcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(232[12:19])
    defparam FF_11.GSR = "ENABLED";
    FD1P3AX FF_10 (.D(ifcount_2), .SP(fcnt_en), .CK(clk_c), .Q(fcount_2)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(236[12:19])
    defparam FF_10.GSR = "ENABLED";
    FD1S3AY FF_9 (.D(empty_d), .CK(clk_c), .Q(\adc_fifo_empty[2] )) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(240[11:18])
    defparam FF_9.GSR = "ENABLED";
    FD1S3AX FF_8 (.D(full_d), .CK(clk_c), .Q(Full)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(243[11:18])
    defparam FF_8.GSR = "ENABLED";
    FD1P3AX FF_7 (.D(iwcount_0), .SP(wren_i), .CK(clk_c), .Q(wcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(246[11:18])
    defparam FF_7.GSR = "ENABLED";
    FD1P3AX FF_6 (.D(iwcount_1), .SP(wren_i), .CK(clk_c), .Q(wcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(250[11:18])
    defparam FF_6.GSR = "ENABLED";
    FD1P3AX FF_4 (.D(ircount_0), .SP(rden_i), .CK(clk_c), .Q(rcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(258[11:18])
    defparam FF_4.GSR = "ENABLED";
    FD1P3AX FF_3 (.D(ircount_1), .SP(rden_i), .CK(clk_c), .Q(rcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(262[11:18])
    defparam FF_3.GSR = "ENABLED";
    FD1P3AX FF_12 (.D(ifcount_0), .SP(fcnt_en), .CK(clk_c), .Q(fcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(228[12:19])
    defparam FF_12.GSR = "ENABLED";
    CCU2C bdcnt_bctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(cnt_con), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .COUT(bdcnt_bctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(276[21:26])
    defparam bdcnt_bctr_cia.INIT0 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INIT1 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INJECT1_0 = "NO";
    defparam bdcnt_bctr_cia.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_0 (.A0(fcount_0), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(bdcnt_bctr_ci), 
          .COUT(co0), .S0(ifcount_0), .S1(ifcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(283[19:24])
    defparam bdcnt_bctr_0.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INJECT1_0 = "NO";
    defparam bdcnt_bctr_0.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_1 (.A0(fcount_2), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(co0), 
          .S0(ifcount_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(290[19:24])
    defparam bdcnt_bctr_1.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INJECT1_0 = "NO";
    defparam bdcnt_bctr_1.INJECT1_1 = "NO";
    CCU2C e_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(297[17:22])
    defparam e_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INJECT1_0 = "NO";
    defparam e_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C e_cmp_0 (.A0(rden_i), .B0(fcount_0), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_1), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci), 
          .COUT(co0_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(304[14:19])
    defparam e_cmp_0.INIT0 = 16'b1001100110101010;
    defparam e_cmp_0.INIT1 = 16'b1001100110101010;
    defparam e_cmp_0.INJECT1_0 = "NO";
    defparam e_cmp_0.INJECT1_1 = "NO";
    CCU2C e_cmp_1 (.A0(GND_net), .B0(fcount_2), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_1), 
          .COUT(cmp_le_1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(311[14:19])
    defparam e_cmp_1.INIT0 = 16'b1001100110101010;
    defparam e_cmp_1.INIT1 = 16'b1001100110101010;
    defparam e_cmp_1.INJECT1_0 = "NO";
    defparam e_cmp_1.INJECT1_1 = "NO";
    CCU2C a0 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_le_1_c), 
          .S0(cmp_le_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(319[9:14])
    defparam a0.INIT0 = 16'b0110011010101010;
    defparam a0.INIT1 = 16'b0110011010101010;
    defparam a0.INJECT1_0 = "NO";
    defparam a0.INJECT1_1 = "NO";
    CCU2C g_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(327[17:22])
    defparam g_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INJECT1_0 = "NO";
    defparam g_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C g_cmp_0 (.A0(fcount_0), .B0(wren_i), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(wren_i), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci_1), 
          .COUT(co0_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(334[14:19])
    defparam g_cmp_0.INIT0 = 16'b1001100110101010;
    defparam g_cmp_0.INIT1 = 16'b1001100110101010;
    defparam g_cmp_0.INJECT1_0 = "NO";
    defparam g_cmp_0.INJECT1_1 = "NO";
    CCU2C g_cmp_1 (.A0(fcount_2), .B0(wren_i_inv), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_2), 
          .COUT(cmp_ge_d1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(341[14:19])
    defparam g_cmp_1.INIT0 = 16'b1001100110101010;
    defparam g_cmp_1.INIT1 = 16'b1001100110101010;
    defparam g_cmp_1.INJECT1_0 = "NO";
    defparam g_cmp_1.INJECT1_1 = "NO";
    CCU2C a1 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ge_d1_c), 
          .S0(cmp_ge_d1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(349[9:14])
    defparam a1.INIT0 = 16'b0110011010101010;
    defparam a1.INIT1 = 16'b0110011010101010;
    defparam a1.INJECT1_0 = "NO";
    defparam a1.INJECT1_1 = "NO";
    CCU2C w_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(w_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(357[16:21])
    defparam w_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam w_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam w_ctr_cia.INJECT1_0 = "NO";
    defparam w_ctr_cia.INJECT1_1 = "NO";
    CCU2C w_ctr_0 (.A0(wcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(wcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(w_ctr_ci), 
          .S0(iwcount_0), .S1(iwcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(364[14:19])
    defparam w_ctr_0.INIT0 = 16'b0110011010101010;
    defparam w_ctr_0.INIT1 = 16'b0110011010101010;
    defparam w_ctr_0.INJECT1_0 = "NO";
    defparam w_ctr_0.INJECT1_1 = "NO";
    CCU2C r_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(r_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(380[16:21])
    defparam r_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam r_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam r_ctr_cia.INJECT1_0 = "NO";
    defparam r_ctr_cia.INJECT1_1 = "NO";
    CCU2C r_ctr_0 (.A0(rcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(rcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(r_ctr_ci), 
          .S0(ircount_0), .S1(ircount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(387[14:19])
    defparam r_ctr_0.INIT0 = 16'b0110011010101010;
    defparam r_ctr_0.INIT1 = 16'b0110011010101010;
    defparam r_ctr_0.INJECT1_0 = "NO";
    defparam r_ctr_0.INJECT1_1 = "NO";
    AND2 AND2_t4 (.A(Write_En_c), .B(invout_2), .Z(wren_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(129[14:18])
    INV INV_8 (.A(Full), .Z(invout_2)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(183[17:35])
    AND2 AND2_t3 (.A(\adc_fifo_rd_en[2] ), .B(invout_1), .Z(rden_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(135[14:18])
    INV INV_7 (.A(\adc_fifo_empty[2] ), .Z(invout_1)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(183[17:35])
    AND2 AND2_t2 (.A(wren_i), .B(rden_i_inv), .Z(cnt_con)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(141[14:18])
    XOR2 XOR2_t1 (.A(wren_i), .B(rden_i), .Z(fcnt_en)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(144[14:18])
    INV INV_6 (.A(rden_i), .Z(rden_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(183[17:35])
    INV INV_5 (.A(wren_i), .Z(wren_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(183[17:35])
    ROM16X1A LUT4_3 (.AD0(\adc_fifo_empty[2] ), .AD1(wren_i), .AD2(cmp_le_1), 
            .AD3(GND_net), .DO0(empty_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(183[17:35])
    defparam LUT4_3.initval = 16'b0011001000110010;
    ROM16X1A LUT4_2 (.AD0(Full), .AD1(rden_i), .AD2(cmp_ge_d1), .AD3(GND_net), 
            .DO0(full_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(183[17:35])
    defparam LUT4_2.initval = 16'b0011001000110010;
    PDPW16KD pdp_ram_0_0_0 (.DI0(Data_x2[0]), .DI1(Data_x2[1]), .DI2(Data_x2[2]), 
            .DI3(Data_x2[3]), .DI4(Data_x2[4]), .DI5(Data_x2[5]), .DI6(Data_x2[6]), 
            .DI7(Data_x2[7]), .DI8(Data_x2[8]), .DI9(Data_x2[9]), .DI10(Data_x2[10]), 
            .DI11(Data_x2[11]), .DI12(Data_x2[12]), .DI13(Data_x2[13]), 
            .DI14(Data_x2[14]), .DI15(Data_x2[15]), .DI16(Data_x2[16]), 
            .DI17(Data_x2[17]), .DI18(Data_x2[18]), .DI19(Data_x2[19]), 
            .DI20(Data_x2[20]), .DI21(Data_x2[21]), .DI22(Data_x2[22]), 
            .DI23(Data_x2[23]), .DI24(GND_net), .DI25(GND_net), .DI26(GND_net), 
            .DI27(GND_net), .DI28(GND_net), .DI29(GND_net), .DI30(GND_net), 
            .DI31(GND_net), .DI32(GND_net), .DI33(GND_net), .DI34(GND_net), 
            .DI35(GND_net), .ADW0(wcount_0), .ADW1(wcount_1), .ADW2(GND_net), 
            .ADW3(GND_net), .ADW4(GND_net), .ADW5(GND_net), .ADW6(GND_net), 
            .ADW7(GND_net), .ADW8(GND_net), .BE0(VCC_net), .BE1(VCC_net), 
            .BE2(VCC_net), .BE3(VCC_net), .CEW(wren_i), .CLKW(clk_c), 
            .CSW0(VCC_net), .CSW1(GND_net), .CSW2(GND_net), .ADR0(GND_net), 
            .ADR1(GND_net), .ADR2(GND_net), .ADR3(GND_net), .ADR4(GND_net), 
            .ADR5(rcount_0), .ADR6(rcount_1), .ADR7(GND_net), .ADR8(GND_net), 
            .ADR9(GND_net), .ADR10(GND_net), .ADR11(GND_net), .ADR12(GND_net), 
            .ADR13(GND_net), .CER(rden_i), .OCER(rden_i), .CLKR(clk_c), 
            .CSR0(GND_net), .CSR1(GND_net), .CSR2(GND_net), .RST(rst_c), 
            .DO0(adc_fifo_2_dout[18]), .DO1(adc_fifo_2_dout[19]), .DO2(adc_fifo_2_dout[20]), 
            .DO3(adc_fifo_2_dout[21]), .DO4(adc_fifo_2_dout[22]), .DO5(adc_fifo_2_dout[23]), 
            .DO18(adc_fifo_2_dout[0]), .DO19(adc_fifo_2_dout[1]), .DO20(adc_fifo_2_dout[2]), 
            .DO21(adc_fifo_2_dout[3]), .DO22(adc_fifo_2_dout[4]), .DO23(adc_fifo_2_dout[5]), 
            .DO24(adc_fifo_2_dout[6]), .DO25(adc_fifo_2_dout[7]), .DO26(adc_fifo_2_dout[8]), 
            .DO27(adc_fifo_2_dout[9]), .DO28(adc_fifo_2_dout[10]), .DO29(adc_fifo_2_dout[11]), 
            .DO30(adc_fifo_2_dout[12]), .DO31(adc_fifo_2_dout[13]), .DO32(adc_fifo_2_dout[14]), 
            .DO33(adc_fifo_2_dout[15]), .DO34(adc_fifo_2_dout[16]), .DO35(adc_fifo_2_dout[17])) /* synthesis syn_black_box=true, MEM_LPC_FILE="FIFOsm.lpc", MEM_INIT_FILE="", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=183, LSE_RLINE=183 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(183[17:35])
    defparam pdp_ram_0_0_0.DATA_WIDTH_W = 36;
    defparam pdp_ram_0_0_0.DATA_WIDTH_R = 36;
    defparam pdp_ram_0_0_0.GSR = "ENABLED";
    defparam pdp_ram_0_0_0.REGMODE = "NOREG";
    defparam pdp_ram_0_0_0.RESETMODE = "ASYNC";
    defparam pdp_ram_0_0_0.ASYNC_RESET_RELEASE = "SYNC";
    defparam pdp_ram_0_0_0.CSDECODE_W = "0b001";
    defparam pdp_ram_0_0_0.CSDECODE_R = "0b000";
    defparam pdp_ram_0_0_0.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_20 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_21 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_22 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_23 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_24 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_25 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_26 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_27 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_28 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_29 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_30 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_31 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_32 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_33 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_34 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_35 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_36 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_37 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_38 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_39 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INIT_DATA = "STATIC";
    
endmodule
//
// Verilog Description of module FIFOsm_U5
//

module FIFOsm_U5 (clk_c, \adc_fifo_empty[3] , GND_net, VCC_net, Write_En_c, 
            \adc_fifo_rd_en[3] , Data_c_21, Data_c_20, Data_c_19, Data_c_18, 
            Data_c_17, Data_c_16, Data_c_15, Data_c_14, Data_c_13, 
            Data_c_12, Data_c_11, Data_c_10, Data_c_9, Data_c_8, Data_c_7, 
            Data_c_6, Data_c_5, Data_c_4, Data_c_3, Data_c_2, Data_c_1, 
            Data_c_0, rst_c, adc_fifo_3_dout) /* synthesis NGD_DRC_MASK=1 */ ;
    input clk_c;
    output \adc_fifo_empty[3] ;
    input GND_net;
    input VCC_net;
    input Write_En_c;
    input \adc_fifo_rd_en[3] ;
    input Data_c_21;
    input Data_c_20;
    input Data_c_19;
    input Data_c_18;
    input Data_c_17;
    input Data_c_16;
    input Data_c_15;
    input Data_c_14;
    input Data_c_13;
    input Data_c_12;
    input Data_c_11;
    input Data_c_10;
    input Data_c_9;
    input Data_c_8;
    input Data_c_7;
    input Data_c_6;
    input Data_c_5;
    input Data_c_4;
    input Data_c_3;
    input Data_c_2;
    input Data_c_1;
    input Data_c_0;
    input rst_c;
    output [23:0]adc_fifo_3_dout;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    
    wire fcount_1, fcnt_en, ifcount_1, fcount_2, ifcount_2, empty_d, 
        Full, full_d, wcount_0, wren_i, iwcount_0, wcount_1, iwcount_1, 
        rcount_0, rden_i, ircount_0, rcount_1, ircount_1, fcount_0, 
        ifcount_0, bdcnt_bctr_ci, cnt_con, co0, cmp_ci, co0_1, cmp_le_1_c, 
        cmp_le_1, cmp_ci_1, co0_2, wren_i_inv, cmp_ge_d1_c, cmp_ge_d1, 
        w_ctr_ci, r_ctr_ci, invout_2, invout_1, rden_i_inv;
    
    FD1P3AX FF_11 (.D(ifcount_1), .SP(fcnt_en), .CK(clk_c), .Q(fcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(232[12:19])
    defparam FF_11.GSR = "ENABLED";
    FD1P3AX FF_10 (.D(ifcount_2), .SP(fcnt_en), .CK(clk_c), .Q(fcount_2)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(236[12:19])
    defparam FF_10.GSR = "ENABLED";
    FD1S3AY FF_9 (.D(empty_d), .CK(clk_c), .Q(\adc_fifo_empty[3] )) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(240[11:18])
    defparam FF_9.GSR = "ENABLED";
    FD1S3AX FF_8 (.D(full_d), .CK(clk_c), .Q(Full)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(243[11:18])
    defparam FF_8.GSR = "ENABLED";
    FD1P3AX FF_7 (.D(iwcount_0), .SP(wren_i), .CK(clk_c), .Q(wcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(246[11:18])
    defparam FF_7.GSR = "ENABLED";
    FD1P3AX FF_6 (.D(iwcount_1), .SP(wren_i), .CK(clk_c), .Q(wcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(250[11:18])
    defparam FF_6.GSR = "ENABLED";
    FD1P3AX FF_4 (.D(ircount_0), .SP(rden_i), .CK(clk_c), .Q(rcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(258[11:18])
    defparam FF_4.GSR = "ENABLED";
    FD1P3AX FF_3 (.D(ircount_1), .SP(rden_i), .CK(clk_c), .Q(rcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(262[11:18])
    defparam FF_3.GSR = "ENABLED";
    FD1P3AX FF_12 (.D(ifcount_0), .SP(fcnt_en), .CK(clk_c), .Q(fcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(228[12:19])
    defparam FF_12.GSR = "ENABLED";
    CCU2C bdcnt_bctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(cnt_con), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .COUT(bdcnt_bctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(276[21:26])
    defparam bdcnt_bctr_cia.INIT0 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INIT1 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INJECT1_0 = "NO";
    defparam bdcnt_bctr_cia.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_0 (.A0(fcount_0), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(bdcnt_bctr_ci), 
          .COUT(co0), .S0(ifcount_0), .S1(ifcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(283[19:24])
    defparam bdcnt_bctr_0.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INJECT1_0 = "NO";
    defparam bdcnt_bctr_0.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_1 (.A0(fcount_2), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(co0), 
          .S0(ifcount_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(290[19:24])
    defparam bdcnt_bctr_1.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INJECT1_0 = "NO";
    defparam bdcnt_bctr_1.INJECT1_1 = "NO";
    CCU2C e_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(297[17:22])
    defparam e_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INJECT1_0 = "NO";
    defparam e_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C e_cmp_0 (.A0(rden_i), .B0(fcount_0), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_1), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci), 
          .COUT(co0_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(304[14:19])
    defparam e_cmp_0.INIT0 = 16'b1001100110101010;
    defparam e_cmp_0.INIT1 = 16'b1001100110101010;
    defparam e_cmp_0.INJECT1_0 = "NO";
    defparam e_cmp_0.INJECT1_1 = "NO";
    CCU2C e_cmp_1 (.A0(GND_net), .B0(fcount_2), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_1), 
          .COUT(cmp_le_1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(311[14:19])
    defparam e_cmp_1.INIT0 = 16'b1001100110101010;
    defparam e_cmp_1.INIT1 = 16'b1001100110101010;
    defparam e_cmp_1.INJECT1_0 = "NO";
    defparam e_cmp_1.INJECT1_1 = "NO";
    CCU2C a0 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_le_1_c), 
          .S0(cmp_le_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(319[9:14])
    defparam a0.INIT0 = 16'b0110011010101010;
    defparam a0.INIT1 = 16'b0110011010101010;
    defparam a0.INJECT1_0 = "NO";
    defparam a0.INJECT1_1 = "NO";
    CCU2C g_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(327[17:22])
    defparam g_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INJECT1_0 = "NO";
    defparam g_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C g_cmp_0 (.A0(fcount_0), .B0(wren_i), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(wren_i), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci_1), 
          .COUT(co0_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(334[14:19])
    defparam g_cmp_0.INIT0 = 16'b1001100110101010;
    defparam g_cmp_0.INIT1 = 16'b1001100110101010;
    defparam g_cmp_0.INJECT1_0 = "NO";
    defparam g_cmp_0.INJECT1_1 = "NO";
    CCU2C g_cmp_1 (.A0(fcount_2), .B0(wren_i_inv), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_2), 
          .COUT(cmp_ge_d1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(341[14:19])
    defparam g_cmp_1.INIT0 = 16'b1001100110101010;
    defparam g_cmp_1.INIT1 = 16'b1001100110101010;
    defparam g_cmp_1.INJECT1_0 = "NO";
    defparam g_cmp_1.INJECT1_1 = "NO";
    CCU2C a1 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ge_d1_c), 
          .S0(cmp_ge_d1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(349[9:14])
    defparam a1.INIT0 = 16'b0110011010101010;
    defparam a1.INIT1 = 16'b0110011010101010;
    defparam a1.INJECT1_0 = "NO";
    defparam a1.INJECT1_1 = "NO";
    CCU2C w_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(w_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(357[16:21])
    defparam w_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam w_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam w_ctr_cia.INJECT1_0 = "NO";
    defparam w_ctr_cia.INJECT1_1 = "NO";
    CCU2C w_ctr_0 (.A0(wcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(wcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(w_ctr_ci), 
          .S0(iwcount_0), .S1(iwcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(364[14:19])
    defparam w_ctr_0.INIT0 = 16'b0110011010101010;
    defparam w_ctr_0.INIT1 = 16'b0110011010101010;
    defparam w_ctr_0.INJECT1_0 = "NO";
    defparam w_ctr_0.INJECT1_1 = "NO";
    CCU2C r_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(r_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(380[16:21])
    defparam r_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam r_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam r_ctr_cia.INJECT1_0 = "NO";
    defparam r_ctr_cia.INJECT1_1 = "NO";
    CCU2C r_ctr_0 (.A0(rcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(rcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(r_ctr_ci), 
          .S0(ircount_0), .S1(ircount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(387[14:19])
    defparam r_ctr_0.INIT0 = 16'b0110011010101010;
    defparam r_ctr_0.INIT1 = 16'b0110011010101010;
    defparam r_ctr_0.INJECT1_0 = "NO";
    defparam r_ctr_0.INJECT1_1 = "NO";
    AND2 AND2_t4 (.A(Write_En_c), .B(invout_2), .Z(wren_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(129[14:18])
    INV INV_8 (.A(Full), .Z(invout_2)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(197[17:35])
    AND2 AND2_t3 (.A(\adc_fifo_rd_en[3] ), .B(invout_1), .Z(rden_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(135[14:18])
    INV INV_7 (.A(\adc_fifo_empty[3] ), .Z(invout_1)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(197[17:35])
    AND2 AND2_t2 (.A(wren_i), .B(rden_i_inv), .Z(cnt_con)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(141[14:18])
    XOR2 XOR2_t1 (.A(wren_i), .B(rden_i), .Z(fcnt_en)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(144[14:18])
    INV INV_6 (.A(rden_i), .Z(rden_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(197[17:35])
    INV INV_5 (.A(wren_i), .Z(wren_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(197[17:35])
    ROM16X1A LUT4_3 (.AD0(\adc_fifo_empty[3] ), .AD1(wren_i), .AD2(cmp_le_1), 
            .AD3(GND_net), .DO0(empty_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(197[17:35])
    defparam LUT4_3.initval = 16'b0011001000110010;
    ROM16X1A LUT4_2 (.AD0(Full), .AD1(rden_i), .AD2(cmp_ge_d1), .AD3(GND_net), 
            .DO0(full_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(197[17:35])
    defparam LUT4_2.initval = 16'b0011001000110010;
    PDPW16KD pdp_ram_0_0_0 (.DI0(GND_net), .DI1(GND_net), .DI2(Data_c_0), 
            .DI3(Data_c_1), .DI4(Data_c_2), .DI5(Data_c_3), .DI6(Data_c_4), 
            .DI7(Data_c_5), .DI8(Data_c_6), .DI9(Data_c_7), .DI10(Data_c_8), 
            .DI11(Data_c_9), .DI12(Data_c_10), .DI13(Data_c_11), .DI14(Data_c_12), 
            .DI15(Data_c_13), .DI16(Data_c_14), .DI17(Data_c_15), .DI18(Data_c_16), 
            .DI19(Data_c_17), .DI20(Data_c_18), .DI21(Data_c_19), .DI22(Data_c_20), 
            .DI23(Data_c_21), .DI24(GND_net), .DI25(GND_net), .DI26(GND_net), 
            .DI27(GND_net), .DI28(GND_net), .DI29(GND_net), .DI30(GND_net), 
            .DI31(GND_net), .DI32(GND_net), .DI33(GND_net), .DI34(GND_net), 
            .DI35(GND_net), .ADW0(wcount_0), .ADW1(wcount_1), .ADW2(GND_net), 
            .ADW3(GND_net), .ADW4(GND_net), .ADW5(GND_net), .ADW6(GND_net), 
            .ADW7(GND_net), .ADW8(GND_net), .BE0(VCC_net), .BE1(VCC_net), 
            .BE2(VCC_net), .BE3(VCC_net), .CEW(wren_i), .CLKW(clk_c), 
            .CSW0(VCC_net), .CSW1(GND_net), .CSW2(GND_net), .ADR0(GND_net), 
            .ADR1(GND_net), .ADR2(GND_net), .ADR3(GND_net), .ADR4(GND_net), 
            .ADR5(rcount_0), .ADR6(rcount_1), .ADR7(GND_net), .ADR8(GND_net), 
            .ADR9(GND_net), .ADR10(GND_net), .ADR11(GND_net), .ADR12(GND_net), 
            .ADR13(GND_net), .CER(rden_i), .OCER(rden_i), .CLKR(clk_c), 
            .CSR0(GND_net), .CSR1(GND_net), .CSR2(GND_net), .RST(rst_c), 
            .DO0(adc_fifo_3_dout[18]), .DO1(adc_fifo_3_dout[19]), .DO2(adc_fifo_3_dout[20]), 
            .DO3(adc_fifo_3_dout[21]), .DO4(adc_fifo_3_dout[22]), .DO5(adc_fifo_3_dout[23]), 
            .DO18(adc_fifo_3_dout[0]), .DO19(adc_fifo_3_dout[1]), .DO20(adc_fifo_3_dout[2]), 
            .DO21(adc_fifo_3_dout[3]), .DO22(adc_fifo_3_dout[4]), .DO23(adc_fifo_3_dout[5]), 
            .DO24(adc_fifo_3_dout[6]), .DO25(adc_fifo_3_dout[7]), .DO26(adc_fifo_3_dout[8]), 
            .DO27(adc_fifo_3_dout[9]), .DO28(adc_fifo_3_dout[10]), .DO29(adc_fifo_3_dout[11]), 
            .DO30(adc_fifo_3_dout[12]), .DO31(adc_fifo_3_dout[13]), .DO32(adc_fifo_3_dout[14]), 
            .DO33(adc_fifo_3_dout[15]), .DO34(adc_fifo_3_dout[16]), .DO35(adc_fifo_3_dout[17])) /* synthesis syn_black_box=true, MEM_LPC_FILE="FIFOsm.lpc", MEM_INIT_FILE="", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=197, LSE_RLINE=197 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(197[17:35])
    defparam pdp_ram_0_0_0.DATA_WIDTH_W = 36;
    defparam pdp_ram_0_0_0.DATA_WIDTH_R = 36;
    defparam pdp_ram_0_0_0.GSR = "ENABLED";
    defparam pdp_ram_0_0_0.REGMODE = "NOREG";
    defparam pdp_ram_0_0_0.RESETMODE = "ASYNC";
    defparam pdp_ram_0_0_0.ASYNC_RESET_RELEASE = "SYNC";
    defparam pdp_ram_0_0_0.CSDECODE_W = "0b001";
    defparam pdp_ram_0_0_0.CSDECODE_R = "0b000";
    defparam pdp_ram_0_0_0.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_20 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_21 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_22 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_23 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_24 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_25 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_26 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_27 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_28 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_29 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_30 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_31 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_32 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_33 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_34 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_35 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_36 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_37 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_38 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_39 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INIT_DATA = "STATIC";
    
endmodule
//
// Verilog Description of module FIFOsm_U4
//

module FIFOsm_U4 (clk_c, \adc_fifo_empty[4] , GND_net, VCC_net, Write_En_c, 
            \adc_fifo_rd_en[4] , Data_x4, rst_c, adc_fifo_4_dout) /* synthesis NGD_DRC_MASK=1 */ ;
    input clk_c;
    output \adc_fifo_empty[4] ;
    input GND_net;
    input VCC_net;
    input Write_En_c;
    input \adc_fifo_rd_en[4] ;
    input [23:0]Data_x4;
    input rst_c;
    output [23:0]adc_fifo_4_dout;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    
    wire fcount_1, fcnt_en, ifcount_1, fcount_2, ifcount_2, empty_d, 
        Full, full_d, wcount_0, wren_i, iwcount_0, wcount_1, iwcount_1, 
        rcount_0, rden_i, ircount_0, rcount_1, ircount_1, fcount_0, 
        ifcount_0, bdcnt_bctr_ci, cnt_con, co0, cmp_ci, co0_1, cmp_le_1_c, 
        cmp_le_1, cmp_ci_1, co0_2, wren_i_inv, cmp_ge_d1_c, cmp_ge_d1, 
        w_ctr_ci, r_ctr_ci, invout_2, invout_1, rden_i_inv;
    
    FD1P3AX FF_11 (.D(ifcount_1), .SP(fcnt_en), .CK(clk_c), .Q(fcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(232[12:19])
    defparam FF_11.GSR = "ENABLED";
    FD1P3AX FF_10 (.D(ifcount_2), .SP(fcnt_en), .CK(clk_c), .Q(fcount_2)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(236[12:19])
    defparam FF_10.GSR = "ENABLED";
    FD1S3AY FF_9 (.D(empty_d), .CK(clk_c), .Q(\adc_fifo_empty[4] )) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(240[11:18])
    defparam FF_9.GSR = "ENABLED";
    FD1S3AX FF_8 (.D(full_d), .CK(clk_c), .Q(Full)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(243[11:18])
    defparam FF_8.GSR = "ENABLED";
    FD1P3AX FF_7 (.D(iwcount_0), .SP(wren_i), .CK(clk_c), .Q(wcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(246[11:18])
    defparam FF_7.GSR = "ENABLED";
    FD1P3AX FF_6 (.D(iwcount_1), .SP(wren_i), .CK(clk_c), .Q(wcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(250[11:18])
    defparam FF_6.GSR = "ENABLED";
    FD1P3AX FF_4 (.D(ircount_0), .SP(rden_i), .CK(clk_c), .Q(rcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(258[11:18])
    defparam FF_4.GSR = "ENABLED";
    FD1P3AX FF_3 (.D(ircount_1), .SP(rden_i), .CK(clk_c), .Q(rcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(262[11:18])
    defparam FF_3.GSR = "ENABLED";
    FD1P3AX FF_12 (.D(ifcount_0), .SP(fcnt_en), .CK(clk_c), .Q(fcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(228[12:19])
    defparam FF_12.GSR = "ENABLED";
    CCU2C bdcnt_bctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(cnt_con), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .COUT(bdcnt_bctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(276[21:26])
    defparam bdcnt_bctr_cia.INIT0 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INIT1 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INJECT1_0 = "NO";
    defparam bdcnt_bctr_cia.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_0 (.A0(fcount_0), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(bdcnt_bctr_ci), 
          .COUT(co0), .S0(ifcount_0), .S1(ifcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(283[19:24])
    defparam bdcnt_bctr_0.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INJECT1_0 = "NO";
    defparam bdcnt_bctr_0.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_1 (.A0(fcount_2), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(co0), 
          .S0(ifcount_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(290[19:24])
    defparam bdcnt_bctr_1.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INJECT1_0 = "NO";
    defparam bdcnt_bctr_1.INJECT1_1 = "NO";
    CCU2C e_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(297[17:22])
    defparam e_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INJECT1_0 = "NO";
    defparam e_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C e_cmp_0 (.A0(rden_i), .B0(fcount_0), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_1), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci), 
          .COUT(co0_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(304[14:19])
    defparam e_cmp_0.INIT0 = 16'b1001100110101010;
    defparam e_cmp_0.INIT1 = 16'b1001100110101010;
    defparam e_cmp_0.INJECT1_0 = "NO";
    defparam e_cmp_0.INJECT1_1 = "NO";
    CCU2C e_cmp_1 (.A0(GND_net), .B0(fcount_2), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_1), 
          .COUT(cmp_le_1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(311[14:19])
    defparam e_cmp_1.INIT0 = 16'b1001100110101010;
    defparam e_cmp_1.INIT1 = 16'b1001100110101010;
    defparam e_cmp_1.INJECT1_0 = "NO";
    defparam e_cmp_1.INJECT1_1 = "NO";
    CCU2C a0 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_le_1_c), 
          .S0(cmp_le_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(319[9:14])
    defparam a0.INIT0 = 16'b0110011010101010;
    defparam a0.INIT1 = 16'b0110011010101010;
    defparam a0.INJECT1_0 = "NO";
    defparam a0.INJECT1_1 = "NO";
    CCU2C g_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(327[17:22])
    defparam g_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INJECT1_0 = "NO";
    defparam g_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C g_cmp_0 (.A0(fcount_0), .B0(wren_i), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(wren_i), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci_1), 
          .COUT(co0_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(334[14:19])
    defparam g_cmp_0.INIT0 = 16'b1001100110101010;
    defparam g_cmp_0.INIT1 = 16'b1001100110101010;
    defparam g_cmp_0.INJECT1_0 = "NO";
    defparam g_cmp_0.INJECT1_1 = "NO";
    CCU2C g_cmp_1 (.A0(fcount_2), .B0(wren_i_inv), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_2), 
          .COUT(cmp_ge_d1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(341[14:19])
    defparam g_cmp_1.INIT0 = 16'b1001100110101010;
    defparam g_cmp_1.INIT1 = 16'b1001100110101010;
    defparam g_cmp_1.INJECT1_0 = "NO";
    defparam g_cmp_1.INJECT1_1 = "NO";
    CCU2C a1 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ge_d1_c), 
          .S0(cmp_ge_d1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(349[9:14])
    defparam a1.INIT0 = 16'b0110011010101010;
    defparam a1.INIT1 = 16'b0110011010101010;
    defparam a1.INJECT1_0 = "NO";
    defparam a1.INJECT1_1 = "NO";
    CCU2C w_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(w_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(357[16:21])
    defparam w_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam w_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam w_ctr_cia.INJECT1_0 = "NO";
    defparam w_ctr_cia.INJECT1_1 = "NO";
    CCU2C w_ctr_0 (.A0(wcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(wcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(w_ctr_ci), 
          .S0(iwcount_0), .S1(iwcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(364[14:19])
    defparam w_ctr_0.INIT0 = 16'b0110011010101010;
    defparam w_ctr_0.INIT1 = 16'b0110011010101010;
    defparam w_ctr_0.INJECT1_0 = "NO";
    defparam w_ctr_0.INJECT1_1 = "NO";
    CCU2C r_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(r_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(380[16:21])
    defparam r_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam r_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam r_ctr_cia.INJECT1_0 = "NO";
    defparam r_ctr_cia.INJECT1_1 = "NO";
    CCU2C r_ctr_0 (.A0(rcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(rcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(r_ctr_ci), 
          .S0(ircount_0), .S1(ircount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(387[14:19])
    defparam r_ctr_0.INIT0 = 16'b0110011010101010;
    defparam r_ctr_0.INIT1 = 16'b0110011010101010;
    defparam r_ctr_0.INJECT1_0 = "NO";
    defparam r_ctr_0.INJECT1_1 = "NO";
    AND2 AND2_t4 (.A(Write_En_c), .B(invout_2), .Z(wren_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(129[14:18])
    INV INV_8 (.A(Full), .Z(invout_2)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(211[17:35])
    AND2 AND2_t3 (.A(\adc_fifo_rd_en[4] ), .B(invout_1), .Z(rden_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(135[14:18])
    INV INV_7 (.A(\adc_fifo_empty[4] ), .Z(invout_1)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(211[17:35])
    AND2 AND2_t2 (.A(wren_i), .B(rden_i_inv), .Z(cnt_con)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(141[14:18])
    XOR2 XOR2_t1 (.A(wren_i), .B(rden_i), .Z(fcnt_en)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(144[14:18])
    INV INV_6 (.A(rden_i), .Z(rden_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(211[17:35])
    INV INV_5 (.A(wren_i), .Z(wren_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(211[17:35])
    ROM16X1A LUT4_3 (.AD0(\adc_fifo_empty[4] ), .AD1(wren_i), .AD2(cmp_le_1), 
            .AD3(GND_net), .DO0(empty_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(211[17:35])
    defparam LUT4_3.initval = 16'b0011001000110010;
    ROM16X1A LUT4_2 (.AD0(Full), .AD1(rden_i), .AD2(cmp_ge_d1), .AD3(GND_net), 
            .DO0(full_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(211[17:35])
    defparam LUT4_2.initval = 16'b0011001000110010;
    PDPW16KD pdp_ram_0_0_0 (.DI0(Data_x4[0]), .DI1(Data_x4[1]), .DI2(Data_x4[2]), 
            .DI3(Data_x4[3]), .DI4(Data_x4[4]), .DI5(Data_x4[5]), .DI6(Data_x4[6]), 
            .DI7(Data_x4[7]), .DI8(Data_x4[8]), .DI9(Data_x4[9]), .DI10(Data_x4[10]), 
            .DI11(Data_x4[11]), .DI12(Data_x4[12]), .DI13(Data_x4[13]), 
            .DI14(Data_x4[14]), .DI15(Data_x4[15]), .DI16(Data_x4[16]), 
            .DI17(Data_x4[17]), .DI18(Data_x4[18]), .DI19(Data_x4[19]), 
            .DI20(Data_x4[20]), .DI21(Data_x4[21]), .DI22(Data_x4[22]), 
            .DI23(Data_x4[23]), .DI24(GND_net), .DI25(GND_net), .DI26(GND_net), 
            .DI27(GND_net), .DI28(GND_net), .DI29(GND_net), .DI30(GND_net), 
            .DI31(GND_net), .DI32(GND_net), .DI33(GND_net), .DI34(GND_net), 
            .DI35(GND_net), .ADW0(wcount_0), .ADW1(wcount_1), .ADW2(GND_net), 
            .ADW3(GND_net), .ADW4(GND_net), .ADW5(GND_net), .ADW6(GND_net), 
            .ADW7(GND_net), .ADW8(GND_net), .BE0(VCC_net), .BE1(VCC_net), 
            .BE2(VCC_net), .BE3(VCC_net), .CEW(wren_i), .CLKW(clk_c), 
            .CSW0(VCC_net), .CSW1(GND_net), .CSW2(GND_net), .ADR0(GND_net), 
            .ADR1(GND_net), .ADR2(GND_net), .ADR3(GND_net), .ADR4(GND_net), 
            .ADR5(rcount_0), .ADR6(rcount_1), .ADR7(GND_net), .ADR8(GND_net), 
            .ADR9(GND_net), .ADR10(GND_net), .ADR11(GND_net), .ADR12(GND_net), 
            .ADR13(GND_net), .CER(rden_i), .OCER(rden_i), .CLKR(clk_c), 
            .CSR0(GND_net), .CSR1(GND_net), .CSR2(GND_net), .RST(rst_c), 
            .DO0(adc_fifo_4_dout[18]), .DO1(adc_fifo_4_dout[19]), .DO2(adc_fifo_4_dout[20]), 
            .DO3(adc_fifo_4_dout[21]), .DO4(adc_fifo_4_dout[22]), .DO5(adc_fifo_4_dout[23]), 
            .DO18(adc_fifo_4_dout[0]), .DO19(adc_fifo_4_dout[1]), .DO20(adc_fifo_4_dout[2]), 
            .DO21(adc_fifo_4_dout[3]), .DO22(adc_fifo_4_dout[4]), .DO23(adc_fifo_4_dout[5]), 
            .DO24(adc_fifo_4_dout[6]), .DO25(adc_fifo_4_dout[7]), .DO26(adc_fifo_4_dout[8]), 
            .DO27(adc_fifo_4_dout[9]), .DO28(adc_fifo_4_dout[10]), .DO29(adc_fifo_4_dout[11]), 
            .DO30(adc_fifo_4_dout[12]), .DO31(adc_fifo_4_dout[13]), .DO32(adc_fifo_4_dout[14]), 
            .DO33(adc_fifo_4_dout[15]), .DO34(adc_fifo_4_dout[16]), .DO35(adc_fifo_4_dout[17])) /* synthesis syn_black_box=true, MEM_LPC_FILE="FIFOsm.lpc", MEM_INIT_FILE="", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=211, LSE_RLINE=211 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(211[17:35])
    defparam pdp_ram_0_0_0.DATA_WIDTH_W = 36;
    defparam pdp_ram_0_0_0.DATA_WIDTH_R = 36;
    defparam pdp_ram_0_0_0.GSR = "ENABLED";
    defparam pdp_ram_0_0_0.REGMODE = "NOREG";
    defparam pdp_ram_0_0_0.RESETMODE = "ASYNC";
    defparam pdp_ram_0_0_0.ASYNC_RESET_RELEASE = "SYNC";
    defparam pdp_ram_0_0_0.CSDECODE_W = "0b001";
    defparam pdp_ram_0_0_0.CSDECODE_R = "0b000";
    defparam pdp_ram_0_0_0.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_20 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_21 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_22 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_23 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_24 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_25 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_26 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_27 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_28 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_29 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_30 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_31 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_32 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_33 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_34 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_35 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_36 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_37 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_38 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_39 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INIT_DATA = "STATIC";
    
endmodule
//
// Verilog Description of module FIFOsm_U3
//

module FIFOsm_U3 (clk_c, \adc_fifo_empty[5] , GND_net, VCC_net, Write_En_c, 
            \adc_fifo_rd_en[5] , \Data_x2[22] , \Data_x2[21] , \Data_x2[20] , 
            \Data_x2[19] , \Data_x2[18] , \Data_x2[17] , \Data_x2[16] , 
            \Data_x2[15] , \Data_x2[14] , \Data_x2[13] , \Data_x2[12] , 
            \Data_x2[11] , \Data_x2[10] , \Data_x2[9] , \Data_x2[8] , 
            \Data_x2[7] , \Data_x2[6] , \Data_x2[5] , \Data_x2[4] , 
            \Data_x2[3] , \Data_x2[2] , \Data_x2[1] , \Data_x2[0] , 
            rst_c, adc_fifo_5_dout) /* synthesis NGD_DRC_MASK=1 */ ;
    input clk_c;
    output \adc_fifo_empty[5] ;
    input GND_net;
    input VCC_net;
    input Write_En_c;
    input \adc_fifo_rd_en[5] ;
    input \Data_x2[22] ;
    input \Data_x2[21] ;
    input \Data_x2[20] ;
    input \Data_x2[19] ;
    input \Data_x2[18] ;
    input \Data_x2[17] ;
    input \Data_x2[16] ;
    input \Data_x2[15] ;
    input \Data_x2[14] ;
    input \Data_x2[13] ;
    input \Data_x2[12] ;
    input \Data_x2[11] ;
    input \Data_x2[10] ;
    input \Data_x2[9] ;
    input \Data_x2[8] ;
    input \Data_x2[7] ;
    input \Data_x2[6] ;
    input \Data_x2[5] ;
    input \Data_x2[4] ;
    input \Data_x2[3] ;
    input \Data_x2[2] ;
    input \Data_x2[1] ;
    input \Data_x2[0] ;
    input rst_c;
    output [23:0]adc_fifo_5_dout;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    
    wire fcount_1, fcnt_en, ifcount_1, fcount_2, ifcount_2, empty_d, 
        Full, full_d, wcount_0, wren_i, iwcount_0, wcount_1, iwcount_1, 
        rcount_0, rden_i, ircount_0, rcount_1, ircount_1, fcount_0, 
        ifcount_0, bdcnt_bctr_ci, cnt_con, co0, cmp_ci, co0_1, cmp_le_1_c, 
        cmp_le_1, cmp_ci_1, co0_2, wren_i_inv, cmp_ge_d1_c, cmp_ge_d1, 
        w_ctr_ci, r_ctr_ci, invout_2, invout_1, rden_i_inv;
    
    FD1P3AX FF_11 (.D(ifcount_1), .SP(fcnt_en), .CK(clk_c), .Q(fcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(232[12:19])
    defparam FF_11.GSR = "ENABLED";
    FD1P3AX FF_10 (.D(ifcount_2), .SP(fcnt_en), .CK(clk_c), .Q(fcount_2)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(236[12:19])
    defparam FF_10.GSR = "ENABLED";
    FD1S3AY FF_9 (.D(empty_d), .CK(clk_c), .Q(\adc_fifo_empty[5] )) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(240[11:18])
    defparam FF_9.GSR = "ENABLED";
    FD1S3AX FF_8 (.D(full_d), .CK(clk_c), .Q(Full)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(243[11:18])
    defparam FF_8.GSR = "ENABLED";
    FD1P3AX FF_7 (.D(iwcount_0), .SP(wren_i), .CK(clk_c), .Q(wcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(246[11:18])
    defparam FF_7.GSR = "ENABLED";
    FD1P3AX FF_6 (.D(iwcount_1), .SP(wren_i), .CK(clk_c), .Q(wcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(250[11:18])
    defparam FF_6.GSR = "ENABLED";
    FD1P3AX FF_4 (.D(ircount_0), .SP(rden_i), .CK(clk_c), .Q(rcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(258[11:18])
    defparam FF_4.GSR = "ENABLED";
    FD1P3AX FF_3 (.D(ircount_1), .SP(rden_i), .CK(clk_c), .Q(rcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(262[11:18])
    defparam FF_3.GSR = "ENABLED";
    FD1P3AX FF_12 (.D(ifcount_0), .SP(fcnt_en), .CK(clk_c), .Q(fcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(228[12:19])
    defparam FF_12.GSR = "ENABLED";
    CCU2C bdcnt_bctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(cnt_con), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .COUT(bdcnt_bctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(276[21:26])
    defparam bdcnt_bctr_cia.INIT0 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INIT1 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INJECT1_0 = "NO";
    defparam bdcnt_bctr_cia.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_0 (.A0(fcount_0), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(bdcnt_bctr_ci), 
          .COUT(co0), .S0(ifcount_0), .S1(ifcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(283[19:24])
    defparam bdcnt_bctr_0.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INJECT1_0 = "NO";
    defparam bdcnt_bctr_0.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_1 (.A0(fcount_2), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(co0), 
          .S0(ifcount_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(290[19:24])
    defparam bdcnt_bctr_1.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INJECT1_0 = "NO";
    defparam bdcnt_bctr_1.INJECT1_1 = "NO";
    CCU2C e_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(297[17:22])
    defparam e_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INJECT1_0 = "NO";
    defparam e_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C e_cmp_0 (.A0(rden_i), .B0(fcount_0), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_1), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci), 
          .COUT(co0_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(304[14:19])
    defparam e_cmp_0.INIT0 = 16'b1001100110101010;
    defparam e_cmp_0.INIT1 = 16'b1001100110101010;
    defparam e_cmp_0.INJECT1_0 = "NO";
    defparam e_cmp_0.INJECT1_1 = "NO";
    CCU2C e_cmp_1 (.A0(GND_net), .B0(fcount_2), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_1), 
          .COUT(cmp_le_1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(311[14:19])
    defparam e_cmp_1.INIT0 = 16'b1001100110101010;
    defparam e_cmp_1.INIT1 = 16'b1001100110101010;
    defparam e_cmp_1.INJECT1_0 = "NO";
    defparam e_cmp_1.INJECT1_1 = "NO";
    CCU2C a0 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_le_1_c), 
          .S0(cmp_le_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(319[9:14])
    defparam a0.INIT0 = 16'b0110011010101010;
    defparam a0.INIT1 = 16'b0110011010101010;
    defparam a0.INJECT1_0 = "NO";
    defparam a0.INJECT1_1 = "NO";
    CCU2C g_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(327[17:22])
    defparam g_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INJECT1_0 = "NO";
    defparam g_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C g_cmp_0 (.A0(fcount_0), .B0(wren_i), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(wren_i), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci_1), 
          .COUT(co0_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(334[14:19])
    defparam g_cmp_0.INIT0 = 16'b1001100110101010;
    defparam g_cmp_0.INIT1 = 16'b1001100110101010;
    defparam g_cmp_0.INJECT1_0 = "NO";
    defparam g_cmp_0.INJECT1_1 = "NO";
    CCU2C g_cmp_1 (.A0(fcount_2), .B0(wren_i_inv), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_2), 
          .COUT(cmp_ge_d1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(341[14:19])
    defparam g_cmp_1.INIT0 = 16'b1001100110101010;
    defparam g_cmp_1.INIT1 = 16'b1001100110101010;
    defparam g_cmp_1.INJECT1_0 = "NO";
    defparam g_cmp_1.INJECT1_1 = "NO";
    CCU2C a1 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ge_d1_c), 
          .S0(cmp_ge_d1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(349[9:14])
    defparam a1.INIT0 = 16'b0110011010101010;
    defparam a1.INIT1 = 16'b0110011010101010;
    defparam a1.INJECT1_0 = "NO";
    defparam a1.INJECT1_1 = "NO";
    CCU2C w_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(w_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(357[16:21])
    defparam w_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam w_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam w_ctr_cia.INJECT1_0 = "NO";
    defparam w_ctr_cia.INJECT1_1 = "NO";
    CCU2C w_ctr_0 (.A0(wcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(wcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(w_ctr_ci), 
          .S0(iwcount_0), .S1(iwcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(364[14:19])
    defparam w_ctr_0.INIT0 = 16'b0110011010101010;
    defparam w_ctr_0.INIT1 = 16'b0110011010101010;
    defparam w_ctr_0.INJECT1_0 = "NO";
    defparam w_ctr_0.INJECT1_1 = "NO";
    CCU2C r_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(r_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(380[16:21])
    defparam r_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam r_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam r_ctr_cia.INJECT1_0 = "NO";
    defparam r_ctr_cia.INJECT1_1 = "NO";
    CCU2C r_ctr_0 (.A0(rcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(rcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(r_ctr_ci), 
          .S0(ircount_0), .S1(ircount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(387[14:19])
    defparam r_ctr_0.INIT0 = 16'b0110011010101010;
    defparam r_ctr_0.INIT1 = 16'b0110011010101010;
    defparam r_ctr_0.INJECT1_0 = "NO";
    defparam r_ctr_0.INJECT1_1 = "NO";
    AND2 AND2_t4 (.A(Write_En_c), .B(invout_2), .Z(wren_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(129[14:18])
    INV INV_8 (.A(Full), .Z(invout_2)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(225[17:35])
    AND2 AND2_t3 (.A(\adc_fifo_rd_en[5] ), .B(invout_1), .Z(rden_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(135[14:18])
    INV INV_7 (.A(\adc_fifo_empty[5] ), .Z(invout_1)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(225[17:35])
    AND2 AND2_t2 (.A(wren_i), .B(rden_i_inv), .Z(cnt_con)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(141[14:18])
    XOR2 XOR2_t1 (.A(wren_i), .B(rden_i), .Z(fcnt_en)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(144[14:18])
    INV INV_6 (.A(rden_i), .Z(rden_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(225[17:35])
    INV INV_5 (.A(wren_i), .Z(wren_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(225[17:35])
    ROM16X1A LUT4_3 (.AD0(\adc_fifo_empty[5] ), .AD1(wren_i), .AD2(cmp_le_1), 
            .AD3(GND_net), .DO0(empty_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(225[17:35])
    defparam LUT4_3.initval = 16'b0011001000110010;
    ROM16X1A LUT4_2 (.AD0(Full), .AD1(rden_i), .AD2(cmp_ge_d1), .AD3(GND_net), 
            .DO0(full_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(225[17:35])
    defparam LUT4_2.initval = 16'b0011001000110010;
    PDPW16KD pdp_ram_0_0_0 (.DI0(GND_net), .DI1(\Data_x2[0] ), .DI2(\Data_x2[1] ), 
            .DI3(\Data_x2[2] ), .DI4(\Data_x2[3] ), .DI5(\Data_x2[4] ), 
            .DI6(\Data_x2[5] ), .DI7(\Data_x2[6] ), .DI8(\Data_x2[7] ), 
            .DI9(\Data_x2[8] ), .DI10(\Data_x2[9] ), .DI11(\Data_x2[10] ), 
            .DI12(\Data_x2[11] ), .DI13(\Data_x2[12] ), .DI14(\Data_x2[13] ), 
            .DI15(\Data_x2[14] ), .DI16(\Data_x2[15] ), .DI17(\Data_x2[16] ), 
            .DI18(\Data_x2[17] ), .DI19(\Data_x2[18] ), .DI20(\Data_x2[19] ), 
            .DI21(\Data_x2[20] ), .DI22(\Data_x2[21] ), .DI23(\Data_x2[22] ), 
            .DI24(GND_net), .DI25(GND_net), .DI26(GND_net), .DI27(GND_net), 
            .DI28(GND_net), .DI29(GND_net), .DI30(GND_net), .DI31(GND_net), 
            .DI32(GND_net), .DI33(GND_net), .DI34(GND_net), .DI35(GND_net), 
            .ADW0(wcount_0), .ADW1(wcount_1), .ADW2(GND_net), .ADW3(GND_net), 
            .ADW4(GND_net), .ADW5(GND_net), .ADW6(GND_net), .ADW7(GND_net), 
            .ADW8(GND_net), .BE0(VCC_net), .BE1(VCC_net), .BE2(VCC_net), 
            .BE3(VCC_net), .CEW(wren_i), .CLKW(clk_c), .CSW0(VCC_net), 
            .CSW1(GND_net), .CSW2(GND_net), .ADR0(GND_net), .ADR1(GND_net), 
            .ADR2(GND_net), .ADR3(GND_net), .ADR4(GND_net), .ADR5(rcount_0), 
            .ADR6(rcount_1), .ADR7(GND_net), .ADR8(GND_net), .ADR9(GND_net), 
            .ADR10(GND_net), .ADR11(GND_net), .ADR12(GND_net), .ADR13(GND_net), 
            .CER(rden_i), .OCER(rden_i), .CLKR(clk_c), .CSR0(GND_net), 
            .CSR1(GND_net), .CSR2(GND_net), .RST(rst_c), .DO0(adc_fifo_5_dout[18]), 
            .DO1(adc_fifo_5_dout[19]), .DO2(adc_fifo_5_dout[20]), .DO3(adc_fifo_5_dout[21]), 
            .DO4(adc_fifo_5_dout[22]), .DO5(adc_fifo_5_dout[23]), .DO18(adc_fifo_5_dout[0]), 
            .DO19(adc_fifo_5_dout[1]), .DO20(adc_fifo_5_dout[2]), .DO21(adc_fifo_5_dout[3]), 
            .DO22(adc_fifo_5_dout[4]), .DO23(adc_fifo_5_dout[5]), .DO24(adc_fifo_5_dout[6]), 
            .DO25(adc_fifo_5_dout[7]), .DO26(adc_fifo_5_dout[8]), .DO27(adc_fifo_5_dout[9]), 
            .DO28(adc_fifo_5_dout[10]), .DO29(adc_fifo_5_dout[11]), .DO30(adc_fifo_5_dout[12]), 
            .DO31(adc_fifo_5_dout[13]), .DO32(adc_fifo_5_dout[14]), .DO33(adc_fifo_5_dout[15]), 
            .DO34(adc_fifo_5_dout[16]), .DO35(adc_fifo_5_dout[17])) /* synthesis syn_black_box=true, MEM_LPC_FILE="FIFOsm.lpc", MEM_INIT_FILE="", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=225, LSE_RLINE=225 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(225[17:35])
    defparam pdp_ram_0_0_0.DATA_WIDTH_W = 36;
    defparam pdp_ram_0_0_0.DATA_WIDTH_R = 36;
    defparam pdp_ram_0_0_0.GSR = "ENABLED";
    defparam pdp_ram_0_0_0.REGMODE = "NOREG";
    defparam pdp_ram_0_0_0.RESETMODE = "ASYNC";
    defparam pdp_ram_0_0_0.ASYNC_RESET_RELEASE = "SYNC";
    defparam pdp_ram_0_0_0.CSDECODE_W = "0b001";
    defparam pdp_ram_0_0_0.CSDECODE_R = "0b000";
    defparam pdp_ram_0_0_0.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_20 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_21 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_22 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_23 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_24 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_25 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_26 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_27 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_28 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_29 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_30 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_31 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_32 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_33 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_34 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_35 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_36 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_37 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_38 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_39 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INIT_DATA = "STATIC";
    
endmodule
//
// Verilog Description of module FIFOsm_U2
//

module FIFOsm_U2 (clk_c, \adc_fifo_empty[6] , GND_net, VCC_net, Write_En_c, 
            \adc_fifo_rd_en[6] , Data_x6, rst_c, adc_fifo_6_dout) /* synthesis NGD_DRC_MASK=1 */ ;
    input clk_c;
    output \adc_fifo_empty[6] ;
    input GND_net;
    input VCC_net;
    input Write_En_c;
    input \adc_fifo_rd_en[6] ;
    input [23:0]Data_x6;
    input rst_c;
    output [23:0]adc_fifo_6_dout;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    
    wire fcount_1, fcnt_en, ifcount_1, fcount_2, ifcount_2, empty_d, 
        Full, full_d, wcount_0, wren_i, iwcount_0, wcount_1, iwcount_1, 
        rcount_0, rden_i, ircount_0, rcount_1, ircount_1, fcount_0, 
        ifcount_0, bdcnt_bctr_ci, cnt_con, co0, cmp_ci, co0_1, cmp_le_1_c, 
        cmp_le_1, cmp_ci_1, co0_2, wren_i_inv, cmp_ge_d1_c, cmp_ge_d1, 
        w_ctr_ci, r_ctr_ci, invout_2, invout_1, rden_i_inv;
    
    FD1P3AX FF_11 (.D(ifcount_1), .SP(fcnt_en), .CK(clk_c), .Q(fcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(232[12:19])
    defparam FF_11.GSR = "ENABLED";
    FD1P3AX FF_10 (.D(ifcount_2), .SP(fcnt_en), .CK(clk_c), .Q(fcount_2)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(236[12:19])
    defparam FF_10.GSR = "ENABLED";
    FD1S3AY FF_9 (.D(empty_d), .CK(clk_c), .Q(\adc_fifo_empty[6] )) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(240[11:18])
    defparam FF_9.GSR = "ENABLED";
    FD1S3AX FF_8 (.D(full_d), .CK(clk_c), .Q(Full)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(243[11:18])
    defparam FF_8.GSR = "ENABLED";
    FD1P3AX FF_7 (.D(iwcount_0), .SP(wren_i), .CK(clk_c), .Q(wcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(246[11:18])
    defparam FF_7.GSR = "ENABLED";
    FD1P3AX FF_6 (.D(iwcount_1), .SP(wren_i), .CK(clk_c), .Q(wcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(250[11:18])
    defparam FF_6.GSR = "ENABLED";
    FD1P3AX FF_4 (.D(ircount_0), .SP(rden_i), .CK(clk_c), .Q(rcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(258[11:18])
    defparam FF_4.GSR = "ENABLED";
    FD1P3AX FF_3 (.D(ircount_1), .SP(rden_i), .CK(clk_c), .Q(rcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(262[11:18])
    defparam FF_3.GSR = "ENABLED";
    FD1P3AX FF_12 (.D(ifcount_0), .SP(fcnt_en), .CK(clk_c), .Q(fcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(228[12:19])
    defparam FF_12.GSR = "ENABLED";
    CCU2C bdcnt_bctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(cnt_con), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .COUT(bdcnt_bctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(276[21:26])
    defparam bdcnt_bctr_cia.INIT0 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INIT1 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INJECT1_0 = "NO";
    defparam bdcnt_bctr_cia.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_0 (.A0(fcount_0), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(bdcnt_bctr_ci), 
          .COUT(co0), .S0(ifcount_0), .S1(ifcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(283[19:24])
    defparam bdcnt_bctr_0.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INJECT1_0 = "NO";
    defparam bdcnt_bctr_0.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_1 (.A0(fcount_2), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(co0), 
          .S0(ifcount_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(290[19:24])
    defparam bdcnt_bctr_1.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INJECT1_0 = "NO";
    defparam bdcnt_bctr_1.INJECT1_1 = "NO";
    CCU2C e_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(297[17:22])
    defparam e_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INJECT1_0 = "NO";
    defparam e_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C e_cmp_0 (.A0(rden_i), .B0(fcount_0), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_1), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci), 
          .COUT(co0_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(304[14:19])
    defparam e_cmp_0.INIT0 = 16'b1001100110101010;
    defparam e_cmp_0.INIT1 = 16'b1001100110101010;
    defparam e_cmp_0.INJECT1_0 = "NO";
    defparam e_cmp_0.INJECT1_1 = "NO";
    CCU2C e_cmp_1 (.A0(GND_net), .B0(fcount_2), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_1), 
          .COUT(cmp_le_1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(311[14:19])
    defparam e_cmp_1.INIT0 = 16'b1001100110101010;
    defparam e_cmp_1.INIT1 = 16'b1001100110101010;
    defparam e_cmp_1.INJECT1_0 = "NO";
    defparam e_cmp_1.INJECT1_1 = "NO";
    CCU2C a0 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_le_1_c), 
          .S0(cmp_le_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(319[9:14])
    defparam a0.INIT0 = 16'b0110011010101010;
    defparam a0.INIT1 = 16'b0110011010101010;
    defparam a0.INJECT1_0 = "NO";
    defparam a0.INJECT1_1 = "NO";
    CCU2C g_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(327[17:22])
    defparam g_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INJECT1_0 = "NO";
    defparam g_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C g_cmp_0 (.A0(fcount_0), .B0(wren_i), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(wren_i), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci_1), 
          .COUT(co0_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(334[14:19])
    defparam g_cmp_0.INIT0 = 16'b1001100110101010;
    defparam g_cmp_0.INIT1 = 16'b1001100110101010;
    defparam g_cmp_0.INJECT1_0 = "NO";
    defparam g_cmp_0.INJECT1_1 = "NO";
    CCU2C g_cmp_1 (.A0(fcount_2), .B0(wren_i_inv), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_2), 
          .COUT(cmp_ge_d1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(341[14:19])
    defparam g_cmp_1.INIT0 = 16'b1001100110101010;
    defparam g_cmp_1.INIT1 = 16'b1001100110101010;
    defparam g_cmp_1.INJECT1_0 = "NO";
    defparam g_cmp_1.INJECT1_1 = "NO";
    CCU2C a1 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ge_d1_c), 
          .S0(cmp_ge_d1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(349[9:14])
    defparam a1.INIT0 = 16'b0110011010101010;
    defparam a1.INIT1 = 16'b0110011010101010;
    defparam a1.INJECT1_0 = "NO";
    defparam a1.INJECT1_1 = "NO";
    CCU2C w_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(w_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(357[16:21])
    defparam w_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam w_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam w_ctr_cia.INJECT1_0 = "NO";
    defparam w_ctr_cia.INJECT1_1 = "NO";
    CCU2C w_ctr_0 (.A0(wcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(wcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(w_ctr_ci), 
          .S0(iwcount_0), .S1(iwcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(364[14:19])
    defparam w_ctr_0.INIT0 = 16'b0110011010101010;
    defparam w_ctr_0.INIT1 = 16'b0110011010101010;
    defparam w_ctr_0.INJECT1_0 = "NO";
    defparam w_ctr_0.INJECT1_1 = "NO";
    CCU2C r_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(r_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(380[16:21])
    defparam r_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam r_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam r_ctr_cia.INJECT1_0 = "NO";
    defparam r_ctr_cia.INJECT1_1 = "NO";
    CCU2C r_ctr_0 (.A0(rcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(rcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(r_ctr_ci), 
          .S0(ircount_0), .S1(ircount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(387[14:19])
    defparam r_ctr_0.INIT0 = 16'b0110011010101010;
    defparam r_ctr_0.INIT1 = 16'b0110011010101010;
    defparam r_ctr_0.INJECT1_0 = "NO";
    defparam r_ctr_0.INJECT1_1 = "NO";
    AND2 AND2_t4 (.A(Write_En_c), .B(invout_2), .Z(wren_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(129[14:18])
    INV INV_8 (.A(Full), .Z(invout_2)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(239[17:35])
    AND2 AND2_t3 (.A(\adc_fifo_rd_en[6] ), .B(invout_1), .Z(rden_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(135[14:18])
    INV INV_7 (.A(\adc_fifo_empty[6] ), .Z(invout_1)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(239[17:35])
    AND2 AND2_t2 (.A(wren_i), .B(rden_i_inv), .Z(cnt_con)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(141[14:18])
    XOR2 XOR2_t1 (.A(wren_i), .B(rden_i), .Z(fcnt_en)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(144[14:18])
    INV INV_6 (.A(rden_i), .Z(rden_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(239[17:35])
    INV INV_5 (.A(wren_i), .Z(wren_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(239[17:35])
    ROM16X1A LUT4_3 (.AD0(\adc_fifo_empty[6] ), .AD1(wren_i), .AD2(cmp_le_1), 
            .AD3(GND_net), .DO0(empty_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(239[17:35])
    defparam LUT4_3.initval = 16'b0011001000110010;
    ROM16X1A LUT4_2 (.AD0(Full), .AD1(rden_i), .AD2(cmp_ge_d1), .AD3(GND_net), 
            .DO0(full_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(239[17:35])
    defparam LUT4_2.initval = 16'b0011001000110010;
    PDPW16KD pdp_ram_0_0_0 (.DI0(Data_x6[0]), .DI1(Data_x6[1]), .DI2(Data_x6[2]), 
            .DI3(Data_x6[3]), .DI4(Data_x6[4]), .DI5(Data_x6[5]), .DI6(Data_x6[6]), 
            .DI7(Data_x6[7]), .DI8(Data_x6[8]), .DI9(Data_x6[9]), .DI10(Data_x6[10]), 
            .DI11(Data_x6[11]), .DI12(Data_x6[12]), .DI13(Data_x6[13]), 
            .DI14(Data_x6[14]), .DI15(Data_x6[15]), .DI16(Data_x6[16]), 
            .DI17(Data_x6[17]), .DI18(Data_x6[18]), .DI19(Data_x6[19]), 
            .DI20(Data_x6[20]), .DI21(Data_x6[21]), .DI22(Data_x6[22]), 
            .DI23(Data_x6[23]), .DI24(GND_net), .DI25(GND_net), .DI26(GND_net), 
            .DI27(GND_net), .DI28(GND_net), .DI29(GND_net), .DI30(GND_net), 
            .DI31(GND_net), .DI32(GND_net), .DI33(GND_net), .DI34(GND_net), 
            .DI35(GND_net), .ADW0(wcount_0), .ADW1(wcount_1), .ADW2(GND_net), 
            .ADW3(GND_net), .ADW4(GND_net), .ADW5(GND_net), .ADW6(GND_net), 
            .ADW7(GND_net), .ADW8(GND_net), .BE0(VCC_net), .BE1(VCC_net), 
            .BE2(VCC_net), .BE3(VCC_net), .CEW(wren_i), .CLKW(clk_c), 
            .CSW0(VCC_net), .CSW1(GND_net), .CSW2(GND_net), .ADR0(GND_net), 
            .ADR1(GND_net), .ADR2(GND_net), .ADR3(GND_net), .ADR4(GND_net), 
            .ADR5(rcount_0), .ADR6(rcount_1), .ADR7(GND_net), .ADR8(GND_net), 
            .ADR9(GND_net), .ADR10(GND_net), .ADR11(GND_net), .ADR12(GND_net), 
            .ADR13(GND_net), .CER(rden_i), .OCER(rden_i), .CLKR(clk_c), 
            .CSR0(GND_net), .CSR1(GND_net), .CSR2(GND_net), .RST(rst_c), 
            .DO0(adc_fifo_6_dout[18]), .DO1(adc_fifo_6_dout[19]), .DO2(adc_fifo_6_dout[20]), 
            .DO3(adc_fifo_6_dout[21]), .DO4(adc_fifo_6_dout[22]), .DO5(adc_fifo_6_dout[23]), 
            .DO18(adc_fifo_6_dout[0]), .DO19(adc_fifo_6_dout[1]), .DO20(adc_fifo_6_dout[2]), 
            .DO21(adc_fifo_6_dout[3]), .DO22(adc_fifo_6_dout[4]), .DO23(adc_fifo_6_dout[5]), 
            .DO24(adc_fifo_6_dout[6]), .DO25(adc_fifo_6_dout[7]), .DO26(adc_fifo_6_dout[8]), 
            .DO27(adc_fifo_6_dout[9]), .DO28(adc_fifo_6_dout[10]), .DO29(adc_fifo_6_dout[11]), 
            .DO30(adc_fifo_6_dout[12]), .DO31(adc_fifo_6_dout[13]), .DO32(adc_fifo_6_dout[14]), 
            .DO33(adc_fifo_6_dout[15]), .DO34(adc_fifo_6_dout[16]), .DO35(adc_fifo_6_dout[17])) /* synthesis syn_black_box=true, MEM_LPC_FILE="FIFOsm.lpc", MEM_INIT_FILE="", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=239, LSE_RLINE=239 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(239[17:35])
    defparam pdp_ram_0_0_0.DATA_WIDTH_W = 36;
    defparam pdp_ram_0_0_0.DATA_WIDTH_R = 36;
    defparam pdp_ram_0_0_0.GSR = "ENABLED";
    defparam pdp_ram_0_0_0.REGMODE = "NOREG";
    defparam pdp_ram_0_0_0.RESETMODE = "ASYNC";
    defparam pdp_ram_0_0_0.ASYNC_RESET_RELEASE = "SYNC";
    defparam pdp_ram_0_0_0.CSDECODE_W = "0b001";
    defparam pdp_ram_0_0_0.CSDECODE_R = "0b000";
    defparam pdp_ram_0_0_0.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_20 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_21 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_22 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_23 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_24 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_25 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_26 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_27 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_28 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_29 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_30 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_31 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_32 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_33 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_34 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_35 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_36 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_37 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_38 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_39 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INIT_DATA = "STATIC";
    
endmodule
//
// Verilog Description of module FIFOsm_U1
//

module FIFOsm_U1 (clk_c, \adc_fifo_empty[7] , GND_net, VCC_net, Write_En_c, 
            \adc_fifo_rd_en[7] , Data_c_20, Data_c_19, Data_c_18, Data_c_17, 
            Data_c_16, Data_c_15, Data_c_14, Data_c_13, Data_c_12, 
            Data_c_11, Data_c_10, Data_c_9, Data_c_8, Data_c_7, Data_c_6, 
            Data_c_5, Data_c_4, Data_c_3, Data_c_2, Data_c_1, Data_c_0, 
            rst_c, adc_fifo_7_dout) /* synthesis NGD_DRC_MASK=1 */ ;
    input clk_c;
    output \adc_fifo_empty[7] ;
    input GND_net;
    input VCC_net;
    input Write_En_c;
    input \adc_fifo_rd_en[7] ;
    input Data_c_20;
    input Data_c_19;
    input Data_c_18;
    input Data_c_17;
    input Data_c_16;
    input Data_c_15;
    input Data_c_14;
    input Data_c_13;
    input Data_c_12;
    input Data_c_11;
    input Data_c_10;
    input Data_c_9;
    input Data_c_8;
    input Data_c_7;
    input Data_c_6;
    input Data_c_5;
    input Data_c_4;
    input Data_c_3;
    input Data_c_2;
    input Data_c_1;
    input Data_c_0;
    input rst_c;
    output [23:0]adc_fifo_7_dout;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    
    wire fcount_1, fcnt_en, ifcount_1, fcount_2, ifcount_2, empty_d, 
        Full, full_d, wcount_0, wren_i, iwcount_0, wcount_1, iwcount_1, 
        rcount_0, rden_i, ircount_0, rcount_1, ircount_1, fcount_0, 
        ifcount_0, bdcnt_bctr_ci, cnt_con, co0, cmp_ci, co0_1, cmp_le_1_c, 
        cmp_le_1, cmp_ci_1, co0_2, wren_i_inv, cmp_ge_d1_c, cmp_ge_d1, 
        w_ctr_ci, r_ctr_ci, invout_2, invout_1, rden_i_inv;
    
    FD1P3AX FF_11 (.D(ifcount_1), .SP(fcnt_en), .CK(clk_c), .Q(fcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(232[12:19])
    defparam FF_11.GSR = "ENABLED";
    FD1P3AX FF_10 (.D(ifcount_2), .SP(fcnt_en), .CK(clk_c), .Q(fcount_2)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(236[12:19])
    defparam FF_10.GSR = "ENABLED";
    FD1S3AY FF_9 (.D(empty_d), .CK(clk_c), .Q(\adc_fifo_empty[7] )) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(240[11:18])
    defparam FF_9.GSR = "ENABLED";
    FD1S3AX FF_8 (.D(full_d), .CK(clk_c), .Q(Full)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(243[11:18])
    defparam FF_8.GSR = "ENABLED";
    FD1P3AX FF_7 (.D(iwcount_0), .SP(wren_i), .CK(clk_c), .Q(wcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(246[11:18])
    defparam FF_7.GSR = "ENABLED";
    FD1P3AX FF_6 (.D(iwcount_1), .SP(wren_i), .CK(clk_c), .Q(wcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(250[11:18])
    defparam FF_6.GSR = "ENABLED";
    FD1P3AX FF_4 (.D(ircount_0), .SP(rden_i), .CK(clk_c), .Q(rcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(258[11:18])
    defparam FF_4.GSR = "ENABLED";
    FD1P3AX FF_3 (.D(ircount_1), .SP(rden_i), .CK(clk_c), .Q(rcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(262[11:18])
    defparam FF_3.GSR = "ENABLED";
    FD1P3AX FF_12 (.D(ifcount_0), .SP(fcnt_en), .CK(clk_c), .Q(fcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(228[12:19])
    defparam FF_12.GSR = "ENABLED";
    CCU2C bdcnt_bctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(cnt_con), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .COUT(bdcnt_bctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(276[21:26])
    defparam bdcnt_bctr_cia.INIT0 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INIT1 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INJECT1_0 = "NO";
    defparam bdcnt_bctr_cia.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_0 (.A0(fcount_0), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(bdcnt_bctr_ci), 
          .COUT(co0), .S0(ifcount_0), .S1(ifcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(283[19:24])
    defparam bdcnt_bctr_0.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INJECT1_0 = "NO";
    defparam bdcnt_bctr_0.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_1 (.A0(fcount_2), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(co0), 
          .S0(ifcount_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(290[19:24])
    defparam bdcnt_bctr_1.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INJECT1_0 = "NO";
    defparam bdcnt_bctr_1.INJECT1_1 = "NO";
    CCU2C e_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(297[17:22])
    defparam e_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INJECT1_0 = "NO";
    defparam e_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C e_cmp_0 (.A0(rden_i), .B0(fcount_0), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_1), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci), 
          .COUT(co0_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(304[14:19])
    defparam e_cmp_0.INIT0 = 16'b1001100110101010;
    defparam e_cmp_0.INIT1 = 16'b1001100110101010;
    defparam e_cmp_0.INJECT1_0 = "NO";
    defparam e_cmp_0.INJECT1_1 = "NO";
    CCU2C e_cmp_1 (.A0(GND_net), .B0(fcount_2), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_1), 
          .COUT(cmp_le_1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(311[14:19])
    defparam e_cmp_1.INIT0 = 16'b1001100110101010;
    defparam e_cmp_1.INIT1 = 16'b1001100110101010;
    defparam e_cmp_1.INJECT1_0 = "NO";
    defparam e_cmp_1.INJECT1_1 = "NO";
    CCU2C a0 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_le_1_c), 
          .S0(cmp_le_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(319[9:14])
    defparam a0.INIT0 = 16'b0110011010101010;
    defparam a0.INIT1 = 16'b0110011010101010;
    defparam a0.INJECT1_0 = "NO";
    defparam a0.INJECT1_1 = "NO";
    CCU2C g_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(327[17:22])
    defparam g_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INJECT1_0 = "NO";
    defparam g_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C g_cmp_0 (.A0(fcount_0), .B0(wren_i), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(wren_i), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci_1), 
          .COUT(co0_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(334[14:19])
    defparam g_cmp_0.INIT0 = 16'b1001100110101010;
    defparam g_cmp_0.INIT1 = 16'b1001100110101010;
    defparam g_cmp_0.INJECT1_0 = "NO";
    defparam g_cmp_0.INJECT1_1 = "NO";
    CCU2C g_cmp_1 (.A0(fcount_2), .B0(wren_i_inv), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_2), 
          .COUT(cmp_ge_d1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(341[14:19])
    defparam g_cmp_1.INIT0 = 16'b1001100110101010;
    defparam g_cmp_1.INIT1 = 16'b1001100110101010;
    defparam g_cmp_1.INJECT1_0 = "NO";
    defparam g_cmp_1.INJECT1_1 = "NO";
    CCU2C a1 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ge_d1_c), 
          .S0(cmp_ge_d1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(349[9:14])
    defparam a1.INIT0 = 16'b0110011010101010;
    defparam a1.INIT1 = 16'b0110011010101010;
    defparam a1.INJECT1_0 = "NO";
    defparam a1.INJECT1_1 = "NO";
    CCU2C w_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(w_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(357[16:21])
    defparam w_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam w_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam w_ctr_cia.INJECT1_0 = "NO";
    defparam w_ctr_cia.INJECT1_1 = "NO";
    CCU2C w_ctr_0 (.A0(wcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(wcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(w_ctr_ci), 
          .S0(iwcount_0), .S1(iwcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(364[14:19])
    defparam w_ctr_0.INIT0 = 16'b0110011010101010;
    defparam w_ctr_0.INIT1 = 16'b0110011010101010;
    defparam w_ctr_0.INJECT1_0 = "NO";
    defparam w_ctr_0.INJECT1_1 = "NO";
    CCU2C r_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(r_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(380[16:21])
    defparam r_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam r_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam r_ctr_cia.INJECT1_0 = "NO";
    defparam r_ctr_cia.INJECT1_1 = "NO";
    CCU2C r_ctr_0 (.A0(rcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(rcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(r_ctr_ci), 
          .S0(ircount_0), .S1(ircount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(387[14:19])
    defparam r_ctr_0.INIT0 = 16'b0110011010101010;
    defparam r_ctr_0.INIT1 = 16'b0110011010101010;
    defparam r_ctr_0.INJECT1_0 = "NO";
    defparam r_ctr_0.INJECT1_1 = "NO";
    AND2 AND2_t4 (.A(Write_En_c), .B(invout_2), .Z(wren_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(129[14:18])
    INV INV_8 (.A(Full), .Z(invout_2)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(253[17:35])
    AND2 AND2_t3 (.A(\adc_fifo_rd_en[7] ), .B(invout_1), .Z(rden_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(135[14:18])
    INV INV_7 (.A(\adc_fifo_empty[7] ), .Z(invout_1)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(253[17:35])
    AND2 AND2_t2 (.A(wren_i), .B(rden_i_inv), .Z(cnt_con)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(141[14:18])
    XOR2 XOR2_t1 (.A(wren_i), .B(rden_i), .Z(fcnt_en)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(144[14:18])
    INV INV_6 (.A(rden_i), .Z(rden_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(253[17:35])
    INV INV_5 (.A(wren_i), .Z(wren_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(253[17:35])
    ROM16X1A LUT4_3 (.AD0(\adc_fifo_empty[7] ), .AD1(wren_i), .AD2(cmp_le_1), 
            .AD3(GND_net), .DO0(empty_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(253[17:35])
    defparam LUT4_3.initval = 16'b0011001000110010;
    ROM16X1A LUT4_2 (.AD0(Full), .AD1(rden_i), .AD2(cmp_ge_d1), .AD3(GND_net), 
            .DO0(full_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(253[17:35])
    defparam LUT4_2.initval = 16'b0011001000110010;
    PDPW16KD pdp_ram_0_0_0 (.DI0(GND_net), .DI1(GND_net), .DI2(GND_net), 
            .DI3(Data_c_0), .DI4(Data_c_1), .DI5(Data_c_2), .DI6(Data_c_3), 
            .DI7(Data_c_4), .DI8(Data_c_5), .DI9(Data_c_6), .DI10(Data_c_7), 
            .DI11(Data_c_8), .DI12(Data_c_9), .DI13(Data_c_10), .DI14(Data_c_11), 
            .DI15(Data_c_12), .DI16(Data_c_13), .DI17(Data_c_14), .DI18(Data_c_15), 
            .DI19(Data_c_16), .DI20(Data_c_17), .DI21(Data_c_18), .DI22(Data_c_19), 
            .DI23(Data_c_20), .DI24(GND_net), .DI25(GND_net), .DI26(GND_net), 
            .DI27(GND_net), .DI28(GND_net), .DI29(GND_net), .DI30(GND_net), 
            .DI31(GND_net), .DI32(GND_net), .DI33(GND_net), .DI34(GND_net), 
            .DI35(GND_net), .ADW0(wcount_0), .ADW1(wcount_1), .ADW2(GND_net), 
            .ADW3(GND_net), .ADW4(GND_net), .ADW5(GND_net), .ADW6(GND_net), 
            .ADW7(GND_net), .ADW8(GND_net), .BE0(VCC_net), .BE1(VCC_net), 
            .BE2(VCC_net), .BE3(VCC_net), .CEW(wren_i), .CLKW(clk_c), 
            .CSW0(VCC_net), .CSW1(GND_net), .CSW2(GND_net), .ADR0(GND_net), 
            .ADR1(GND_net), .ADR2(GND_net), .ADR3(GND_net), .ADR4(GND_net), 
            .ADR5(rcount_0), .ADR6(rcount_1), .ADR7(GND_net), .ADR8(GND_net), 
            .ADR9(GND_net), .ADR10(GND_net), .ADR11(GND_net), .ADR12(GND_net), 
            .ADR13(GND_net), .CER(rden_i), .OCER(rden_i), .CLKR(clk_c), 
            .CSR0(GND_net), .CSR1(GND_net), .CSR2(GND_net), .RST(rst_c), 
            .DO0(adc_fifo_7_dout[18]), .DO1(adc_fifo_7_dout[19]), .DO2(adc_fifo_7_dout[20]), 
            .DO3(adc_fifo_7_dout[21]), .DO4(adc_fifo_7_dout[22]), .DO5(adc_fifo_7_dout[23]), 
            .DO18(adc_fifo_7_dout[0]), .DO19(adc_fifo_7_dout[1]), .DO20(adc_fifo_7_dout[2]), 
            .DO21(adc_fifo_7_dout[3]), .DO22(adc_fifo_7_dout[4]), .DO23(adc_fifo_7_dout[5]), 
            .DO24(adc_fifo_7_dout[6]), .DO25(adc_fifo_7_dout[7]), .DO26(adc_fifo_7_dout[8]), 
            .DO27(adc_fifo_7_dout[9]), .DO28(adc_fifo_7_dout[10]), .DO29(adc_fifo_7_dout[11]), 
            .DO30(adc_fifo_7_dout[12]), .DO31(adc_fifo_7_dout[13]), .DO32(adc_fifo_7_dout[14]), 
            .DO33(adc_fifo_7_dout[15]), .DO34(adc_fifo_7_dout[16]), .DO35(adc_fifo_7_dout[17])) /* synthesis syn_black_box=true, MEM_LPC_FILE="FIFOsm.lpc", MEM_INIT_FILE="", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=253, LSE_RLINE=253 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(253[17:35])
    defparam pdp_ram_0_0_0.DATA_WIDTH_W = 36;
    defparam pdp_ram_0_0_0.DATA_WIDTH_R = 36;
    defparam pdp_ram_0_0_0.GSR = "ENABLED";
    defparam pdp_ram_0_0_0.REGMODE = "NOREG";
    defparam pdp_ram_0_0_0.RESETMODE = "ASYNC";
    defparam pdp_ram_0_0_0.ASYNC_RESET_RELEASE = "SYNC";
    defparam pdp_ram_0_0_0.CSDECODE_W = "0b001";
    defparam pdp_ram_0_0_0.CSDECODE_R = "0b000";
    defparam pdp_ram_0_0_0.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_20 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_21 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_22 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_23 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_24 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_25 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_26 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_27 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_28 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_29 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_30 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_31 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_32 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_33 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_34 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_35 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_36 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_37 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_38 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_39 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INIT_DATA = "STATIC";
    
endmodule
//
// Verilog Description of module FIFOsm_U0
//

module FIFOsm_U0 (clk_c, \adc_fifo_empty[8] , GND_net, VCC_net, Write_En_c, 
            \adc_fifo_rd_en[8] , Data_x8, rst_c, adc_fifo_8_dout) /* synthesis NGD_DRC_MASK=1 */ ;
    input clk_c;
    output \adc_fifo_empty[8] ;
    input GND_net;
    input VCC_net;
    input Write_En_c;
    input \adc_fifo_rd_en[8] ;
    input [23:0]Data_x8;
    input rst_c;
    output [23:0]adc_fifo_8_dout;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    
    wire fcount_1, fcnt_en, ifcount_1, fcount_2, ifcount_2, empty_d, 
        Full, full_d, wcount_0, wren_i, iwcount_0, wcount_1, iwcount_1, 
        rcount_0, rden_i, ircount_0, rcount_1, ircount_1, fcount_0, 
        ifcount_0, bdcnt_bctr_ci, cnt_con, co0, cmp_ci, co0_1, cmp_le_1_c, 
        cmp_le_1, cmp_ci_1, co0_2, wren_i_inv, cmp_ge_d1_c, cmp_ge_d1, 
        w_ctr_ci, r_ctr_ci, invout_2, invout_1, rden_i_inv;
    
    FD1P3AX FF_11 (.D(ifcount_1), .SP(fcnt_en), .CK(clk_c), .Q(fcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(232[12:19])
    defparam FF_11.GSR = "ENABLED";
    FD1P3AX FF_10 (.D(ifcount_2), .SP(fcnt_en), .CK(clk_c), .Q(fcount_2)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(236[12:19])
    defparam FF_10.GSR = "ENABLED";
    FD1S3AY FF_9 (.D(empty_d), .CK(clk_c), .Q(\adc_fifo_empty[8] )) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(240[11:18])
    defparam FF_9.GSR = "ENABLED";
    FD1S3AX FF_8 (.D(full_d), .CK(clk_c), .Q(Full)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(243[11:18])
    defparam FF_8.GSR = "ENABLED";
    FD1P3AX FF_7 (.D(iwcount_0), .SP(wren_i), .CK(clk_c), .Q(wcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(246[11:18])
    defparam FF_7.GSR = "ENABLED";
    FD1P3AX FF_6 (.D(iwcount_1), .SP(wren_i), .CK(clk_c), .Q(wcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(250[11:18])
    defparam FF_6.GSR = "ENABLED";
    FD1P3AX FF_4 (.D(ircount_0), .SP(rden_i), .CK(clk_c), .Q(rcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(258[11:18])
    defparam FF_4.GSR = "ENABLED";
    FD1P3AX FF_3 (.D(ircount_1), .SP(rden_i), .CK(clk_c), .Q(rcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(262[11:18])
    defparam FF_3.GSR = "ENABLED";
    FD1P3AX FF_12 (.D(ifcount_0), .SP(fcnt_en), .CK(clk_c), .Q(fcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(228[12:19])
    defparam FF_12.GSR = "ENABLED";
    CCU2C bdcnt_bctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(cnt_con), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .COUT(bdcnt_bctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(276[21:26])
    defparam bdcnt_bctr_cia.INIT0 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INIT1 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INJECT1_0 = "NO";
    defparam bdcnt_bctr_cia.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_0 (.A0(fcount_0), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(bdcnt_bctr_ci), 
          .COUT(co0), .S0(ifcount_0), .S1(ifcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(283[19:24])
    defparam bdcnt_bctr_0.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INJECT1_0 = "NO";
    defparam bdcnt_bctr_0.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_1 (.A0(fcount_2), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(co0), 
          .S0(ifcount_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(290[19:24])
    defparam bdcnt_bctr_1.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INJECT1_0 = "NO";
    defparam bdcnt_bctr_1.INJECT1_1 = "NO";
    CCU2C e_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(297[17:22])
    defparam e_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INJECT1_0 = "NO";
    defparam e_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C e_cmp_0 (.A0(rden_i), .B0(fcount_0), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_1), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci), 
          .COUT(co0_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(304[14:19])
    defparam e_cmp_0.INIT0 = 16'b1001100110101010;
    defparam e_cmp_0.INIT1 = 16'b1001100110101010;
    defparam e_cmp_0.INJECT1_0 = "NO";
    defparam e_cmp_0.INJECT1_1 = "NO";
    CCU2C e_cmp_1 (.A0(GND_net), .B0(fcount_2), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_1), 
          .COUT(cmp_le_1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(311[14:19])
    defparam e_cmp_1.INIT0 = 16'b1001100110101010;
    defparam e_cmp_1.INIT1 = 16'b1001100110101010;
    defparam e_cmp_1.INJECT1_0 = "NO";
    defparam e_cmp_1.INJECT1_1 = "NO";
    CCU2C a0 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_le_1_c), 
          .S0(cmp_le_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(319[9:14])
    defparam a0.INIT0 = 16'b0110011010101010;
    defparam a0.INIT1 = 16'b0110011010101010;
    defparam a0.INJECT1_0 = "NO";
    defparam a0.INJECT1_1 = "NO";
    CCU2C g_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(327[17:22])
    defparam g_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INJECT1_0 = "NO";
    defparam g_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C g_cmp_0 (.A0(fcount_0), .B0(wren_i), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(wren_i), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci_1), 
          .COUT(co0_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(334[14:19])
    defparam g_cmp_0.INIT0 = 16'b1001100110101010;
    defparam g_cmp_0.INIT1 = 16'b1001100110101010;
    defparam g_cmp_0.INJECT1_0 = "NO";
    defparam g_cmp_0.INJECT1_1 = "NO";
    CCU2C g_cmp_1 (.A0(fcount_2), .B0(wren_i_inv), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_2), 
          .COUT(cmp_ge_d1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(341[14:19])
    defparam g_cmp_1.INIT0 = 16'b1001100110101010;
    defparam g_cmp_1.INIT1 = 16'b1001100110101010;
    defparam g_cmp_1.INJECT1_0 = "NO";
    defparam g_cmp_1.INJECT1_1 = "NO";
    CCU2C a1 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ge_d1_c), 
          .S0(cmp_ge_d1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(349[9:14])
    defparam a1.INIT0 = 16'b0110011010101010;
    defparam a1.INIT1 = 16'b0110011010101010;
    defparam a1.INJECT1_0 = "NO";
    defparam a1.INJECT1_1 = "NO";
    CCU2C w_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(w_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(357[16:21])
    defparam w_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam w_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam w_ctr_cia.INJECT1_0 = "NO";
    defparam w_ctr_cia.INJECT1_1 = "NO";
    CCU2C w_ctr_0 (.A0(wcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(wcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(w_ctr_ci), 
          .S0(iwcount_0), .S1(iwcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(364[14:19])
    defparam w_ctr_0.INIT0 = 16'b0110011010101010;
    defparam w_ctr_0.INIT1 = 16'b0110011010101010;
    defparam w_ctr_0.INJECT1_0 = "NO";
    defparam w_ctr_0.INJECT1_1 = "NO";
    CCU2C r_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(r_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(380[16:21])
    defparam r_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam r_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam r_ctr_cia.INJECT1_0 = "NO";
    defparam r_ctr_cia.INJECT1_1 = "NO";
    CCU2C r_ctr_0 (.A0(rcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(rcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(r_ctr_ci), 
          .S0(ircount_0), .S1(ircount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(387[14:19])
    defparam r_ctr_0.INIT0 = 16'b0110011010101010;
    defparam r_ctr_0.INIT1 = 16'b0110011010101010;
    defparam r_ctr_0.INJECT1_0 = "NO";
    defparam r_ctr_0.INJECT1_1 = "NO";
    AND2 AND2_t4 (.A(Write_En_c), .B(invout_2), .Z(wren_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(129[14:18])
    INV INV_8 (.A(Full), .Z(invout_2)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(267[17:35])
    AND2 AND2_t3 (.A(\adc_fifo_rd_en[8] ), .B(invout_1), .Z(rden_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(135[14:18])
    INV INV_7 (.A(\adc_fifo_empty[8] ), .Z(invout_1)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(267[17:35])
    AND2 AND2_t2 (.A(wren_i), .B(rden_i_inv), .Z(cnt_con)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(141[14:18])
    XOR2 XOR2_t1 (.A(wren_i), .B(rden_i), .Z(fcnt_en)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(144[14:18])
    INV INV_6 (.A(rden_i), .Z(rden_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(267[17:35])
    INV INV_5 (.A(wren_i), .Z(wren_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(267[17:35])
    ROM16X1A LUT4_3 (.AD0(\adc_fifo_empty[8] ), .AD1(wren_i), .AD2(cmp_le_1), 
            .AD3(GND_net), .DO0(empty_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(267[17:35])
    defparam LUT4_3.initval = 16'b0011001000110010;
    ROM16X1A LUT4_2 (.AD0(Full), .AD1(rden_i), .AD2(cmp_ge_d1), .AD3(GND_net), 
            .DO0(full_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(267[17:35])
    defparam LUT4_2.initval = 16'b0011001000110010;
    PDPW16KD pdp_ram_0_0_0 (.DI0(Data_x8[0]), .DI1(Data_x8[1]), .DI2(Data_x8[2]), 
            .DI3(Data_x8[3]), .DI4(Data_x8[4]), .DI5(Data_x8[5]), .DI6(Data_x8[6]), 
            .DI7(Data_x8[7]), .DI8(Data_x8[8]), .DI9(Data_x8[9]), .DI10(Data_x8[10]), 
            .DI11(Data_x8[11]), .DI12(Data_x8[12]), .DI13(Data_x8[13]), 
            .DI14(Data_x8[14]), .DI15(Data_x8[15]), .DI16(Data_x8[16]), 
            .DI17(Data_x8[17]), .DI18(Data_x8[18]), .DI19(Data_x8[19]), 
            .DI20(Data_x8[20]), .DI21(Data_x8[21]), .DI22(Data_x8[22]), 
            .DI23(Data_x8[23]), .DI24(GND_net), .DI25(GND_net), .DI26(GND_net), 
            .DI27(GND_net), .DI28(GND_net), .DI29(GND_net), .DI30(GND_net), 
            .DI31(GND_net), .DI32(GND_net), .DI33(GND_net), .DI34(GND_net), 
            .DI35(GND_net), .ADW0(wcount_0), .ADW1(wcount_1), .ADW2(GND_net), 
            .ADW3(GND_net), .ADW4(GND_net), .ADW5(GND_net), .ADW6(GND_net), 
            .ADW7(GND_net), .ADW8(GND_net), .BE0(VCC_net), .BE1(VCC_net), 
            .BE2(VCC_net), .BE3(VCC_net), .CEW(wren_i), .CLKW(clk_c), 
            .CSW0(VCC_net), .CSW1(GND_net), .CSW2(GND_net), .ADR0(GND_net), 
            .ADR1(GND_net), .ADR2(GND_net), .ADR3(GND_net), .ADR4(GND_net), 
            .ADR5(rcount_0), .ADR6(rcount_1), .ADR7(GND_net), .ADR8(GND_net), 
            .ADR9(GND_net), .ADR10(GND_net), .ADR11(GND_net), .ADR12(GND_net), 
            .ADR13(GND_net), .CER(rden_i), .OCER(rden_i), .CLKR(clk_c), 
            .CSR0(GND_net), .CSR1(GND_net), .CSR2(GND_net), .RST(rst_c), 
            .DO0(adc_fifo_8_dout[18]), .DO1(adc_fifo_8_dout[19]), .DO2(adc_fifo_8_dout[20]), 
            .DO3(adc_fifo_8_dout[21]), .DO4(adc_fifo_8_dout[22]), .DO5(adc_fifo_8_dout[23]), 
            .DO18(adc_fifo_8_dout[0]), .DO19(adc_fifo_8_dout[1]), .DO20(adc_fifo_8_dout[2]), 
            .DO21(adc_fifo_8_dout[3]), .DO22(adc_fifo_8_dout[4]), .DO23(adc_fifo_8_dout[5]), 
            .DO24(adc_fifo_8_dout[6]), .DO25(adc_fifo_8_dout[7]), .DO26(adc_fifo_8_dout[8]), 
            .DO27(adc_fifo_8_dout[9]), .DO28(adc_fifo_8_dout[10]), .DO29(adc_fifo_8_dout[11]), 
            .DO30(adc_fifo_8_dout[12]), .DO31(adc_fifo_8_dout[13]), .DO32(adc_fifo_8_dout[14]), 
            .DO33(adc_fifo_8_dout[15]), .DO34(adc_fifo_8_dout[16]), .DO35(adc_fifo_8_dout[17])) /* synthesis syn_black_box=true, MEM_LPC_FILE="FIFOsm.lpc", MEM_INIT_FILE="", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=267, LSE_RLINE=267 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(267[17:35])
    defparam pdp_ram_0_0_0.DATA_WIDTH_W = 36;
    defparam pdp_ram_0_0_0.DATA_WIDTH_R = 36;
    defparam pdp_ram_0_0_0.GSR = "ENABLED";
    defparam pdp_ram_0_0_0.REGMODE = "NOREG";
    defparam pdp_ram_0_0_0.RESETMODE = "ASYNC";
    defparam pdp_ram_0_0_0.ASYNC_RESET_RELEASE = "SYNC";
    defparam pdp_ram_0_0_0.CSDECODE_W = "0b001";
    defparam pdp_ram_0_0_0.CSDECODE_R = "0b000";
    defparam pdp_ram_0_0_0.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_20 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_21 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_22 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_23 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_24 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_25 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_26 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_27 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_28 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_29 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_30 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_31 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_32 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_33 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_34 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_35 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_36 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_37 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_38 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_39 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INIT_DATA = "STATIC";
    
endmodule
//
// Verilog Description of module FIFOsm_U14
//

module FIFOsm_U14 (clk_c, \adc_fifo_empty[0] , GND_net, VCC_net, Write_En_c, 
            \adc_fifo_rd_en[0] , Data_c_23, Data_c_22, Data_c_21, Data_c_20, 
            Data_c_19, Data_c_18, Data_c_17, Data_c_16, Data_c_15, 
            Data_c_14, Data_c_13, Data_c_12, Data_c_11, Data_c_10, 
            Data_c_9, Data_c_8, Data_c_7, Data_c_6, Data_c_5, Data_c_4, 
            Data_c_3, Data_c_2, Data_c_1, Data_c_0, rst_c, adc_fifo_0_dout) /* synthesis NGD_DRC_MASK=1 */ ;
    input clk_c;
    output \adc_fifo_empty[0] ;
    input GND_net;
    input VCC_net;
    input Write_En_c;
    input \adc_fifo_rd_en[0] ;
    input Data_c_23;
    input Data_c_22;
    input Data_c_21;
    input Data_c_20;
    input Data_c_19;
    input Data_c_18;
    input Data_c_17;
    input Data_c_16;
    input Data_c_15;
    input Data_c_14;
    input Data_c_13;
    input Data_c_12;
    input Data_c_11;
    input Data_c_10;
    input Data_c_9;
    input Data_c_8;
    input Data_c_7;
    input Data_c_6;
    input Data_c_5;
    input Data_c_4;
    input Data_c_3;
    input Data_c_2;
    input Data_c_1;
    input Data_c_0;
    input rst_c;
    output [23:0]adc_fifo_0_dout;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    
    wire Full, invout_2, fcount_2, fcnt_en, ifcount_2, empty_d, 
        full_d, wcount_0, wren_i, iwcount_0, wcount_1, iwcount_1, 
        rcount_0, rden_i, ircount_0, rcount_1, ircount_1, fcount_0, 
        ifcount_0, bdcnt_bctr_ci, cnt_con, ifcount_1, co0, fcount_1, 
        cmp_ci, co0_1, cmp_le_1_c, cmp_le_1, cmp_ci_1, co0_2, wren_i_inv, 
        cmp_ge_d1_c, cmp_ge_d1, w_ctr_ci, r_ctr_ci, invout_1, rden_i_inv;
    
    INV INV_8 (.A(Full), .Z(invout_2)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(155[17:35])
    FD1P3AX FF_10 (.D(ifcount_2), .SP(fcnt_en), .CK(clk_c), .Q(fcount_2)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(236[12:19])
    defparam FF_10.GSR = "ENABLED";
    FD1S3AY FF_9 (.D(empty_d), .CK(clk_c), .Q(\adc_fifo_empty[0] )) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(240[11:18])
    defparam FF_9.GSR = "ENABLED";
    FD1S3AX FF_8 (.D(full_d), .CK(clk_c), .Q(Full)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(243[11:18])
    defparam FF_8.GSR = "ENABLED";
    FD1P3AX FF_7 (.D(iwcount_0), .SP(wren_i), .CK(clk_c), .Q(wcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(246[11:18])
    defparam FF_7.GSR = "ENABLED";
    FD1P3AX FF_6 (.D(iwcount_1), .SP(wren_i), .CK(clk_c), .Q(wcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(250[11:18])
    defparam FF_6.GSR = "ENABLED";
    FD1P3AX FF_4 (.D(ircount_0), .SP(rden_i), .CK(clk_c), .Q(rcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(258[11:18])
    defparam FF_4.GSR = "ENABLED";
    FD1P3AX FF_3 (.D(ircount_1), .SP(rden_i), .CK(clk_c), .Q(rcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(262[11:18])
    defparam FF_3.GSR = "ENABLED";
    FD1P3AX FF_12 (.D(ifcount_0), .SP(fcnt_en), .CK(clk_c), .Q(fcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(228[12:19])
    defparam FF_12.GSR = "ENABLED";
    CCU2C bdcnt_bctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(cnt_con), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .COUT(bdcnt_bctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(276[21:26])
    defparam bdcnt_bctr_cia.INIT0 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INIT1 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INJECT1_0 = "NO";
    defparam bdcnt_bctr_cia.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_0 (.A0(fcount_0), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(bdcnt_bctr_ci), 
          .COUT(co0), .S0(ifcount_0), .S1(ifcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(283[19:24])
    defparam bdcnt_bctr_0.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INJECT1_0 = "NO";
    defparam bdcnt_bctr_0.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_1 (.A0(fcount_2), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(co0), 
          .S0(ifcount_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(290[19:24])
    defparam bdcnt_bctr_1.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INJECT1_0 = "NO";
    defparam bdcnt_bctr_1.INJECT1_1 = "NO";
    CCU2C e_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(297[17:22])
    defparam e_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INJECT1_0 = "NO";
    defparam e_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C e_cmp_0 (.A0(rden_i), .B0(fcount_0), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_1), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci), 
          .COUT(co0_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(304[14:19])
    defparam e_cmp_0.INIT0 = 16'b1001100110101010;
    defparam e_cmp_0.INIT1 = 16'b1001100110101010;
    defparam e_cmp_0.INJECT1_0 = "NO";
    defparam e_cmp_0.INJECT1_1 = "NO";
    CCU2C e_cmp_1 (.A0(GND_net), .B0(fcount_2), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_1), 
          .COUT(cmp_le_1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(311[14:19])
    defparam e_cmp_1.INIT0 = 16'b1001100110101010;
    defparam e_cmp_1.INIT1 = 16'b1001100110101010;
    defparam e_cmp_1.INJECT1_0 = "NO";
    defparam e_cmp_1.INJECT1_1 = "NO";
    CCU2C a0 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_le_1_c), 
          .S0(cmp_le_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(319[9:14])
    defparam a0.INIT0 = 16'b0110011010101010;
    defparam a0.INIT1 = 16'b0110011010101010;
    defparam a0.INJECT1_0 = "NO";
    defparam a0.INJECT1_1 = "NO";
    CCU2C g_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(327[17:22])
    defparam g_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INJECT1_0 = "NO";
    defparam g_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C g_cmp_0 (.A0(fcount_0), .B0(wren_i), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(wren_i), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci_1), 
          .COUT(co0_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(334[14:19])
    defparam g_cmp_0.INIT0 = 16'b1001100110101010;
    defparam g_cmp_0.INIT1 = 16'b1001100110101010;
    defparam g_cmp_0.INJECT1_0 = "NO";
    defparam g_cmp_0.INJECT1_1 = "NO";
    CCU2C g_cmp_1 (.A0(fcount_2), .B0(wren_i_inv), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_2), 
          .COUT(cmp_ge_d1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(341[14:19])
    defparam g_cmp_1.INIT0 = 16'b1001100110101010;
    defparam g_cmp_1.INIT1 = 16'b1001100110101010;
    defparam g_cmp_1.INJECT1_0 = "NO";
    defparam g_cmp_1.INJECT1_1 = "NO";
    CCU2C a1 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ge_d1_c), 
          .S0(cmp_ge_d1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(349[9:14])
    defparam a1.INIT0 = 16'b0110011010101010;
    defparam a1.INIT1 = 16'b0110011010101010;
    defparam a1.INJECT1_0 = "NO";
    defparam a1.INJECT1_1 = "NO";
    CCU2C w_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(w_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(357[16:21])
    defparam w_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam w_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam w_ctr_cia.INJECT1_0 = "NO";
    defparam w_ctr_cia.INJECT1_1 = "NO";
    CCU2C w_ctr_0 (.A0(wcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(wcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(w_ctr_ci), 
          .S0(iwcount_0), .S1(iwcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(364[14:19])
    defparam w_ctr_0.INIT0 = 16'b0110011010101010;
    defparam w_ctr_0.INIT1 = 16'b0110011010101010;
    defparam w_ctr_0.INJECT1_0 = "NO";
    defparam w_ctr_0.INJECT1_1 = "NO";
    CCU2C r_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(r_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(380[16:21])
    defparam r_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam r_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam r_ctr_cia.INJECT1_0 = "NO";
    defparam r_ctr_cia.INJECT1_1 = "NO";
    CCU2C r_ctr_0 (.A0(rcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(rcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(r_ctr_ci), 
          .S0(ircount_0), .S1(ircount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(387[14:19])
    defparam r_ctr_0.INIT0 = 16'b0110011010101010;
    defparam r_ctr_0.INIT1 = 16'b0110011010101010;
    defparam r_ctr_0.INJECT1_0 = "NO";
    defparam r_ctr_0.INJECT1_1 = "NO";
    AND2 AND2_t4 (.A(Write_En_c), .B(invout_2), .Z(wren_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(129[14:18])
    AND2 AND2_t3 (.A(\adc_fifo_rd_en[0] ), .B(invout_1), .Z(rden_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(135[14:18])
    INV INV_7 (.A(\adc_fifo_empty[0] ), .Z(invout_1)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(155[17:35])
    AND2 AND2_t2 (.A(wren_i), .B(rden_i_inv), .Z(cnt_con)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(141[14:18])
    XOR2 XOR2_t1 (.A(wren_i), .B(rden_i), .Z(fcnt_en)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(144[14:18])
    INV INV_6 (.A(rden_i), .Z(rden_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(155[17:35])
    INV INV_5 (.A(wren_i), .Z(wren_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(155[17:35])
    ROM16X1A LUT4_3 (.AD0(\adc_fifo_empty[0] ), .AD1(wren_i), .AD2(cmp_le_1), 
            .AD3(GND_net), .DO0(empty_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(155[17:35])
    defparam LUT4_3.initval = 16'b0011001000110010;
    ROM16X1A LUT4_2 (.AD0(Full), .AD1(rden_i), .AD2(cmp_ge_d1), .AD3(GND_net), 
            .DO0(full_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(155[17:35])
    defparam LUT4_2.initval = 16'b0011001000110010;
    PDPW16KD pdp_ram_0_0_0 (.DI0(Data_c_0), .DI1(Data_c_1), .DI2(Data_c_2), 
            .DI3(Data_c_3), .DI4(Data_c_4), .DI5(Data_c_5), .DI6(Data_c_6), 
            .DI7(Data_c_7), .DI8(Data_c_8), .DI9(Data_c_9), .DI10(Data_c_10), 
            .DI11(Data_c_11), .DI12(Data_c_12), .DI13(Data_c_13), .DI14(Data_c_14), 
            .DI15(Data_c_15), .DI16(Data_c_16), .DI17(Data_c_17), .DI18(Data_c_18), 
            .DI19(Data_c_19), .DI20(Data_c_20), .DI21(Data_c_21), .DI22(Data_c_22), 
            .DI23(Data_c_23), .DI24(GND_net), .DI25(GND_net), .DI26(GND_net), 
            .DI27(GND_net), .DI28(GND_net), .DI29(GND_net), .DI30(GND_net), 
            .DI31(GND_net), .DI32(GND_net), .DI33(GND_net), .DI34(GND_net), 
            .DI35(GND_net), .ADW0(wcount_0), .ADW1(wcount_1), .ADW2(GND_net), 
            .ADW3(GND_net), .ADW4(GND_net), .ADW5(GND_net), .ADW6(GND_net), 
            .ADW7(GND_net), .ADW8(GND_net), .BE0(VCC_net), .BE1(VCC_net), 
            .BE2(VCC_net), .BE3(VCC_net), .CEW(wren_i), .CLKW(clk_c), 
            .CSW0(VCC_net), .CSW1(GND_net), .CSW2(GND_net), .ADR0(GND_net), 
            .ADR1(GND_net), .ADR2(GND_net), .ADR3(GND_net), .ADR4(GND_net), 
            .ADR5(rcount_0), .ADR6(rcount_1), .ADR7(GND_net), .ADR8(GND_net), 
            .ADR9(GND_net), .ADR10(GND_net), .ADR11(GND_net), .ADR12(GND_net), 
            .ADR13(GND_net), .CER(rden_i), .OCER(rden_i), .CLKR(clk_c), 
            .CSR0(GND_net), .CSR1(GND_net), .CSR2(GND_net), .RST(rst_c), 
            .DO0(adc_fifo_0_dout[18]), .DO1(adc_fifo_0_dout[19]), .DO2(adc_fifo_0_dout[20]), 
            .DO3(adc_fifo_0_dout[21]), .DO4(adc_fifo_0_dout[22]), .DO5(adc_fifo_0_dout[23]), 
            .DO18(adc_fifo_0_dout[0]), .DO19(adc_fifo_0_dout[1]), .DO20(adc_fifo_0_dout[2]), 
            .DO21(adc_fifo_0_dout[3]), .DO22(adc_fifo_0_dout[4]), .DO23(adc_fifo_0_dout[5]), 
            .DO24(adc_fifo_0_dout[6]), .DO25(adc_fifo_0_dout[7]), .DO26(adc_fifo_0_dout[8]), 
            .DO27(adc_fifo_0_dout[9]), .DO28(adc_fifo_0_dout[10]), .DO29(adc_fifo_0_dout[11]), 
            .DO30(adc_fifo_0_dout[12]), .DO31(adc_fifo_0_dout[13]), .DO32(adc_fifo_0_dout[14]), 
            .DO33(adc_fifo_0_dout[15]), .DO34(adc_fifo_0_dout[16]), .DO35(adc_fifo_0_dout[17])) /* synthesis syn_black_box=true, MEM_LPC_FILE="FIFOsm.lpc", MEM_INIT_FILE="", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(155[17:35])
    defparam pdp_ram_0_0_0.DATA_WIDTH_W = 36;
    defparam pdp_ram_0_0_0.DATA_WIDTH_R = 36;
    defparam pdp_ram_0_0_0.GSR = "ENABLED";
    defparam pdp_ram_0_0_0.REGMODE = "NOREG";
    defparam pdp_ram_0_0_0.RESETMODE = "ASYNC";
    defparam pdp_ram_0_0_0.ASYNC_RESET_RELEASE = "SYNC";
    defparam pdp_ram_0_0_0.CSDECODE_W = "0b001";
    defparam pdp_ram_0_0_0.CSDECODE_R = "0b000";
    defparam pdp_ram_0_0_0.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_20 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_21 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_22 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_23 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_24 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_25 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_26 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_27 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_28 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_29 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_30 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_31 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_32 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_33 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_34 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_35 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_36 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_37 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_38 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_39 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INIT_DATA = "STATIC";
    FD1P3AX FF_11 (.D(ifcount_1), .SP(fcnt_en), .CK(clk_c), .Q(fcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=155, LSE_RLINE=155 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(232[12:19])
    defparam FF_11.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module FIFOsm_U13
//

module FIFOsm_U13 (clk_c, \adc_fifo_empty[10] , GND_net, VCC_net, Write_En_c, 
            \adc_fifo_rd_en[10] , Data_x10, rst_c, adc_fifo_10_dout) /* synthesis NGD_DRC_MASK=1 */ ;
    input clk_c;
    output \adc_fifo_empty[10] ;
    input GND_net;
    input VCC_net;
    input Write_En_c;
    input \adc_fifo_rd_en[10] ;
    input [23:0]Data_x10;
    input rst_c;
    output [23:0]adc_fifo_10_dout;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    
    wire fcount_1, fcnt_en, ifcount_1, fcount_2, ifcount_2, empty_d, 
        Full, full_d, wcount_0, wren_i, iwcount_0, wcount_1, iwcount_1, 
        rcount_0, rden_i, ircount_0, rcount_1, ircount_1, fcount_0, 
        ifcount_0, bdcnt_bctr_ci, cnt_con, co0, cmp_ci, co0_1, cmp_le_1_c, 
        cmp_le_1, cmp_ci_1, co0_2, wren_i_inv, cmp_ge_d1_c, cmp_ge_d1, 
        w_ctr_ci, r_ctr_ci, invout_2, invout_1, rden_i_inv;
    
    FD1P3AX FF_11 (.D(ifcount_1), .SP(fcnt_en), .CK(clk_c), .Q(fcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(232[12:19])
    defparam FF_11.GSR = "ENABLED";
    FD1P3AX FF_10 (.D(ifcount_2), .SP(fcnt_en), .CK(clk_c), .Q(fcount_2)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(236[12:19])
    defparam FF_10.GSR = "ENABLED";
    FD1S3AY FF_9 (.D(empty_d), .CK(clk_c), .Q(\adc_fifo_empty[10] )) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(240[11:18])
    defparam FF_9.GSR = "ENABLED";
    FD1S3AX FF_8 (.D(full_d), .CK(clk_c), .Q(Full)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(243[11:18])
    defparam FF_8.GSR = "ENABLED";
    FD1P3AX FF_7 (.D(iwcount_0), .SP(wren_i), .CK(clk_c), .Q(wcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(246[11:18])
    defparam FF_7.GSR = "ENABLED";
    FD1P3AX FF_6 (.D(iwcount_1), .SP(wren_i), .CK(clk_c), .Q(wcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(250[11:18])
    defparam FF_6.GSR = "ENABLED";
    FD1P3AX FF_4 (.D(ircount_0), .SP(rden_i), .CK(clk_c), .Q(rcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(258[11:18])
    defparam FF_4.GSR = "ENABLED";
    FD1P3AX FF_3 (.D(ircount_1), .SP(rden_i), .CK(clk_c), .Q(rcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(262[11:18])
    defparam FF_3.GSR = "ENABLED";
    FD1P3AX FF_12 (.D(ifcount_0), .SP(fcnt_en), .CK(clk_c), .Q(fcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(228[12:19])
    defparam FF_12.GSR = "ENABLED";
    CCU2C bdcnt_bctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(cnt_con), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .COUT(bdcnt_bctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(276[21:26])
    defparam bdcnt_bctr_cia.INIT0 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INIT1 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INJECT1_0 = "NO";
    defparam bdcnt_bctr_cia.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_0 (.A0(fcount_0), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(bdcnt_bctr_ci), 
          .COUT(co0), .S0(ifcount_0), .S1(ifcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(283[19:24])
    defparam bdcnt_bctr_0.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INJECT1_0 = "NO";
    defparam bdcnt_bctr_0.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_1 (.A0(fcount_2), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(co0), 
          .S0(ifcount_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(290[19:24])
    defparam bdcnt_bctr_1.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INJECT1_0 = "NO";
    defparam bdcnt_bctr_1.INJECT1_1 = "NO";
    CCU2C e_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(297[17:22])
    defparam e_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INJECT1_0 = "NO";
    defparam e_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C e_cmp_0 (.A0(rden_i), .B0(fcount_0), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_1), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci), 
          .COUT(co0_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(304[14:19])
    defparam e_cmp_0.INIT0 = 16'b1001100110101010;
    defparam e_cmp_0.INIT1 = 16'b1001100110101010;
    defparam e_cmp_0.INJECT1_0 = "NO";
    defparam e_cmp_0.INJECT1_1 = "NO";
    CCU2C e_cmp_1 (.A0(GND_net), .B0(fcount_2), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_1), 
          .COUT(cmp_le_1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(311[14:19])
    defparam e_cmp_1.INIT0 = 16'b1001100110101010;
    defparam e_cmp_1.INIT1 = 16'b1001100110101010;
    defparam e_cmp_1.INJECT1_0 = "NO";
    defparam e_cmp_1.INJECT1_1 = "NO";
    CCU2C a0 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_le_1_c), 
          .S0(cmp_le_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(319[9:14])
    defparam a0.INIT0 = 16'b0110011010101010;
    defparam a0.INIT1 = 16'b0110011010101010;
    defparam a0.INJECT1_0 = "NO";
    defparam a0.INJECT1_1 = "NO";
    CCU2C g_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(327[17:22])
    defparam g_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INJECT1_0 = "NO";
    defparam g_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C g_cmp_0 (.A0(fcount_0), .B0(wren_i), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(wren_i), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci_1), 
          .COUT(co0_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(334[14:19])
    defparam g_cmp_0.INIT0 = 16'b1001100110101010;
    defparam g_cmp_0.INIT1 = 16'b1001100110101010;
    defparam g_cmp_0.INJECT1_0 = "NO";
    defparam g_cmp_0.INJECT1_1 = "NO";
    CCU2C g_cmp_1 (.A0(fcount_2), .B0(wren_i_inv), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_2), 
          .COUT(cmp_ge_d1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(341[14:19])
    defparam g_cmp_1.INIT0 = 16'b1001100110101010;
    defparam g_cmp_1.INIT1 = 16'b1001100110101010;
    defparam g_cmp_1.INJECT1_0 = "NO";
    defparam g_cmp_1.INJECT1_1 = "NO";
    CCU2C a1 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ge_d1_c), 
          .S0(cmp_ge_d1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(349[9:14])
    defparam a1.INIT0 = 16'b0110011010101010;
    defparam a1.INIT1 = 16'b0110011010101010;
    defparam a1.INJECT1_0 = "NO";
    defparam a1.INJECT1_1 = "NO";
    CCU2C w_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(w_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(357[16:21])
    defparam w_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam w_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam w_ctr_cia.INJECT1_0 = "NO";
    defparam w_ctr_cia.INJECT1_1 = "NO";
    CCU2C w_ctr_0 (.A0(wcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(wcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(w_ctr_ci), 
          .S0(iwcount_0), .S1(iwcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(364[14:19])
    defparam w_ctr_0.INIT0 = 16'b0110011010101010;
    defparam w_ctr_0.INIT1 = 16'b0110011010101010;
    defparam w_ctr_0.INJECT1_0 = "NO";
    defparam w_ctr_0.INJECT1_1 = "NO";
    CCU2C r_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(r_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(380[16:21])
    defparam r_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam r_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam r_ctr_cia.INJECT1_0 = "NO";
    defparam r_ctr_cia.INJECT1_1 = "NO";
    CCU2C r_ctr_0 (.A0(rcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(rcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(r_ctr_ci), 
          .S0(ircount_0), .S1(ircount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(387[14:19])
    defparam r_ctr_0.INIT0 = 16'b0110011010101010;
    defparam r_ctr_0.INIT1 = 16'b0110011010101010;
    defparam r_ctr_0.INJECT1_0 = "NO";
    defparam r_ctr_0.INJECT1_1 = "NO";
    AND2 AND2_t4 (.A(Write_En_c), .B(invout_2), .Z(wren_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(129[14:18])
    INV INV_8 (.A(Full), .Z(invout_2)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(295[18:36])
    AND2 AND2_t3 (.A(\adc_fifo_rd_en[10] ), .B(invout_1), .Z(rden_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(135[14:18])
    INV INV_7 (.A(\adc_fifo_empty[10] ), .Z(invout_1)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(295[18:36])
    AND2 AND2_t2 (.A(wren_i), .B(rden_i_inv), .Z(cnt_con)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(141[14:18])
    XOR2 XOR2_t1 (.A(wren_i), .B(rden_i), .Z(fcnt_en)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(144[14:18])
    INV INV_6 (.A(rden_i), .Z(rden_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(295[18:36])
    INV INV_5 (.A(wren_i), .Z(wren_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(295[18:36])
    ROM16X1A LUT4_3 (.AD0(\adc_fifo_empty[10] ), .AD1(wren_i), .AD2(cmp_le_1), 
            .AD3(GND_net), .DO0(empty_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(295[18:36])
    defparam LUT4_3.initval = 16'b0011001000110010;
    ROM16X1A LUT4_2 (.AD0(Full), .AD1(rden_i), .AD2(cmp_ge_d1), .AD3(GND_net), 
            .DO0(full_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(295[18:36])
    defparam LUT4_2.initval = 16'b0011001000110010;
    PDPW16KD pdp_ram_0_0_0 (.DI0(Data_x10[0]), .DI1(Data_x10[1]), .DI2(Data_x10[2]), 
            .DI3(Data_x10[3]), .DI4(Data_x10[4]), .DI5(Data_x10[5]), .DI6(Data_x10[6]), 
            .DI7(Data_x10[7]), .DI8(Data_x10[8]), .DI9(Data_x10[9]), .DI10(Data_x10[10]), 
            .DI11(Data_x10[11]), .DI12(Data_x10[12]), .DI13(Data_x10[13]), 
            .DI14(Data_x10[14]), .DI15(Data_x10[15]), .DI16(Data_x10[16]), 
            .DI17(Data_x10[17]), .DI18(Data_x10[18]), .DI19(Data_x10[19]), 
            .DI20(Data_x10[20]), .DI21(Data_x10[21]), .DI22(Data_x10[22]), 
            .DI23(Data_x10[23]), .DI24(GND_net), .DI25(GND_net), .DI26(GND_net), 
            .DI27(GND_net), .DI28(GND_net), .DI29(GND_net), .DI30(GND_net), 
            .DI31(GND_net), .DI32(GND_net), .DI33(GND_net), .DI34(GND_net), 
            .DI35(GND_net), .ADW0(wcount_0), .ADW1(wcount_1), .ADW2(GND_net), 
            .ADW3(GND_net), .ADW4(GND_net), .ADW5(GND_net), .ADW6(GND_net), 
            .ADW7(GND_net), .ADW8(GND_net), .BE0(VCC_net), .BE1(VCC_net), 
            .BE2(VCC_net), .BE3(VCC_net), .CEW(wren_i), .CLKW(clk_c), 
            .CSW0(VCC_net), .CSW1(GND_net), .CSW2(GND_net), .ADR0(GND_net), 
            .ADR1(GND_net), .ADR2(GND_net), .ADR3(GND_net), .ADR4(GND_net), 
            .ADR5(rcount_0), .ADR6(rcount_1), .ADR7(GND_net), .ADR8(GND_net), 
            .ADR9(GND_net), .ADR10(GND_net), .ADR11(GND_net), .ADR12(GND_net), 
            .ADR13(GND_net), .CER(rden_i), .OCER(rden_i), .CLKR(clk_c), 
            .CSR0(GND_net), .CSR1(GND_net), .CSR2(GND_net), .RST(rst_c), 
            .DO0(adc_fifo_10_dout[18]), .DO1(adc_fifo_10_dout[19]), .DO2(adc_fifo_10_dout[20]), 
            .DO3(adc_fifo_10_dout[21]), .DO4(adc_fifo_10_dout[22]), .DO5(adc_fifo_10_dout[23]), 
            .DO18(adc_fifo_10_dout[0]), .DO19(adc_fifo_10_dout[1]), .DO20(adc_fifo_10_dout[2]), 
            .DO21(adc_fifo_10_dout[3]), .DO22(adc_fifo_10_dout[4]), .DO23(adc_fifo_10_dout[5]), 
            .DO24(adc_fifo_10_dout[6]), .DO25(adc_fifo_10_dout[7]), .DO26(adc_fifo_10_dout[8]), 
            .DO27(adc_fifo_10_dout[9]), .DO28(adc_fifo_10_dout[10]), .DO29(adc_fifo_10_dout[11]), 
            .DO30(adc_fifo_10_dout[12]), .DO31(adc_fifo_10_dout[13]), .DO32(adc_fifo_10_dout[14]), 
            .DO33(adc_fifo_10_dout[15]), .DO34(adc_fifo_10_dout[16]), .DO35(adc_fifo_10_dout[17])) /* synthesis syn_black_box=true, MEM_LPC_FILE="FIFOsm.lpc", MEM_INIT_FILE="", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=295, LSE_RLINE=295 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(295[18:36])
    defparam pdp_ram_0_0_0.DATA_WIDTH_W = 36;
    defparam pdp_ram_0_0_0.DATA_WIDTH_R = 36;
    defparam pdp_ram_0_0_0.GSR = "ENABLED";
    defparam pdp_ram_0_0_0.REGMODE = "NOREG";
    defparam pdp_ram_0_0_0.RESETMODE = "ASYNC";
    defparam pdp_ram_0_0_0.ASYNC_RESET_RELEASE = "SYNC";
    defparam pdp_ram_0_0_0.CSDECODE_W = "0b001";
    defparam pdp_ram_0_0_0.CSDECODE_R = "0b000";
    defparam pdp_ram_0_0_0.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_20 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_21 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_22 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_23 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_24 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_25 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_26 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_27 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_28 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_29 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_30 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_31 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_32 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_33 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_34 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_35 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_36 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_37 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_38 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_39 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INIT_DATA = "STATIC";
    
endmodule
//
// Verilog Description of module FIFOsm_U12
//

module FIFOsm_U12 (clk_c, \adc_fifo_empty[11] , GND_net, VCC_net, Write_En_c, 
            \adc_fifo_rd_en[11] , \Data_x2[21] , \Data_x2[20] , \Data_x2[19] , 
            \Data_x2[18] , \Data_x2[17] , \Data_x2[16] , \Data_x2[15] , 
            \Data_x2[14] , \Data_x2[13] , \Data_x2[12] , \Data_x2[11] , 
            \Data_x2[10] , \Data_x2[9] , \Data_x2[8] , \Data_x2[7] , 
            \Data_x2[6] , \Data_x2[5] , \Data_x2[4] , \Data_x2[3] , 
            \Data_x2[2] , \Data_x2[1] , \Data_x2[0] , rst_c, adc_fifo_11_dout) /* synthesis NGD_DRC_MASK=1 */ ;
    input clk_c;
    output \adc_fifo_empty[11] ;
    input GND_net;
    input VCC_net;
    input Write_En_c;
    input \adc_fifo_rd_en[11] ;
    input \Data_x2[21] ;
    input \Data_x2[20] ;
    input \Data_x2[19] ;
    input \Data_x2[18] ;
    input \Data_x2[17] ;
    input \Data_x2[16] ;
    input \Data_x2[15] ;
    input \Data_x2[14] ;
    input \Data_x2[13] ;
    input \Data_x2[12] ;
    input \Data_x2[11] ;
    input \Data_x2[10] ;
    input \Data_x2[9] ;
    input \Data_x2[8] ;
    input \Data_x2[7] ;
    input \Data_x2[6] ;
    input \Data_x2[5] ;
    input \Data_x2[4] ;
    input \Data_x2[3] ;
    input \Data_x2[2] ;
    input \Data_x2[1] ;
    input \Data_x2[0] ;
    input rst_c;
    output [23:0]adc_fifo_11_dout;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    
    wire fcount_1, fcnt_en, ifcount_1, fcount_2, ifcount_2, empty_d, 
        Full, full_d, wcount_0, wren_i, iwcount_0, wcount_1, iwcount_1, 
        rcount_0, rden_i, ircount_0, rcount_1, ircount_1, fcount_0, 
        ifcount_0, bdcnt_bctr_ci, cnt_con, co0, cmp_ci, co0_1, cmp_le_1_c, 
        cmp_le_1, cmp_ci_1, co0_2, wren_i_inv, cmp_ge_d1_c, cmp_ge_d1, 
        w_ctr_ci, r_ctr_ci, invout_2, invout_1, rden_i_inv;
    
    FD1P3AX FF_11 (.D(ifcount_1), .SP(fcnt_en), .CK(clk_c), .Q(fcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(232[12:19])
    defparam FF_11.GSR = "ENABLED";
    FD1P3AX FF_10 (.D(ifcount_2), .SP(fcnt_en), .CK(clk_c), .Q(fcount_2)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(236[12:19])
    defparam FF_10.GSR = "ENABLED";
    FD1S3AY FF_9 (.D(empty_d), .CK(clk_c), .Q(\adc_fifo_empty[11] )) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(240[11:18])
    defparam FF_9.GSR = "ENABLED";
    FD1S3AX FF_8 (.D(full_d), .CK(clk_c), .Q(Full)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(243[11:18])
    defparam FF_8.GSR = "ENABLED";
    FD1P3AX FF_7 (.D(iwcount_0), .SP(wren_i), .CK(clk_c), .Q(wcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(246[11:18])
    defparam FF_7.GSR = "ENABLED";
    FD1P3AX FF_6 (.D(iwcount_1), .SP(wren_i), .CK(clk_c), .Q(wcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(250[11:18])
    defparam FF_6.GSR = "ENABLED";
    FD1P3AX FF_4 (.D(ircount_0), .SP(rden_i), .CK(clk_c), .Q(rcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(258[11:18])
    defparam FF_4.GSR = "ENABLED";
    FD1P3AX FF_3 (.D(ircount_1), .SP(rden_i), .CK(clk_c), .Q(rcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(262[11:18])
    defparam FF_3.GSR = "ENABLED";
    FD1P3AX FF_12 (.D(ifcount_0), .SP(fcnt_en), .CK(clk_c), .Q(fcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(228[12:19])
    defparam FF_12.GSR = "ENABLED";
    CCU2C bdcnt_bctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(cnt_con), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .COUT(bdcnt_bctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(276[21:26])
    defparam bdcnt_bctr_cia.INIT0 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INIT1 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INJECT1_0 = "NO";
    defparam bdcnt_bctr_cia.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_0 (.A0(fcount_0), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(bdcnt_bctr_ci), 
          .COUT(co0), .S0(ifcount_0), .S1(ifcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(283[19:24])
    defparam bdcnt_bctr_0.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INJECT1_0 = "NO";
    defparam bdcnt_bctr_0.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_1 (.A0(fcount_2), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(co0), 
          .S0(ifcount_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(290[19:24])
    defparam bdcnt_bctr_1.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INJECT1_0 = "NO";
    defparam bdcnt_bctr_1.INJECT1_1 = "NO";
    CCU2C e_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(297[17:22])
    defparam e_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INJECT1_0 = "NO";
    defparam e_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C e_cmp_0 (.A0(rden_i), .B0(fcount_0), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_1), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci), 
          .COUT(co0_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(304[14:19])
    defparam e_cmp_0.INIT0 = 16'b1001100110101010;
    defparam e_cmp_0.INIT1 = 16'b1001100110101010;
    defparam e_cmp_0.INJECT1_0 = "NO";
    defparam e_cmp_0.INJECT1_1 = "NO";
    CCU2C e_cmp_1 (.A0(GND_net), .B0(fcount_2), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_1), 
          .COUT(cmp_le_1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(311[14:19])
    defparam e_cmp_1.INIT0 = 16'b1001100110101010;
    defparam e_cmp_1.INIT1 = 16'b1001100110101010;
    defparam e_cmp_1.INJECT1_0 = "NO";
    defparam e_cmp_1.INJECT1_1 = "NO";
    CCU2C a0 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_le_1_c), 
          .S0(cmp_le_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(319[9:14])
    defparam a0.INIT0 = 16'b0110011010101010;
    defparam a0.INIT1 = 16'b0110011010101010;
    defparam a0.INJECT1_0 = "NO";
    defparam a0.INJECT1_1 = "NO";
    CCU2C g_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(327[17:22])
    defparam g_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INJECT1_0 = "NO";
    defparam g_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C g_cmp_0 (.A0(fcount_0), .B0(wren_i), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(wren_i), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci_1), 
          .COUT(co0_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(334[14:19])
    defparam g_cmp_0.INIT0 = 16'b1001100110101010;
    defparam g_cmp_0.INIT1 = 16'b1001100110101010;
    defparam g_cmp_0.INJECT1_0 = "NO";
    defparam g_cmp_0.INJECT1_1 = "NO";
    CCU2C g_cmp_1 (.A0(fcount_2), .B0(wren_i_inv), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_2), 
          .COUT(cmp_ge_d1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(341[14:19])
    defparam g_cmp_1.INIT0 = 16'b1001100110101010;
    defparam g_cmp_1.INIT1 = 16'b1001100110101010;
    defparam g_cmp_1.INJECT1_0 = "NO";
    defparam g_cmp_1.INJECT1_1 = "NO";
    CCU2C a1 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ge_d1_c), 
          .S0(cmp_ge_d1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(349[9:14])
    defparam a1.INIT0 = 16'b0110011010101010;
    defparam a1.INIT1 = 16'b0110011010101010;
    defparam a1.INJECT1_0 = "NO";
    defparam a1.INJECT1_1 = "NO";
    CCU2C w_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(w_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(357[16:21])
    defparam w_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam w_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam w_ctr_cia.INJECT1_0 = "NO";
    defparam w_ctr_cia.INJECT1_1 = "NO";
    CCU2C w_ctr_0 (.A0(wcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(wcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(w_ctr_ci), 
          .S0(iwcount_0), .S1(iwcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(364[14:19])
    defparam w_ctr_0.INIT0 = 16'b0110011010101010;
    defparam w_ctr_0.INIT1 = 16'b0110011010101010;
    defparam w_ctr_0.INJECT1_0 = "NO";
    defparam w_ctr_0.INJECT1_1 = "NO";
    CCU2C r_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(r_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(380[16:21])
    defparam r_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam r_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam r_ctr_cia.INJECT1_0 = "NO";
    defparam r_ctr_cia.INJECT1_1 = "NO";
    CCU2C r_ctr_0 (.A0(rcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(rcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(r_ctr_ci), 
          .S0(ircount_0), .S1(ircount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(387[14:19])
    defparam r_ctr_0.INIT0 = 16'b0110011010101010;
    defparam r_ctr_0.INIT1 = 16'b0110011010101010;
    defparam r_ctr_0.INJECT1_0 = "NO";
    defparam r_ctr_0.INJECT1_1 = "NO";
    AND2 AND2_t4 (.A(Write_En_c), .B(invout_2), .Z(wren_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(129[14:18])
    INV INV_8 (.A(Full), .Z(invout_2)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(309[18:36])
    AND2 AND2_t3 (.A(\adc_fifo_rd_en[11] ), .B(invout_1), .Z(rden_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(135[14:18])
    INV INV_7 (.A(\adc_fifo_empty[11] ), .Z(invout_1)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(309[18:36])
    AND2 AND2_t2 (.A(wren_i), .B(rden_i_inv), .Z(cnt_con)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(141[14:18])
    XOR2 XOR2_t1 (.A(wren_i), .B(rden_i), .Z(fcnt_en)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(144[14:18])
    INV INV_6 (.A(rden_i), .Z(rden_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(309[18:36])
    INV INV_5 (.A(wren_i), .Z(wren_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(309[18:36])
    ROM16X1A LUT4_3 (.AD0(\adc_fifo_empty[11] ), .AD1(wren_i), .AD2(cmp_le_1), 
            .AD3(GND_net), .DO0(empty_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(309[18:36])
    defparam LUT4_3.initval = 16'b0011001000110010;
    ROM16X1A LUT4_2 (.AD0(Full), .AD1(rden_i), .AD2(cmp_ge_d1), .AD3(GND_net), 
            .DO0(full_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(309[18:36])
    defparam LUT4_2.initval = 16'b0011001000110010;
    PDPW16KD pdp_ram_0_0_0 (.DI0(GND_net), .DI1(GND_net), .DI2(\Data_x2[0] ), 
            .DI3(\Data_x2[1] ), .DI4(\Data_x2[2] ), .DI5(\Data_x2[3] ), 
            .DI6(\Data_x2[4] ), .DI7(\Data_x2[5] ), .DI8(\Data_x2[6] ), 
            .DI9(\Data_x2[7] ), .DI10(\Data_x2[8] ), .DI11(\Data_x2[9] ), 
            .DI12(\Data_x2[10] ), .DI13(\Data_x2[11] ), .DI14(\Data_x2[12] ), 
            .DI15(\Data_x2[13] ), .DI16(\Data_x2[14] ), .DI17(\Data_x2[15] ), 
            .DI18(\Data_x2[16] ), .DI19(\Data_x2[17] ), .DI20(\Data_x2[18] ), 
            .DI21(\Data_x2[19] ), .DI22(\Data_x2[20] ), .DI23(\Data_x2[21] ), 
            .DI24(GND_net), .DI25(GND_net), .DI26(GND_net), .DI27(GND_net), 
            .DI28(GND_net), .DI29(GND_net), .DI30(GND_net), .DI31(GND_net), 
            .DI32(GND_net), .DI33(GND_net), .DI34(GND_net), .DI35(GND_net), 
            .ADW0(wcount_0), .ADW1(wcount_1), .ADW2(GND_net), .ADW3(GND_net), 
            .ADW4(GND_net), .ADW5(GND_net), .ADW6(GND_net), .ADW7(GND_net), 
            .ADW8(GND_net), .BE0(VCC_net), .BE1(VCC_net), .BE2(VCC_net), 
            .BE3(VCC_net), .CEW(wren_i), .CLKW(clk_c), .CSW0(VCC_net), 
            .CSW1(GND_net), .CSW2(GND_net), .ADR0(GND_net), .ADR1(GND_net), 
            .ADR2(GND_net), .ADR3(GND_net), .ADR4(GND_net), .ADR5(rcount_0), 
            .ADR6(rcount_1), .ADR7(GND_net), .ADR8(GND_net), .ADR9(GND_net), 
            .ADR10(GND_net), .ADR11(GND_net), .ADR12(GND_net), .ADR13(GND_net), 
            .CER(rden_i), .OCER(rden_i), .CLKR(clk_c), .CSR0(GND_net), 
            .CSR1(GND_net), .CSR2(GND_net), .RST(rst_c), .DO0(adc_fifo_11_dout[18]), 
            .DO1(adc_fifo_11_dout[19]), .DO2(adc_fifo_11_dout[20]), .DO3(adc_fifo_11_dout[21]), 
            .DO4(adc_fifo_11_dout[22]), .DO5(adc_fifo_11_dout[23]), .DO18(adc_fifo_11_dout[0]), 
            .DO19(adc_fifo_11_dout[1]), .DO20(adc_fifo_11_dout[2]), .DO21(adc_fifo_11_dout[3]), 
            .DO22(adc_fifo_11_dout[4]), .DO23(adc_fifo_11_dout[5]), .DO24(adc_fifo_11_dout[6]), 
            .DO25(adc_fifo_11_dout[7]), .DO26(adc_fifo_11_dout[8]), .DO27(adc_fifo_11_dout[9]), 
            .DO28(adc_fifo_11_dout[10]), .DO29(adc_fifo_11_dout[11]), .DO30(adc_fifo_11_dout[12]), 
            .DO31(adc_fifo_11_dout[13]), .DO32(adc_fifo_11_dout[14]), .DO33(adc_fifo_11_dout[15]), 
            .DO34(adc_fifo_11_dout[16]), .DO35(adc_fifo_11_dout[17])) /* synthesis syn_black_box=true, MEM_LPC_FILE="FIFOsm.lpc", MEM_INIT_FILE="", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=309, LSE_RLINE=309 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(309[18:36])
    defparam pdp_ram_0_0_0.DATA_WIDTH_W = 36;
    defparam pdp_ram_0_0_0.DATA_WIDTH_R = 36;
    defparam pdp_ram_0_0_0.GSR = "ENABLED";
    defparam pdp_ram_0_0_0.REGMODE = "NOREG";
    defparam pdp_ram_0_0_0.RESETMODE = "ASYNC";
    defparam pdp_ram_0_0_0.ASYNC_RESET_RELEASE = "SYNC";
    defparam pdp_ram_0_0_0.CSDECODE_W = "0b001";
    defparam pdp_ram_0_0_0.CSDECODE_R = "0b000";
    defparam pdp_ram_0_0_0.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_20 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_21 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_22 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_23 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_24 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_25 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_26 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_27 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_28 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_29 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_30 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_31 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_32 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_33 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_34 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_35 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_36 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_37 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_38 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_39 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INIT_DATA = "STATIC";
    
endmodule
//
// Verilog Description of module FIFOsm_U11
//

module FIFOsm_U11 (clk_c, \adc_fifo_empty[12] , GND_net, VCC_net, Write_En_c, 
            \adc_fifo_rd_en[12] , Data_x12, rst_c, adc_fifo_12_dout) /* synthesis NGD_DRC_MASK=1 */ ;
    input clk_c;
    output \adc_fifo_empty[12] ;
    input GND_net;
    input VCC_net;
    input Write_En_c;
    input \adc_fifo_rd_en[12] ;
    input [23:0]Data_x12;
    input rst_c;
    output [23:0]adc_fifo_12_dout;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    
    wire fcount_1, fcnt_en, ifcount_1, fcount_2, ifcount_2, empty_d, 
        Full, full_d, wcount_0, wren_i, iwcount_0, wcount_1, iwcount_1, 
        rcount_0, rden_i, ircount_0, rcount_1, ircount_1, fcount_0, 
        ifcount_0, bdcnt_bctr_ci, cnt_con, co0, cmp_ci, co0_1, cmp_le_1_c, 
        cmp_le_1, cmp_ci_1, co0_2, wren_i_inv, cmp_ge_d1_c, cmp_ge_d1, 
        w_ctr_ci, r_ctr_ci, invout_2, invout_1, rden_i_inv;
    
    FD1P3AX FF_11 (.D(ifcount_1), .SP(fcnt_en), .CK(clk_c), .Q(fcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(232[12:19])
    defparam FF_11.GSR = "ENABLED";
    FD1P3AX FF_10 (.D(ifcount_2), .SP(fcnt_en), .CK(clk_c), .Q(fcount_2)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(236[12:19])
    defparam FF_10.GSR = "ENABLED";
    FD1S3AY FF_9 (.D(empty_d), .CK(clk_c), .Q(\adc_fifo_empty[12] )) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(240[11:18])
    defparam FF_9.GSR = "ENABLED";
    FD1S3AX FF_8 (.D(full_d), .CK(clk_c), .Q(Full)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(243[11:18])
    defparam FF_8.GSR = "ENABLED";
    FD1P3AX FF_7 (.D(iwcount_0), .SP(wren_i), .CK(clk_c), .Q(wcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(246[11:18])
    defparam FF_7.GSR = "ENABLED";
    FD1P3AX FF_6 (.D(iwcount_1), .SP(wren_i), .CK(clk_c), .Q(wcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(250[11:18])
    defparam FF_6.GSR = "ENABLED";
    FD1P3AX FF_4 (.D(ircount_0), .SP(rden_i), .CK(clk_c), .Q(rcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(258[11:18])
    defparam FF_4.GSR = "ENABLED";
    FD1P3AX FF_3 (.D(ircount_1), .SP(rden_i), .CK(clk_c), .Q(rcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(262[11:18])
    defparam FF_3.GSR = "ENABLED";
    FD1P3AX FF_12 (.D(ifcount_0), .SP(fcnt_en), .CK(clk_c), .Q(fcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(228[12:19])
    defparam FF_12.GSR = "ENABLED";
    CCU2C bdcnt_bctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(cnt_con), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .COUT(bdcnt_bctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(276[21:26])
    defparam bdcnt_bctr_cia.INIT0 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INIT1 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INJECT1_0 = "NO";
    defparam bdcnt_bctr_cia.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_0 (.A0(fcount_0), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(bdcnt_bctr_ci), 
          .COUT(co0), .S0(ifcount_0), .S1(ifcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(283[19:24])
    defparam bdcnt_bctr_0.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INJECT1_0 = "NO";
    defparam bdcnt_bctr_0.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_1 (.A0(fcount_2), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(co0), 
          .S0(ifcount_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(290[19:24])
    defparam bdcnt_bctr_1.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INJECT1_0 = "NO";
    defparam bdcnt_bctr_1.INJECT1_1 = "NO";
    CCU2C e_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(297[17:22])
    defparam e_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INJECT1_0 = "NO";
    defparam e_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C e_cmp_0 (.A0(rden_i), .B0(fcount_0), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_1), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci), 
          .COUT(co0_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(304[14:19])
    defparam e_cmp_0.INIT0 = 16'b1001100110101010;
    defparam e_cmp_0.INIT1 = 16'b1001100110101010;
    defparam e_cmp_0.INJECT1_0 = "NO";
    defparam e_cmp_0.INJECT1_1 = "NO";
    CCU2C e_cmp_1 (.A0(GND_net), .B0(fcount_2), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_1), 
          .COUT(cmp_le_1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(311[14:19])
    defparam e_cmp_1.INIT0 = 16'b1001100110101010;
    defparam e_cmp_1.INIT1 = 16'b1001100110101010;
    defparam e_cmp_1.INJECT1_0 = "NO";
    defparam e_cmp_1.INJECT1_1 = "NO";
    CCU2C a0 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_le_1_c), 
          .S0(cmp_le_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(319[9:14])
    defparam a0.INIT0 = 16'b0110011010101010;
    defparam a0.INIT1 = 16'b0110011010101010;
    defparam a0.INJECT1_0 = "NO";
    defparam a0.INJECT1_1 = "NO";
    CCU2C g_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(327[17:22])
    defparam g_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INJECT1_0 = "NO";
    defparam g_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C g_cmp_0 (.A0(fcount_0), .B0(wren_i), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(wren_i), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci_1), 
          .COUT(co0_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(334[14:19])
    defparam g_cmp_0.INIT0 = 16'b1001100110101010;
    defparam g_cmp_0.INIT1 = 16'b1001100110101010;
    defparam g_cmp_0.INJECT1_0 = "NO";
    defparam g_cmp_0.INJECT1_1 = "NO";
    CCU2C g_cmp_1 (.A0(fcount_2), .B0(wren_i_inv), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_2), 
          .COUT(cmp_ge_d1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(341[14:19])
    defparam g_cmp_1.INIT0 = 16'b1001100110101010;
    defparam g_cmp_1.INIT1 = 16'b1001100110101010;
    defparam g_cmp_1.INJECT1_0 = "NO";
    defparam g_cmp_1.INJECT1_1 = "NO";
    CCU2C a1 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ge_d1_c), 
          .S0(cmp_ge_d1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(349[9:14])
    defparam a1.INIT0 = 16'b0110011010101010;
    defparam a1.INIT1 = 16'b0110011010101010;
    defparam a1.INJECT1_0 = "NO";
    defparam a1.INJECT1_1 = "NO";
    CCU2C w_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(w_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(357[16:21])
    defparam w_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam w_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam w_ctr_cia.INJECT1_0 = "NO";
    defparam w_ctr_cia.INJECT1_1 = "NO";
    CCU2C w_ctr_0 (.A0(wcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(wcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(w_ctr_ci), 
          .S0(iwcount_0), .S1(iwcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(364[14:19])
    defparam w_ctr_0.INIT0 = 16'b0110011010101010;
    defparam w_ctr_0.INIT1 = 16'b0110011010101010;
    defparam w_ctr_0.INJECT1_0 = "NO";
    defparam w_ctr_0.INJECT1_1 = "NO";
    CCU2C r_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(r_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(380[16:21])
    defparam r_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam r_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam r_ctr_cia.INJECT1_0 = "NO";
    defparam r_ctr_cia.INJECT1_1 = "NO";
    CCU2C r_ctr_0 (.A0(rcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(rcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(r_ctr_ci), 
          .S0(ircount_0), .S1(ircount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(387[14:19])
    defparam r_ctr_0.INIT0 = 16'b0110011010101010;
    defparam r_ctr_0.INIT1 = 16'b0110011010101010;
    defparam r_ctr_0.INJECT1_0 = "NO";
    defparam r_ctr_0.INJECT1_1 = "NO";
    AND2 AND2_t4 (.A(Write_En_c), .B(invout_2), .Z(wren_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(129[14:18])
    INV INV_8 (.A(Full), .Z(invout_2)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(323[18:36])
    AND2 AND2_t3 (.A(\adc_fifo_rd_en[12] ), .B(invout_1), .Z(rden_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(135[14:18])
    INV INV_7 (.A(\adc_fifo_empty[12] ), .Z(invout_1)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(323[18:36])
    AND2 AND2_t2 (.A(wren_i), .B(rden_i_inv), .Z(cnt_con)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(141[14:18])
    XOR2 XOR2_t1 (.A(wren_i), .B(rden_i), .Z(fcnt_en)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(144[14:18])
    INV INV_6 (.A(rden_i), .Z(rden_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(323[18:36])
    INV INV_5 (.A(wren_i), .Z(wren_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(323[18:36])
    ROM16X1A LUT4_3 (.AD0(\adc_fifo_empty[12] ), .AD1(wren_i), .AD2(cmp_le_1), 
            .AD3(GND_net), .DO0(empty_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(323[18:36])
    defparam LUT4_3.initval = 16'b0011001000110010;
    ROM16X1A LUT4_2 (.AD0(Full), .AD1(rden_i), .AD2(cmp_ge_d1), .AD3(GND_net), 
            .DO0(full_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(323[18:36])
    defparam LUT4_2.initval = 16'b0011001000110010;
    PDPW16KD pdp_ram_0_0_0 (.DI0(Data_x12[0]), .DI1(Data_x12[1]), .DI2(Data_x12[2]), 
            .DI3(Data_x12[3]), .DI4(Data_x12[4]), .DI5(Data_x12[5]), .DI6(Data_x12[6]), 
            .DI7(Data_x12[7]), .DI8(Data_x12[8]), .DI9(Data_x12[9]), .DI10(Data_x12[10]), 
            .DI11(Data_x12[11]), .DI12(Data_x12[12]), .DI13(Data_x12[13]), 
            .DI14(Data_x12[14]), .DI15(Data_x12[15]), .DI16(Data_x12[16]), 
            .DI17(Data_x12[17]), .DI18(Data_x12[18]), .DI19(Data_x12[19]), 
            .DI20(Data_x12[20]), .DI21(Data_x12[21]), .DI22(Data_x12[22]), 
            .DI23(Data_x12[23]), .DI24(GND_net), .DI25(GND_net), .DI26(GND_net), 
            .DI27(GND_net), .DI28(GND_net), .DI29(GND_net), .DI30(GND_net), 
            .DI31(GND_net), .DI32(GND_net), .DI33(GND_net), .DI34(GND_net), 
            .DI35(GND_net), .ADW0(wcount_0), .ADW1(wcount_1), .ADW2(GND_net), 
            .ADW3(GND_net), .ADW4(GND_net), .ADW5(GND_net), .ADW6(GND_net), 
            .ADW7(GND_net), .ADW8(GND_net), .BE0(VCC_net), .BE1(VCC_net), 
            .BE2(VCC_net), .BE3(VCC_net), .CEW(wren_i), .CLKW(clk_c), 
            .CSW0(VCC_net), .CSW1(GND_net), .CSW2(GND_net), .ADR0(GND_net), 
            .ADR1(GND_net), .ADR2(GND_net), .ADR3(GND_net), .ADR4(GND_net), 
            .ADR5(rcount_0), .ADR6(rcount_1), .ADR7(GND_net), .ADR8(GND_net), 
            .ADR9(GND_net), .ADR10(GND_net), .ADR11(GND_net), .ADR12(GND_net), 
            .ADR13(GND_net), .CER(rden_i), .OCER(rden_i), .CLKR(clk_c), 
            .CSR0(GND_net), .CSR1(GND_net), .CSR2(GND_net), .RST(rst_c), 
            .DO0(adc_fifo_12_dout[18]), .DO1(adc_fifo_12_dout[19]), .DO2(adc_fifo_12_dout[20]), 
            .DO3(adc_fifo_12_dout[21]), .DO4(adc_fifo_12_dout[22]), .DO5(adc_fifo_12_dout[23]), 
            .DO18(adc_fifo_12_dout[0]), .DO19(adc_fifo_12_dout[1]), .DO20(adc_fifo_12_dout[2]), 
            .DO21(adc_fifo_12_dout[3]), .DO22(adc_fifo_12_dout[4]), .DO23(adc_fifo_12_dout[5]), 
            .DO24(adc_fifo_12_dout[6]), .DO25(adc_fifo_12_dout[7]), .DO26(adc_fifo_12_dout[8]), 
            .DO27(adc_fifo_12_dout[9]), .DO28(adc_fifo_12_dout[10]), .DO29(adc_fifo_12_dout[11]), 
            .DO30(adc_fifo_12_dout[12]), .DO31(adc_fifo_12_dout[13]), .DO32(adc_fifo_12_dout[14]), 
            .DO33(adc_fifo_12_dout[15]), .DO34(adc_fifo_12_dout[16]), .DO35(adc_fifo_12_dout[17])) /* synthesis syn_black_box=true, MEM_LPC_FILE="FIFOsm.lpc", MEM_INIT_FILE="", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=323, LSE_RLINE=323 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(323[18:36])
    defparam pdp_ram_0_0_0.DATA_WIDTH_W = 36;
    defparam pdp_ram_0_0_0.DATA_WIDTH_R = 36;
    defparam pdp_ram_0_0_0.GSR = "ENABLED";
    defparam pdp_ram_0_0_0.REGMODE = "NOREG";
    defparam pdp_ram_0_0_0.RESETMODE = "ASYNC";
    defparam pdp_ram_0_0_0.ASYNC_RESET_RELEASE = "SYNC";
    defparam pdp_ram_0_0_0.CSDECODE_W = "0b001";
    defparam pdp_ram_0_0_0.CSDECODE_R = "0b000";
    defparam pdp_ram_0_0_0.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_20 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_21 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_22 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_23 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_24 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_25 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_26 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_27 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_28 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_29 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_30 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_31 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_32 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_33 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_34 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_35 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_36 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_37 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_38 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_39 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INIT_DATA = "STATIC";
    
endmodule
//
// Verilog Description of module FIFOsm_U10
//

module FIFOsm_U10 (clk_c, \adc_fifo_empty[13] , GND_net, VCC_net, Write_En_c, 
            \adc_fifo_rd_en[13] , \Data_x6[22] , \Data_x6[21] , \Data_x6[20] , 
            \Data_x6[19] , \Data_x6[18] , \Data_x6[17] , \Data_x6[16] , 
            \Data_x6[15] , \Data_x6[14] , \Data_x6[13] , \Data_x6[12] , 
            \Data_x6[11] , \Data_x6[10] , \Data_x6[9] , \Data_x6[8] , 
            \Data_x6[7] , \Data_x6[6] , \Data_x6[5] , \Data_x6[4] , 
            \Data_x6[3] , \Data_x6[2] , \Data_x6[1] , \Data_x6[0] , 
            rst_c, adc_fifo_13_dout) /* synthesis NGD_DRC_MASK=1 */ ;
    input clk_c;
    output \adc_fifo_empty[13] ;
    input GND_net;
    input VCC_net;
    input Write_En_c;
    input \adc_fifo_rd_en[13] ;
    input \Data_x6[22] ;
    input \Data_x6[21] ;
    input \Data_x6[20] ;
    input \Data_x6[19] ;
    input \Data_x6[18] ;
    input \Data_x6[17] ;
    input \Data_x6[16] ;
    input \Data_x6[15] ;
    input \Data_x6[14] ;
    input \Data_x6[13] ;
    input \Data_x6[12] ;
    input \Data_x6[11] ;
    input \Data_x6[10] ;
    input \Data_x6[9] ;
    input \Data_x6[8] ;
    input \Data_x6[7] ;
    input \Data_x6[6] ;
    input \Data_x6[5] ;
    input \Data_x6[4] ;
    input \Data_x6[3] ;
    input \Data_x6[2] ;
    input \Data_x6[1] ;
    input \Data_x6[0] ;
    input rst_c;
    output [23:0]adc_fifo_13_dout;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    
    wire fcount_1, fcnt_en, ifcount_1, fcount_2, ifcount_2, empty_d, 
        Full, full_d, wcount_0, wren_i, iwcount_0, wcount_1, iwcount_1, 
        rcount_0, rden_i, ircount_0, rcount_1, ircount_1, fcount_0, 
        ifcount_0, bdcnt_bctr_ci, cnt_con, co0, cmp_ci, co0_1, cmp_le_1_c, 
        cmp_le_1, cmp_ci_1, co0_2, wren_i_inv, cmp_ge_d1_c, cmp_ge_d1, 
        w_ctr_ci, r_ctr_ci, invout_2, invout_1, rden_i_inv;
    
    FD1P3AX FF_11 (.D(ifcount_1), .SP(fcnt_en), .CK(clk_c), .Q(fcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(232[12:19])
    defparam FF_11.GSR = "ENABLED";
    FD1P3AX FF_10 (.D(ifcount_2), .SP(fcnt_en), .CK(clk_c), .Q(fcount_2)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(236[12:19])
    defparam FF_10.GSR = "ENABLED";
    FD1S3AY FF_9 (.D(empty_d), .CK(clk_c), .Q(\adc_fifo_empty[13] )) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(240[11:18])
    defparam FF_9.GSR = "ENABLED";
    FD1S3AX FF_8 (.D(full_d), .CK(clk_c), .Q(Full)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(243[11:18])
    defparam FF_8.GSR = "ENABLED";
    FD1P3AX FF_7 (.D(iwcount_0), .SP(wren_i), .CK(clk_c), .Q(wcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(246[11:18])
    defparam FF_7.GSR = "ENABLED";
    FD1P3AX FF_6 (.D(iwcount_1), .SP(wren_i), .CK(clk_c), .Q(wcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(250[11:18])
    defparam FF_6.GSR = "ENABLED";
    FD1P3AX FF_4 (.D(ircount_0), .SP(rden_i), .CK(clk_c), .Q(rcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(258[11:18])
    defparam FF_4.GSR = "ENABLED";
    FD1P3AX FF_3 (.D(ircount_1), .SP(rden_i), .CK(clk_c), .Q(rcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(262[11:18])
    defparam FF_3.GSR = "ENABLED";
    FD1P3AX FF_12 (.D(ifcount_0), .SP(fcnt_en), .CK(clk_c), .Q(fcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(228[12:19])
    defparam FF_12.GSR = "ENABLED";
    CCU2C bdcnt_bctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(cnt_con), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .COUT(bdcnt_bctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(276[21:26])
    defparam bdcnt_bctr_cia.INIT0 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INIT1 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INJECT1_0 = "NO";
    defparam bdcnt_bctr_cia.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_0 (.A0(fcount_0), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(bdcnt_bctr_ci), 
          .COUT(co0), .S0(ifcount_0), .S1(ifcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(283[19:24])
    defparam bdcnt_bctr_0.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INJECT1_0 = "NO";
    defparam bdcnt_bctr_0.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_1 (.A0(fcount_2), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(co0), 
          .S0(ifcount_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(290[19:24])
    defparam bdcnt_bctr_1.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INJECT1_0 = "NO";
    defparam bdcnt_bctr_1.INJECT1_1 = "NO";
    CCU2C e_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(297[17:22])
    defparam e_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INJECT1_0 = "NO";
    defparam e_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C e_cmp_0 (.A0(rden_i), .B0(fcount_0), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_1), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci), 
          .COUT(co0_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(304[14:19])
    defparam e_cmp_0.INIT0 = 16'b1001100110101010;
    defparam e_cmp_0.INIT1 = 16'b1001100110101010;
    defparam e_cmp_0.INJECT1_0 = "NO";
    defparam e_cmp_0.INJECT1_1 = "NO";
    CCU2C e_cmp_1 (.A0(GND_net), .B0(fcount_2), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_1), 
          .COUT(cmp_le_1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(311[14:19])
    defparam e_cmp_1.INIT0 = 16'b1001100110101010;
    defparam e_cmp_1.INIT1 = 16'b1001100110101010;
    defparam e_cmp_1.INJECT1_0 = "NO";
    defparam e_cmp_1.INJECT1_1 = "NO";
    CCU2C a0 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_le_1_c), 
          .S0(cmp_le_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(319[9:14])
    defparam a0.INIT0 = 16'b0110011010101010;
    defparam a0.INIT1 = 16'b0110011010101010;
    defparam a0.INJECT1_0 = "NO";
    defparam a0.INJECT1_1 = "NO";
    CCU2C g_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(327[17:22])
    defparam g_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INJECT1_0 = "NO";
    defparam g_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C g_cmp_0 (.A0(fcount_0), .B0(wren_i), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(wren_i), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci_1), 
          .COUT(co0_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(334[14:19])
    defparam g_cmp_0.INIT0 = 16'b1001100110101010;
    defparam g_cmp_0.INIT1 = 16'b1001100110101010;
    defparam g_cmp_0.INJECT1_0 = "NO";
    defparam g_cmp_0.INJECT1_1 = "NO";
    CCU2C g_cmp_1 (.A0(fcount_2), .B0(wren_i_inv), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_2), 
          .COUT(cmp_ge_d1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(341[14:19])
    defparam g_cmp_1.INIT0 = 16'b1001100110101010;
    defparam g_cmp_1.INIT1 = 16'b1001100110101010;
    defparam g_cmp_1.INJECT1_0 = "NO";
    defparam g_cmp_1.INJECT1_1 = "NO";
    CCU2C a1 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ge_d1_c), 
          .S0(cmp_ge_d1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(349[9:14])
    defparam a1.INIT0 = 16'b0110011010101010;
    defparam a1.INIT1 = 16'b0110011010101010;
    defparam a1.INJECT1_0 = "NO";
    defparam a1.INJECT1_1 = "NO";
    CCU2C w_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(w_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(357[16:21])
    defparam w_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam w_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam w_ctr_cia.INJECT1_0 = "NO";
    defparam w_ctr_cia.INJECT1_1 = "NO";
    CCU2C w_ctr_0 (.A0(wcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(wcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(w_ctr_ci), 
          .S0(iwcount_0), .S1(iwcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(364[14:19])
    defparam w_ctr_0.INIT0 = 16'b0110011010101010;
    defparam w_ctr_0.INIT1 = 16'b0110011010101010;
    defparam w_ctr_0.INJECT1_0 = "NO";
    defparam w_ctr_0.INJECT1_1 = "NO";
    CCU2C r_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(r_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(380[16:21])
    defparam r_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam r_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam r_ctr_cia.INJECT1_0 = "NO";
    defparam r_ctr_cia.INJECT1_1 = "NO";
    CCU2C r_ctr_0 (.A0(rcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(rcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(r_ctr_ci), 
          .S0(ircount_0), .S1(ircount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(387[14:19])
    defparam r_ctr_0.INIT0 = 16'b0110011010101010;
    defparam r_ctr_0.INIT1 = 16'b0110011010101010;
    defparam r_ctr_0.INJECT1_0 = "NO";
    defparam r_ctr_0.INJECT1_1 = "NO";
    AND2 AND2_t4 (.A(Write_En_c), .B(invout_2), .Z(wren_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(129[14:18])
    INV INV_8 (.A(Full), .Z(invout_2)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(337[18:36])
    AND2 AND2_t3 (.A(\adc_fifo_rd_en[13] ), .B(invout_1), .Z(rden_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(135[14:18])
    INV INV_7 (.A(\adc_fifo_empty[13] ), .Z(invout_1)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(337[18:36])
    AND2 AND2_t2 (.A(wren_i), .B(rden_i_inv), .Z(cnt_con)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(141[14:18])
    XOR2 XOR2_t1 (.A(wren_i), .B(rden_i), .Z(fcnt_en)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(144[14:18])
    INV INV_6 (.A(rden_i), .Z(rden_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(337[18:36])
    INV INV_5 (.A(wren_i), .Z(wren_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(337[18:36])
    ROM16X1A LUT4_3 (.AD0(\adc_fifo_empty[13] ), .AD1(wren_i), .AD2(cmp_le_1), 
            .AD3(GND_net), .DO0(empty_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(337[18:36])
    defparam LUT4_3.initval = 16'b0011001000110010;
    ROM16X1A LUT4_2 (.AD0(Full), .AD1(rden_i), .AD2(cmp_ge_d1), .AD3(GND_net), 
            .DO0(full_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(337[18:36])
    defparam LUT4_2.initval = 16'b0011001000110010;
    PDPW16KD pdp_ram_0_0_0 (.DI0(GND_net), .DI1(\Data_x6[0] ), .DI2(\Data_x6[1] ), 
            .DI3(\Data_x6[2] ), .DI4(\Data_x6[3] ), .DI5(\Data_x6[4] ), 
            .DI6(\Data_x6[5] ), .DI7(\Data_x6[6] ), .DI8(\Data_x6[7] ), 
            .DI9(\Data_x6[8] ), .DI10(\Data_x6[9] ), .DI11(\Data_x6[10] ), 
            .DI12(\Data_x6[11] ), .DI13(\Data_x6[12] ), .DI14(\Data_x6[13] ), 
            .DI15(\Data_x6[14] ), .DI16(\Data_x6[15] ), .DI17(\Data_x6[16] ), 
            .DI18(\Data_x6[17] ), .DI19(\Data_x6[18] ), .DI20(\Data_x6[19] ), 
            .DI21(\Data_x6[20] ), .DI22(\Data_x6[21] ), .DI23(\Data_x6[22] ), 
            .DI24(GND_net), .DI25(GND_net), .DI26(GND_net), .DI27(GND_net), 
            .DI28(GND_net), .DI29(GND_net), .DI30(GND_net), .DI31(GND_net), 
            .DI32(GND_net), .DI33(GND_net), .DI34(GND_net), .DI35(GND_net), 
            .ADW0(wcount_0), .ADW1(wcount_1), .ADW2(GND_net), .ADW3(GND_net), 
            .ADW4(GND_net), .ADW5(GND_net), .ADW6(GND_net), .ADW7(GND_net), 
            .ADW8(GND_net), .BE0(VCC_net), .BE1(VCC_net), .BE2(VCC_net), 
            .BE3(VCC_net), .CEW(wren_i), .CLKW(clk_c), .CSW0(VCC_net), 
            .CSW1(GND_net), .CSW2(GND_net), .ADR0(GND_net), .ADR1(GND_net), 
            .ADR2(GND_net), .ADR3(GND_net), .ADR4(GND_net), .ADR5(rcount_0), 
            .ADR6(rcount_1), .ADR7(GND_net), .ADR8(GND_net), .ADR9(GND_net), 
            .ADR10(GND_net), .ADR11(GND_net), .ADR12(GND_net), .ADR13(GND_net), 
            .CER(rden_i), .OCER(rden_i), .CLKR(clk_c), .CSR0(GND_net), 
            .CSR1(GND_net), .CSR2(GND_net), .RST(rst_c), .DO0(adc_fifo_13_dout[18]), 
            .DO1(adc_fifo_13_dout[19]), .DO2(adc_fifo_13_dout[20]), .DO3(adc_fifo_13_dout[21]), 
            .DO4(adc_fifo_13_dout[22]), .DO5(adc_fifo_13_dout[23]), .DO18(adc_fifo_13_dout[0]), 
            .DO19(adc_fifo_13_dout[1]), .DO20(adc_fifo_13_dout[2]), .DO21(adc_fifo_13_dout[3]), 
            .DO22(adc_fifo_13_dout[4]), .DO23(adc_fifo_13_dout[5]), .DO24(adc_fifo_13_dout[6]), 
            .DO25(adc_fifo_13_dout[7]), .DO26(adc_fifo_13_dout[8]), .DO27(adc_fifo_13_dout[9]), 
            .DO28(adc_fifo_13_dout[10]), .DO29(adc_fifo_13_dout[11]), .DO30(adc_fifo_13_dout[12]), 
            .DO31(adc_fifo_13_dout[13]), .DO32(adc_fifo_13_dout[14]), .DO33(adc_fifo_13_dout[15]), 
            .DO34(adc_fifo_13_dout[16]), .DO35(adc_fifo_13_dout[17])) /* synthesis syn_black_box=true, MEM_LPC_FILE="FIFOsm.lpc", MEM_INIT_FILE="", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=337, LSE_RLINE=337 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(337[18:36])
    defparam pdp_ram_0_0_0.DATA_WIDTH_W = 36;
    defparam pdp_ram_0_0_0.DATA_WIDTH_R = 36;
    defparam pdp_ram_0_0_0.GSR = "ENABLED";
    defparam pdp_ram_0_0_0.REGMODE = "NOREG";
    defparam pdp_ram_0_0_0.RESETMODE = "ASYNC";
    defparam pdp_ram_0_0_0.ASYNC_RESET_RELEASE = "SYNC";
    defparam pdp_ram_0_0_0.CSDECODE_W = "0b001";
    defparam pdp_ram_0_0_0.CSDECODE_R = "0b000";
    defparam pdp_ram_0_0_0.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_20 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_21 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_22 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_23 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_24 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_25 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_26 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_27 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_28 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_29 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_30 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_31 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_32 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_33 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_34 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_35 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_36 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_37 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_38 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_39 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INIT_DATA = "STATIC";
    
endmodule
//
// Verilog Description of module FIFOsm_U9
//

module FIFOsm_U9 (clk_c, \adc_fifo_empty[14] , GND_net, VCC_net, Write_En_c, 
            \adc_fifo_rd_en[14] , Data_x14, rst_c, adc_fifo_14_dout) /* synthesis NGD_DRC_MASK=1 */ ;
    input clk_c;
    output \adc_fifo_empty[14] ;
    input GND_net;
    input VCC_net;
    input Write_En_c;
    input \adc_fifo_rd_en[14] ;
    input [23:0]Data_x14;
    input rst_c;
    output [23:0]adc_fifo_14_dout;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    
    wire fcount_1, fcnt_en, ifcount_1, fcount_2, ifcount_2, empty_d, 
        Full, full_d, wcount_0, wren_i, iwcount_0, wcount_1, iwcount_1, 
        rcount_0, rden_i, ircount_0, rcount_1, ircount_1, fcount_0, 
        ifcount_0, bdcnt_bctr_ci, cnt_con, co0, cmp_ci, co0_1, cmp_le_1_c, 
        cmp_le_1, cmp_ci_1, co0_2, wren_i_inv, cmp_ge_d1_c, cmp_ge_d1, 
        w_ctr_ci, r_ctr_ci, invout_2, invout_1, rden_i_inv;
    
    FD1P3AX FF_11 (.D(ifcount_1), .SP(fcnt_en), .CK(clk_c), .Q(fcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(232[12:19])
    defparam FF_11.GSR = "ENABLED";
    FD1P3AX FF_10 (.D(ifcount_2), .SP(fcnt_en), .CK(clk_c), .Q(fcount_2)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(236[12:19])
    defparam FF_10.GSR = "ENABLED";
    FD1S3AY FF_9 (.D(empty_d), .CK(clk_c), .Q(\adc_fifo_empty[14] )) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(240[11:18])
    defparam FF_9.GSR = "ENABLED";
    FD1S3AX FF_8 (.D(full_d), .CK(clk_c), .Q(Full)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(243[11:18])
    defparam FF_8.GSR = "ENABLED";
    FD1P3AX FF_7 (.D(iwcount_0), .SP(wren_i), .CK(clk_c), .Q(wcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(246[11:18])
    defparam FF_7.GSR = "ENABLED";
    FD1P3AX FF_6 (.D(iwcount_1), .SP(wren_i), .CK(clk_c), .Q(wcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(250[11:18])
    defparam FF_6.GSR = "ENABLED";
    FD1P3AX FF_4 (.D(ircount_0), .SP(rden_i), .CK(clk_c), .Q(rcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(258[11:18])
    defparam FF_4.GSR = "ENABLED";
    FD1P3AX FF_3 (.D(ircount_1), .SP(rden_i), .CK(clk_c), .Q(rcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(262[11:18])
    defparam FF_3.GSR = "ENABLED";
    FD1P3AX FF_12 (.D(ifcount_0), .SP(fcnt_en), .CK(clk_c), .Q(fcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(228[12:19])
    defparam FF_12.GSR = "ENABLED";
    CCU2C bdcnt_bctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(cnt_con), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .COUT(bdcnt_bctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(276[21:26])
    defparam bdcnt_bctr_cia.INIT0 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INIT1 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INJECT1_0 = "NO";
    defparam bdcnt_bctr_cia.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_0 (.A0(fcount_0), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(bdcnt_bctr_ci), 
          .COUT(co0), .S0(ifcount_0), .S1(ifcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(283[19:24])
    defparam bdcnt_bctr_0.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INJECT1_0 = "NO";
    defparam bdcnt_bctr_0.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_1 (.A0(fcount_2), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(co0), 
          .S0(ifcount_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(290[19:24])
    defparam bdcnt_bctr_1.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INJECT1_0 = "NO";
    defparam bdcnt_bctr_1.INJECT1_1 = "NO";
    CCU2C e_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(297[17:22])
    defparam e_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INJECT1_0 = "NO";
    defparam e_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C e_cmp_0 (.A0(rden_i), .B0(fcount_0), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_1), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci), 
          .COUT(co0_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(304[14:19])
    defparam e_cmp_0.INIT0 = 16'b1001100110101010;
    defparam e_cmp_0.INIT1 = 16'b1001100110101010;
    defparam e_cmp_0.INJECT1_0 = "NO";
    defparam e_cmp_0.INJECT1_1 = "NO";
    CCU2C e_cmp_1 (.A0(GND_net), .B0(fcount_2), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_1), 
          .COUT(cmp_le_1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(311[14:19])
    defparam e_cmp_1.INIT0 = 16'b1001100110101010;
    defparam e_cmp_1.INIT1 = 16'b1001100110101010;
    defparam e_cmp_1.INJECT1_0 = "NO";
    defparam e_cmp_1.INJECT1_1 = "NO";
    CCU2C a0 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_le_1_c), 
          .S0(cmp_le_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(319[9:14])
    defparam a0.INIT0 = 16'b0110011010101010;
    defparam a0.INIT1 = 16'b0110011010101010;
    defparam a0.INJECT1_0 = "NO";
    defparam a0.INJECT1_1 = "NO";
    CCU2C g_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(327[17:22])
    defparam g_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INJECT1_0 = "NO";
    defparam g_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C g_cmp_0 (.A0(fcount_0), .B0(wren_i), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(wren_i), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci_1), 
          .COUT(co0_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(334[14:19])
    defparam g_cmp_0.INIT0 = 16'b1001100110101010;
    defparam g_cmp_0.INIT1 = 16'b1001100110101010;
    defparam g_cmp_0.INJECT1_0 = "NO";
    defparam g_cmp_0.INJECT1_1 = "NO";
    CCU2C g_cmp_1 (.A0(fcount_2), .B0(wren_i_inv), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_2), 
          .COUT(cmp_ge_d1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(341[14:19])
    defparam g_cmp_1.INIT0 = 16'b1001100110101010;
    defparam g_cmp_1.INIT1 = 16'b1001100110101010;
    defparam g_cmp_1.INJECT1_0 = "NO";
    defparam g_cmp_1.INJECT1_1 = "NO";
    CCU2C a1 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ge_d1_c), 
          .S0(cmp_ge_d1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(349[9:14])
    defparam a1.INIT0 = 16'b0110011010101010;
    defparam a1.INIT1 = 16'b0110011010101010;
    defparam a1.INJECT1_0 = "NO";
    defparam a1.INJECT1_1 = "NO";
    CCU2C w_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(w_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(357[16:21])
    defparam w_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam w_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam w_ctr_cia.INJECT1_0 = "NO";
    defparam w_ctr_cia.INJECT1_1 = "NO";
    CCU2C w_ctr_0 (.A0(wcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(wcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(w_ctr_ci), 
          .S0(iwcount_0), .S1(iwcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(364[14:19])
    defparam w_ctr_0.INIT0 = 16'b0110011010101010;
    defparam w_ctr_0.INIT1 = 16'b0110011010101010;
    defparam w_ctr_0.INJECT1_0 = "NO";
    defparam w_ctr_0.INJECT1_1 = "NO";
    CCU2C r_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(r_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(380[16:21])
    defparam r_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam r_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam r_ctr_cia.INJECT1_0 = "NO";
    defparam r_ctr_cia.INJECT1_1 = "NO";
    CCU2C r_ctr_0 (.A0(rcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(rcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(r_ctr_ci), 
          .S0(ircount_0), .S1(ircount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(387[14:19])
    defparam r_ctr_0.INIT0 = 16'b0110011010101010;
    defparam r_ctr_0.INIT1 = 16'b0110011010101010;
    defparam r_ctr_0.INJECT1_0 = "NO";
    defparam r_ctr_0.INJECT1_1 = "NO";
    AND2 AND2_t4 (.A(Write_En_c), .B(invout_2), .Z(wren_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(129[14:18])
    INV INV_8 (.A(Full), .Z(invout_2)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(351[18:36])
    AND2 AND2_t3 (.A(\adc_fifo_rd_en[14] ), .B(invout_1), .Z(rden_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(135[14:18])
    INV INV_7 (.A(\adc_fifo_empty[14] ), .Z(invout_1)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(351[18:36])
    AND2 AND2_t2 (.A(wren_i), .B(rden_i_inv), .Z(cnt_con)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(141[14:18])
    XOR2 XOR2_t1 (.A(wren_i), .B(rden_i), .Z(fcnt_en)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(144[14:18])
    INV INV_6 (.A(rden_i), .Z(rden_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(351[18:36])
    INV INV_5 (.A(wren_i), .Z(wren_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(351[18:36])
    ROM16X1A LUT4_3 (.AD0(\adc_fifo_empty[14] ), .AD1(wren_i), .AD2(cmp_le_1), 
            .AD3(GND_net), .DO0(empty_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(351[18:36])
    defparam LUT4_3.initval = 16'b0011001000110010;
    ROM16X1A LUT4_2 (.AD0(Full), .AD1(rden_i), .AD2(cmp_ge_d1), .AD3(GND_net), 
            .DO0(full_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(351[18:36])
    defparam LUT4_2.initval = 16'b0011001000110010;
    PDPW16KD pdp_ram_0_0_0 (.DI0(Data_x14[0]), .DI1(Data_x14[1]), .DI2(Data_x14[2]), 
            .DI3(Data_x14[3]), .DI4(Data_x14[4]), .DI5(Data_x14[5]), .DI6(Data_x14[6]), 
            .DI7(Data_x14[7]), .DI8(Data_x14[8]), .DI9(Data_x14[9]), .DI10(Data_x14[10]), 
            .DI11(Data_x14[11]), .DI12(Data_x14[12]), .DI13(Data_x14[13]), 
            .DI14(Data_x14[14]), .DI15(Data_x14[15]), .DI16(Data_x14[16]), 
            .DI17(Data_x14[17]), .DI18(Data_x14[18]), .DI19(Data_x14[19]), 
            .DI20(Data_x14[20]), .DI21(Data_x14[21]), .DI22(Data_x14[22]), 
            .DI23(Data_x14[23]), .DI24(GND_net), .DI25(GND_net), .DI26(GND_net), 
            .DI27(GND_net), .DI28(GND_net), .DI29(GND_net), .DI30(GND_net), 
            .DI31(GND_net), .DI32(GND_net), .DI33(GND_net), .DI34(GND_net), 
            .DI35(GND_net), .ADW0(wcount_0), .ADW1(wcount_1), .ADW2(GND_net), 
            .ADW3(GND_net), .ADW4(GND_net), .ADW5(GND_net), .ADW6(GND_net), 
            .ADW7(GND_net), .ADW8(GND_net), .BE0(VCC_net), .BE1(VCC_net), 
            .BE2(VCC_net), .BE3(VCC_net), .CEW(wren_i), .CLKW(clk_c), 
            .CSW0(VCC_net), .CSW1(GND_net), .CSW2(GND_net), .ADR0(GND_net), 
            .ADR1(GND_net), .ADR2(GND_net), .ADR3(GND_net), .ADR4(GND_net), 
            .ADR5(rcount_0), .ADR6(rcount_1), .ADR7(GND_net), .ADR8(GND_net), 
            .ADR9(GND_net), .ADR10(GND_net), .ADR11(GND_net), .ADR12(GND_net), 
            .ADR13(GND_net), .CER(rden_i), .OCER(rden_i), .CLKR(clk_c), 
            .CSR0(GND_net), .CSR1(GND_net), .CSR2(GND_net), .RST(rst_c), 
            .DO0(adc_fifo_14_dout[18]), .DO1(adc_fifo_14_dout[19]), .DO2(adc_fifo_14_dout[20]), 
            .DO3(adc_fifo_14_dout[21]), .DO4(adc_fifo_14_dout[22]), .DO5(adc_fifo_14_dout[23]), 
            .DO18(adc_fifo_14_dout[0]), .DO19(adc_fifo_14_dout[1]), .DO20(adc_fifo_14_dout[2]), 
            .DO21(adc_fifo_14_dout[3]), .DO22(adc_fifo_14_dout[4]), .DO23(adc_fifo_14_dout[5]), 
            .DO24(adc_fifo_14_dout[6]), .DO25(adc_fifo_14_dout[7]), .DO26(adc_fifo_14_dout[8]), 
            .DO27(adc_fifo_14_dout[9]), .DO28(adc_fifo_14_dout[10]), .DO29(adc_fifo_14_dout[11]), 
            .DO30(adc_fifo_14_dout[12]), .DO31(adc_fifo_14_dout[13]), .DO32(adc_fifo_14_dout[14]), 
            .DO33(adc_fifo_14_dout[15]), .DO34(adc_fifo_14_dout[16]), .DO35(adc_fifo_14_dout[17])) /* synthesis syn_black_box=true, MEM_LPC_FILE="FIFOsm.lpc", MEM_INIT_FILE="", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=18, LSE_RCOL=36, LSE_LLINE=351, LSE_RLINE=351 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(351[18:36])
    defparam pdp_ram_0_0_0.DATA_WIDTH_W = 36;
    defparam pdp_ram_0_0_0.DATA_WIDTH_R = 36;
    defparam pdp_ram_0_0_0.GSR = "ENABLED";
    defparam pdp_ram_0_0_0.REGMODE = "NOREG";
    defparam pdp_ram_0_0_0.RESETMODE = "ASYNC";
    defparam pdp_ram_0_0_0.ASYNC_RESET_RELEASE = "SYNC";
    defparam pdp_ram_0_0_0.CSDECODE_W = "0b001";
    defparam pdp_ram_0_0_0.CSDECODE_R = "0b000";
    defparam pdp_ram_0_0_0.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_20 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_21 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_22 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_23 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_24 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_25 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_26 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_27 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_28 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_29 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_30 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_31 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_32 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_33 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_34 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_35 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_36 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_37 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_38 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_39 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INIT_DATA = "STATIC";
    
endmodule
//
// Verilog Description of module rgmii_tx_ddr
//

module rgmii_tx_ddr (clk_c, rst_c, gmii_txd, buf_douto3, buf_douto2, 
            buf_douto1, buf_douto0, GND_net, VCC_net, buf_clkout, 
            ctl_reg, buf_douto4);
    input clk_c;
    input rst_c;
    input [7:0]gmii_txd;
    output buf_douto3;
    output buf_douto2;
    output buf_douto1;
    output buf_douto0;
    input GND_net;
    input VCC_net;
    output buf_clkout;
    input ctl_reg;
    output buf_douto4;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    
    DDR_forRGMII DDR_TX (.clk_c(clk_c), .rst_c(rst_c), .gmii_txd({gmii_txd}), 
            .buf_douto3(buf_douto3), .buf_douto2(buf_douto2), .buf_douto1(buf_douto1), 
            .buf_douto0(buf_douto0), .GND_net(GND_net), .VCC_net(VCC_net), 
            .buf_clkout(buf_clkout), .ctl_reg(ctl_reg), .buf_douto4(buf_douto4)) /* synthesis NGD_DRC_MASK=1 */ ;   // d:/bap/lattice_projecten/rgmii_withddr.vhd(35[13:37])
    
endmodule
//
// Verilog Description of module DDR_forRGMII
//

module DDR_forRGMII (clk_c, rst_c, gmii_txd, buf_douto3, buf_douto2, 
            buf_douto1, buf_douto0, GND_net, VCC_net, buf_clkout, 
            ctl_reg, buf_douto4) /* synthesis NGD_DRC_MASK=1 */ ;
    input clk_c;
    input rst_c;
    input [7:0]gmii_txd;
    output buf_douto3;
    output buf_douto2;
    output buf_douto1;
    output buf_douto0;
    input GND_net;
    input VCC_net;
    output buf_clkout;
    input ctl_reg;
    output buf_douto4;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    
    ODDRX1F Inst4_ODDRX1F3 (.D0(gmii_txd[3]), .D1(gmii_txd[7]), .SCLK(clk_c), 
            .RST(rst_c), .Q(buf_douto3)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=48, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/lattice_projecten/rgmii_withddr.vhd(35[13:37])
    defparam Inst4_ODDRX1F3.GSR = "ENABLED";
    ODDRX1F Inst4_ODDRX1F2 (.D0(gmii_txd[2]), .D1(gmii_txd[6]), .SCLK(clk_c), 
            .RST(rst_c), .Q(buf_douto2)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=48, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/lattice_projecten/rgmii_withddr.vhd(35[13:37])
    defparam Inst4_ODDRX1F2.GSR = "ENABLED";
    ODDRX1F Inst4_ODDRX1F1 (.D0(gmii_txd[1]), .D1(gmii_txd[5]), .SCLK(clk_c), 
            .RST(rst_c), .Q(buf_douto1)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=48, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/lattice_projecten/rgmii_withddr.vhd(35[13:37])
    defparam Inst4_ODDRX1F1.GSR = "ENABLED";
    ODDRX1F Inst4_ODDRX1F0 (.D0(gmii_txd[0]), .D1(gmii_txd[4]), .SCLK(clk_c), 
            .RST(rst_c), .Q(buf_douto0)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=48, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/lattice_projecten/rgmii_withddr.vhd(35[13:37])
    defparam Inst4_ODDRX1F0.GSR = "ENABLED";
    ODDRX1F Inst3_ODDRX1F (.D0(VCC_net), .D1(GND_net), .SCLK(clk_c), .RST(rst_c), 
            .Q(buf_clkout)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=48, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/lattice_projecten/rgmii_withddr.vhd(35[13:37])
    defparam Inst3_ODDRX1F.GSR = "ENABLED";
    ODDRX1F Inst4_ODDRX1F4 (.D0(ctl_reg), .D1(ctl_reg), .SCLK(clk_c), 
            .RST(rst_c), .Q(buf_douto4)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=48, LSE_LCOL=13, LSE_RCOL=37, LSE_LLINE=35, LSE_RLINE=35 */ ;   // d:/bap/lattice_projecten/rgmii_withddr.vhd(35[13:37])
    defparam Inst4_ODDRX1F4.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module MAC_AXItoRGMII
//

module MAC_AXItoRGMII (rst_c, clk_c, n2296, n11984, clk_c_enable_15, 
            crc_cnt, n11907, n2298, n399, n11929, frame_len, GND_net, 
            VCC_net, n11945, \udp_tdata[2] , \udp_tdata[0] , \crc_reg[1] , 
            \crc_reg[2] , \udp_tdata[5] , \udp_tdata[4] , gmii_txd, 
            n11931, n11921, n11942, n11919, n2297, \udp_tdata[1] , 
            n2268, \frame_len[5] , \crc_reg[12] , \frame_len[13] , \frame_len[14] , 
            \crc_reg[17] , n11911, fifo_rd_en_N_404, n2186, n5459, 
            \crc_reg[25] , \frame_len[11] , \frame_len[12] , \crc_reg[9] , 
            n15, n2187, n5461, n11839, \frame_len[9] , \frame_len[10] , 
            \frame_len[7] , \frame_len[8] , ctl_reg, \frame_len[6] , 
            n11954, \frame_len[23] , \frame_len[24] , \frame_len[25] , 
            \frame_len[26] , \frame_len[27] , \frame_len[28] , \frame_len[29] , 
            \frame_len[30] , \frame_len[31] , n5703, \reg_fifo_data[3] , 
            n2185, n11968, \next_crc_reg_31__N_594[2] , \crc_next[2] , 
            n9742, n11923, n2315, \next_crc_reg_31__N_594[9] , \next_crc_reg_31__N_594[12] , 
            \crc_next[12] , n11918, n11917, n11913, n11912, n11915, 
            n11916);
    input rst_c;
    input clk_c;
    output n2296;
    input n11984;
    input clk_c_enable_15;
    output [1:0]crc_cnt;
    input n11907;
    output n2298;
    input n399;
    input n11929;
    output [31:0]frame_len;
    input GND_net;
    input VCC_net;
    input n11945;
    input \udp_tdata[2] ;
    input \udp_tdata[0] ;
    output \crc_reg[1] ;
    output \crc_reg[2] ;
    input \udp_tdata[5] ;
    input \udp_tdata[4] ;
    output [7:0]gmii_txd;
    output n11931;
    input n11921;
    input n11942;
    input n11919;
    output n2297;
    input \udp_tdata[1] ;
    input n2268;
    output \frame_len[5] ;
    output \crc_reg[12] ;
    output \frame_len[13] ;
    output \frame_len[14] ;
    output \crc_reg[17] ;
    output n11911;
    input fifo_rd_en_N_404;
    input n2186;
    output n5459;
    output \crc_reg[25] ;
    output \frame_len[11] ;
    output \frame_len[12] ;
    output \crc_reg[9] ;
    input n15;
    input n2187;
    output n5461;
    input n11839;
    output \frame_len[9] ;
    output \frame_len[10] ;
    output \frame_len[7] ;
    output \frame_len[8] ;
    output ctl_reg;
    output \frame_len[6] ;
    output n11954;
    output \frame_len[23] ;
    output \frame_len[24] ;
    output \frame_len[25] ;
    output \frame_len[26] ;
    output \frame_len[27] ;
    output \frame_len[28] ;
    output \frame_len[29] ;
    output \frame_len[30] ;
    output \frame_len[31] ;
    input n5703;
    input \reg_fifo_data[3] ;
    input n2185;
    input n11968;
    input \next_crc_reg_31__N_594[2] ;
    output \crc_next[2] ;
    output n9742;
    output n11923;
    input n2315;
    input \next_crc_reg_31__N_594[9] ;
    input \next_crc_reg_31__N_594[12] ;
    output \crc_next[12] ;
    input n11918;
    input n11917;
    input n11913;
    input n11912;
    input n11915;
    input n11916;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    wire [7:0]n2290;
    
    wire n11955, n7145, clk_c_enable_13;
    wire [3:0]ifg_cnt;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(49[12:19])
    
    wire n3482;
    wire [3:0]n1;
    wire [31:0]crc_next;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(57[12:20])
    
    wire n2, n10244;
    wire [31:0]next_crc_reg;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(55[21:33])
    wire [31:0]crc_reg;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(55[12:19])
    wire [2:0]pre_cnt;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(46[12:19])
    
    wire n9509, n11854, n11853;
    wire [7:0]gmii_txd_7__N_406;
    
    wire n11_adj_895, clk_c_enable_71, n2_adj_896, n10390, n11851, 
        n11850, n11852, n11848, n11847, n11970, n10216, n2_adj_897, 
        n10386, clk_c_enable_74, n11841, n11840, n9021, n3360;
    wire [31:0]n133;
    
    wire n9022, n2_adj_898, n10500, n2_adj_899, n10588;
    wire [5:0]pad_cnt;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(47[12:19])
    
    wire n11944, n11920, n11932, n10360, n11966, n11796, n5449;
    wire [5:0]next_pad_cnt;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(47[21:33])
    
    wire n11757, n9020, n10456, n10332, n11910, n10534, n11909, 
        n9019, n5583, n10368, n11908, n10442, n9018, n6156, n10374, 
        n6195;
    wire [31:0]frame_len_c;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(51[12:21])
    
    wire n11827, n11826, n5;
    wire [1:0]next_crc_cnt;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(48[21:33])
    
    wire n11957, n6247, n10125, n11750, n10840, n10838, n10212, 
        n10548, n10396, n9017, n10274, n5581, n2_adj_900, n10570, 
        n10340, n10490, n10432, n10446, n9016, n10584, n5577, 
        n10574, n10558, n10504, n10478, n10378;
    wire [3:0]next_ifg_cnt_3__N_717;
    
    wire n10344, n10496, n10278, n11862, n10240, n10236, n10382, 
        n10282, n11749, n9543, n10518, n10416, n9015, n9561, n5579, 
        n5431, n9014, n5447, n5445, n5443, n10155, n5439, n4, 
        n11939, n9013, n9012, n9011, n5440, n10185, n10864, n11983, 
        n9026, n9025, n11986, n11933, n9024, n2_adj_901, n11985, 
        n2_adj_902, n2_adj_903, n2_adj_904, n6929, n3, n12003, n12002, 
        n2_adj_905, n2_adj_906, n2_adj_907, n2_adj_908, n9023, n2_adj_909, 
        n10288, n2_adj_910, n2_adj_911, n2_adj_912, n11587, n2_adj_913, 
        n3_adj_914, n11588, n2_adj_915, n2_adj_916, n3_adj_917, n2_adj_918, 
        n6922, n2_adj_919, n10872, n11914, n2_adj_920, n2_adj_921, 
        n2_adj_922, n2_adj_923, n6926, n2_adj_924, n11861, n2_adj_925, 
        n11860;
    
    LUT4 i1_3_lut_rep_182_4_lut (.A(n2290[5]), .B(n11955), .C(rst_c), 
         .D(n7145), .Z(clk_c_enable_13)) /* synthesis lut_function=(A (C+(D))+!A (B+(C+(D)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_rep_182_4_lut.init = 16'hfff4;
    FD1S3IX ifg_cnt__i0 (.D(n1[0]), .CK(clk_c), .CD(n3482), .Q(ifg_cnt[0])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam ifg_cnt__i0.GSR = "DISABLED";
    LUT4 i1_4_lut (.A(crc_next[27]), .B(n2), .C(n10244), .D(n2290[3]), 
         .Z(next_crc_reg[27])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut.init = 16'hfefc;
    LUT4 select_534_Select_27_i2_4_lut (.A(crc_reg[27]), .B(n2296), .C(crc_next[27]), 
         .D(n11984), .Z(n2)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_27_i2_4_lut.init = 16'h88c0;
    FD1P3IX pre_cnt__i0 (.D(n9509), .SP(clk_c_enable_15), .CD(rst_c), 
            .CK(clk_c), .Q(pre_cnt[0])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam pre_cnt__i0.GSR = "DISABLED";
    PFUMX i7484 (.BLUT(n11854), .ALUT(n11853), .C0(crc_cnt[1]), .Z(gmii_txd_7__N_406[4]));
    LUT4 i2035_4_lut_4_lut (.A(n11907), .B(n2290[3]), .C(n11_adj_895), 
         .D(rst_c), .Z(clk_c_enable_71)) /* synthesis lut_function=(A ((C+(D))+!B)+!A (B (C+(D))+!B (D))) */ ;
    defparam i2035_4_lut_4_lut.init = 16'hffe2;
    LUT4 i1_4_lut_adj_243 (.A(crc_next[28]), .B(n2_adj_896), .C(n10390), 
         .D(n2290[3]), .Z(next_crc_reg[28])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_243.init = 16'hfefc;
    LUT4 select_534_Select_28_i2_4_lut (.A(crc_reg[28]), .B(n2296), .C(crc_next[28]), 
         .D(n11984), .Z(n2_adj_896)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_28_i2_4_lut.init = 16'h88c0;
    PFUMX i7481 (.BLUT(n11851), .ALUT(n11850), .C0(crc_cnt[1]), .Z(n11852));
    PFUMX i7478 (.BLUT(n11848), .ALUT(n11847), .C0(crc_cnt[1]), .Z(gmii_txd_7__N_406[2]));
    LUT4 i1_3_lut_4_lut (.A(n2290[4]), .B(n11970), .C(n2298), .D(crc_reg[23]), 
         .Z(n10216)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut.init = 16'hfef0;
    LUT4 i1_4_lut_adj_244 (.A(n2290[3]), .B(n2_adj_897), .C(n10386), .D(crc_next[29]), 
         .Z(next_crc_reg[29])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_244.init = 16'hfefc;
    LUT4 i2_2_lut_3_lut_4_lut (.A(n399), .B(n11929), .C(rst_c), .D(n2290[3]), 
         .Z(clk_c_enable_74)) /* synthesis lut_function=(A (C+(D))+!A (B+(C+(D)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(173[17] 195[24])
    defparam i2_2_lut_3_lut_4_lut.init = 16'hfff4;
    LUT4 select_534_Select_29_i2_4_lut (.A(crc_reg[29]), .B(n2296), .C(crc_next[29]), 
         .D(n11984), .Z(n2_adj_897)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_29_i2_4_lut.init = 16'h88c0;
    PFUMX i7473 (.BLUT(n11841), .ALUT(n11840), .C0(crc_cnt[1]), .Z(gmii_txd_7__N_406[0]));
    CCU2C frame_len_702_add_4_23 (.A0(frame_len[21]), .B0(n3360), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[22]), .B1(n3360), .C1(GND_net), 
          .D1(VCC_net), .CIN(n9021), .COUT(n9022), .S0(n133[21]), .S1(n133[22]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702_add_4_23.INIT0 = 16'h2222;
    defparam frame_len_702_add_4_23.INIT1 = 16'h2222;
    defparam frame_len_702_add_4_23.INJECT1_0 = "NO";
    defparam frame_len_702_add_4_23.INJECT1_1 = "NO";
    LUT4 i1_4_lut_adj_245 (.A(crc_next[30]), .B(n2_adj_898), .C(n10500), 
         .D(n2290[3]), .Z(next_crc_reg[30])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_245.init = 16'hfefc;
    LUT4 select_534_Select_30_i2_4_lut (.A(crc_reg[30]), .B(n2296), .C(crc_next[30]), 
         .D(n11984), .Z(n2_adj_898)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_30_i2_4_lut.init = 16'h88c0;
    LUT4 i1_4_lut_adj_246 (.A(crc_next[31]), .B(n2_adj_899), .C(n10588), 
         .D(n2290[3]), .Z(next_crc_reg[31])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_246.init = 16'hfefc;
    LUT4 select_534_Select_31_i2_4_lut (.A(crc_reg[31]), .B(n2296), .C(crc_next[31]), 
         .D(n11984), .Z(n2_adj_899)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_31_i2_4_lut.init = 16'h88c0;
    LUT4 i863_2_lut_rep_198_3_lut (.A(pad_cnt[1]), .B(pad_cnt[0]), .C(pad_cnt[2]), 
         .Z(n11944)) /* synthesis lut_function=(A+(B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(211[37:44])
    defparam i863_2_lut_rep_198_3_lut.init = 16'hfefe;
    LUT4 i1_3_lut_4_lut_adj_247 (.A(n11945), .B(n11920), .C(crc_reg[19]), 
         .D(crc_reg[3]), .Z(crc_next[11])) /* synthesis lut_function=(!(A (C (D)+!C !(D))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1_3_lut_4_lut_adj_247.init = 16'h4bb4;
    LUT4 i871_2_lut_rep_186_3_lut_4_lut (.A(pad_cnt[1]), .B(pad_cnt[0]), 
         .C(pad_cnt[3]), .D(pad_cnt[2]), .Z(n11932)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(211[37:44])
    defparam i871_2_lut_rep_186_3_lut_4_lut.init = 16'hfffe;
    LUT4 i1_3_lut_4_lut_4_lut (.A(\udp_tdata[2] ), .B(n11945), .C(crc_reg[3]), 
         .D(\udp_tdata[0] ), .Z(n10360)) /* synthesis lut_function=(A (B (C)+!B (C (D)+!C !(D)))+!A (B (C)+!B !(C (D)+!C !(D)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_4_lut.init = 16'he1d2;
    LUT4 i2803_2_lut_rep_220 (.A(frame_len[2]), .B(frame_len[1]), .Z(n11966)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i2803_2_lut_rep_220.init = 16'heeee;
    LUT4 n6_bdd_2_lut_3_lut (.A(frame_len[2]), .B(frame_len[1]), .C(frame_len[3]), 
         .Z(n11796)) /* synthesis lut_function=(A (C)+!A (B (C)+!B !(C))) */ ;
    defparam n6_bdd_2_lut_3_lut.init = 16'he1e1;
    FD1S3JX state_FSM_i1 (.D(n5449), .CK(clk_c), .PD(rst_c), .Q(n2298));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam state_FSM_i1.GSR = "DISABLED";
    LUT4 i2036_4_lut (.A(frame_len[1]), .B(pad_cnt[1]), .C(n2290[3]), 
         .D(pad_cnt[0]), .Z(next_pad_cnt[1])) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C (D)))+!A (B (C (D))+!B !((D)+!C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i2036_4_lut.init = 16'hca3a;
    LUT4 n8_bdd_2_lut_3_lut_4_lut (.A(frame_len[2]), .B(frame_len[1]), .C(frame_len[4]), 
         .D(frame_len[3]), .Z(n11757)) /* synthesis lut_function=(A (C (D)+!C !(D))+!A (B (C (D)+!C !(D))+!B !(C))) */ ;
    defparam n8_bdd_2_lut_3_lut_4_lut.init = 16'he10f;
    CCU2C frame_len_702_add_4_21 (.A0(frame_len[19]), .B0(n3360), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[20]), .B1(n3360), .C1(GND_net), 
          .D1(VCC_net), .CIN(n9020), .COUT(n9021), .S0(n133[19]), .S1(n133[20]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702_add_4_21.INIT0 = 16'h2222;
    defparam frame_len_702_add_4_21.INIT1 = 16'h2222;
    defparam frame_len_702_add_4_21.INJECT1_0 = "NO";
    defparam frame_len_702_add_4_21.INJECT1_1 = "NO";
    LUT4 i1_3_lut_4_lut_adj_248 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(\crc_reg[1] ), .Z(n10456)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_248.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_249 (.A(\udp_tdata[2] ), .B(n11945), .C(crc_reg[8]), 
         .D(\crc_reg[2] ), .Z(crc_next[0])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A (C (D)+!C !(D)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_249.init = 16'h2dd2;
    LUT4 i1_3_lut_4_lut_adj_250 (.A(\udp_tdata[2] ), .B(n11945), .C(crc_reg[26]), 
         .D(crc_reg[4]), .Z(n10332)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A (C (D)+!C !(D)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_250.init = 16'h2dd2;
    LUT4 i2582_3_lut_rep_164_4_lut (.A(n11984), .B(n2296), .C(crc_reg[5]), 
         .D(\udp_tdata[5] ), .Z(n11910)) /* synthesis lut_function=(A (C)+!A !(B (C (D)+!C !(D))+!B !(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i2582_3_lut_rep_164_4_lut.init = 16'hb4f0;
    LUT4 i1_3_lut_4_lut_adj_251 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[14]), .Z(n10534)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_251.init = 16'hfef0;
    LUT4 i1_2_lut_rep_163_3_lut_4_lut (.A(n11984), .B(n2296), .C(crc_reg[4]), 
         .D(\udp_tdata[4] ), .Z(n11909)) /* synthesis lut_function=(A (C)+!A !(B (C (D)+!C !(D))+!B !(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_2_lut_rep_163_3_lut_4_lut.init = 16'hb4f0;
    CCU2C frame_len_702_add_4_19 (.A0(frame_len[17]), .B0(n3360), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[18]), .B1(n3360), .C1(GND_net), 
          .D1(VCC_net), .CIN(n9019), .COUT(n9020), .S0(n133[17]), .S1(n133[18]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702_add_4_19.INIT0 = 16'h2222;
    defparam frame_len_702_add_4_19.INIT1 = 16'h2222;
    defparam frame_len_702_add_4_19.INJECT1_0 = "NO";
    defparam frame_len_702_add_4_19.INJECT1_1 = "NO";
    LUT4 i1275_3_lut (.A(n5583), .B(gmii_txd_7__N_406[7]), .C(n2290[4]), 
         .Z(gmii_txd[7])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1275_3_lut.init = 16'hcaca;
    LUT4 i1_3_lut_4_lut_adj_252 (.A(\udp_tdata[2] ), .B(n11945), .C(crc_reg[29]), 
         .D(\crc_reg[2] ), .Z(n10368)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A (C (D)+!C !(D)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_252.init = 16'h2dd2;
    LUT4 i1274_4_lut (.A(n11931), .B(n11921), .C(n2296), .D(n11984), 
         .Z(n5583)) /* synthesis lut_function=(!(A (B (C (D))+!B (C))+!A (((D)+!C)+!B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1274_4_lut.init = 16'h0aca;
    LUT4 i1_3_lut_4_lut_adj_253 (.A(\udp_tdata[2] ), .B(n11945), .C(crc_reg[18]), 
         .D(\crc_reg[2] ), .Z(crc_next[10])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A (C (D)+!C !(D)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_253.init = 16'h2dd2;
    LUT4 i11_4_lut (.A(n11920), .B(n11852), .C(n2290[4]), .D(n11942), 
         .Z(gmii_txd[3])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i11_4_lut.init = 16'hcac0;
    LUT4 i1_2_lut_rep_162_3_lut_4_lut (.A(n11984), .B(n2296), .C(crc_reg[6]), 
         .D(n11919), .Z(n11908)) /* synthesis lut_function=(A (C)+!A !(B (C (D)+!C !(D))+!B !(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_2_lut_rep_162_3_lut_4_lut.init = 16'hb4f0;
    LUT4 i6601_3_lut_4_lut (.A(n11984), .B(n2296), .C(\udp_tdata[0] ), 
         .D(\udp_tdata[4] ), .Z(n10442)) /* synthesis lut_function=(!(A+((C (D)+!C !(D))+!B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i6601_3_lut_4_lut.init = 16'h0440;
    CCU2C frame_len_702_add_4_17 (.A0(frame_len[15]), .B0(n3360), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[16]), .B1(n3360), .C1(GND_net), 
          .D1(VCC_net), .CIN(n9018), .COUT(n9019), .S0(n133[15]), .S1(n133[16]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702_add_4_17.INIT0 = 16'h2222;
    defparam frame_len_702_add_4_17.INIT1 = 16'h2222;
    defparam frame_len_702_add_4_17.INJECT1_0 = "NO";
    defparam frame_len_702_add_4_17.INJECT1_1 = "NO";
    LUT4 i1_2_lut_3_lut_4_lut (.A(n11984), .B(n2296), .C(crc_reg[3]), 
         .D(n11920), .Z(n6156)) /* synthesis lut_function=(A (C)+!A !(B (C (D)+!C !(D))+!B !(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_2_lut_3_lut_4_lut.init = 16'hb4f0;
    LUT4 i1_3_lut_4_lut_adj_254 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[18]), .Z(n10374)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_254.init = 16'hfef0;
    LUT4 i1_2_lut_3_lut_4_lut_adj_255 (.A(n11984), .B(n2296), .C(crc_reg[7]), 
         .D(n11921), .Z(n6195)) /* synthesis lut_function=(A (C)+!A !(B (C (D)+!C !(D))+!B !(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_2_lut_3_lut_4_lut_adj_255.init = 16'hb4f0;
    LUT4 i1_2_lut_rep_224 (.A(n2297), .B(n2290[5]), .Z(n11970)) /* synthesis lut_function=(A+(B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_2_lut_rep_224.init = 16'heeee;
    LUT4 mux_298_i1_4_lut (.A(frame_len_c[0]), .B(pad_cnt[0]), .C(n2290[3]), 
         .D(n11_adj_895), .Z(next_pad_cnt[0])) /* synthesis lut_function=(!(A (B ((D)+!C)+!B !(C (D)))+!A (B (C (D))+!B !((D)+!C)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam mux_298_i1_4_lut.init = 16'h35c5;
    PFUMX i7462 (.BLUT(n11827), .ALUT(n11826), .C0(crc_cnt[1]), .Z(gmii_txd_7__N_406[7]));
    LUT4 i1_4_lut_4_lut (.A(crc_cnt[0]), .B(crc_cnt[1]), .C(n5), .D(n2290[4]), 
         .Z(next_crc_cnt[0])) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (D)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(229[17] 234[24])
    defparam i1_4_lut_4_lut.init = 16'hfda0;
    LUT4 i1_4_lut_4_lut_adj_256 (.A(crc_cnt[0]), .B(crc_cnt[1]), .C(n2290[4]), 
         .D(n5), .Z(next_crc_cnt[1])) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (B (C+(D)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(229[17] 234[24])
    defparam i1_4_lut_4_lut_adj_256.init = 16'hece0;
    LUT4 i1_2_lut_3_lut_4_lut_adj_257 (.A(n11984), .B(n2296), .C(n11957), 
         .D(\udp_tdata[1] ), .Z(n6247)) /* synthesis lut_function=(A (C)+!A !(B (C (D)+!C !(D))+!B !(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_2_lut_3_lut_4_lut_adj_257.init = 16'hb4f0;
    LUT4 i2_4_lut (.A(n2296), .B(n10125), .C(n2268), .D(n399), .Z(n5)) /* synthesis lut_function=(A (B+(C+!(D)))+!A (B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i2_4_lut.init = 16'hecee;
    FD1S3IX crc_cnt__i0 (.D(next_crc_cnt[0]), .CK(clk_c), .CD(rst_c), 
            .Q(crc_cnt[0])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_cnt__i0.GSR = "DISABLED";
    FD1S3JX crc_reg_i0 (.D(next_crc_reg[0]), .CK(clk_c), .PD(rst_c), .Q(crc_reg[0])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i0.GSR = "DISABLED";
    LUT4 n8_bdd_3_lut_4_lut (.A(frame_len[3]), .B(n11966), .C(frame_len[4]), 
         .D(\frame_len[5] ), .Z(n11750)) /* synthesis lut_function=(A (B (C (D)+!C !(D))+!B !(D))+!A !(D)) */ ;
    defparam n8_bdd_3_lut_4_lut.init = 16'h807f;
    LUT4 i1_4_lut_adj_258 (.A(pad_cnt[4]), .B(n10840), .C(n10838), .D(pad_cnt[5]), 
         .Z(n11_adj_895)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(207[20:31])
    defparam i1_4_lut_adj_258.init = 16'hfffe;
    LUT4 i1_3_lut_4_lut_adj_259 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[20]), .Z(n10212)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_259.init = 16'hfef0;
    FD1S3IX frame_len_702__i0 (.D(n133[0]), .CK(clk_c), .CD(rst_c), .Q(frame_len_c[0])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i0.GSR = "DISABLED";
    LUT4 i1_3_lut_4_lut_adj_260 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(\crc_reg[12] ), .Z(n10548)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_260.init = 16'hfef0;
    LUT4 i1_2_lut (.A(pad_cnt[0]), .B(pad_cnt[3]), .Z(n10840)) /* synthesis lut_function=(A+(B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(207[20:31])
    defparam i1_2_lut.init = 16'heeee;
    LUT4 n6_bdd_4_lut (.A(n11944), .B(pad_cnt[3]), .C(n11796), .D(n2290[3]), 
         .Z(next_pad_cnt[3])) /* synthesis lut_function=(A (B (C+(D))+!B !((D)+!C))+!A !(B ((D)+!C)+!B !(C+(D)))) */ ;
    defparam n6_bdd_4_lut.init = 16'h99f0;
    LUT4 i1_3_lut_4_lut_adj_261 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[6]), .Z(n10396)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_261.init = 16'hfef0;
    LUT4 i1_2_lut_adj_262 (.A(pad_cnt[2]), .B(pad_cnt[1]), .Z(n10838)) /* synthesis lut_function=(A+(B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(207[20:31])
    defparam i1_2_lut_adj_262.init = 16'heeee;
    CCU2C frame_len_702_add_4_15 (.A0(\frame_len[13] ), .B0(n3360), .C0(GND_net), 
          .D0(VCC_net), .A1(\frame_len[14] ), .B1(n3360), .C1(GND_net), 
          .D1(VCC_net), .CIN(n9017), .COUT(n9018), .S0(n133[13]), .S1(n133[14]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702_add_4_15.INIT0 = 16'h2222;
    defparam frame_len_702_add_4_15.INIT1 = 16'h2222;
    defparam frame_len_702_add_4_15.INJECT1_0 = "NO";
    defparam frame_len_702_add_4_15.INJECT1_1 = "NO";
    LUT4 i1_3_lut_4_lut_adj_263 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[22]), .Z(n10274)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_263.init = 16'hfef0;
    LUT4 i1273_3_lut (.A(n5581), .B(gmii_txd_7__N_406[6]), .C(n2290[4]), 
         .Z(gmii_txd[6])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1273_3_lut.init = 16'hcaca;
    LUT4 i1_3_lut_rep_165_4_lut (.A(n11921), .B(n11945), .C(\crc_reg[17] ), 
         .D(crc_reg[7]), .Z(n11911)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A (C (D)+!C !(D)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_rep_165_4_lut.init = 16'h2dd2;
    LUT4 i1272_4_lut (.A(n2297), .B(n11919), .C(n2296), .D(n11984), 
         .Z(n5581)) /* synthesis lut_function=(!(A (B (C (D))+!B (C))+!A (((D)+!C)+!B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1272_4_lut.init = 16'h0aca;
    LUT4 i1_4_lut_adj_264 (.A(crc_next[0]), .B(n2_adj_900), .C(n10570), 
         .D(n2290[3]), .Z(next_crc_reg[0])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_264.init = 16'hfefc;
    LUT4 i1150_3_lut_4_lut (.A(n11931), .B(n2296), .C(fifo_rd_en_N_404), 
         .D(n2186), .Z(n5459)) /* synthesis lut_function=(!(A (C+!(D))+!A (B (C+!(D))+!B !(D)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1150_3_lut_4_lut.init = 16'h1f00;
    LUT4 select_534_Select_0_i2_4_lut (.A(crc_reg[0]), .B(n2296), .C(crc_next[0]), 
         .D(n11984), .Z(n2_adj_900)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_0_i2_4_lut.init = 16'h88c0;
    LUT4 i1_3_lut_4_lut_adj_265 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(\crc_reg[25] ), .Z(n10340)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_265.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_266 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[15]), .Z(n10490)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_266.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_267 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[5]), .Z(n10432)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_267.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_268 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[16]), .Z(n10446)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_268.init = 16'hfef0;
    CCU2C frame_len_702_add_4_13 (.A0(\frame_len[11] ), .B0(n3360), .C0(GND_net), 
          .D0(VCC_net), .A1(\frame_len[12] ), .B1(n3360), .C1(GND_net), 
          .D1(VCC_net), .CIN(n9016), .COUT(n9017), .S0(n133[11]), .S1(n133[12]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702_add_4_13.INIT0 = 16'h2222;
    defparam frame_len_702_add_4_13.INIT1 = 16'h2222;
    defparam frame_len_702_add_4_13.INJECT1_0 = "NO";
    defparam frame_len_702_add_4_13.INJECT1_1 = "NO";
    LUT4 i1_3_lut_4_lut_adj_269 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(\crc_reg[9] ), .Z(n10584)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_269.init = 16'hfef0;
    LUT4 i1269_3_lut (.A(n5577), .B(gmii_txd_7__N_406[2]), .C(n2290[4]), 
         .Z(gmii_txd[2])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1269_3_lut.init = 16'hcaca;
    LUT4 i1_3_lut_4_lut_adj_270 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[10]), .Z(n10574)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_270.init = 16'hfef0;
    LUT4 i1268_4_lut (.A(n2297), .B(\udp_tdata[2] ), .C(n2296), .D(n11984), 
         .Z(n5577)) /* synthesis lut_function=(!(A (B (C (D))+!B (C))+!A (((D)+!C)+!B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1268_4_lut.init = 16'h0aca;
    LUT4 i1_3_lut_4_lut_adj_271 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(\crc_reg[2] ), .Z(n10558)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_271.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_272 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[0]), .Z(n10570)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_272.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_273 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[8]), .Z(n10504)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_273.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_274 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[4]), .Z(n10478)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_274.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_275 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[7]), .Z(n10378)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_275.init = 16'hfef0;
    FD1P3IX ifg_cnt__i3 (.D(next_ifg_cnt_3__N_717[3]), .SP(clk_c_enable_13), 
            .CD(n3482), .CK(clk_c), .Q(ifg_cnt[3])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam ifg_cnt__i3.GSR = "DISABLED";
    LUT4 i1152_3_lut_4_lut (.A(n11931), .B(n2296), .C(n15), .D(n2187), 
         .Z(n5461)) /* synthesis lut_function=(A (C (D))+!A (B (C (D))+!B (D))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1152_3_lut_4_lut.init = 16'hf100;
    LUT4 i1_3_lut_4_lut_adj_276 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[24]), .Z(n10344)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_276.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_277 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[11]), .Z(n10496)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_277.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_278 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[13]), .Z(n10278)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_278.init = 16'hfef0;
    LUT4 i905_2_lut_3_lut (.A(ifg_cnt[1]), .B(ifg_cnt[0]), .C(ifg_cnt[2]), 
         .Z(next_ifg_cnt_3__N_717[2])) /* synthesis lut_function=(!(A (B (C)+!B !(C))+!A !(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(246[37:44])
    defparam i905_2_lut_3_lut.init = 16'h7878;
    LUT4 i11_4_lut_adj_279 (.A(\udp_tdata[5] ), .B(n11862), .C(n2290[4]), 
         .D(n11942), .Z(gmii_txd[5])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i11_4_lut_adj_279.init = 16'hcac0;
    FD1P3IX pad_cnt__i5 (.D(next_pad_cnt[5]), .SP(clk_c_enable_71), .CD(rst_c), 
            .CK(clk_c), .Q(pad_cnt[5])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam pad_cnt__i5.GSR = "DISABLED";
    FD1P3IX pad_cnt__i4 (.D(next_pad_cnt[4]), .SP(clk_c_enable_71), .CD(rst_c), 
            .CK(clk_c), .Q(pad_cnt[4])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam pad_cnt__i4.GSR = "DISABLED";
    LUT4 i1_3_lut_4_lut_adj_280 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(\crc_reg[17] ), .Z(n10240)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_280.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_281 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[19]), .Z(n10236)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_281.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_282 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[21]), .Z(n10382)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_282.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_283 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[3]), .Z(n10282)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_283.init = 16'hfef0;
    FD1P3IX pad_cnt__i3 (.D(next_pad_cnt[3]), .SP(clk_c_enable_71), .CD(rst_c), 
            .CK(clk_c), .Q(pad_cnt[3])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam pad_cnt__i3.GSR = "DISABLED";
    PFUMX i7416 (.BLUT(n11750), .ALUT(n11749), .C0(n2290[3]), .Z(next_pad_cnt[5]));
    LUT4 i12_4_lut (.A(\udp_tdata[1] ), .B(n11839), .C(n2290[4]), .D(n11942), 
         .Z(gmii_txd[1])) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i12_4_lut.init = 16'hcac0;
    FD1P3IX ifg_cnt__i2 (.D(next_ifg_cnt_3__N_717[2]), .SP(clk_c_enable_13), 
            .CD(n3482), .CK(clk_c), .Q(ifg_cnt[2])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam ifg_cnt__i2.GSR = "DISABLED";
    FD1P3IX ifg_cnt__i1 (.D(next_ifg_cnt_3__N_717[1]), .SP(clk_c_enable_13), 
            .CD(n3482), .CK(clk_c), .Q(ifg_cnt[1])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam ifg_cnt__i1.GSR = "DISABLED";
    FD1P3IX pre_cnt__i1 (.D(n9543), .SP(clk_c_enable_15), .CD(rst_c), 
            .CK(clk_c), .Q(pre_cnt[1])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam pre_cnt__i1.GSR = "DISABLED";
    LUT4 i1_3_lut_4_lut_adj_284 (.A(n11945), .B(\udp_tdata[1] ), .C(crc_reg[6]), 
         .D(n11957), .Z(n10518)) /* synthesis lut_function=(!(A (C (D)+!C !(D))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_284.init = 16'h4bb4;
    LUT4 i1_3_lut_4_lut_adj_285 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[26]), .Z(n10416)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_285.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_286 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[27]), .Z(n10244)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_286.init = 16'hfef0;
    CCU2C frame_len_702_add_4_11 (.A0(\frame_len[9] ), .B0(n3360), .C0(GND_net), 
          .D0(VCC_net), .A1(\frame_len[10] ), .B1(n3360), .C1(GND_net), 
          .D1(VCC_net), .CIN(n9015), .COUT(n9016), .S0(n133[9]), .S1(n133[10]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702_add_4_11.INIT0 = 16'h2222;
    defparam frame_len_702_add_4_11.INIT1 = 16'h2222;
    defparam frame_len_702_add_4_11.INJECT1_0 = "NO";
    defparam frame_len_702_add_4_11.INJECT1_1 = "NO";
    LUT4 i1_3_lut_4_lut_adj_287 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[28]), .Z(n10390)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_287.init = 16'hfef0;
    LUT4 i1_3_lut_4_lut_adj_288 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[29]), .Z(n10386)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_288.init = 16'hfef0;
    FD1P3IX pre_cnt__i2 (.D(n9561), .SP(clk_c_enable_15), .CD(rst_c), 
            .CK(clk_c), .Q(pre_cnt[2])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam pre_cnt__i2.GSR = "DISABLED";
    LUT4 i1_3_lut_4_lut_adj_289 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[30]), .Z(n10500)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_289.init = 16'hfef0;
    LUT4 i1271_3_lut (.A(n5579), .B(gmii_txd_7__N_406[4]), .C(n2290[4]), 
         .Z(gmii_txd[4])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1271_3_lut.init = 16'hcaca;
    LUT4 i1_3_lut_4_lut_adj_290 (.A(n2290[4]), .B(n11970), .C(n2298), 
         .D(crc_reg[31]), .Z(n10588)) /* synthesis lut_function=(A (C+(D))+!A (B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_290.init = 16'hfef0;
    LUT4 i1270_4_lut (.A(n2297), .B(\udp_tdata[4] ), .C(n2296), .D(n11984), 
         .Z(n5579)) /* synthesis lut_function=(!(A (B (C (D))+!B (C))+!A (((D)+!C)+!B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1270_4_lut.init = 16'h0aca;
    LUT4 i1123_3_lut (.A(n5431), .B(gmii_txd_7__N_406[0]), .C(n2290[4]), 
         .Z(gmii_txd[0])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1123_3_lut.init = 16'hcaca;
    LUT4 i1122_4_lut (.A(n2297), .B(\udp_tdata[0] ), .C(n2296), .D(n11984), 
         .Z(n5431)) /* synthesis lut_function=(!(A (B (C (D))+!B (C))+!A (((D)+!C)+!B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1122_4_lut.init = 16'h0aca;
    CCU2C frame_len_702_add_4_9 (.A0(\frame_len[7] ), .B0(n3360), .C0(GND_net), 
          .D0(VCC_net), .A1(\frame_len[8] ), .B1(n3360), .C1(GND_net), 
          .D1(VCC_net), .CIN(n9014), .COUT(n9015), .S0(n133[7]), .S1(n133[8]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702_add_4_9.INIT0 = 16'h2222;
    defparam frame_len_702_add_4_9.INIT1 = 16'h2222;
    defparam frame_len_702_add_4_9.INJECT1_0 = "NO";
    defparam frame_len_702_add_4_9.INJECT1_1 = "NO";
    FD1S3IX state_FSM_i2 (.D(n5447), .CK(clk_c), .CD(rst_c), .Q(n2297));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam state_FSM_i2.GSR = "DISABLED";
    FD1S3IX state_FSM_i3 (.D(n5445), .CK(clk_c), .CD(rst_c), .Q(n2296));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam state_FSM_i3.GSR = "DISABLED";
    FD1S3IX state_FSM_i4 (.D(n5443), .CK(clk_c), .CD(rst_c), .Q(n2290[3]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam state_FSM_i4.GSR = "DISABLED";
    FD1S3IX state_FSM_i5 (.D(n10155), .CK(clk_c), .CD(rst_c), .Q(n2290[4]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam state_FSM_i5.GSR = "DISABLED";
    FD1S3IX state_FSM_i6 (.D(n5439), .CK(clk_c), .CD(rst_c), .Q(n2290[5]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam state_FSM_i6.GSR = "DISABLED";
    LUT4 i310_4_lut (.A(n2290[4]), .B(n11984), .C(n2296), .D(n4), .Z(ctl_reg)) /* synthesis lut_function=(!(A (B (C))+!A (B (C+!(D))+!B !(C+(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i310_4_lut.init = 16'h3f3a;
    LUT4 i1_2_lut_adj_291 (.A(n2297), .B(n2290[3]), .Z(n4)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_adj_291.init = 16'heeee;
    LUT4 i1066_2_lut_4_lut (.A(n7145), .B(n11939), .C(rst_c), .D(ifg_cnt[0]), 
         .Z(n1[0])) /* synthesis lut_function=(!(A (D)+!A (B (D)+!B (C (D)+!C !(D))))) */ ;
    defparam i1066_2_lut_4_lut.init = 16'h01fe;
    LUT4 i898_2_lut (.A(ifg_cnt[1]), .B(ifg_cnt[0]), .Z(next_ifg_cnt_3__N_717[1])) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(246[37:44])
    defparam i898_2_lut.init = 16'h6666;
    LUT4 i1_3_lut (.A(n2297), .B(pre_cnt[0]), .C(pre_cnt[1]), .Z(n9543)) /* synthesis lut_function=(!((B (C)+!B !(C))+!A)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut.init = 16'h2828;
    FD1S3IX crc_cnt__i1 (.D(next_crc_cnt[1]), .CK(clk_c), .CD(rst_c), 
            .Q(crc_cnt[1])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_cnt__i1.GSR = "DISABLED";
    FD1S3JX crc_reg_i1 (.D(next_crc_reg[1]), .CK(clk_c), .PD(rst_c), .Q(\crc_reg[1] )) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i1.GSR = "DISABLED";
    CCU2C frame_len_702_add_4_7 (.A0(\frame_len[5] ), .B0(n3360), .C0(GND_net), 
          .D0(VCC_net), .A1(\frame_len[6] ), .B1(n3360), .C1(GND_net), 
          .D1(VCC_net), .CIN(n9013), .COUT(n9014), .S0(n133[5]), .S1(n133[6]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702_add_4_7.INIT0 = 16'h2222;
    defparam frame_len_702_add_4_7.INIT1 = 16'h2222;
    defparam frame_len_702_add_4_7.INJECT1_0 = "NO";
    defparam frame_len_702_add_4_7.INJECT1_1 = "NO";
    FD1S3JX crc_reg_i2 (.D(next_crc_reg[2]), .CK(clk_c), .PD(rst_c), .Q(\crc_reg[2] )) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i2.GSR = "DISABLED";
    FD1S3JX crc_reg_i3 (.D(next_crc_reg[3]), .CK(clk_c), .PD(rst_c), .Q(crc_reg[3])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i3.GSR = "DISABLED";
    FD1S3JX crc_reg_i4 (.D(next_crc_reg[4]), .CK(clk_c), .PD(rst_c), .Q(crc_reg[4])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i4.GSR = "DISABLED";
    FD1S3JX crc_reg_i5 (.D(next_crc_reg[5]), .CK(clk_c), .PD(rst_c), .Q(crc_reg[5])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i5.GSR = "DISABLED";
    FD1S3JX crc_reg_i6 (.D(next_crc_reg[6]), .CK(clk_c), .PD(rst_c), .Q(crc_reg[6])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i6.GSR = "DISABLED";
    FD1S3JX crc_reg_i7 (.D(next_crc_reg[7]), .CK(clk_c), .PD(rst_c), .Q(crc_reg[7])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i7.GSR = "DISABLED";
    FD1S3JX crc_reg_i8 (.D(next_crc_reg[8]), .CK(clk_c), .PD(rst_c), .Q(crc_reg[8])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i8.GSR = "DISABLED";
    FD1S3JX crc_reg_i9 (.D(next_crc_reg[9]), .CK(clk_c), .PD(rst_c), .Q(\crc_reg[9] )) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i9.GSR = "DISABLED";
    FD1S3JX crc_reg_i10 (.D(next_crc_reg[10]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[10])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i10.GSR = "DISABLED";
    FD1S3JX crc_reg_i11 (.D(next_crc_reg[11]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[11])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i11.GSR = "DISABLED";
    FD1S3JX crc_reg_i12 (.D(next_crc_reg[12]), .CK(clk_c), .PD(rst_c), 
            .Q(\crc_reg[12] )) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i12.GSR = "DISABLED";
    FD1S3JX crc_reg_i13 (.D(next_crc_reg[13]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[13])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i13.GSR = "DISABLED";
    FD1S3JX crc_reg_i14 (.D(next_crc_reg[14]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[14])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i14.GSR = "DISABLED";
    FD1S3JX crc_reg_i15 (.D(next_crc_reg[15]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[15])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i15.GSR = "DISABLED";
    FD1S3JX crc_reg_i16 (.D(next_crc_reg[16]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[16])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i16.GSR = "DISABLED";
    FD1S3JX crc_reg_i17 (.D(next_crc_reg[17]), .CK(clk_c), .PD(rst_c), 
            .Q(\crc_reg[17] )) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i17.GSR = "DISABLED";
    FD1S3JX crc_reg_i18 (.D(next_crc_reg[18]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[18])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i18.GSR = "DISABLED";
    FD1S3JX crc_reg_i19 (.D(next_crc_reg[19]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[19])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i19.GSR = "DISABLED";
    FD1S3JX crc_reg_i20 (.D(next_crc_reg[20]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[20])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i20.GSR = "DISABLED";
    FD1S3JX crc_reg_i21 (.D(next_crc_reg[21]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[21])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i21.GSR = "DISABLED";
    FD1S3JX crc_reg_i22 (.D(next_crc_reg[22]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[22])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i22.GSR = "DISABLED";
    FD1S3JX crc_reg_i23 (.D(next_crc_reg[23]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[23])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i23.GSR = "DISABLED";
    FD1S3JX crc_reg_i24 (.D(next_crc_reg[24]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[24])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i24.GSR = "DISABLED";
    FD1S3JX crc_reg_i25 (.D(next_crc_reg[25]), .CK(clk_c), .PD(rst_c), 
            .Q(\crc_reg[25] )) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i25.GSR = "DISABLED";
    FD1S3JX crc_reg_i26 (.D(next_crc_reg[26]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[26])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i26.GSR = "DISABLED";
    FD1S3JX crc_reg_i27 (.D(next_crc_reg[27]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[27])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i27.GSR = "DISABLED";
    FD1S3JX crc_reg_i28 (.D(next_crc_reg[28]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[28])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i28.GSR = "DISABLED";
    FD1S3JX crc_reg_i29 (.D(next_crc_reg[29]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[29])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i29.GSR = "DISABLED";
    FD1S3JX crc_reg_i30 (.D(next_crc_reg[30]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[30])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i30.GSR = "DISABLED";
    FD1S3JX crc_reg_i31 (.D(next_crc_reg[31]), .CK(clk_c), .PD(rst_c), 
            .Q(crc_reg[31])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam crc_reg_i31.GSR = "DISABLED";
    FD1P3IX pad_cnt__i2 (.D(next_pad_cnt[2]), .SP(clk_c_enable_71), .CD(rst_c), 
            .CK(clk_c), .Q(pad_cnt[2])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam pad_cnt__i2.GSR = "DISABLED";
    CCU2C frame_len_702_add_4_5 (.A0(frame_len[3]), .B0(n3360), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[4]), .B1(n3360), .C1(GND_net), 
          .D1(VCC_net), .CIN(n9012), .COUT(n9013), .S0(n133[3]), .S1(n133[4]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702_add_4_5.INIT0 = 16'h2222;
    defparam frame_len_702_add_4_5.INIT1 = 16'h2222;
    defparam frame_len_702_add_4_5.INJECT1_0 = "NO";
    defparam frame_len_702_add_4_5.INJECT1_1 = "NO";
    FD1S3IX frame_len_702__i1 (.D(n133[1]), .CK(clk_c), .CD(rst_c), .Q(frame_len[1])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i1.GSR = "DISABLED";
    CCU2C frame_len_702_add_4_3 (.A0(frame_len[1]), .B0(n3360), .C0(GND_net), 
          .D0(VCC_net), .A1(frame_len[2]), .B1(n3360), .C1(GND_net), 
          .D1(VCC_net), .CIN(n9011), .COUT(n9012), .S0(n133[1]), .S1(n133[2]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702_add_4_3.INIT0 = 16'h2222;
    defparam frame_len_702_add_4_3.INIT1 = 16'h2222;
    defparam frame_len_702_add_4_3.INJECT1_0 = "NO";
    defparam frame_len_702_add_4_3.INJECT1_1 = "NO";
    CCU2C frame_len_702_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), 
          .D0(VCC_net), .A1(n2296), .B1(n11984), .C1(n2298), .D1(frame_len_c[0]), 
          .COUT(n9011), .S1(n133[0]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702_add_4_1.INIT0 = 16'h0000;
    defparam frame_len_702_add_4_1.INIT1 = 16'h8d22;
    defparam frame_len_702_add_4_1.INJECT1_0 = "NO";
    defparam frame_len_702_add_4_1.INJECT1_1 = "NO";
    FD1P3IX pad_cnt__i1 (.D(next_pad_cnt[1]), .SP(clk_c_enable_71), .CD(rst_c), 
            .CK(clk_c), .Q(pad_cnt[1])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam pad_cnt__i1.GSR = "DISABLED";
    FD1P3IX pad_cnt__i0 (.D(next_pad_cnt[0]), .SP(clk_c_enable_74), .CD(rst_c), 
            .CK(clk_c), .Q(pad_cnt[0])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=42, LSE_LLINE=440, LSE_RLINE=440 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(76[13] 98[20])
    defparam pad_cnt__i0.GSR = "DISABLED";
    LUT4 i1_4_lut_adj_292 (.A(n5440), .B(n399), .C(n10185), .D(n11929), 
         .Z(n10155)) /* synthesis lut_function=(A+(B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_292.init = 16'hfefa;
    LUT4 i1_4_lut_adj_293 (.A(pad_cnt[3]), .B(n10864), .C(n10838), .D(pad_cnt[4]), 
         .Z(n10185)) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;
    defparam i1_4_lut_adj_293.init = 16'h0004;
    LUT4 i1_2_lut_rep_237 (.A(pre_cnt[1]), .B(pre_cnt[0]), .Z(n11983)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_2_lut_rep_237.init = 16'h8888;
    LUT4 i1_3_lut_4_lut_adj_294 (.A(pre_cnt[1]), .B(pre_cnt[0]), .C(pre_cnt[2]), 
         .D(n2297), .Z(n9561)) /* synthesis lut_function=(!(A (B (C+!(D))+!B !(C (D)))+!A !(C (D)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_294.init = 16'h7800;
    LUT4 i1_3_lut_adj_295 (.A(pad_cnt[5]), .B(pad_cnt[0]), .C(n2290[3]), 
         .Z(n10864)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;
    defparam i1_3_lut_adj_295.init = 16'h1010;
    LUT4 i1_2_lut_rep_208_3_lut (.A(pre_cnt[1]), .B(pre_cnt[0]), .C(pre_cnt[2]), 
         .Z(n11954)) /* synthesis lut_function=(A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_2_lut_rep_208_3_lut.init = 16'h8080;
    FD1S3IX frame_len_702__i2 (.D(n133[2]), .CK(clk_c), .CD(rst_c), .Q(frame_len[2])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i2.GSR = "DISABLED";
    FD1S3IX frame_len_702__i3 (.D(n133[3]), .CK(clk_c), .CD(rst_c), .Q(frame_len[3])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i3.GSR = "DISABLED";
    FD1S3IX frame_len_702__i4 (.D(n133[4]), .CK(clk_c), .CD(rst_c), .Q(frame_len[4])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i4.GSR = "DISABLED";
    FD1S3IX frame_len_702__i5 (.D(n133[5]), .CK(clk_c), .CD(rst_c), .Q(\frame_len[5] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i5.GSR = "DISABLED";
    FD1S3IX frame_len_702__i6 (.D(n133[6]), .CK(clk_c), .CD(rst_c), .Q(\frame_len[6] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i6.GSR = "DISABLED";
    FD1S3IX frame_len_702__i7 (.D(n133[7]), .CK(clk_c), .CD(rst_c), .Q(\frame_len[7] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i7.GSR = "DISABLED";
    FD1S3IX frame_len_702__i8 (.D(n133[8]), .CK(clk_c), .CD(rst_c), .Q(\frame_len[8] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i8.GSR = "DISABLED";
    FD1S3IX frame_len_702__i9 (.D(n133[9]), .CK(clk_c), .CD(rst_c), .Q(\frame_len[9] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i9.GSR = "DISABLED";
    FD1S3IX frame_len_702__i10 (.D(n133[10]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[10] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i10.GSR = "DISABLED";
    FD1S3IX frame_len_702__i11 (.D(n133[11]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[11] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i11.GSR = "DISABLED";
    FD1S3IX frame_len_702__i12 (.D(n133[12]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[12] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i12.GSR = "DISABLED";
    FD1S3IX frame_len_702__i13 (.D(n133[13]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[13] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i13.GSR = "DISABLED";
    FD1S3IX frame_len_702__i14 (.D(n133[14]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[14] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i14.GSR = "DISABLED";
    FD1S3IX frame_len_702__i15 (.D(n133[15]), .CK(clk_c), .CD(rst_c), 
            .Q(frame_len[15])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i15.GSR = "DISABLED";
    FD1S3IX frame_len_702__i16 (.D(n133[16]), .CK(clk_c), .CD(rst_c), 
            .Q(frame_len[16])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i16.GSR = "DISABLED";
    FD1S3IX frame_len_702__i17 (.D(n133[17]), .CK(clk_c), .CD(rst_c), 
            .Q(frame_len[17])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i17.GSR = "DISABLED";
    FD1S3IX frame_len_702__i18 (.D(n133[18]), .CK(clk_c), .CD(rst_c), 
            .Q(frame_len[18])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i18.GSR = "DISABLED";
    FD1S3IX frame_len_702__i19 (.D(n133[19]), .CK(clk_c), .CD(rst_c), 
            .Q(frame_len[19])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i19.GSR = "DISABLED";
    FD1S3IX frame_len_702__i20 (.D(n133[20]), .CK(clk_c), .CD(rst_c), 
            .Q(frame_len[20])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i20.GSR = "DISABLED";
    FD1S3IX frame_len_702__i21 (.D(n133[21]), .CK(clk_c), .CD(rst_c), 
            .Q(frame_len[21])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i21.GSR = "DISABLED";
    FD1S3IX frame_len_702__i22 (.D(n133[22]), .CK(clk_c), .CD(rst_c), 
            .Q(frame_len[22])) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i22.GSR = "DISABLED";
    FD1S3IX frame_len_702__i23 (.D(n133[23]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[23] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i23.GSR = "DISABLED";
    FD1S3IX frame_len_702__i24 (.D(n133[24]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[24] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i24.GSR = "DISABLED";
    FD1S3IX frame_len_702__i25 (.D(n133[25]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[25] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i25.GSR = "DISABLED";
    FD1S3IX frame_len_702__i26 (.D(n133[26]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[26] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i26.GSR = "DISABLED";
    FD1S3IX frame_len_702__i27 (.D(n133[27]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[27] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i27.GSR = "DISABLED";
    FD1S3IX frame_len_702__i28 (.D(n133[28]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[28] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i28.GSR = "DISABLED";
    FD1S3IX frame_len_702__i29 (.D(n133[29]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[29] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i29.GSR = "DISABLED";
    FD1S3IX frame_len_702__i30 (.D(n133[30]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[30] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i30.GSR = "DISABLED";
    FD1S3IX frame_len_702__i31 (.D(n133[31]), .CK(clk_c), .CD(rst_c), 
            .Q(\frame_len[31] )) /* synthesis syn_use_carry_chain=1, REG_OUTPUT_CLK=CLK3, REG_OUTPUT_CE=CE3, REG_OUTPUT_RST=RST3 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702__i31.GSR = "DISABLED";
    LUT4 i2812_rep_185_3_lut_4_lut (.A(pre_cnt[1]), .B(pre_cnt[0]), .C(n2297), 
         .D(pre_cnt[2]), .Z(n11931)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i2812_rep_185_3_lut_4_lut.init = 16'h8000;
    CCU2C frame_len_702_add_4_33 (.A0(\frame_len[31] ), .B0(n3360), .C0(GND_net), 
          .D0(VCC_net), .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), 
          .CIN(n9026), .S0(n133[31]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702_add_4_33.INIT0 = 16'h2222;
    defparam frame_len_702_add_4_33.INIT1 = 16'h0000;
    defparam frame_len_702_add_4_33.INJECT1_0 = "NO";
    defparam frame_len_702_add_4_33.INJECT1_1 = "NO";
    CCU2C frame_len_702_add_4_31 (.A0(\frame_len[29] ), .B0(n3360), .C0(GND_net), 
          .D0(VCC_net), .A1(\frame_len[30] ), .B1(n3360), .C1(GND_net), 
          .D1(VCC_net), .CIN(n9025), .COUT(n9026), .S0(n133[29]), .S1(n133[30]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702_add_4_31.INIT0 = 16'h2222;
    defparam frame_len_702_add_4_31.INIT1 = 16'h2222;
    defparam frame_len_702_add_4_31.INJECT1_0 = "NO";
    defparam frame_len_702_add_4_31.INJECT1_1 = "NO";
    LUT4 i2795_2_lut_rep_240 (.A(crc_cnt[0]), .B(crc_cnt[1]), .Z(n11986)) /* synthesis lut_function=(A (B)) */ ;
    defparam i2795_2_lut_rep_240.init = 16'h8888;
    LUT4 i1130_2_lut_3_lut_4_lut (.A(crc_cnt[0]), .B(crc_cnt[1]), .C(n7145), 
         .D(n2290[4]), .Z(n5439)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (C)) */ ;
    defparam i1130_2_lut_3_lut_4_lut.init = 16'hf8f0;
    LUT4 i2569_3_lut_rep_174 (.A(n5703), .B(\reg_fifo_data[3] ), .C(n2185), 
         .Z(n11920)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i2569_3_lut_rep_174.init = 16'hcaca;
    LUT4 i1134_2_lut_3_lut_4_lut (.A(n11942), .B(n11968), .C(n11933), 
         .D(n399), .Z(n5443)) /* synthesis lut_function=(A (B (C+!(D))+!B (C))+!A (C)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(173[17] 195[24])
    defparam i1134_2_lut_3_lut_4_lut.init = 16'hf0f8;
    CCU2C frame_len_702_add_4_29 (.A0(\frame_len[27] ), .B0(n3360), .C0(GND_net), 
          .D0(VCC_net), .A1(\frame_len[28] ), .B1(n3360), .C1(GND_net), 
          .D1(VCC_net), .CIN(n9024), .COUT(n9025), .S0(n133[27]), .S1(n133[28]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702_add_4_29.INIT0 = 16'h2222;
    defparam frame_len_702_add_4_29.INIT1 = 16'h2222;
    defparam frame_len_702_add_4_29.INJECT1_0 = "NO";
    defparam frame_len_702_add_4_29.INJECT1_1 = "NO";
    LUT4 i1_4_lut_adj_296 (.A(crc_next[19]), .B(n2_adj_901), .C(n10236), 
         .D(n2290[3]), .Z(next_crc_reg[19])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_296.init = 16'hfefc;
    LUT4 select_534_Select_19_i2_4_lut (.A(crc_reg[19]), .B(n2296), .C(crc_next[19]), 
         .D(n11984), .Z(n2_adj_901)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_19_i2_4_lut.init = 16'h88c0;
    LUT4 i1131_2_lut_3_lut (.A(crc_cnt[0]), .B(crc_cnt[1]), .C(n2290[4]), 
         .Z(n5440)) /* synthesis lut_function=(!(A (B+!(C))+!A !(C))) */ ;
    defparam i1131_2_lut_3_lut.init = 16'h7070;
    LUT4 i900_2_lut_rep_239 (.A(ifg_cnt[1]), .B(ifg_cnt[0]), .Z(n11985)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(246[37:44])
    defparam i900_2_lut_rep_239.init = 16'h8888;
    LUT4 i675_2_lut_rep_193_3_lut_4_lut (.A(crc_cnt[0]), .B(crc_cnt[1]), 
         .C(n2290[5]), .D(n2290[4]), .Z(n11939)) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;
    defparam i675_2_lut_rep_193_3_lut_4_lut.init = 16'h0800;
    LUT4 i425_2_lut_rep_209_3_lut (.A(crc_cnt[0]), .B(crc_cnt[1]), .C(n2290[4]), 
         .Z(n11955)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i425_2_lut_rep_209_3_lut.init = 16'h8080;
    LUT4 i1_4_lut_adj_297 (.A(crc_next[20]), .B(n2_adj_902), .C(n10212), 
         .D(n2290[3]), .Z(next_crc_reg[20])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_297.init = 16'hfefc;
    LUT4 i2840_4_lut (.A(n11985), .B(n2290[5]), .C(ifg_cnt[3]), .D(ifg_cnt[2]), 
         .Z(n7145)) /* synthesis lut_function=(A (B ((D)+!C))+!A (B)) */ ;
    defparam i2840_4_lut.init = 16'hcc4c;
    LUT4 select_534_Select_20_i2_4_lut (.A(crc_reg[20]), .B(n2296), .C(crc_next[20]), 
         .D(n11984), .Z(n2_adj_902)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_20_i2_4_lut.init = 16'h88c0;
    LUT4 i1_2_lut_adj_298 (.A(pre_cnt[0]), .B(n2297), .Z(n9509)) /* synthesis lut_function=(!(A+!(B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_2_lut_adj_298.init = 16'h4444;
    LUT4 n8_bdd_4_lut (.A(n11932), .B(pad_cnt[4]), .C(n11757), .D(n2290[3]), 
         .Z(next_pad_cnt[4])) /* synthesis lut_function=(A (B (C+(D))+!B !((D)+!C))+!A !(B ((D)+!C)+!B !(C+(D)))) */ ;
    defparam n8_bdd_4_lut.init = 16'h99f0;
    LUT4 i1_4_lut_adj_299 (.A(crc_next[21]), .B(n2_adj_903), .C(n10382), 
         .D(n2290[3]), .Z(next_crc_reg[21])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_299.init = 16'hfefc;
    LUT4 i1_4_lut_adj_300 (.A(n2290[3]), .B(n2_adj_904), .C(n10456), .D(n6929), 
         .Z(next_crc_reg[1])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_300.init = 16'hfefc;
    LUT4 select_534_Select_1_i2_4_lut (.A(\crc_reg[1] ), .B(n2296), .C(n6929), 
         .D(n11984), .Z(n2_adj_904)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_1_i2_4_lut.init = 16'h88c0;
    LUT4 i912_3_lut_4_lut (.A(ifg_cnt[1]), .B(ifg_cnt[0]), .C(ifg_cnt[2]), 
         .D(ifg_cnt[3]), .Z(next_ifg_cnt_3__N_717[3])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(D))+!A !(D))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(246[37:44])
    defparam i912_3_lut_4_lut.init = 16'h7f80;
    LUT4 i1_4_lut_adj_301 (.A(n3), .B(\next_crc_reg_31__N_594[2] ), .C(n10558), 
         .D(n2296), .Z(next_crc_reg[2])) /* synthesis lut_function=(A+(B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_301.init = 16'hfefa;
    LUT4 select_534_Select_21_i2_4_lut (.A(crc_reg[21]), .B(n2296), .C(crc_next[21]), 
         .D(n11984), .Z(n2_adj_903)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_21_i2_4_lut.init = 16'h88c0;
    LUT4 select_534_Select_2_i3_2_lut (.A(\crc_next[2] ), .B(n2290[3]), 
         .Z(n3)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_2_i3_2_lut.init = 16'h8888;
    LUT4 i1_2_lut_3_lut_4_lut_adj_302 (.A(n11954), .B(n2297), .C(n2186), 
         .D(n2296), .Z(n9742)) /* synthesis lut_function=(A (B (C)+!B (C (D)))+!A (C (D))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_2_lut_3_lut_4_lut_adj_302.init = 16'hf080;
    LUT4 pad_cnt_2__bdd_4_lut_then_3_lut (.A(pad_cnt[2]), .B(pad_cnt[0]), 
         .C(pad_cnt[1]), .Z(n12003)) /* synthesis lut_function=(A (B+(C))+!A !(B+(C))) */ ;
    defparam pad_cnt_2__bdd_4_lut_then_3_lut.init = 16'ha9a9;
    LUT4 pad_cnt_2__bdd_4_lut_else_3_lut (.A(frame_len[1]), .B(frame_len[2]), 
         .Z(n12002)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;
    defparam pad_cnt_2__bdd_4_lut_else_3_lut.init = 16'h6666;
    LUT4 i1136_3_lut_4_lut (.A(n11954), .B(n2297), .C(n2268), .D(n2296), 
         .Z(n5445)) /* synthesis lut_function=(A (B+(C (D)))+!A (C (D))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1136_3_lut_4_lut.init = 16'hf888;
    LUT4 i1_4_lut_adj_303 (.A(crc_next[3]), .B(n2_adj_905), .C(n10282), 
         .D(n2290[3]), .Z(next_crc_reg[3])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_303.init = 16'hfefc;
    LUT4 i1_4_lut_adj_304 (.A(crc_next[22]), .B(n2_adj_906), .C(n10274), 
         .D(n2290[3]), .Z(next_crc_reg[22])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_304.init = 16'hfefc;
    LUT4 select_534_Select_22_i2_4_lut (.A(crc_reg[22]), .B(n2296), .C(crc_next[22]), 
         .D(n11984), .Z(n2_adj_906)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_22_i2_4_lut.init = 16'h88c0;
    LUT4 select_534_Select_3_i2_4_lut (.A(crc_reg[3]), .B(n2296), .C(crc_next[3]), 
         .D(n11984), .Z(n2_adj_905)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_3_i2_4_lut.init = 16'h88c0;
    LUT4 n8_bdd_3_lut_7415_4_lut (.A(pad_cnt[3]), .B(n11944), .C(pad_cnt[4]), 
         .D(pad_cnt[5]), .Z(n11749)) /* synthesis lut_function=(A (D)+!A (B (D)+!B (C (D)+!C !(D)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(211[37:44])
    defparam n8_bdd_3_lut_7415_4_lut.init = 16'hfe01;
    LUT4 i1_4_lut_adj_305 (.A(crc_next[4]), .B(n2_adj_907), .C(n10478), 
         .D(n2290[3]), .Z(next_crc_reg[4])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_305.init = 16'hfefc;
    LUT4 select_534_Select_4_i2_4_lut (.A(crc_reg[4]), .B(n2296), .C(crc_next[4]), 
         .D(n11984), .Z(n2_adj_907)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_4_i2_4_lut.init = 16'h88c0;
    LUT4 i2811_2_lut_rep_177_3_lut_4_lut (.A(pre_cnt[2]), .B(n11983), .C(n2296), 
         .D(n2297), .Z(n11923)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (C)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i2811_2_lut_rep_177_3_lut_4_lut.init = 16'hf8f0;
    LUT4 i1133_2_lut_rep_187 (.A(n2290[3]), .B(n11_adj_895), .Z(n11933)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1133_2_lut_rep_187.init = 16'h8888;
    LUT4 i1_3_lut_4_lut_adj_306 (.A(n2290[3]), .B(n11_adj_895), .C(n2298), 
         .D(n11970), .Z(n10125)) /* synthesis lut_function=(A (B+(C+(D)))+!A (C+(D))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_306.init = 16'hfff8;
    LUT4 i1_4_lut_adj_307 (.A(crc_next[23]), .B(n2_adj_908), .C(n10216), 
         .D(n2290[3]), .Z(next_crc_reg[23])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_307.init = 16'hfefc;
    CCU2C frame_len_702_add_4_27 (.A0(\frame_len[25] ), .B0(n3360), .C0(GND_net), 
          .D0(VCC_net), .A1(\frame_len[26] ), .B1(n3360), .C1(GND_net), 
          .D1(VCC_net), .CIN(n9023), .COUT(n9024), .S0(n133[25]), .S1(n133[26]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702_add_4_27.INIT0 = 16'h2222;
    defparam frame_len_702_add_4_27.INIT1 = 16'h2222;
    defparam frame_len_702_add_4_27.INJECT1_0 = "NO";
    defparam frame_len_702_add_4_27.INJECT1_1 = "NO";
    CCU2C frame_len_702_add_4_25 (.A0(\frame_len[23] ), .B0(n3360), .C0(GND_net), 
          .D0(VCC_net), .A1(\frame_len[24] ), .B1(n3360), .C1(GND_net), 
          .D1(VCC_net), .CIN(n9022), .COUT(n9023), .S0(n133[23]), .S1(n133[24]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam frame_len_702_add_4_25.INIT0 = 16'h2222;
    defparam frame_len_702_add_4_25.INIT1 = 16'h2222;
    defparam frame_len_702_add_4_25.INJECT1_0 = "NO";
    defparam frame_len_702_add_4_25.INJECT1_1 = "NO";
    LUT4 i1138_3_lut_4_lut (.A(pre_cnt[2]), .B(n11983), .C(n2297), .D(n2315), 
         .Z(n5447)) /* synthesis lut_function=(A (B (D)+!B (C+(D)))+!A (C+(D))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1138_3_lut_4_lut.init = 16'hff70;
    LUT4 select_534_Select_23_i2_4_lut (.A(crc_reg[23]), .B(n2296), .C(crc_next[23]), 
         .D(n11984), .Z(n2_adj_908)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_23_i2_4_lut.init = 16'h88c0;
    LUT4 i1_2_lut_4_lut (.A(\udp_tdata[5] ), .B(crc_reg[5]), .C(n11945), 
         .D(crc_next[30]), .Z(crc_next[29])) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A (B (D)+!B !(D)))) */ ;
    defparam i1_2_lut_4_lut.init = 16'h39c6;
    LUT4 i1_4_lut_adj_308 (.A(crc_next[5]), .B(n2_adj_909), .C(n10432), 
         .D(n2290[3]), .Z(next_crc_reg[5])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_308.init = 16'hfefc;
    LUT4 select_534_Select_5_i2_4_lut (.A(crc_reg[5]), .B(n2296), .C(crc_next[5]), 
         .D(n11984), .Z(n2_adj_909)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_5_i2_4_lut.init = 16'h88c0;
    LUT4 i639_2_lut (.A(n2298), .B(n2296), .Z(n3360)) /* synthesis lut_function=(!((B)+!A)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i639_2_lut.init = 16'h2222;
    LUT4 i1_3_lut_4_lut_adj_309 (.A(\udp_tdata[0] ), .B(n11945), .C(crc_reg[0]), 
         .D(crc_reg[4]), .Z(n10288)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A (C (D)+!C !(D)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_3_lut_4_lut_adj_309.init = 16'h2dd2;
    LUT4 i1_4_lut_adj_310 (.A(crc_next[6]), .B(n2_adj_910), .C(n10396), 
         .D(n2290[3]), .Z(next_crc_reg[6])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_310.init = 16'hfefc;
    LUT4 select_534_Select_6_i2_4_lut (.A(crc_reg[6]), .B(n2296), .C(crc_next[6]), 
         .D(n11984), .Z(n2_adj_910)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_6_i2_4_lut.init = 16'h88c0;
    LUT4 i1_4_lut_adj_311 (.A(crc_next[24]), .B(n2_adj_911), .C(n10344), 
         .D(n2290[3]), .Z(next_crc_reg[24])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_311.init = 16'hfefc;
    LUT4 i2824_2_lut_3_lut_4_lut (.A(n11986), .B(n2290[4]), .C(rst_c), 
         .D(n2290[5]), .Z(n3482)) /* synthesis lut_function=(A (B (C+!(D))+!B (C))+!A (C)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i2824_2_lut_3_lut_4_lut.init = 16'hf0f8;
    LUT4 select_534_Select_24_i2_4_lut (.A(crc_reg[24]), .B(n2296), .C(crc_next[24]), 
         .D(n11984), .Z(n2_adj_911)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_24_i2_4_lut.init = 16'h88c0;
    LUT4 i1_4_lut_adj_312 (.A(crc_next[7]), .B(n2_adj_912), .C(n10378), 
         .D(n2290[3]), .Z(next_crc_reg[7])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_312.init = 16'hfefc;
    LUT4 select_534_Select_7_i2_4_lut (.A(crc_reg[7]), .B(n2296), .C(crc_next[7]), 
         .D(n11984), .Z(n2_adj_912)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_7_i2_4_lut.init = 16'h88c0;
    LUT4 crc_reg_22__bdd_3_lut_7321 (.A(crc_reg[22]), .B(crc_cnt[0]), .C(crc_reg[30]), 
         .Z(n11587)) /* synthesis lut_function=(!(A ((C)+!B)+!A (B (C)))) */ ;
    defparam crc_reg_22__bdd_3_lut_7321.init = 16'h1d1d;
    LUT4 i1_4_lut_adj_313 (.A(crc_next[8]), .B(n2_adj_913), .C(n10504), 
         .D(n2290[3]), .Z(next_crc_reg[8])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_313.init = 16'hfefc;
    LUT4 select_534_Select_8_i2_4_lut (.A(crc_reg[8]), .B(n2296), .C(crc_next[8]), 
         .D(n11984), .Z(n2_adj_913)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_8_i2_4_lut.init = 16'h88c0;
    LUT4 i1_4_lut_adj_314 (.A(n3_adj_914), .B(\next_crc_reg_31__N_594[9] ), 
         .C(n10584), .D(n2296), .Z(next_crc_reg[9])) /* synthesis lut_function=(A+(B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_314.init = 16'hfefa;
    LUT4 crc_reg_23__bdd_3_lut_7461 (.A(crc_reg[23]), .B(crc_cnt[0]), .C(crc_reg[31]), 
         .Z(n11826)) /* synthesis lut_function=(!(A ((C)+!B)+!A (B (C)))) */ ;
    defparam crc_reg_23__bdd_3_lut_7461.init = 16'h1d1d;
    PFUMX i7322 (.BLUT(n11588), .ALUT(n11587), .C0(crc_cnt[1]), .Z(gmii_txd_7__N_406[6]));
    LUT4 i1_4_lut_adj_315 (.A(crc_next[10]), .B(n2_adj_915), .C(n10574), 
         .D(n2290[3]), .Z(next_crc_reg[10])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_315.init = 16'hfefc;
    LUT4 select_534_Select_10_i2_4_lut (.A(crc_reg[10]), .B(n2296), .C(crc_next[10]), 
         .D(n11984), .Z(n2_adj_915)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_10_i2_4_lut.init = 16'h88c0;
    LUT4 crc_reg_23__bdd_3_lut (.A(crc_reg[7]), .B(crc_reg[15]), .C(crc_cnt[0]), 
         .Z(n11827)) /* synthesis lut_function=(!(A (B+!(C))+!A (B (C)))) */ ;
    defparam crc_reg_23__bdd_3_lut.init = 16'h3535;
    LUT4 crc_reg_22__bdd_3_lut (.A(crc_reg[6]), .B(crc_reg[14]), .C(crc_cnt[0]), 
         .Z(n11588)) /* synthesis lut_function=(!(A (B+!(C))+!A (B (C)))) */ ;
    defparam crc_reg_22__bdd_3_lut.init = 16'h3535;
    LUT4 i1_4_lut_adj_316 (.A(crc_next[11]), .B(n2_adj_916), .C(n10496), 
         .D(n2290[3]), .Z(next_crc_reg[11])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_316.init = 16'hfefc;
    LUT4 select_534_Select_11_i2_4_lut (.A(crc_reg[11]), .B(n2296), .C(crc_next[11]), 
         .D(n11984), .Z(n2_adj_916)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_11_i2_4_lut.init = 16'h88c0;
    LUT4 i1_4_lut_adj_317 (.A(n3_adj_917), .B(\next_crc_reg_31__N_594[12] ), 
         .C(n10548), .D(n2296), .Z(next_crc_reg[12])) /* synthesis lut_function=(A+(B (C+(D))+!B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_317.init = 16'hfefa;
    LUT4 select_534_Select_12_i3_2_lut (.A(\crc_next[12] ), .B(n2290[3]), 
         .Z(n3_adj_917)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_12_i3_2_lut.init = 16'h8888;
    LUT4 i1_4_lut_adj_318 (.A(n2290[3]), .B(n2_adj_918), .C(n10340), .D(n6922), 
         .Z(next_crc_reg[25])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_318.init = 16'hfefc;
    LUT4 i1_4_lut_adj_319 (.A(crc_next[13]), .B(n2_adj_919), .C(n10278), 
         .D(n2290[3]), .Z(next_crc_reg[13])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_319.init = 16'hfefc;
    LUT4 select_534_Select_13_i2_4_lut (.A(crc_reg[13]), .B(n2296), .C(crc_next[13]), 
         .D(n11984), .Z(n2_adj_919)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_13_i2_4_lut.init = 16'h88c0;
    LUT4 i1_4_lut_adj_320 (.A(n2296), .B(\crc_reg[25] ), .C(n6922), .D(n11984), 
         .Z(n2_adj_918)) /* synthesis lut_function=(A (B (C+(D))+!B !((D)+!C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_320.init = 16'h88a0;
    LUT4 crc_reg_16__bdd_3_lut_7472 (.A(crc_reg[16]), .B(crc_cnt[0]), .C(crc_reg[24]), 
         .Z(n11840)) /* synthesis lut_function=(!(A ((C)+!B)+!A (B (C)))) */ ;
    defparam crc_reg_16__bdd_3_lut_7472.init = 16'h1d1d;
    LUT4 crc_reg_16__bdd_3_lut (.A(crc_reg[0]), .B(crc_reg[8]), .C(crc_cnt[0]), 
         .Z(n11841)) /* synthesis lut_function=(!(A (B+!(C))+!A (B (C)))) */ ;
    defparam crc_reg_16__bdd_3_lut.init = 16'h3535;
    LUT4 i1140_4_lut (.A(n2298), .B(n10872), .C(n11984), .D(ifg_cnt[2]), 
         .Z(n5449)) /* synthesis lut_function=(A (B (C+!(D))+!B (C))+!A !((D)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1140_4_lut.init = 16'ha0ec;
    LUT4 i1_2_lut_rep_168_4_lut (.A(n5703), .B(\reg_fifo_data[3] ), .C(n2185), 
         .D(n11945), .Z(n11914)) /* synthesis lut_function=(!(A (B (D)+!B (C+(D)))+!A (((D)+!C)+!B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1_2_lut_rep_168_4_lut.init = 16'h00ca;
    LUT4 i1_4_lut_adj_321 (.A(ifg_cnt[0]), .B(ifg_cnt[1]), .C(n2290[5]), 
         .D(ifg_cnt[3]), .Z(n10872)) /* synthesis lut_function=(A (B (C (D)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_321.init = 16'h8000;
    LUT4 i1_4_lut_adj_322 (.A(crc_next[26]), .B(n2_adj_920), .C(n10416), 
         .D(n2290[3]), .Z(next_crc_reg[26])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_322.init = 16'hfefc;
    LUT4 i1_4_lut_adj_323 (.A(crc_next[14]), .B(n2_adj_921), .C(n10534), 
         .D(n2290[3]), .Z(next_crc_reg[14])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_323.init = 16'hfefc;
    LUT4 select_534_Select_14_i2_4_lut (.A(crc_reg[14]), .B(n2296), .C(crc_next[14]), 
         .D(n11984), .Z(n2_adj_921)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_14_i2_4_lut.init = 16'h88c0;
    LUT4 crc_reg_18__bdd_3_lut (.A(\crc_reg[2] ), .B(crc_reg[10]), .C(crc_cnt[0]), 
         .Z(n11848)) /* synthesis lut_function=(!(A (B+!(C))+!A (B (C)))) */ ;
    defparam crc_reg_18__bdd_3_lut.init = 16'h3535;
    LUT4 crc_reg_18__bdd_3_lut_7477 (.A(crc_reg[18]), .B(crc_cnt[0]), .C(crc_reg[26]), 
         .Z(n11847)) /* synthesis lut_function=(!(A ((C)+!B)+!A (B (C)))) */ ;
    defparam crc_reg_18__bdd_3_lut_7477.init = 16'h1d1d;
    LUT4 crc_reg_19__bdd_3_lut_7480 (.A(crc_reg[19]), .B(crc_cnt[0]), .C(crc_reg[27]), 
         .Z(n11850)) /* synthesis lut_function=(!(A ((C)+!B)+!A (B (C)))) */ ;
    defparam crc_reg_19__bdd_3_lut_7480.init = 16'h1d1d;
    LUT4 crc_reg_19__bdd_3_lut_7668 (.A(crc_reg[3]), .B(crc_reg[11]), .C(crc_cnt[0]), 
         .Z(n11851)) /* synthesis lut_function=(!(A (B+!(C))+!A (B (C)))) */ ;
    defparam crc_reg_19__bdd_3_lut_7668.init = 16'h3535;
    LUT4 i1_4_lut_adj_324 (.A(crc_next[15]), .B(n2_adj_922), .C(n10490), 
         .D(n2290[3]), .Z(next_crc_reg[15])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_324.init = 16'hfefc;
    LUT4 select_534_Select_15_i2_4_lut (.A(crc_reg[15]), .B(n2296), .C(crc_next[15]), 
         .D(n11984), .Z(n2_adj_922)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_15_i2_4_lut.init = 16'h88c0;
    LUT4 crc_reg_20__bdd_3_lut_7483 (.A(crc_reg[20]), .B(crc_cnt[0]), .C(crc_reg[28]), 
         .Z(n11853)) /* synthesis lut_function=(!(A ((C)+!B)+!A (B (C)))) */ ;
    defparam crc_reg_20__bdd_3_lut_7483.init = 16'h1d1d;
    LUT4 i1_4_lut_adj_325 (.A(n2290[3]), .B(n2_adj_923), .C(n10240), .D(n6926), 
         .Z(next_crc_reg[17])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_325.init = 16'hfefc;
    LUT4 crc_reg_20__bdd_3_lut (.A(crc_reg[4]), .B(\crc_reg[12] ), .C(crc_cnt[0]), 
         .Z(n11854)) /* synthesis lut_function=(!(A (B+!(C))+!A (B (C)))) */ ;
    defparam crc_reg_20__bdd_3_lut.init = 16'h3535;
    LUT4 select_534_Select_26_i2_4_lut (.A(crc_reg[26]), .B(n2296), .C(crc_next[26]), 
         .D(n11984), .Z(n2_adj_920)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_26_i2_4_lut.init = 16'h88c0;
    LUT4 select_534_Select_17_i2_4_lut (.A(\crc_reg[17] ), .B(n2296), .C(n6926), 
         .D(n11984), .Z(n2_adj_923)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_17_i2_4_lut.init = 16'h88c0;
    LUT4 i1_4_lut_adj_326 (.A(crc_next[18]), .B(n2_adj_924), .C(n10374), 
         .D(n2290[3]), .Z(next_crc_reg[18])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_326.init = 16'hfefc;
    LUT4 select_534_Select_18_i2_4_lut (.A(crc_reg[18]), .B(n2296), .C(crc_next[18]), 
         .D(n11984), .Z(n2_adj_924)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_18_i2_4_lut.init = 16'h88c0;
    LUT4 crc_reg_13__bdd_3_lut_7646 (.A(crc_reg[5]), .B(crc_reg[21]), .C(crc_cnt[1]), 
         .Z(n11861)) /* synthesis lut_function=(!(A (B+!(C))+!A (B (C)))) */ ;
    defparam crc_reg_13__bdd_3_lut_7646.init = 16'h3535;
    PFUMX i7525 (.BLUT(n12002), .ALUT(n12003), .C0(n2290[3]), .Z(next_pad_cnt[2]));
    LUT4 i1_4_lut_adj_327 (.A(crc_next[16]), .B(n2_adj_925), .C(n10446), 
         .D(n2290[3]), .Z(next_crc_reg[16])) /* synthesis lut_function=(A (B+(C+(D)))+!A (B+(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam i1_4_lut_adj_327.init = 16'hfefc;
    LUT4 select_534_Select_16_i2_4_lut (.A(crc_reg[16]), .B(n2296), .C(crc_next[16]), 
         .D(n11984), .Z(n2_adj_925)) /* synthesis lut_function=(A (B (C+(D)))+!A !(((D)+!C)+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(129[13] 249[22])
    defparam select_534_Select_16_i2_4_lut.init = 16'h88c0;
    PFUMX i7489 (.BLUT(n11861), .ALUT(n11860), .C0(crc_cnt[0]), .Z(n11862));
    LUT4 crc_reg_13__bdd_3_lut_7488 (.A(crc_reg[13]), .B(crc_cnt[1]), .C(crc_reg[29]), 
         .Z(n11860)) /* synthesis lut_function=(!(A ((C)+!B)+!A (B (C)))) */ ;
    defparam crc_reg_13__bdd_3_lut_7488.init = 16'h1d1d;
    crc32_8 crc_inst (.n6156(n6156), .n11910(n11910), .n11909(n11909), 
            .\crc_next[31] (crc_next[31]), .\crc_next[27] (crc_next[27]), 
            .n11918(n11918), .n11917(n11917), .\crc_reg[1] (\crc_reg[1] ), 
            .\crc_reg[7] (crc_reg[7]), .n11957(n11957), .\crc_reg[2] (\crc_reg[2] ), 
            .\crc_reg[6] (crc_reg[6]), .\crc_reg[4] (crc_reg[4]), .\crc_reg[17] (\crc_reg[17] ), 
            .n2295(n2290[3]), .n3(n3_adj_914), .n11908(n11908), .n10288(n10288), 
            .n11913(n11913), .\crc_next[28] (crc_next[28]), .n11912(n11912), 
            .n6195(n6195), .n11915(n11915), .n10518(n10518), .\crc_next[30] (crc_next[30]), 
            .\crc_next[19] (crc_next[19]), .n11916(n11916), .\crc_reg[14] (crc_reg[14]), 
            .\crc_next[6] (crc_next[6]), .n11914(n11914), .\crc_next[20] (crc_next[20]), 
            .\crc_reg[3] (crc_reg[3]), .\crc_reg[28] (crc_reg[28]), .n6929(n6929), 
            .\crc_reg[0] (crc_reg[0]), .\crc_reg[9] (\crc_reg[9] ), .n10368(n10368), 
            .\crc_next[21] (crc_next[21]), .n6247(n6247), .\crc_next[2] (\crc_next[2] ), 
            .\crc_reg[10] (crc_reg[10]), .\crc_next[3] (crc_next[3]), .\crc_reg[11] (crc_reg[11]), 
            .\crc_next[4] (crc_next[4]), .\crc_reg[12] (\crc_reg[12] ), 
            .\crc_next[22] (crc_next[22]), .\crc_reg[30] (crc_reg[30]), 
            .\crc_next[23] (crc_next[23]), .\crc_reg[31] (crc_reg[31]), 
            .\crc_next[5] (crc_next[5]), .\crc_reg[13] (crc_reg[13]), .\crc_next[7] (crc_next[7]), 
            .\crc_reg[15] (crc_reg[15]), .\crc_reg[22] (crc_reg[22]), .n11945(n11945), 
            .\crc_next[24] (crc_next[24]), .\crc_reg[27] (crc_reg[27]), 
            .\udp_tdata[0] (\udp_tdata[0] ), .\udp_tdata[2] (\udp_tdata[2] ), 
            .\crc_next[8] (crc_next[8]), .\crc_reg[16] (crc_reg[16]), .\crc_reg[24] (crc_reg[24]), 
            .\crc_reg[21] (crc_reg[21]), .\crc_next[12] (\crc_next[12] ), 
            .\crc_reg[20] (crc_reg[20]), .n10360(n10360), .n6922(n6922), 
            .\crc_next[13] (crc_next[13]), .\crc_next[14] (crc_next[14]), 
            .\crc_next[15] (crc_next[15]), .n6926(n6926), .\crc_reg[25] (\crc_reg[25] ), 
            .\crc_reg[23] (crc_reg[23]), .n10442(n10442), .n10332(n10332), 
            .\crc_next[18] (crc_next[18]), .\crc_next[26] (crc_next[26]), 
            .\crc_next[16] (crc_next[16]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/mac_axitorgmii.vhd(67[16:35])
    
endmodule
//
// Verilog Description of module crc32_8
//

module crc32_8 (n6156, n11910, n11909, \crc_next[31] , \crc_next[27] , 
            n11918, n11917, \crc_reg[1] , \crc_reg[7] , n11957, \crc_reg[2] , 
            \crc_reg[6] , \crc_reg[4] , \crc_reg[17] , n2295, n3, 
            n11908, n10288, n11913, \crc_next[28] , n11912, n6195, 
            n11915, n10518, \crc_next[30] , \crc_next[19] , n11916, 
            \crc_reg[14] , \crc_next[6] , n11914, \crc_next[20] , \crc_reg[3] , 
            \crc_reg[28] , n6929, \crc_reg[0] , \crc_reg[9] , n10368, 
            \crc_next[21] , n6247, \crc_next[2] , \crc_reg[10] , \crc_next[3] , 
            \crc_reg[11] , \crc_next[4] , \crc_reg[12] , \crc_next[22] , 
            \crc_reg[30] , \crc_next[23] , \crc_reg[31] , \crc_next[5] , 
            \crc_reg[13] , \crc_next[7] , \crc_reg[15] , \crc_reg[22] , 
            n11945, \crc_next[24] , \crc_reg[27] , \udp_tdata[0] , \udp_tdata[2] , 
            \crc_next[8] , \crc_reg[16] , \crc_reg[24] , \crc_reg[21] , 
            \crc_next[12] , \crc_reg[20] , n10360, n6922, \crc_next[13] , 
            \crc_next[14] , \crc_next[15] , n6926, \crc_reg[25] , \crc_reg[23] , 
            n10442, n10332, \crc_next[18] , \crc_next[26] , \crc_next[16] );
    input n6156;
    input n11910;
    input n11909;
    output \crc_next[31] ;
    output \crc_next[27] ;
    input n11918;
    input n11917;
    input \crc_reg[1] ;
    input \crc_reg[7] ;
    output n11957;
    input \crc_reg[2] ;
    input \crc_reg[6] ;
    input \crc_reg[4] ;
    input \crc_reg[17] ;
    input n2295;
    output n3;
    input n11908;
    input n10288;
    input n11913;
    output \crc_next[28] ;
    input n11912;
    input n6195;
    input n11915;
    input n10518;
    output \crc_next[30] ;
    output \crc_next[19] ;
    input n11916;
    input \crc_reg[14] ;
    output \crc_next[6] ;
    input n11914;
    output \crc_next[20] ;
    input \crc_reg[3] ;
    input \crc_reg[28] ;
    output n6929;
    input \crc_reg[0] ;
    input \crc_reg[9] ;
    input n10368;
    output \crc_next[21] ;
    input n6247;
    output \crc_next[2] ;
    input \crc_reg[10] ;
    output \crc_next[3] ;
    input \crc_reg[11] ;
    output \crc_next[4] ;
    input \crc_reg[12] ;
    output \crc_next[22] ;
    input \crc_reg[30] ;
    output \crc_next[23] ;
    input \crc_reg[31] ;
    output \crc_next[5] ;
    input \crc_reg[13] ;
    output \crc_next[7] ;
    input \crc_reg[15] ;
    input \crc_reg[22] ;
    input n11945;
    output \crc_next[24] ;
    input \crc_reg[27] ;
    input \udp_tdata[0] ;
    input \udp_tdata[2] ;
    output \crc_next[8] ;
    input \crc_reg[16] ;
    input \crc_reg[24] ;
    input \crc_reg[21] ;
    output \crc_next[12] ;
    input \crc_reg[20] ;
    input n10360;
    output n6922;
    output \crc_next[13] ;
    output \crc_next[14] ;
    output \crc_next[15] ;
    output n6926;
    input \crc_reg[25] ;
    input \crc_reg[23] ;
    input n10442;
    input n10332;
    output \crc_next[18] ;
    output \crc_next[26] ;
    output \crc_next[16] ;
    
    
    wire n10402, n4, n10230, n10224, n10198, n10472, n10552, n10268, 
        n10466, n11956, n10460, n10318, n10206, n10426, n10420, 
        n10324, n10528, n10256, n10899, n10248, n10510, n10438, 
        n11940, n10260, n10542, n9792, n10484, n10298, n10410;
    
    LUT4 i1_4_lut (.A(n6156), .B(n11910), .C(n11909), .D(\crc_next[31] ), 
         .Z(\crc_next[27] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut.init = 16'h6996;
    LUT4 i1_4_lut_adj_195 (.A(n11918), .B(n11917), .C(\crc_reg[1] ), .D(\crc_reg[7] ), 
         .Z(\crc_next[31] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_195.init = 16'h6996;
    LUT4 i1_3_lut_4_lut (.A(n11957), .B(\crc_reg[2] ), .C(\crc_reg[6] ), 
         .D(\crc_reg[4] ), .Z(n10402)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(63[19:53])
    defparam i1_3_lut_4_lut.init = 16'h6996;
    LUT4 i1_2_lut_4_lut (.A(\crc_reg[7] ), .B(n11917), .C(\crc_reg[17] ), 
         .D(n2295), .Z(n3)) /* synthesis lut_function=(A (B (C (D))+!B !(C+!(D)))+!A !(B (C+!(D))+!B !(C (D)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_2_lut_4_lut.init = 16'h9600;
    LUT4 i1_4_lut_adj_196 (.A(n11908), .B(n11910), .C(n10288), .D(n11913), 
         .Z(\crc_next[28] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(65[19:40])
    defparam i1_4_lut_adj_196.init = 16'h6996;
    LUT4 i1_4_lut_adj_197 (.A(n11912), .B(n6195), .C(n11915), .D(n10518), 
         .Z(\crc_next[30] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_197.init = 16'h6996;
    LUT4 i1_2_lut_3_lut_4_lut (.A(\crc_reg[4] ), .B(n11913), .C(n11912), 
         .D(\crc_reg[6] ), .Z(n4)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(60[19:66])
    defparam i1_2_lut_3_lut_4_lut.init = 16'h6996;
    LUT4 i1_4_lut_adj_198 (.A(n6156), .B(n11910), .C(n10230), .D(n6195), 
         .Z(\crc_next[19] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_198.init = 16'h6996;
    LUT4 i1_4_lut_adj_199 (.A(n11912), .B(n11916), .C(n11918), .D(n10224), 
         .Z(n10230)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_199.init = 16'h6996;
    LUT4 i1_3_lut_4_lut_adj_200 (.A(\crc_reg[4] ), .B(n11913), .C(\crc_reg[14] ), 
         .D(n11910), .Z(\crc_next[6] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(60[19:66])
    defparam i1_3_lut_4_lut_adj_200.init = 16'h6996;
    LUT4 i1_4_lut_adj_201 (.A(n6195), .B(n4), .C(n11914), .D(n10198), 
         .Z(\crc_next[20] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_201.init = 16'h6996;
    LUT4 i1_2_lut (.A(\crc_reg[3] ), .B(\crc_reg[28] ), .Z(n10198)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_2_lut.init = 16'h6666;
    LUT4 i1_4_lut_adj_202 (.A(n11915), .B(n11914), .C(n10472), .D(\crc_reg[3] ), 
         .Z(n6929)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_202.init = 16'h6996;
    LUT4 i1_2_lut_adj_203 (.A(\crc_reg[0] ), .B(\crc_reg[9] ), .Z(n10472)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_2_lut_adj_203.init = 16'h6666;
    LUT4 i1_4_lut_adj_204 (.A(n11909), .B(n11910), .C(n6195), .D(n10368), 
         .Z(\crc_next[21] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_204.init = 16'h6996;
    LUT4 i1_4_lut_adj_205 (.A(n6247), .B(n11913), .C(n11915), .D(n10552), 
         .Z(\crc_next[2] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(60[19:66])
    defparam i1_4_lut_adj_205.init = 16'h6996;
    LUT4 i1_2_lut_adj_206 (.A(\crc_reg[4] ), .B(\crc_reg[10] ), .Z(n10552)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(60[19:66])
    defparam i1_2_lut_adj_206.init = 16'h6666;
    LUT4 i1_4_lut_adj_207 (.A(n11916), .B(n11910), .C(n11918), .D(n10268), 
         .Z(\crc_next[3] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_207.init = 16'h6996;
    LUT4 i1_3_lut (.A(\crc_reg[1] ), .B(\crc_reg[2] ), .C(\crc_reg[11] ), 
         .Z(n10268)) /* synthesis lut_function=(A (B (C)+!B !(C))+!A !(B (C)+!B !(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_3_lut.init = 16'h9696;
    LUT4 i1_4_lut_adj_208 (.A(n11912), .B(n11914), .C(n10466), .D(n11915), 
         .Z(\crc_next[4] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_208.init = 16'h6996;
    LUT4 i1_4_lut_adj_209 (.A(n11916), .B(n11956), .C(n10460), .D(\crc_reg[6] ), 
         .Z(n10466)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_209.init = 16'h6996;
    LUT4 i1_2_lut_adj_210 (.A(\crc_reg[3] ), .B(\crc_reg[12] ), .Z(n10460)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_2_lut_adj_210.init = 16'h6666;
    LUT4 i1_4_lut_adj_211 (.A(n6156), .B(n11910), .C(n11912), .D(n10318), 
         .Z(\crc_next[22] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_211.init = 16'h6996;
    LUT4 i1_4_lut_adj_212 (.A(n11916), .B(\crc_reg[2] ), .C(\crc_reg[6] ), 
         .D(\crc_reg[30] ), .Z(n10318)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_212.init = 16'h6996;
    LUT4 i1_4_lut_adj_213 (.A(n6195), .B(n4), .C(n11914), .D(n10206), 
         .Z(\crc_next[23] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_213.init = 16'h6996;
    LUT4 i1_2_lut_adj_214 (.A(\crc_reg[3] ), .B(\crc_reg[31] ), .Z(n10206)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_2_lut_adj_214.init = 16'h6666;
    LUT4 i1_4_lut_adj_215 (.A(n11913), .B(n6156), .C(n11917), .D(n10426), 
         .Z(\crc_next[5] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(60[19:66])
    defparam i1_4_lut_adj_215.init = 16'h6996;
    LUT4 i1_4_lut_adj_216 (.A(n11918), .B(\crc_reg[4] ), .C(n10420), .D(\crc_reg[1] ), 
         .Z(n10426)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(60[19:66])
    defparam i1_4_lut_adj_216.init = 16'h6996;
    LUT4 i1_2_lut_adj_217 (.A(\crc_reg[7] ), .B(\crc_reg[13] ), .Z(n10420)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(60[19:66])
    defparam i1_2_lut_adj_217.init = 16'h6666;
    LUT4 i1_4_lut_adj_218 (.A(n11908), .B(n11910), .C(n11915), .D(n10324), 
         .Z(\crc_next[7] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_218.init = 16'h6996;
    LUT4 i1_2_lut_adj_219 (.A(\crc_reg[0] ), .B(\crc_reg[15] ), .Z(n10324)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_2_lut_adj_219.init = 16'h6666;
    LUT4 i1_3_lut_4_lut_adj_220 (.A(\crc_reg[6] ), .B(\crc_reg[2] ), .C(\crc_reg[22] ), 
         .D(\crc_reg[1] ), .Z(n10528)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_3_lut_4_lut_adj_220.init = 16'h6996;
    LUT4 i1_4_lut_adj_221 (.A(n10256), .B(n11910), .C(n11945), .D(n10899), 
         .Z(\crc_next[24] )) /* synthesis lut_function=(!(A (B (C+!(D))+!B !(C+!(D)))+!A !(B (C+!(D))+!B !(C+!(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(60[19:66])
    defparam i1_4_lut_adj_221.init = 16'h6966;
    LUT4 i1_4_lut_adj_222 (.A(n11913), .B(n11917), .C(n11956), .D(n10248), 
         .Z(n10256)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(60[19:66])
    defparam i1_4_lut_adj_222.init = 16'h6996;
    LUT4 i1_3_lut_4_lut_adj_223 (.A(\crc_reg[6] ), .B(\crc_reg[2] ), .C(\crc_reg[27] ), 
         .D(\crc_reg[1] ), .Z(n10224)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_3_lut_4_lut_adj_223.init = 16'h6996;
    LUT4 i1_2_lut_adj_224 (.A(\udp_tdata[0] ), .B(\udp_tdata[2] ), .Z(n10899)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(60[19:66])
    defparam i1_2_lut_adj_224.init = 16'h6666;
    LUT4 crcIn_0__I_0_234_2_lut_rep_210 (.A(\crc_reg[0] ), .B(\crc_reg[2] ), 
         .Z(n11956)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(61[19:40])
    defparam crcIn_0__I_0_234_2_lut_rep_210.init = 16'h6666;
    LUT4 i1_4_lut_adj_225 (.A(n11912), .B(n6195), .C(n11918), .D(n10510), 
         .Z(\crc_next[8] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_225.init = 16'h6996;
    LUT4 i1_3_lut_adj_226 (.A(\crc_reg[1] ), .B(\crc_reg[6] ), .C(\crc_reg[16] ), 
         .Z(n10510)) /* synthesis lut_function=(A (B (C)+!B !(C))+!A !(B (C)+!B !(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_3_lut_adj_226.init = 16'h9696;
    LUT4 i1_3_lut_4_lut_adj_227 (.A(\crc_reg[0] ), .B(\crc_reg[2] ), .C(\crc_reg[24] ), 
         .D(\crc_reg[4] ), .Z(n10438)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(61[19:40])
    defparam i1_3_lut_4_lut_adj_227.init = 16'h6996;
    LUT4 i1_2_lut_adj_228 (.A(\crc_reg[4] ), .B(\crc_reg[7] ), .Z(n10248)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(60[19:66])
    defparam i1_2_lut_adj_228.init = 16'h6666;
    LUT4 crcIn_0__I_0_226_2_lut_rep_211 (.A(\crc_reg[0] ), .B(\crc_reg[1] ), 
         .Z(n11957)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(67[19:40])
    defparam crcIn_0__I_0_226_2_lut_rep_211.init = 16'h6666;
    LUT4 crcOut_31__N_758_I_0_232_2_lut_rep_194_3_lut (.A(\crc_reg[0] ), .B(\crc_reg[1] ), 
         .C(\crc_reg[2] ), .Z(n11940)) /* synthesis lut_function=(A (B (C)+!B !(C))+!A !(B (C)+!B !(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(67[19:40])
    defparam crcOut_31__N_758_I_0_232_2_lut_rep_194_3_lut.init = 16'h9696;
    LUT4 i1_2_lut_3_lut (.A(\crc_reg[0] ), .B(\crc_reg[1] ), .C(\crc_reg[21] ), 
         .Z(n10260)) /* synthesis lut_function=(A (B (C)+!B !(C))+!A !(B (C)+!B !(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(67[19:40])
    defparam i1_2_lut_3_lut.init = 16'h9696;
    LUT4 i1_4_lut_adj_229 (.A(n11915), .B(n11913), .C(n10542), .D(\crc_reg[4] ), 
         .Z(\crc_next[12] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(60[19:66])
    defparam i1_4_lut_adj_229.init = 16'h6996;
    LUT4 i1_2_lut_adj_230 (.A(\crc_reg[0] ), .B(\crc_reg[20] ), .Z(n10542)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(60[19:66])
    defparam i1_2_lut_adj_230.init = 16'h6666;
    LUT4 i1_4_lut_adj_231 (.A(n9792), .B(n11910), .C(n11914), .D(n10360), 
         .Z(n6922)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_231.init = 16'h6996;
    LUT4 i1_4_lut_adj_232 (.A(n11915), .B(n11910), .C(n11918), .D(n10260), 
         .Z(\crc_next[13] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(66[19:53])
    defparam i1_4_lut_adj_232.init = 16'h6996;
    LUT4 i1_4_lut_adj_233 (.A(n11916), .B(n11912), .C(n11918), .D(n10528), 
         .Z(\crc_next[14] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_233.init = 16'h6996;
    LUT4 i1_4_lut_adj_234 (.A(n6195), .B(n11914), .C(n11916), .D(n10484), 
         .Z(\crc_next[15] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_234.init = 16'h6996;
    LUT4 i1_4_lut_adj_235 (.A(n6156), .B(n11910), .C(n10298), .D(n11913), 
         .Z(n6926)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(60[19:66])
    defparam i1_4_lut_adj_235.init = 16'h6996;
    LUT4 i1_4_lut_adj_236 (.A(n6247), .B(n11915), .C(\crc_reg[4] ), .D(\crc_reg[25] ), 
         .Z(n10298)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(60[19:66])
    defparam i1_4_lut_adj_236.init = 16'h6996;
    LUT4 i1_3_lut_adj_237 (.A(\crc_reg[3] ), .B(\crc_reg[2] ), .C(\crc_reg[23] ), 
         .Z(n10484)) /* synthesis lut_function=(A (B (C)+!B !(C))+!A !(B (C)+!B !(C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_3_lut_adj_237.init = 16'h9696;
    LUT4 i1_4_lut_adj_238 (.A(n9792), .B(n11910), .C(n10442), .D(n10332), 
         .Z(\crc_next[18] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(60[19:66])
    defparam i1_4_lut_adj_238.init = 16'h6996;
    LUT4 i1_4_lut_adj_239 (.A(n6195), .B(n6156), .C(n10410), .D(n11912), 
         .Z(\crc_next[26] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(60[19:66])
    defparam i1_4_lut_adj_239.init = 16'h6996;
    LUT4 i1_4_lut_adj_240 (.A(n11918), .B(n11912), .C(n11940), .D(\crc_reg[6] ), 
         .Z(n9792)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(68[19:64])
    defparam i1_4_lut_adj_240.init = 16'h6996;
    LUT4 i1_4_lut_adj_241 (.A(n10442), .B(n6156), .C(n11916), .D(n10438), 
         .Z(\crc_next[16] )) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(53[19:53])
    defparam i1_4_lut_adj_241.init = 16'h6996;
    LUT4 i1_4_lut_adj_242 (.A(n10442), .B(n11916), .C(n11918), .D(n10402), 
         .Z(n10410)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C (D)+!C !(D)))+!A !(B (C (D)+!C !(D))+!B !(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/crc32_8.vhd(60[19:66])
    defparam i1_4_lut_adj_242.init = 16'h6996;
    
endmodule
//
// Verilog Description of module fifo_udp_reg
//

module fifo_udp_reg (reg_fifo_data, clk_c, data_out_large_fifo, reg_fifo_almostfull, 
            fifo_almostempty_N_1, read_large_fifo, fifo_rd_en_in, reg_fifo_empty, 
            fifo_empty);
    output [7:0]reg_fifo_data;
    input clk_c;
    input [7:0]data_out_large_fifo;
    output reg_fifo_almostfull;
    input fifo_almostempty_N_1;
    output read_large_fifo;
    input fifo_rd_en_in;
    output reg_fifo_empty;
    input fifo_empty;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    
    FD1S3AX data_reg_i0 (.D(data_out_large_fifo[0]), .CK(clk_c), .Q(reg_fifo_data[0])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=12, LSE_RCOL=36, LSE_LLINE=393, LSE_RLINE=393 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/register.vhd(37[9] 48[16])
    defparam data_reg_i0.GSR = "ENABLED";
    FD1S3AX almostfull_reg_14 (.D(fifo_almostempty_N_1), .CK(clk_c), .Q(reg_fifo_almostfull)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=12, LSE_RCOL=36, LSE_LLINE=393, LSE_RLINE=393 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/register.vhd(37[9] 48[16])
    defparam almostfull_reg_14.GSR = "ENABLED";
    FD1S3AX rd_en_reg_15 (.D(fifo_rd_en_in), .CK(clk_c), .Q(read_large_fifo)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=12, LSE_RCOL=36, LSE_LLINE=393, LSE_RLINE=393 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/register.vhd(37[9] 48[16])
    defparam rd_en_reg_15.GSR = "ENABLED";
    FD1S3AY empty_reg_13 (.D(fifo_empty), .CK(clk_c), .Q(reg_fifo_empty)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=12, LSE_RCOL=36, LSE_LLINE=393, LSE_RLINE=393 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/register.vhd(37[9] 48[16])
    defparam empty_reg_13.GSR = "ENABLED";
    FD1S3AX data_reg_i1 (.D(data_out_large_fifo[1]), .CK(clk_c), .Q(reg_fifo_data[1])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=12, LSE_RCOL=36, LSE_LLINE=393, LSE_RLINE=393 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/register.vhd(37[9] 48[16])
    defparam data_reg_i1.GSR = "ENABLED";
    FD1S3AX data_reg_i2 (.D(data_out_large_fifo[2]), .CK(clk_c), .Q(reg_fifo_data[2])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=12, LSE_RCOL=36, LSE_LLINE=393, LSE_RLINE=393 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/register.vhd(37[9] 48[16])
    defparam data_reg_i2.GSR = "ENABLED";
    FD1S3AX data_reg_i3 (.D(data_out_large_fifo[3]), .CK(clk_c), .Q(reg_fifo_data[3])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=12, LSE_RCOL=36, LSE_LLINE=393, LSE_RLINE=393 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/register.vhd(37[9] 48[16])
    defparam data_reg_i3.GSR = "ENABLED";
    FD1S3AX data_reg_i4 (.D(data_out_large_fifo[4]), .CK(clk_c), .Q(reg_fifo_data[4])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=12, LSE_RCOL=36, LSE_LLINE=393, LSE_RLINE=393 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/register.vhd(37[9] 48[16])
    defparam data_reg_i4.GSR = "ENABLED";
    FD1S3AX data_reg_i5 (.D(data_out_large_fifo[5]), .CK(clk_c), .Q(reg_fifo_data[5])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=12, LSE_RCOL=36, LSE_LLINE=393, LSE_RLINE=393 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/register.vhd(37[9] 48[16])
    defparam data_reg_i5.GSR = "ENABLED";
    FD1S3AX data_reg_i6 (.D(data_out_large_fifo[6]), .CK(clk_c), .Q(reg_fifo_data[6])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=12, LSE_RCOL=36, LSE_LLINE=393, LSE_RLINE=393 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/register.vhd(37[9] 48[16])
    defparam data_reg_i6.GSR = "ENABLED";
    FD1S3AX data_reg_i7 (.D(data_out_large_fifo[7]), .CK(clk_c), .Q(reg_fifo_data[7])) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=12, LSE_RCOL=36, LSE_LLINE=393, LSE_RLINE=393 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/register.vhd(37[9] 48[16])
    defparam data_reg_i7.GSR = "ENABLED";
    
endmodule
//
// Verilog Description of module Fifolg
//

module Fifolg (clk_c, n11947, fifo_empty, fifo_almostempty, large_fifo_almost_full, 
            VCC_net, GND_net, read_large_fifo, large_fifo_din, rst_c, 
            data_out_large_fifo) /* synthesis NGD_DRC_MASK=1 */ ;
    input clk_c;
    input n11947;
    output fifo_empty;
    output fifo_almostempty;
    output large_fifo_almost_full;
    input VCC_net;
    input GND_net;
    input read_large_fifo;
    input [7:0]large_fifo_din;
    input rst_c;
    output [7:0]data_out_large_fifo;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    
    wire rden_i_inv, wren_i, cnt_con, fcount_1, fcnt_en, ifcount_1, 
        large_fifo_full, invout_2, invout_1, fcount_2, ifcount_2, 
        fcount_3, ifcount_3, fcount_4, ifcount_4, fcount_5, ifcount_5, 
        fcount_6, ifcount_6, fcount_7, ifcount_7, fcount_8, ifcount_8, 
        fcount_9, ifcount_9, empty_d, full_d, wcount_0, iwcount_0, 
        wcount_1, iwcount_1, wcount_2, iwcount_2, wcount_3, iwcount_3, 
        wcount_4, iwcount_4, wcount_5, iwcount_5, wcount_6, iwcount_6, 
        wcount_7, iwcount_7, wcount_8, iwcount_8, wcount_9, iwcount_9, 
        rcount_0, rden_i, ircount_0, rcount_1, ircount_1, rcount_2, 
        ircount_2, rcount_3, ircount_3, rcount_4, ircount_4, rcount_5, 
        ircount_5, rcount_6, ircount_6, rcount_7, ircount_7, rcount_8, 
        ircount_8, rcount_9, ircount_9, ae_d, af_d, fcount_0, ifcount_0, 
        bdcnt_bctr_ci, co0, co1, co2, co3, cmp_ci, co0_1, co1_1, 
        co2_1, co3_1, cmp_le_1_c, cmp_le_1, cmp_ci_1, co0_2, co1_2, 
        co2_2, co3_2, wren_i_inv, cmp_ge_d1_c, cmp_ge_d1, w_ctr_ci, 
        co0_3, co1_3, co2_3, co3_3, r_ctr_ci, co0_4, co1_4, co2_4, 
        co3_4, cmp_ci_2, co0_5, fcnt_en_inv_inv, cnt_con_inv, co1_5, 
        co2_5, co3_5, ae_set_d_c, ae_set_d, cmp_ci_3, co0_6, co1_6, 
        co2_6, co3_6, ae_clr_d_c, ae_clr_d, cmp_ci_4, co0_7, co1_7, 
        co2_7, co3_7, af_set_d_c, af_set_d, cmp_ci_5, co0_8, co1_8, 
        co2_8, co3_8, af_clr_d_c, af_clr_d, fcnt_en_inv;
    
    AND2 AND2_t2 (.A(wren_i), .B(rden_i_inv), .Z(cnt_con)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(231[14:18])
    FD1P3AX FF_32 (.D(ifcount_1), .SP(fcnt_en), .CK(clk_c), .Q(fcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(322[12:19])
    defparam FF_32.GSR = "ENABLED";
    INV INV_8 (.A(large_fifo_full), .Z(invout_2)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(378[20:38])
    AND2 AND2_t4 (.A(n11947), .B(invout_2), .Z(wren_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(219[14:18])
    INV INV_7 (.A(fifo_empty), .Z(invout_1)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(378[20:38])
    FD1P3AX FF_31 (.D(ifcount_2), .SP(fcnt_en), .CK(clk_c), .Q(fcount_2)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(326[12:19])
    defparam FF_31.GSR = "ENABLED";
    FD1P3AX FF_30 (.D(ifcount_3), .SP(fcnt_en), .CK(clk_c), .Q(fcount_3)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(330[12:19])
    defparam FF_30.GSR = "ENABLED";
    FD1P3AX FF_29 (.D(ifcount_4), .SP(fcnt_en), .CK(clk_c), .Q(fcount_4)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(334[12:19])
    defparam FF_29.GSR = "ENABLED";
    FD1P3AX FF_28 (.D(ifcount_5), .SP(fcnt_en), .CK(clk_c), .Q(fcount_5)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(338[12:19])
    defparam FF_28.GSR = "ENABLED";
    FD1P3AX FF_27 (.D(ifcount_6), .SP(fcnt_en), .CK(clk_c), .Q(fcount_6)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(342[12:19])
    defparam FF_27.GSR = "ENABLED";
    FD1P3AX FF_26 (.D(ifcount_7), .SP(fcnt_en), .CK(clk_c), .Q(fcount_7)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(346[12:19])
    defparam FF_26.GSR = "ENABLED";
    FD1P3AX FF_25 (.D(ifcount_8), .SP(fcnt_en), .CK(clk_c), .Q(fcount_8)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(350[12:19])
    defparam FF_25.GSR = "ENABLED";
    FD1P3AX FF_24 (.D(ifcount_9), .SP(fcnt_en), .CK(clk_c), .Q(fcount_9)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(354[12:19])
    defparam FF_24.GSR = "ENABLED";
    FD1S3AY FF_23 (.D(empty_d), .CK(clk_c), .Q(fifo_empty)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(358[12:19])
    defparam FF_23.GSR = "ENABLED";
    FD1S3AX FF_22 (.D(full_d), .CK(clk_c), .Q(large_fifo_full)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(361[12:19])
    defparam FF_22.GSR = "ENABLED";
    FD1P3AX FF_21 (.D(iwcount_0), .SP(wren_i), .CK(clk_c), .Q(wcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(364[12:19])
    defparam FF_21.GSR = "ENABLED";
    FD1P3AX FF_20 (.D(iwcount_1), .SP(wren_i), .CK(clk_c), .Q(wcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(368[12:19])
    defparam FF_20.GSR = "ENABLED";
    FD1P3AX FF_19 (.D(iwcount_2), .SP(wren_i), .CK(clk_c), .Q(wcount_2)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(372[12:19])
    defparam FF_19.GSR = "ENABLED";
    FD1P3AX FF_18 (.D(iwcount_3), .SP(wren_i), .CK(clk_c), .Q(wcount_3)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(376[12:19])
    defparam FF_18.GSR = "ENABLED";
    FD1P3AX FF_17 (.D(iwcount_4), .SP(wren_i), .CK(clk_c), .Q(wcount_4)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(380[12:19])
    defparam FF_17.GSR = "ENABLED";
    FD1P3AX FF_16 (.D(iwcount_5), .SP(wren_i), .CK(clk_c), .Q(wcount_5)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(384[12:19])
    defparam FF_16.GSR = "ENABLED";
    FD1P3AX FF_15 (.D(iwcount_6), .SP(wren_i), .CK(clk_c), .Q(wcount_6)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(388[12:19])
    defparam FF_15.GSR = "ENABLED";
    FD1P3AX FF_14 (.D(iwcount_7), .SP(wren_i), .CK(clk_c), .Q(wcount_7)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(392[12:19])
    defparam FF_14.GSR = "ENABLED";
    FD1P3AX FF_13 (.D(iwcount_8), .SP(wren_i), .CK(clk_c), .Q(wcount_8)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(396[12:19])
    defparam FF_13.GSR = "ENABLED";
    FD1P3AX FF_12 (.D(iwcount_9), .SP(wren_i), .CK(clk_c), .Q(wcount_9)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(400[12:19])
    defparam FF_12.GSR = "ENABLED";
    FD1P3AX FF_11 (.D(ircount_0), .SP(rden_i), .CK(clk_c), .Q(rcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(404[12:19])
    defparam FF_11.GSR = "ENABLED";
    FD1P3AX FF_10 (.D(ircount_1), .SP(rden_i), .CK(clk_c), .Q(rcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(408[12:19])
    defparam FF_10.GSR = "ENABLED";
    FD1P3AX FF_9 (.D(ircount_2), .SP(rden_i), .CK(clk_c), .Q(rcount_2)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(412[11:18])
    defparam FF_9.GSR = "ENABLED";
    FD1P3AX FF_8 (.D(ircount_3), .SP(rden_i), .CK(clk_c), .Q(rcount_3)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(416[11:18])
    defparam FF_8.GSR = "ENABLED";
    FD1P3AX FF_7 (.D(ircount_4), .SP(rden_i), .CK(clk_c), .Q(rcount_4)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(420[11:18])
    defparam FF_7.GSR = "ENABLED";
    FD1P3AX FF_6 (.D(ircount_5), .SP(rden_i), .CK(clk_c), .Q(rcount_5)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(424[11:18])
    defparam FF_6.GSR = "ENABLED";
    FD1P3AX FF_5 (.D(ircount_6), .SP(rden_i), .CK(clk_c), .Q(rcount_6)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(428[11:18])
    defparam FF_5.GSR = "ENABLED";
    FD1P3AX FF_4 (.D(ircount_7), .SP(rden_i), .CK(clk_c), .Q(rcount_7)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(432[11:18])
    defparam FF_4.GSR = "ENABLED";
    FD1P3AX FF_3 (.D(ircount_8), .SP(rden_i), .CK(clk_c), .Q(rcount_8)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(436[11:18])
    defparam FF_3.GSR = "ENABLED";
    FD1P3AX FF_2 (.D(ircount_9), .SP(rden_i), .CK(clk_c), .Q(rcount_9)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(440[11:18])
    defparam FF_2.GSR = "ENABLED";
    FD1S3AY FF_1 (.D(ae_d), .CK(clk_c), .Q(fifo_almostempty)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(444[11:18])
    defparam FF_1.GSR = "ENABLED";
    FD1S3AX FF_0 (.D(af_d), .CK(clk_c), .Q(large_fifo_almost_full)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(447[11:18])
    defparam FF_0.GSR = "ENABLED";
    FD1P3AX FF_33 (.D(ifcount_0), .SP(fcnt_en), .CK(clk_c), .Q(fcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(318[12:19])
    defparam FF_33.GSR = "ENABLED";
    CCU2C bdcnt_bctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(cnt_con), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .COUT(bdcnt_bctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(450[21:26])
    defparam bdcnt_bctr_cia.INIT0 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INIT1 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INJECT1_0 = "NO";
    defparam bdcnt_bctr_cia.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_0 (.A0(fcount_0), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(bdcnt_bctr_ci), 
          .COUT(co0), .S0(ifcount_0), .S1(ifcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(457[19:24])
    defparam bdcnt_bctr_0.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INJECT1_0 = "NO";
    defparam bdcnt_bctr_0.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_1 (.A0(fcount_2), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_3), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(co0), 
          .COUT(co1), .S0(ifcount_2), .S1(ifcount_3)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(464[19:24])
    defparam bdcnt_bctr_1.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INJECT1_0 = "NO";
    defparam bdcnt_bctr_1.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_2 (.A0(fcount_4), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_5), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(co1), 
          .COUT(co2), .S0(ifcount_4), .S1(ifcount_5)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(471[19:24])
    defparam bdcnt_bctr_2.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_2.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_2.INJECT1_0 = "NO";
    defparam bdcnt_bctr_2.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_3 (.A0(fcount_6), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_7), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(co2), 
          .COUT(co3), .S0(ifcount_6), .S1(ifcount_7)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(478[19:24])
    defparam bdcnt_bctr_3.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_3.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_3.INJECT1_0 = "NO";
    defparam bdcnt_bctr_3.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_4 (.A0(fcount_8), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_9), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(co3), 
          .S0(ifcount_8), .S1(ifcount_9)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(485[19:24])
    defparam bdcnt_bctr_4.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_4.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_4.INJECT1_0 = "NO";
    defparam bdcnt_bctr_4.INJECT1_1 = "NO";
    CCU2C e_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(492[17:22])
    defparam e_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INJECT1_0 = "NO";
    defparam e_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C e_cmp_0 (.A0(rden_i), .B0(fcount_0), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_1), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci), 
          .COUT(co0_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(499[14:19])
    defparam e_cmp_0.INIT0 = 16'b1001100110101010;
    defparam e_cmp_0.INIT1 = 16'b1001100110101010;
    defparam e_cmp_0.INJECT1_0 = "NO";
    defparam e_cmp_0.INJECT1_1 = "NO";
    CCU2C e_cmp_1 (.A0(GND_net), .B0(fcount_2), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_3), .C1(VCC_net), .D1(VCC_net), .CIN(co0_1), 
          .COUT(co1_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(506[14:19])
    defparam e_cmp_1.INIT0 = 16'b1001100110101010;
    defparam e_cmp_1.INIT1 = 16'b1001100110101010;
    defparam e_cmp_1.INJECT1_0 = "NO";
    defparam e_cmp_1.INJECT1_1 = "NO";
    CCU2C e_cmp_2 (.A0(GND_net), .B0(fcount_4), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_5), .C1(VCC_net), .D1(VCC_net), .CIN(co1_1), 
          .COUT(co2_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(513[14:19])
    defparam e_cmp_2.INIT0 = 16'b1001100110101010;
    defparam e_cmp_2.INIT1 = 16'b1001100110101010;
    defparam e_cmp_2.INJECT1_0 = "NO";
    defparam e_cmp_2.INJECT1_1 = "NO";
    CCU2C e_cmp_3 (.A0(GND_net), .B0(fcount_6), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_7), .C1(VCC_net), .D1(VCC_net), .CIN(co2_1), 
          .COUT(co3_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(520[14:19])
    defparam e_cmp_3.INIT0 = 16'b1001100110101010;
    defparam e_cmp_3.INIT1 = 16'b1001100110101010;
    defparam e_cmp_3.INJECT1_0 = "NO";
    defparam e_cmp_3.INJECT1_1 = "NO";
    CCU2C e_cmp_4 (.A0(GND_net), .B0(fcount_8), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_9), .C1(VCC_net), .D1(VCC_net), .CIN(co3_1), 
          .COUT(cmp_le_1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(527[14:19])
    defparam e_cmp_4.INIT0 = 16'b1001100110101010;
    defparam e_cmp_4.INIT1 = 16'b1001100110101010;
    defparam e_cmp_4.INJECT1_0 = "NO";
    defparam e_cmp_4.INJECT1_1 = "NO";
    CCU2C a0 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_le_1_c), 
          .S0(cmp_le_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(535[9:14])
    defparam a0.INIT0 = 16'b0110011010101010;
    defparam a0.INIT1 = 16'b0110011010101010;
    defparam a0.INJECT1_0 = "NO";
    defparam a0.INJECT1_1 = "NO";
    CCU2C g_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(543[17:22])
    defparam g_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INJECT1_0 = "NO";
    defparam g_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C g_cmp_0 (.A0(fcount_0), .B0(wren_i), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(wren_i), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci_1), 
          .COUT(co0_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(550[14:19])
    defparam g_cmp_0.INIT0 = 16'b1001100110101010;
    defparam g_cmp_0.INIT1 = 16'b1001100110101010;
    defparam g_cmp_0.INJECT1_0 = "NO";
    defparam g_cmp_0.INJECT1_1 = "NO";
    CCU2C g_cmp_1 (.A0(fcount_2), .B0(wren_i), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_3), .B1(wren_i), .C1(VCC_net), .D1(VCC_net), .CIN(co0_2), 
          .COUT(co1_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(557[14:19])
    defparam g_cmp_1.INIT0 = 16'b1001100110101010;
    defparam g_cmp_1.INIT1 = 16'b1001100110101010;
    defparam g_cmp_1.INJECT1_0 = "NO";
    defparam g_cmp_1.INJECT1_1 = "NO";
    CCU2C g_cmp_2 (.A0(fcount_4), .B0(wren_i), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_5), .B1(wren_i), .C1(VCC_net), .D1(VCC_net), .CIN(co1_2), 
          .COUT(co2_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(564[14:19])
    defparam g_cmp_2.INIT0 = 16'b1001100110101010;
    defparam g_cmp_2.INIT1 = 16'b1001100110101010;
    defparam g_cmp_2.INJECT1_0 = "NO";
    defparam g_cmp_2.INJECT1_1 = "NO";
    CCU2C g_cmp_3 (.A0(fcount_6), .B0(wren_i), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_7), .B1(wren_i), .C1(VCC_net), .D1(VCC_net), .CIN(co2_2), 
          .COUT(co3_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(571[14:19])
    defparam g_cmp_3.INIT0 = 16'b1001100110101010;
    defparam g_cmp_3.INIT1 = 16'b1001100110101010;
    defparam g_cmp_3.INJECT1_0 = "NO";
    defparam g_cmp_3.INJECT1_1 = "NO";
    CCU2C g_cmp_4 (.A0(fcount_8), .B0(wren_i), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_9), .B1(wren_i_inv), .C1(VCC_net), .D1(VCC_net), 
          .CIN(co3_2), .COUT(cmp_ge_d1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(578[14:19])
    defparam g_cmp_4.INIT0 = 16'b1001100110101010;
    defparam g_cmp_4.INIT1 = 16'b1001100110101010;
    defparam g_cmp_4.INJECT1_0 = "NO";
    defparam g_cmp_4.INJECT1_1 = "NO";
    CCU2C a1 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ge_d1_c), 
          .S0(cmp_ge_d1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(585[9:14])
    defparam a1.INIT0 = 16'b0110011010101010;
    defparam a1.INIT1 = 16'b0110011010101010;
    defparam a1.INJECT1_0 = "NO";
    defparam a1.INJECT1_1 = "NO";
    CCU2C w_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(w_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(593[16:21])
    defparam w_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam w_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam w_ctr_cia.INJECT1_0 = "NO";
    defparam w_ctr_cia.INJECT1_1 = "NO";
    CCU2C w_ctr_0 (.A0(wcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(wcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(w_ctr_ci), 
          .COUT(co0_3), .S0(iwcount_0), .S1(iwcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(600[14:19])
    defparam w_ctr_0.INIT0 = 16'b0110011010101010;
    defparam w_ctr_0.INIT1 = 16'b0110011010101010;
    defparam w_ctr_0.INJECT1_0 = "NO";
    defparam w_ctr_0.INJECT1_1 = "NO";
    CCU2C w_ctr_1 (.A0(wcount_2), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(wcount_3), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_3), 
          .COUT(co1_3), .S0(iwcount_2), .S1(iwcount_3)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(608[14:19])
    defparam w_ctr_1.INIT0 = 16'b0110011010101010;
    defparam w_ctr_1.INIT1 = 16'b0110011010101010;
    defparam w_ctr_1.INJECT1_0 = "NO";
    defparam w_ctr_1.INJECT1_1 = "NO";
    CCU2C w_ctr_2 (.A0(wcount_4), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(wcount_5), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co1_3), 
          .COUT(co2_3), .S0(iwcount_4), .S1(iwcount_5)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(616[14:19])
    defparam w_ctr_2.INIT0 = 16'b0110011010101010;
    defparam w_ctr_2.INIT1 = 16'b0110011010101010;
    defparam w_ctr_2.INJECT1_0 = "NO";
    defparam w_ctr_2.INJECT1_1 = "NO";
    CCU2C w_ctr_3 (.A0(wcount_6), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(wcount_7), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co2_3), 
          .COUT(co3_3), .S0(iwcount_6), .S1(iwcount_7)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(624[14:19])
    defparam w_ctr_3.INIT0 = 16'b0110011010101010;
    defparam w_ctr_3.INIT1 = 16'b0110011010101010;
    defparam w_ctr_3.INJECT1_0 = "NO";
    defparam w_ctr_3.INJECT1_1 = "NO";
    CCU2C w_ctr_4 (.A0(wcount_8), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(wcount_9), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co3_3), 
          .S0(iwcount_8), .S1(iwcount_9)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(632[14:19])
    defparam w_ctr_4.INIT0 = 16'b0110011010101010;
    defparam w_ctr_4.INIT1 = 16'b0110011010101010;
    defparam w_ctr_4.INJECT1_0 = "NO";
    defparam w_ctr_4.INJECT1_1 = "NO";
    CCU2C r_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(r_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(640[16:21])
    defparam r_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam r_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam r_ctr_cia.INJECT1_0 = "NO";
    defparam r_ctr_cia.INJECT1_1 = "NO";
    CCU2C r_ctr_0 (.A0(rcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(rcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(r_ctr_ci), 
          .COUT(co0_4), .S0(ircount_0), .S1(ircount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(647[14:19])
    defparam r_ctr_0.INIT0 = 16'b0110011010101010;
    defparam r_ctr_0.INIT1 = 16'b0110011010101010;
    defparam r_ctr_0.INJECT1_0 = "NO";
    defparam r_ctr_0.INJECT1_1 = "NO";
    CCU2C r_ctr_1 (.A0(rcount_2), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(rcount_3), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_4), 
          .COUT(co1_4), .S0(ircount_2), .S1(ircount_3)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(655[14:19])
    defparam r_ctr_1.INIT0 = 16'b0110011010101010;
    defparam r_ctr_1.INIT1 = 16'b0110011010101010;
    defparam r_ctr_1.INJECT1_0 = "NO";
    defparam r_ctr_1.INJECT1_1 = "NO";
    CCU2C r_ctr_2 (.A0(rcount_4), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(rcount_5), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co1_4), 
          .COUT(co2_4), .S0(ircount_4), .S1(ircount_5)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(663[14:19])
    defparam r_ctr_2.INIT0 = 16'b0110011010101010;
    defparam r_ctr_2.INIT1 = 16'b0110011010101010;
    defparam r_ctr_2.INJECT1_0 = "NO";
    defparam r_ctr_2.INJECT1_1 = "NO";
    CCU2C r_ctr_3 (.A0(rcount_6), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(rcount_7), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co2_4), 
          .COUT(co3_4), .S0(ircount_6), .S1(ircount_7)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(671[14:19])
    defparam r_ctr_3.INIT0 = 16'b0110011010101010;
    defparam r_ctr_3.INIT1 = 16'b0110011010101010;
    defparam r_ctr_3.INJECT1_0 = "NO";
    defparam r_ctr_3.INJECT1_1 = "NO";
    CCU2C r_ctr_4 (.A0(rcount_8), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(rcount_9), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co3_4), 
          .S0(ircount_8), .S1(ircount_9)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(679[14:19])
    defparam r_ctr_4.INIT0 = 16'b0110011010101010;
    defparam r_ctr_4.INIT1 = 16'b0110011010101010;
    defparam r_ctr_4.INJECT1_0 = "NO";
    defparam r_ctr_4.INJECT1_1 = "NO";
    CCU2C ae_set_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(687[22:27])
    defparam ae_set_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam ae_set_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam ae_set_cmp_ci_a.INJECT1_0 = "NO";
    defparam ae_set_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C ae_set_cmp_0 (.A0(fcnt_en_inv_inv), .B0(fcount_0), .C0(VCC_net), 
          .D0(VCC_net), .A1(cnt_con_inv), .B1(fcount_1), .C1(VCC_net), 
          .D1(VCC_net), .CIN(cmp_ci_2), .COUT(co0_5)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(694[19:24])
    defparam ae_set_cmp_0.INIT0 = 16'b1001100110101010;
    defparam ae_set_cmp_0.INIT1 = 16'b1001100110101010;
    defparam ae_set_cmp_0.INJECT1_0 = "NO";
    defparam ae_set_cmp_0.INJECT1_1 = "NO";
    CCU2C ae_set_cmp_1 (.A0(GND_net), .B0(fcount_2), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(fcount_3), .C1(VCC_net), .D1(VCC_net), .CIN(co0_5), 
          .COUT(co1_5)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(702[19:24])
    defparam ae_set_cmp_1.INIT0 = 16'b1001100110101010;
    defparam ae_set_cmp_1.INIT1 = 16'b1001100110101010;
    defparam ae_set_cmp_1.INJECT1_0 = "NO";
    defparam ae_set_cmp_1.INJECT1_1 = "NO";
    CCU2C ae_set_cmp_2 (.A0(GND_net), .B0(fcount_4), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_5), .C1(VCC_net), .D1(VCC_net), .CIN(co1_5), 
          .COUT(co2_5)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(709[19:24])
    defparam ae_set_cmp_2.INIT0 = 16'b1001100110101010;
    defparam ae_set_cmp_2.INIT1 = 16'b1001100110101010;
    defparam ae_set_cmp_2.INJECT1_0 = "NO";
    defparam ae_set_cmp_2.INJECT1_1 = "NO";
    CCU2C ae_set_cmp_3 (.A0(GND_net), .B0(fcount_6), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_7), .C1(VCC_net), .D1(VCC_net), .CIN(co2_5), 
          .COUT(co3_5)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(716[19:24])
    defparam ae_set_cmp_3.INIT0 = 16'b1001100110101010;
    defparam ae_set_cmp_3.INIT1 = 16'b1001100110101010;
    defparam ae_set_cmp_3.INJECT1_0 = "NO";
    defparam ae_set_cmp_3.INJECT1_1 = "NO";
    CCU2C ae_set_cmp_4 (.A0(GND_net), .B0(fcount_8), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_9), .C1(VCC_net), .D1(VCC_net), .CIN(co3_5), 
          .COUT(ae_set_d_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(723[19:24])
    defparam ae_set_cmp_4.INIT0 = 16'b1001100110101010;
    defparam ae_set_cmp_4.INIT1 = 16'b1001100110101010;
    defparam ae_set_cmp_4.INJECT1_0 = "NO";
    defparam ae_set_cmp_4.INJECT1_1 = "NO";
    CCU2C a2 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(ae_set_d_c), 
          .S0(ae_set_d)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(731[9:14])
    defparam a2.INIT0 = 16'b0110011010101010;
    defparam a2.INIT1 = 16'b0110011010101010;
    defparam a2.INJECT1_0 = "NO";
    defparam a2.INJECT1_1 = "NO";
    CCU2C ae_clr_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci_3)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(739[22:27])
    defparam ae_clr_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam ae_clr_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam ae_clr_cmp_ci_a.INJECT1_0 = "NO";
    defparam ae_clr_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C ae_clr_cmp_0 (.A0(fcnt_en_inv_inv), .B0(fcount_0), .C0(VCC_net), 
          .D0(VCC_net), .A1(cnt_con), .B1(fcount_1), .C1(VCC_net), .D1(VCC_net), 
          .CIN(cmp_ci_3), .COUT(co0_6)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(746[19:24])
    defparam ae_clr_cmp_0.INIT0 = 16'b1001100110101010;
    defparam ae_clr_cmp_0.INIT1 = 16'b1001100110101010;
    defparam ae_clr_cmp_0.INJECT1_0 = "NO";
    defparam ae_clr_cmp_0.INJECT1_1 = "NO";
    CCU2C ae_clr_cmp_1 (.A0(cnt_con_inv), .B0(fcount_2), .C0(VCC_net), 
          .D0(VCC_net), .A1(VCC_net), .B1(fcount_3), .C1(VCC_net), .D1(VCC_net), 
          .CIN(co0_6), .COUT(co1_6)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(754[19:24])
    defparam ae_clr_cmp_1.INIT0 = 16'b1001100110101010;
    defparam ae_clr_cmp_1.INIT1 = 16'b1001100110101010;
    defparam ae_clr_cmp_1.INJECT1_0 = "NO";
    defparam ae_clr_cmp_1.INJECT1_1 = "NO";
    CCU2C ae_clr_cmp_2 (.A0(GND_net), .B0(fcount_4), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_5), .C1(VCC_net), .D1(VCC_net), .CIN(co1_6), 
          .COUT(co2_6)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(761[19:24])
    defparam ae_clr_cmp_2.INIT0 = 16'b1001100110101010;
    defparam ae_clr_cmp_2.INIT1 = 16'b1001100110101010;
    defparam ae_clr_cmp_2.INJECT1_0 = "NO";
    defparam ae_clr_cmp_2.INJECT1_1 = "NO";
    CCU2C ae_clr_cmp_3 (.A0(GND_net), .B0(fcount_6), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_7), .C1(VCC_net), .D1(VCC_net), .CIN(co2_6), 
          .COUT(co3_6)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(768[19:24])
    defparam ae_clr_cmp_3.INIT0 = 16'b1001100110101010;
    defparam ae_clr_cmp_3.INIT1 = 16'b1001100110101010;
    defparam ae_clr_cmp_3.INJECT1_0 = "NO";
    defparam ae_clr_cmp_3.INJECT1_1 = "NO";
    CCU2C ae_clr_cmp_4 (.A0(GND_net), .B0(fcount_8), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_9), .C1(VCC_net), .D1(VCC_net), .CIN(co3_6), 
          .COUT(ae_clr_d_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(775[19:24])
    defparam ae_clr_cmp_4.INIT0 = 16'b1001100110101010;
    defparam ae_clr_cmp_4.INIT1 = 16'b1001100110101010;
    defparam ae_clr_cmp_4.INJECT1_0 = "NO";
    defparam ae_clr_cmp_4.INJECT1_1 = "NO";
    CCU2C a3 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(ae_clr_d_c), 
          .S0(ae_clr_d)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(783[9:14])
    defparam a3.INIT0 = 16'b0110011010101010;
    defparam a3.INIT1 = 16'b0110011010101010;
    defparam a3.INJECT1_0 = "NO";
    defparam a3.INJECT1_1 = "NO";
    CCU2C af_set_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci_4)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(791[22:27])
    defparam af_set_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam af_set_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam af_set_cmp_ci_a.INJECT1_0 = "NO";
    defparam af_set_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C af_set_cmp_0 (.A0(fcount_0), .B0(fcnt_en_inv_inv), .C0(VCC_net), 
          .D0(VCC_net), .A1(fcount_1), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), 
          .CIN(cmp_ci_4), .COUT(co0_7)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(798[19:24])
    defparam af_set_cmp_0.INIT0 = 16'b1001100110101010;
    defparam af_set_cmp_0.INIT1 = 16'b1001100110101010;
    defparam af_set_cmp_0.INJECT1_0 = "NO";
    defparam af_set_cmp_0.INJECT1_1 = "NO";
    CCU2C af_set_cmp_1 (.A0(fcount_2), .B0(cnt_con_inv), .C0(VCC_net), 
          .D0(VCC_net), .A1(fcount_3), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), 
          .CIN(co0_7), .COUT(co1_7)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(806[19:24])
    defparam af_set_cmp_1.INIT0 = 16'b1001100110101010;
    defparam af_set_cmp_1.INIT1 = 16'b1001100110101010;
    defparam af_set_cmp_1.INJECT1_0 = "NO";
    defparam af_set_cmp_1.INJECT1_1 = "NO";
    CCU2C af_set_cmp_2 (.A0(fcount_4), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_5), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .CIN(co1_7), 
          .COUT(co2_7)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(813[19:24])
    defparam af_set_cmp_2.INIT0 = 16'b1001100110101010;
    defparam af_set_cmp_2.INIT1 = 16'b1001100110101010;
    defparam af_set_cmp_2.INJECT1_0 = "NO";
    defparam af_set_cmp_2.INJECT1_1 = "NO";
    CCU2C af_set_cmp_3 (.A0(fcount_6), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_7), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .CIN(co2_7), 
          .COUT(co3_7)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(820[19:24])
    defparam af_set_cmp_3.INIT0 = 16'b1001100110101010;
    defparam af_set_cmp_3.INIT1 = 16'b1001100110101010;
    defparam af_set_cmp_3.INJECT1_0 = "NO";
    defparam af_set_cmp_3.INJECT1_1 = "NO";
    CCU2C af_set_cmp_4 (.A0(fcount_8), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_9), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co3_7), 
          .COUT(af_set_d_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(827[19:24])
    defparam af_set_cmp_4.INIT0 = 16'b1001100110101010;
    defparam af_set_cmp_4.INIT1 = 16'b1001100110101010;
    defparam af_set_cmp_4.INJECT1_0 = "NO";
    defparam af_set_cmp_4.INJECT1_1 = "NO";
    CCU2C a4 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(af_set_d_c), 
          .S0(af_set_d)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(835[9:14])
    defparam a4.INIT0 = 16'b0110011010101010;
    defparam a4.INIT1 = 16'b0110011010101010;
    defparam a4.INJECT1_0 = "NO";
    defparam a4.INJECT1_1 = "NO";
    CCU2C af_clr_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci_5)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(843[22:27])
    defparam af_clr_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam af_clr_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam af_clr_cmp_ci_a.INJECT1_0 = "NO";
    defparam af_clr_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C af_clr_cmp_0 (.A0(fcount_0), .B0(fcnt_en_inv_inv), .C0(VCC_net), 
          .D0(VCC_net), .A1(fcount_1), .B1(cnt_con_inv), .C1(VCC_net), 
          .D1(VCC_net), .CIN(cmp_ci_5), .COUT(co0_8)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(850[19:24])
    defparam af_clr_cmp_0.INIT0 = 16'b1001100110101010;
    defparam af_clr_cmp_0.INIT1 = 16'b1001100110101010;
    defparam af_clr_cmp_0.INJECT1_0 = "NO";
    defparam af_clr_cmp_0.INJECT1_1 = "NO";
    CCU2C af_clr_cmp_1 (.A0(fcount_2), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_3), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_8), 
          .COUT(co1_8)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(858[19:24])
    defparam af_clr_cmp_1.INIT0 = 16'b1001100110101010;
    defparam af_clr_cmp_1.INIT1 = 16'b1001100110101010;
    defparam af_clr_cmp_1.INJECT1_0 = "NO";
    defparam af_clr_cmp_1.INJECT1_1 = "NO";
    CCU2C af_clr_cmp_2 (.A0(fcount_4), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_5), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .CIN(co1_8), 
          .COUT(co2_8)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(865[19:24])
    defparam af_clr_cmp_2.INIT0 = 16'b1001100110101010;
    defparam af_clr_cmp_2.INIT1 = 16'b1001100110101010;
    defparam af_clr_cmp_2.INJECT1_0 = "NO";
    defparam af_clr_cmp_2.INJECT1_1 = "NO";
    CCU2C af_clr_cmp_3 (.A0(fcount_6), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_7), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .CIN(co2_8), 
          .COUT(co3_8)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(872[19:24])
    defparam af_clr_cmp_3.INIT0 = 16'b1001100110101010;
    defparam af_clr_cmp_3.INIT1 = 16'b1001100110101010;
    defparam af_clr_cmp_3.INJECT1_0 = "NO";
    defparam af_clr_cmp_3.INJECT1_1 = "NO";
    CCU2C af_clr_cmp_4 (.A0(fcount_8), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_9), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co3_8), 
          .COUT(af_clr_d_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(879[19:24])
    defparam af_clr_cmp_4.INIT0 = 16'b1001100110101010;
    defparam af_clr_cmp_4.INIT1 = 16'b1001100110101010;
    defparam af_clr_cmp_4.INJECT1_0 = "NO";
    defparam af_clr_cmp_4.INJECT1_1 = "NO";
    CCU2C a5 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(af_clr_d_c), 
          .S0(af_clr_d)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(893[9:14])
    defparam a5.INIT0 = 16'b0110011010101010;
    defparam a5.INIT1 = 16'b0110011010101010;
    defparam a5.INJECT1_0 = "NO";
    defparam a5.INJECT1_1 = "NO";
    AND2 AND2_t3 (.A(read_large_fifo), .B(invout_1), .Z(rden_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(225[14:18])
    XOR2 XOR2_t1 (.A(wren_i), .B(rden_i), .Z(fcnt_en)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifolg.vhd(234[14:18])
    INV INV_6 (.A(rden_i), .Z(rden_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(378[20:38])
    INV INV_5 (.A(wren_i), .Z(wren_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(378[20:38])
    ROM16X1A LUT4_3 (.AD0(fifo_empty), .AD1(wren_i), .AD2(cmp_le_1), .AD3(GND_net), 
            .DO0(empty_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(378[20:38])
    defparam LUT4_3.initval = 16'b0011001000110010;
    ROM16X1A LUT4_2 (.AD0(large_fifo_full), .AD1(rden_i), .AD2(cmp_ge_d1), 
            .AD3(GND_net), .DO0(full_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(378[20:38])
    defparam LUT4_2.initval = 16'b0011001000110010;
    INV INV_3 (.A(fcnt_en), .Z(fcnt_en_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(378[20:38])
    INV INV_2 (.A(cnt_con), .Z(cnt_con_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(378[20:38])
    INV INV_0 (.A(fcnt_en_inv), .Z(fcnt_en_inv_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(378[20:38])
    ROM16X1A LUT4_1 (.AD0(GND_net), .AD1(ae_clr_d), .AD2(ae_set_d), .AD3(fifo_almostempty), 
            .DO0(ae_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(378[20:38])
    defparam LUT4_1.initval = 16'b0100010001010000;
    ROM16X1A LUT4_0 (.AD0(GND_net), .AD1(af_clr_d), .AD2(af_set_d), .AD3(large_fifo_almost_full), 
            .DO0(af_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(378[20:38])
    defparam LUT4_0.initval = 16'b0100010001010000;
    PDPW16KD pdp_ram_0_0_0 (.DI0(large_fifo_din[0]), .DI1(large_fifo_din[1]), 
            .DI2(large_fifo_din[2]), .DI3(large_fifo_din[3]), .DI4(large_fifo_din[4]), 
            .DI5(large_fifo_din[5]), .DI6(large_fifo_din[6]), .DI7(large_fifo_din[7]), 
            .DI8(GND_net), .DI9(GND_net), .DI10(GND_net), .DI11(GND_net), 
            .DI12(GND_net), .DI13(GND_net), .DI14(GND_net), .DI15(GND_net), 
            .DI16(GND_net), .DI17(GND_net), .DI18(GND_net), .DI19(GND_net), 
            .DI20(GND_net), .DI21(GND_net), .DI22(GND_net), .DI23(GND_net), 
            .DI24(GND_net), .DI25(GND_net), .DI26(GND_net), .DI27(GND_net), 
            .DI28(GND_net), .DI29(GND_net), .DI30(GND_net), .DI31(GND_net), 
            .DI32(GND_net), .DI33(GND_net), .DI34(GND_net), .DI35(GND_net), 
            .ADW0(wcount_0), .ADW1(wcount_1), .ADW2(wcount_2), .ADW3(wcount_3), 
            .ADW4(wcount_4), .ADW5(wcount_5), .ADW6(wcount_6), .ADW7(wcount_7), 
            .ADW8(wcount_8), .BE0(VCC_net), .BE1(VCC_net), .BE2(VCC_net), 
            .BE3(VCC_net), .CEW(wren_i), .CLKW(clk_c), .CSW0(VCC_net), 
            .CSW1(GND_net), .CSW2(GND_net), .ADR0(GND_net), .ADR1(GND_net), 
            .ADR2(GND_net), .ADR3(GND_net), .ADR4(GND_net), .ADR5(rcount_0), 
            .ADR6(rcount_1), .ADR7(rcount_2), .ADR8(rcount_3), .ADR9(rcount_4), 
            .ADR10(rcount_5), .ADR11(rcount_6), .ADR12(rcount_7), .ADR13(rcount_8), 
            .CER(rden_i), .OCER(rden_i), .CLKR(clk_c), .CSR0(GND_net), 
            .CSR1(GND_net), .CSR2(GND_net), .RST(rst_c), .DO18(data_out_large_fifo[0]), 
            .DO19(data_out_large_fifo[1]), .DO20(data_out_large_fifo[2]), 
            .DO21(data_out_large_fifo[3]), .DO22(data_out_large_fifo[4]), 
            .DO23(data_out_large_fifo[5]), .DO24(data_out_large_fifo[6]), 
            .DO25(data_out_large_fifo[7])) /* synthesis syn_black_box=true, MEM_LPC_FILE="Fifolg.lpc", MEM_INIT_FILE="", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=20, LSE_RCOL=38, LSE_LLINE=378, LSE_RLINE=378 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(378[20:38])
    defparam pdp_ram_0_0_0.DATA_WIDTH_W = 36;
    defparam pdp_ram_0_0_0.DATA_WIDTH_R = 36;
    defparam pdp_ram_0_0_0.GSR = "ENABLED";
    defparam pdp_ram_0_0_0.REGMODE = "NOREG";
    defparam pdp_ram_0_0_0.RESETMODE = "ASYNC";
    defparam pdp_ram_0_0_0.ASYNC_RESET_RELEASE = "SYNC";
    defparam pdp_ram_0_0_0.CSDECODE_W = "0b001";
    defparam pdp_ram_0_0_0.CSDECODE_R = "0b000";
    defparam pdp_ram_0_0_0.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_20 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_21 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_22 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_23 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_24 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_25 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_26 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_27 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_28 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_29 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_30 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_31 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_32 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_33 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_34 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_35 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_36 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_37 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_38 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_39 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INIT_DATA = "STATIC";
    
endmodule
//
// Verilog Description of module FIFOsm
//

module FIFOsm (clk_c, \adc_fifo_empty[9] , GND_net, VCC_net, Write_En_c, 
            \adc_fifo_rd_en[9] , \Data_x4[22] , \Data_x4[21] , \Data_x4[20] , 
            \Data_x4[19] , \Data_x4[18] , \Data_x4[17] , \Data_x4[16] , 
            \Data_x4[15] , \Data_x4[14] , \Data_x4[13] , \Data_x4[12] , 
            \Data_x4[11] , \Data_x4[10] , \Data_x4[9] , \Data_x4[8] , 
            \Data_x4[7] , \Data_x4[6] , \Data_x4[5] , \Data_x4[4] , 
            \Data_x4[3] , \Data_x4[2] , \Data_x4[1] , \Data_x4[0] , 
            rst_c, adc_fifo_9_dout) /* synthesis NGD_DRC_MASK=1 */ ;
    input clk_c;
    output \adc_fifo_empty[9] ;
    input GND_net;
    input VCC_net;
    input Write_En_c;
    input \adc_fifo_rd_en[9] ;
    input \Data_x4[22] ;
    input \Data_x4[21] ;
    input \Data_x4[20] ;
    input \Data_x4[19] ;
    input \Data_x4[18] ;
    input \Data_x4[17] ;
    input \Data_x4[16] ;
    input \Data_x4[15] ;
    input \Data_x4[14] ;
    input \Data_x4[13] ;
    input \Data_x4[12] ;
    input \Data_x4[11] ;
    input \Data_x4[10] ;
    input \Data_x4[9] ;
    input \Data_x4[8] ;
    input \Data_x4[7] ;
    input \Data_x4[6] ;
    input \Data_x4[5] ;
    input \Data_x4[4] ;
    input \Data_x4[3] ;
    input \Data_x4[2] ;
    input \Data_x4[1] ;
    input \Data_x4[0] ;
    input rst_c;
    output [23:0]adc_fifo_9_dout;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    
    wire fcount_1, fcnt_en, ifcount_1, fcount_2, ifcount_2, empty_d, 
        Full, full_d, wcount_0, wren_i, iwcount_0, wcount_1, iwcount_1, 
        rcount_0, rden_i, ircount_0, rcount_1, ircount_1, fcount_0, 
        ifcount_0, bdcnt_bctr_ci, cnt_con, co0, cmp_ci, co0_1, cmp_le_1_c, 
        cmp_le_1, cmp_ci_1, co0_2, wren_i_inv, cmp_ge_d1_c, cmp_ge_d1, 
        w_ctr_ci, r_ctr_ci, invout_2, invout_1, rden_i_inv;
    
    FD1P3AX FF_11 (.D(ifcount_1), .SP(fcnt_en), .CK(clk_c), .Q(fcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(232[12:19])
    defparam FF_11.GSR = "ENABLED";
    FD1P3AX FF_10 (.D(ifcount_2), .SP(fcnt_en), .CK(clk_c), .Q(fcount_2)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(236[12:19])
    defparam FF_10.GSR = "ENABLED";
    FD1S3AY FF_9 (.D(empty_d), .CK(clk_c), .Q(\adc_fifo_empty[9] )) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(240[11:18])
    defparam FF_9.GSR = "ENABLED";
    FD1S3AX FF_8 (.D(full_d), .CK(clk_c), .Q(Full)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(243[11:18])
    defparam FF_8.GSR = "ENABLED";
    FD1P3AX FF_7 (.D(iwcount_0), .SP(wren_i), .CK(clk_c), .Q(wcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(246[11:18])
    defparam FF_7.GSR = "ENABLED";
    FD1P3AX FF_6 (.D(iwcount_1), .SP(wren_i), .CK(clk_c), .Q(wcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(250[11:18])
    defparam FF_6.GSR = "ENABLED";
    FD1P3AX FF_4 (.D(ircount_0), .SP(rden_i), .CK(clk_c), .Q(rcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(258[11:18])
    defparam FF_4.GSR = "ENABLED";
    FD1P3AX FF_3 (.D(ircount_1), .SP(rden_i), .CK(clk_c), .Q(rcount_1)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(262[11:18])
    defparam FF_3.GSR = "ENABLED";
    FD1P3AX FF_12 (.D(ifcount_0), .SP(fcnt_en), .CK(clk_c), .Q(fcount_0)) /* synthesis syn_black_box=true, GSR="ENABLED", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(228[12:19])
    defparam FF_12.GSR = "ENABLED";
    CCU2C bdcnt_bctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(cnt_con), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .COUT(bdcnt_bctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(276[21:26])
    defparam bdcnt_bctr_cia.INIT0 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INIT1 = 16'b0110011010101010;
    defparam bdcnt_bctr_cia.INJECT1_0 = "NO";
    defparam bdcnt_bctr_cia.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_0 (.A0(fcount_0), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(bdcnt_bctr_ci), 
          .COUT(co0), .S0(ifcount_0), .S1(ifcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(283[19:24])
    defparam bdcnt_bctr_0.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_0.INJECT1_0 = "NO";
    defparam bdcnt_bctr_0.INJECT1_1 = "NO";
    CCU2C bdcnt_bctr_1 (.A0(fcount_2), .B0(cnt_con), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(cnt_con), .C1(VCC_net), .D1(VCC_net), .CIN(co0), 
          .S0(ifcount_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(290[19:24])
    defparam bdcnt_bctr_1.INIT0 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INIT1 = 16'b1001100110101010;
    defparam bdcnt_bctr_1.INJECT1_0 = "NO";
    defparam bdcnt_bctr_1.INJECT1_1 = "NO";
    CCU2C e_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(297[17:22])
    defparam e_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam e_cmp_ci_a.INJECT1_0 = "NO";
    defparam e_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C e_cmp_0 (.A0(rden_i), .B0(fcount_0), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(fcount_1), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci), 
          .COUT(co0_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(304[14:19])
    defparam e_cmp_0.INIT0 = 16'b1001100110101010;
    defparam e_cmp_0.INIT1 = 16'b1001100110101010;
    defparam e_cmp_0.INJECT1_0 = "NO";
    defparam e_cmp_0.INJECT1_1 = "NO";
    CCU2C e_cmp_1 (.A0(GND_net), .B0(fcount_2), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_1), 
          .COUT(cmp_le_1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(311[14:19])
    defparam e_cmp_1.INIT0 = 16'b1001100110101010;
    defparam e_cmp_1.INIT1 = 16'b1001100110101010;
    defparam e_cmp_1.INJECT1_0 = "NO";
    defparam e_cmp_1.INJECT1_1 = "NO";
    CCU2C a0 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_le_1_c), 
          .S0(cmp_le_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(319[9:14])
    defparam a0.INIT0 = 16'b0110011010101010;
    defparam a0.INIT1 = 16'b0110011010101010;
    defparam a0.INJECT1_0 = "NO";
    defparam a0.INJECT1_1 = "NO";
    CCU2C g_cmp_ci_a (.A0(VCC_net), .B0(VCC_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(cmp_ci_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(327[17:22])
    defparam g_cmp_ci_a.INIT0 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INIT1 = 16'b0110011010101010;
    defparam g_cmp_ci_a.INJECT1_0 = "NO";
    defparam g_cmp_ci_a.INJECT1_1 = "NO";
    CCU2C g_cmp_0 (.A0(fcount_0), .B0(wren_i), .C0(VCC_net), .D0(VCC_net), 
          .A1(fcount_1), .B1(wren_i), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ci_1), 
          .COUT(co0_2)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(334[14:19])
    defparam g_cmp_0.INIT0 = 16'b1001100110101010;
    defparam g_cmp_0.INIT1 = 16'b1001100110101010;
    defparam g_cmp_0.INJECT1_0 = "NO";
    defparam g_cmp_0.INJECT1_1 = "NO";
    CCU2C g_cmp_1 (.A0(fcount_2), .B0(wren_i_inv), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(co0_2), 
          .COUT(cmp_ge_d1_c)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(341[14:19])
    defparam g_cmp_1.INIT0 = 16'b1001100110101010;
    defparam g_cmp_1.INIT1 = 16'b1001100110101010;
    defparam g_cmp_1.INJECT1_0 = "NO";
    defparam g_cmp_1.INJECT1_1 = "NO";
    CCU2C a1 (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(cmp_ge_d1_c), 
          .S0(cmp_ge_d1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(349[9:14])
    defparam a1.INIT0 = 16'b0110011010101010;
    defparam a1.INIT1 = 16'b0110011010101010;
    defparam a1.INJECT1_0 = "NO";
    defparam a1.INJECT1_1 = "NO";
    CCU2C w_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(w_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(357[16:21])
    defparam w_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam w_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam w_ctr_cia.INJECT1_0 = "NO";
    defparam w_ctr_cia.INJECT1_1 = "NO";
    CCU2C w_ctr_0 (.A0(wcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(wcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(w_ctr_ci), 
          .S0(iwcount_0), .S1(iwcount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(364[14:19])
    defparam w_ctr_0.INIT0 = 16'b0110011010101010;
    defparam w_ctr_0.INIT1 = 16'b0110011010101010;
    defparam w_ctr_0.INJECT1_0 = "NO";
    defparam w_ctr_0.INJECT1_1 = "NO";
    CCU2C r_ctr_cia (.A0(GND_net), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(VCC_net), .B1(VCC_net), .C1(VCC_net), .D1(VCC_net), .COUT(r_ctr_ci)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(380[16:21])
    defparam r_ctr_cia.INIT0 = 16'b0110011010101010;
    defparam r_ctr_cia.INIT1 = 16'b0110011010101010;
    defparam r_ctr_cia.INJECT1_0 = "NO";
    defparam r_ctr_cia.INJECT1_1 = "NO";
    CCU2C r_ctr_0 (.A0(rcount_0), .B0(GND_net), .C0(VCC_net), .D0(VCC_net), 
          .A1(rcount_1), .B1(GND_net), .C1(VCC_net), .D1(VCC_net), .CIN(r_ctr_ci), 
          .S0(ircount_0), .S1(ircount_1)) /* synthesis syn_black_box=true, syn_unconnected_inputs="CIN", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(387[14:19])
    defparam r_ctr_0.INIT0 = 16'b0110011010101010;
    defparam r_ctr_0.INIT1 = 16'b0110011010101010;
    defparam r_ctr_0.INJECT1_0 = "NO";
    defparam r_ctr_0.INJECT1_1 = "NO";
    AND2 AND2_t4 (.A(Write_En_c), .B(invout_2), .Z(wren_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(129[14:18])
    INV INV_8 (.A(Full), .Z(invout_2)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(281[17:35])
    AND2 AND2_t3 (.A(\adc_fifo_rd_en[9] ), .B(invout_1), .Z(rden_i)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(135[14:18])
    INV INV_7 (.A(\adc_fifo_empty[9] ), .Z(invout_1)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(281[17:35])
    AND2 AND2_t2 (.A(wren_i), .B(rden_i_inv), .Z(cnt_con)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(141[14:18])
    XOR2 XOR2_t1 (.A(wren_i), .B(rden_i), .Z(fcnt_en)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/fifosm.vhd(144[14:18])
    INV INV_6 (.A(rden_i), .Z(rden_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(281[17:35])
    INV INV_5 (.A(wren_i), .Z(wren_i_inv)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(281[17:35])
    ROM16X1A LUT4_3 (.AD0(\adc_fifo_empty[9] ), .AD1(wren_i), .AD2(cmp_le_1), 
            .AD3(GND_net), .DO0(empty_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(281[17:35])
    defparam LUT4_3.initval = 16'b0011001000110010;
    ROM16X1A LUT4_2 (.AD0(Full), .AD1(rden_i), .AD2(cmp_ge_d1), .AD3(GND_net), 
            .DO0(full_d)) /* synthesis syn_black_box=true, syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(281[17:35])
    defparam LUT4_2.initval = 16'b0011001000110010;
    PDPW16KD pdp_ram_0_0_0 (.DI0(GND_net), .DI1(\Data_x4[0] ), .DI2(\Data_x4[1] ), 
            .DI3(\Data_x4[2] ), .DI4(\Data_x4[3] ), .DI5(\Data_x4[4] ), 
            .DI6(\Data_x4[5] ), .DI7(\Data_x4[6] ), .DI8(\Data_x4[7] ), 
            .DI9(\Data_x4[8] ), .DI10(\Data_x4[9] ), .DI11(\Data_x4[10] ), 
            .DI12(\Data_x4[11] ), .DI13(\Data_x4[12] ), .DI14(\Data_x4[13] ), 
            .DI15(\Data_x4[14] ), .DI16(\Data_x4[15] ), .DI17(\Data_x4[16] ), 
            .DI18(\Data_x4[17] ), .DI19(\Data_x4[18] ), .DI20(\Data_x4[19] ), 
            .DI21(\Data_x4[20] ), .DI22(\Data_x4[21] ), .DI23(\Data_x4[22] ), 
            .DI24(GND_net), .DI25(GND_net), .DI26(GND_net), .DI27(GND_net), 
            .DI28(GND_net), .DI29(GND_net), .DI30(GND_net), .DI31(GND_net), 
            .DI32(GND_net), .DI33(GND_net), .DI34(GND_net), .DI35(GND_net), 
            .ADW0(wcount_0), .ADW1(wcount_1), .ADW2(GND_net), .ADW3(GND_net), 
            .ADW4(GND_net), .ADW5(GND_net), .ADW6(GND_net), .ADW7(GND_net), 
            .ADW8(GND_net), .BE0(VCC_net), .BE1(VCC_net), .BE2(VCC_net), 
            .BE3(VCC_net), .CEW(wren_i), .CLKW(clk_c), .CSW0(VCC_net), 
            .CSW1(GND_net), .CSW2(GND_net), .ADR0(GND_net), .ADR1(GND_net), 
            .ADR2(GND_net), .ADR3(GND_net), .ADR4(GND_net), .ADR5(rcount_0), 
            .ADR6(rcount_1), .ADR7(GND_net), .ADR8(GND_net), .ADR9(GND_net), 
            .ADR10(GND_net), .ADR11(GND_net), .ADR12(GND_net), .ADR13(GND_net), 
            .CER(rden_i), .OCER(rden_i), .CLKR(clk_c), .CSR0(GND_net), 
            .CSR1(GND_net), .CSR2(GND_net), .RST(rst_c), .DO0(adc_fifo_9_dout[18]), 
            .DO1(adc_fifo_9_dout[19]), .DO2(adc_fifo_9_dout[20]), .DO3(adc_fifo_9_dout[21]), 
            .DO4(adc_fifo_9_dout[22]), .DO5(adc_fifo_9_dout[23]), .DO18(adc_fifo_9_dout[0]), 
            .DO19(adc_fifo_9_dout[1]), .DO20(adc_fifo_9_dout[2]), .DO21(adc_fifo_9_dout[3]), 
            .DO22(adc_fifo_9_dout[4]), .DO23(adc_fifo_9_dout[5]), .DO24(adc_fifo_9_dout[6]), 
            .DO25(adc_fifo_9_dout[7]), .DO26(adc_fifo_9_dout[8]), .DO27(adc_fifo_9_dout[9]), 
            .DO28(adc_fifo_9_dout[10]), .DO29(adc_fifo_9_dout[11]), .DO30(adc_fifo_9_dout[12]), 
            .DO31(adc_fifo_9_dout[13]), .DO32(adc_fifo_9_dout[14]), .DO33(adc_fifo_9_dout[15]), 
            .DO34(adc_fifo_9_dout[16]), .DO35(adc_fifo_9_dout[17])) /* synthesis syn_black_box=true, MEM_LPC_FILE="FIFOsm.lpc", MEM_INIT_FILE="", syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=17, LSE_RCOL=35, LSE_LLINE=281, LSE_RLINE=281 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(281[17:35])
    defparam pdp_ram_0_0_0.DATA_WIDTH_W = 36;
    defparam pdp_ram_0_0_0.DATA_WIDTH_R = 36;
    defparam pdp_ram_0_0_0.GSR = "ENABLED";
    defparam pdp_ram_0_0_0.REGMODE = "NOREG";
    defparam pdp_ram_0_0_0.RESETMODE = "ASYNC";
    defparam pdp_ram_0_0_0.ASYNC_RESET_RELEASE = "SYNC";
    defparam pdp_ram_0_0_0.CSDECODE_W = "0b001";
    defparam pdp_ram_0_0_0.CSDECODE_R = "0b000";
    defparam pdp_ram_0_0_0.INITVAL_00 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_01 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_02 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_03 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_04 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_05 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_06 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_07 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_08 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_09 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_0F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_10 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_11 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_12 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_13 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_14 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_15 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_16 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_17 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_18 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_19 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_1F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_20 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_21 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_22 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_23 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_24 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_25 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_26 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_27 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_28 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_29 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_2F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_30 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_31 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_32 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_33 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_34 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_35 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_36 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_37 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_38 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_39 = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3A = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3B = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3C = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3D = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3E = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INITVAL_3F = "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000";
    defparam pdp_ram_0_0_0.INIT_DATA = "STATIC";
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

//
// Verilog Description of module UDP_FIFO_AXI
//

module UDP_FIFO_AXI (n2187, rst_c, n2186, fifo_rd_en_N_404, GND_net, 
            VCC_net, n2296, n11984, n399, n11968, n11907, \reg_fifo_data[7] , 
            n2185, n11921, n11945, n11917, crc_cnt, n11839, \reg_fifo_data[1] , 
            \udp_tdata[1] , reg_fifo_empty, n11929, clk_c, n5703, 
            n9742, n2297, n11954, n1, clk_c_enable_73, n11931, n10056, 
            n11923, \reg_fifo_data[5] , \udp_tdata[5] , \reg_fifo_data[4] , 
            \udp_tdata[4] , \reg_fifo_data[0] , \udp_tdata[0] , \reg_fifo_data[2] , 
            \udp_tdata[2] , \reg_fifo_data[6] , n11919, n2184, n11912, 
            reg_fifo_almostfull, n11913, n2298, n2315, n11915, \crc_next[2] , 
            \crc_reg[2] , \next_crc_reg_31__N_594[2] , fifo_rd_en_in, 
            n11916, n11918, n5461, n11911, \crc_reg[9] , \next_crc_reg_31__N_594[9] , 
            n15, \crc_next[12] , \crc_reg[12] , \next_crc_reg_31__N_594[12] , 
            n11942, n2268, n5459, \crc_reg[25] , \crc_reg[1] , \crc_reg[17] );
    output n2187;
    input rst_c;
    output n2186;
    output fifo_rd_en_N_404;
    input GND_net;
    input VCC_net;
    input n2296;
    output n11984;
    input n399;
    output n11968;
    output n11907;
    input \reg_fifo_data[7] ;
    output n2185;
    output n11921;
    output n11945;
    output n11917;
    input [1:0]crc_cnt;
    output n11839;
    input \reg_fifo_data[1] ;
    output \udp_tdata[1] ;
    input reg_fifo_empty;
    output n11929;
    input clk_c;
    output n5703;
    input n9742;
    input n2297;
    input n11954;
    output n1;
    input clk_c_enable_73;
    input n11931;
    output n10056;
    input n11923;
    input \reg_fifo_data[5] ;
    output \udp_tdata[5] ;
    input \reg_fifo_data[4] ;
    output \udp_tdata[4] ;
    input \reg_fifo_data[0] ;
    output \udp_tdata[0] ;
    input \reg_fifo_data[2] ;
    output \udp_tdata[2] ;
    input \reg_fifo_data[6] ;
    output n11919;
    output n2184;
    output n11912;
    input reg_fifo_almostfull;
    output n11913;
    input n2298;
    output n2315;
    output n11915;
    input \crc_next[2] ;
    input \crc_reg[2] ;
    output \next_crc_reg_31__N_594[2] ;
    output fifo_rd_en_in;
    output n11916;
    output n11918;
    input n5461;
    input n11911;
    input \crc_reg[9] ;
    output \next_crc_reg_31__N_594[9] ;
    output n15;
    input \crc_next[12] ;
    input \crc_reg[12] ;
    output \next_crc_reg_31__N_594[12] ;
    output n11942;
    output n2268;
    input n5459;
    input \crc_reg[25] ;
    input \crc_reg[1] ;
    input \crc_reg[17] ;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    wire [7:0]idx;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(62[12:15])
    
    wire n10812, n10734, n10187, n10738, n10109;
    wire [7:0]n2181;
    
    wire n11962;
    wire [7:0]t_data_7__N_296;
    wire [7:0]t_data_7__N_304;
    
    wire n11631, n11717, n10562, n5429;
    wire [7:0]n3207;
    
    wire n11963, n11958, n9657, n9007;
    wire [7:0]n37;
    
    wire n9008, n10756, n11964, n9870, n5711, n11838, n11837, 
        n15_c, n11632, n5729, n5466, n11949, n11895;
    wire [7:0]t_data_7__N_288;
    
    wire n6, n10760, n9744, next_state_2__N_398, n11800, n11799, 
        n11798, n7, n11783, n11630, n6371, n11716, n11782, n11784, 
        n10955, n11897, n5709, n10193, n10732, n5707;
    wire [7:0]n3187;
    
    wire n5705, n11718, n5464, n5462, n5460, n5458, n2206, n15_adj_893, 
        n11960, n9010, n11959, n11941, n9009, n11994, n14, n11993, 
        n11997, n12001, n11996, n12000, n11999;
    
    LUT4 i1_4_lut (.A(idx[3]), .B(n2187), .C(idx[1]), .D(idx[4]), .Z(n10812)) /* synthesis lut_function=(!(A+!(B (C (D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(110[39:42])
    defparam i1_4_lut.init = 16'h4000;
    LUT4 i1_4_lut_adj_182 (.A(n10734), .B(n10187), .C(n10738), .D(idx[3]), 
         .Z(n10109)) /* synthesis lut_function=(A (B+!((D)+!C))) */ ;
    defparam i1_4_lut_adj_182.init = 16'h88a8;
    LUT4 i575_2_lut_rep_216 (.A(n2181[1]), .B(n2187), .Z(n11962)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i575_2_lut_rep_216.init = 16'heeee;
    LUT4 i1_2_lut (.A(idx[4]), .B(idx[2]), .Z(n10734)) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i1_2_lut.init = 16'h4444;
    LUT4 t_data_7__N_304_1__bdd_4_lut_7410_4_lut (.A(n2181[1]), .B(n2187), 
         .C(t_data_7__N_296[1]), .D(t_data_7__N_304[1]), .Z(n11631)) /* synthesis lut_function=(A (B (C)+!B (D))+!A (B (C))) */ ;
    defparam t_data_7__N_304_1__bdd_4_lut_7410_4_lut.init = 16'he2c0;
    LUT4 t_data_7__N_304_2__bdd_4_lut_7399_4_lut (.A(n2181[1]), .B(n2187), 
         .C(t_data_7__N_296[2]), .D(t_data_7__N_304[2]), .Z(n11717)) /* synthesis lut_function=(A (B (C)+!B (D))+!A (B (C))) */ ;
    defparam t_data_7__N_304_2__bdd_4_lut_7399_4_lut.init = 16'he2c0;
    LUT4 i1_4_lut_adj_183 (.A(n2181[1]), .B(idx[1]), .C(idx[3]), .D(rst_c), 
         .Z(n10187)) /* synthesis lut_function=(!((B+((D)+!C))+!A)) */ ;
    defparam i1_4_lut_adj_183.init = 16'h0020;
    LUT4 i1_2_lut_adj_184 (.A(idx[1]), .B(n2186), .Z(n10738)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam i1_2_lut_adj_184.init = 16'h8888;
    LUT4 i1_2_lut_3_lut (.A(n2181[1]), .B(n2187), .C(n2186), .Z(n10562)) /* synthesis lut_function=(!(A (C)+!A ((C)+!B))) */ ;
    defparam i1_2_lut_3_lut.init = 16'h0e0e;
    LUT4 i2909_4_lut_4_lut (.A(n2181[1]), .B(n2187), .C(t_data_7__N_296[4]), 
         .D(n5429), .Z(n3207[4])) /* synthesis lut_function=(A (B (C)+!B !(D))+!A (B (C))) */ ;
    defparam i2909_4_lut_4_lut.init = 16'hc0e2;
    LUT4 i1_2_lut_rep_217 (.A(idx[1]), .B(idx[2]), .Z(n11963)) /* synthesis lut_function=(A (B)) */ ;
    defparam i1_2_lut_rep_217.init = 16'h8888;
    LUT4 i7267_2_lut_4_lut (.A(idx[0]), .B(idx[1]), .C(n11958), .D(n9657), 
         .Z(fifo_rd_en_N_404)) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i7267_2_lut_4_lut.init = 16'h0008;
    CCU2C idx_703_add_4_3 (.A0(idx[1]), .B0(GND_net), .C0(GND_net), .D0(VCC_net), 
          .A1(idx[2]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), .CIN(n9007), 
          .COUT(n9008), .S0(n37[1]), .S1(n37[2]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam idx_703_add_4_3.INIT0 = 16'haaa0;
    defparam idx_703_add_4_3.INIT1 = 16'haaa0;
    defparam idx_703_add_4_3.INJECT1_0 = "NO";
    defparam idx_703_add_4_3.INJECT1_1 = "NO";
    LUT4 i1_2_lut_adj_185 (.A(idx[7]), .B(idx[6]), .Z(n10756)) /* synthesis lut_function=(A+(B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[21] 156[28])
    defparam i1_2_lut_adj_185.init = 16'heeee;
    LUT4 i1_2_lut_rep_161_3_lut_4_lut (.A(n2296), .B(n11984), .C(n399), 
         .D(n11968), .Z(n11907)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)) */ ;
    defparam i1_2_lut_rep_161_3_lut_4_lut.init = 16'h0200;
    LUT4 i7271_2_lut_rep_218 (.A(idx[2]), .B(idx[3]), .Z(n11964)) /* synthesis lut_function=(!(A+(B))) */ ;
    defparam i7271_2_lut_rep_218.init = 16'h1111;
    LUT4 i1_2_lut_3_lut_4_lut (.A(idx[2]), .B(idx[3]), .C(idx[1]), .D(idx[0]), 
         .Z(n9870)) /* synthesis lut_function=(!(A+(B+((D)+!C)))) */ ;
    defparam i1_2_lut_3_lut_4_lut.init = 16'h0010;
    LUT4 i1403_3_lut_rep_175 (.A(n5711), .B(\reg_fifo_data[7] ), .C(n2185), 
         .Z(n11921)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1403_3_lut_rep_175.init = 16'hcaca;
    LUT4 i2871_2_lut_rep_171_4_lut (.A(n5711), .B(\reg_fifo_data[7] ), .C(n2185), 
         .D(n11945), .Z(n11917)) /* synthesis lut_function=(!(A (B (D)+!B (C+(D)))+!A (((D)+!C)+!B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i2871_2_lut_rep_171_4_lut.init = 16'h00ca;
    PFUMX i7470 (.BLUT(n11838), .ALUT(n11837), .C0(crc_cnt[0]), .Z(n11839));
    LUT4 idx_4__I_0_Mux_0_i31_4_lut (.A(n15_c), .B(n11963), .C(n2187), 
         .D(idx[3]), .Z(t_data_7__N_296[0])) /* synthesis lut_function=(A (B (C)+!B (C+!(D)))+!A !(B+(C+(D)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(127[38:41])
    defparam idx_4__I_0_Mux_0_i31_4_lut.init = 16'ha0a3;
    LUT4 n11632_bdd_3_lut (.A(n11632), .B(\reg_fifo_data[1] ), .C(n2185), 
         .Z(\udp_tdata[1] )) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam n11632_bdd_3_lut.init = 16'hcaca;
    LUT4 i2798_4_lut (.A(idx[0]), .B(n5729), .C(n11964), .D(idx[4]), 
         .Z(t_data_7__N_296[5])) /* synthesis lut_function=(A (B (C+!(D))+!B (C (D)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(127[38:41])
    defparam i2798_4_lut.init = 16'ha088;
    LUT4 i198_2_lut_rep_222 (.A(reg_fifo_empty), .B(n2185), .Z(n11968)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i198_2_lut_rep_222.init = 16'h8888;
    LUT4 i1_2_lut_rep_183_3_lut_4_lut (.A(reg_fifo_empty), .B(n2185), .C(n11984), 
         .D(n2296), .Z(n11929)) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1_2_lut_rep_183_3_lut_4_lut.init = 16'h0800;
    FD1S3JX state_FSM_i1 (.D(n5466), .CK(clk_c), .PD(rst_c), .Q(n2181[0]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam state_FSM_i1.GSR = "DISABLED";
    CCU2C idx_703_add_4_1 (.A0(GND_net), .B0(GND_net), .C0(GND_net), .D0(GND_net), 
          .A1(idx[0]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), .COUT(n9007), 
          .S1(n37[0]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam idx_703_add_4_1.INIT0 = 16'h0000;
    defparam idx_703_add_4_1.INIT1 = 16'h555f;
    defparam idx_703_add_4_1.INJECT1_0 = "NO";
    defparam idx_703_add_4_1.INJECT1_1 = "NO";
    LUT4 idx_3__I_0_Mux_6_i15_3_lut_rep_203_4_lut_3_lut (.A(idx[1]), .B(idx[2]), 
         .C(idx[3]), .Z(n11949)) /* synthesis lut_function=(A (B+(C))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(127[38:41])
    defparam idx_3__I_0_Mux_6_i15_3_lut_rep_203_4_lut_3_lut.init = 16'he8e8;
    LUT4 i1394_4_lut (.A(n11895), .B(t_data_7__N_288[5]), .C(n2186), .D(n11962), 
         .Z(n5703)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1394_4_lut.init = 16'hcac0;
    LUT4 i1_4_lut_adj_186 (.A(n6), .B(n9742), .C(fifo_rd_en_N_404), .D(n10760), 
         .Z(n9744)) /* synthesis lut_function=(A (B)+!A (B (C+(D)))) */ ;
    defparam i1_4_lut_adj_186.init = 16'hccc8;
    LUT4 next_state_2__I_15_2_lut_3_lut_4_lut_4_lut (.A(reg_fifo_empty), .B(n2296), 
         .C(n2297), .D(n11954), .Z(next_state_2__N_398)) /* synthesis lut_function=(!(A+!(B+(C (D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(168[20:36])
    defparam next_state_2__I_15_2_lut_3_lut_4_lut_4_lut.init = 16'h5444;
    LUT4 i1_3_lut (.A(idx[0]), .B(idx[2]), .C(idx[1]), .Z(t_data_7__N_288[5])) /* synthesis lut_function=(!((B (C)+!B !(C))+!A)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(144[39:42])
    defparam i1_3_lut.init = 16'h2828;
    LUT4 i1_1_lut (.A(rst_c), .Z(n1)) /* synthesis lut_function=(!(A)) */ ;
    defparam i1_1_lut.init = 16'h5555;
    LUT4 i1402_4_lut (.A(n11800), .B(t_data_7__N_288[6]), .C(n2186), .D(n11962), 
         .Z(n5711)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1402_4_lut.init = 16'hcac0;
    PFUMX i7452 (.BLUT(n11799), .ALUT(n11798), .C0(n2187), .Z(n11800));
    LUT4 i2989_2_lut_3_lut (.A(idx[1]), .B(idx[0]), .C(idx[2]), .Z(n7)) /* synthesis lut_function=(!(A+(B+(C)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(127[38:41])
    defparam i2989_2_lut_3_lut.init = 16'h0101;
    LUT4 i744_2_lut_3_lut (.A(idx[1]), .B(idx[0]), .C(idx[2]), .Z(n6)) /* synthesis lut_function=(A (C)+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(127[38:41])
    defparam i744_2_lut_3_lut.init = 16'he0e0;
    LUT4 idx_3__I_0_Mux_3_i15_4_lut_4_lut_4_lut_4_lut (.A(idx[1]), .B(idx[0]), 
         .C(idx[3]), .D(idx[2]), .Z(t_data_7__N_304[3])) /* synthesis lut_function=(!(A (D)+!A (B (C (D))+!B !((D)+!C)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(127[38:41])
    defparam idx_3__I_0_Mux_3_i15_4_lut_4_lut_4_lut_4_lut.init = 16'h15ef;
    LUT4 n1_bdd_4_lut_3_lut (.A(idx[2]), .B(idx[4]), .C(idx[1]), .Z(n11783)) /* synthesis lut_function=(!(A+(B (C)+!B !(C)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[24:51])
    defparam n1_bdd_4_lut_3_lut.init = 16'h1414;
    LUT4 idx_3__I_0_Mux_5_i15_4_lut_4_lut_4_lut (.A(idx[2]), .B(idx[3]), 
         .C(idx[0]), .D(idx[1]), .Z(t_data_7__N_304[5])) /* synthesis lut_function=(!(A (B+!(C+!(D)))+!A !((C)+!B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[24:51])
    defparam idx_3__I_0_Mux_5_i15_4_lut_4_lut_4_lut.init = 16'h7173;
    LUT4 i1420_4_lut_3_lut_3_lut (.A(idx[2]), .B(idx[3]), .C(idx[1]), 
         .Z(n5729)) /* synthesis lut_function=(!(A ((C)+!B)+!A (B+!(C)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[24:51])
    defparam i1420_4_lut_3_lut_3_lut.init = 16'h1818;
    LUT4 t_data_7__N_304_1__bdd_2_lut_7409_3_lut_3_lut (.A(idx[2]), .B(idx[0]), 
         .C(idx[1]), .Z(n11630)) /* synthesis lut_function=(!(A+!(B+(C)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[24:51])
    defparam t_data_7__N_304_1__bdd_2_lut_7409_3_lut_3_lut.init = 16'h5454;
    FD1P3IX idx_703__i7 (.D(n37[7]), .SP(clk_c_enable_73), .CD(n6371), 
            .CK(clk_c), .Q(idx[7])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam idx_703__i7.GSR = "DISABLED";
    LUT4 i1120_2_lut (.A(idx[2]), .B(idx[3]), .Z(n5429)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(127[38:41])
    defparam i1120_2_lut.init = 16'h8888;
    LUT4 i1_2_lut_3_lut_3_lut (.A(idx[2]), .B(idx[0]), .C(idx[1]), .Z(t_data_7__N_288[4])) /* synthesis lut_function=(!(A+(B (C)+!B !(C)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[24:51])
    defparam i1_2_lut_3_lut_3_lut.init = 16'h1414;
    LUT4 n2187_bdd_4_lut_3_lut (.A(idx[2]), .B(idx[3]), .C(idx[1]), .Z(n11799)) /* synthesis lut_function=(!(A (B+(C))+!A !((C)+!B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[24:51])
    defparam n2187_bdd_4_lut_3_lut.init = 16'h5353;
    FD1P3IX idx_703__i6 (.D(n37[6]), .SP(clk_c_enable_73), .CD(n6371), 
            .CK(clk_c), .Q(idx[6])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam idx_703__i6.GSR = "DISABLED";
    LUT4 t_data_7__N_304_2__bdd_2_lut_7398_3_lut_3_lut (.A(idx[2]), .B(idx[1]), 
         .C(idx[0]), .Z(n11716)) /* synthesis lut_function=(!(A+!(B+!(C)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[24:51])
    defparam t_data_7__N_304_2__bdd_2_lut_7398_3_lut_3_lut.init = 16'h4545;
    PFUMX i7437 (.BLUT(n11783), .ALUT(n11782), .C0(idx[3]), .Z(n11784));
    LUT4 i7276_3_lut (.A(n2187), .B(idx[4]), .C(idx[3]), .Z(n10955)) /* synthesis lut_function=((B+!(C))+!A) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i7276_3_lut.init = 16'hdfdf;
    LUT4 i1_4_lut_adj_187 (.A(n2186), .B(n11931), .C(n2296), .D(n11962), 
         .Z(n10056)) /* synthesis lut_function=(!(A (B+(C))+!A (B+(C+!(D))))) */ ;
    defparam i1_4_lut_adj_187.init = 16'h0302;
    LUT4 i1400_4_lut (.A(n11897), .B(t_data_7__N_288[6]), .C(n2186), .D(n11962), 
         .Z(n5709)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1400_4_lut.init = 16'hcac0;
    LUT4 i1_4_lut_adj_188 (.A(clk_c_enable_73), .B(n2181[0]), .C(n10193), 
         .D(rst_c), .Z(n6371)) /* synthesis lut_function=(A (B+(C+(D)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam i1_4_lut_adj_188.init = 16'haaa8;
    LUT4 i1_4_lut_adj_189 (.A(n10732), .B(n10812), .C(n10109), .D(idx[2]), 
         .Z(n10193)) /* synthesis lut_function=(A (B (C+!(D))+!B (C))) */ ;
    defparam i1_4_lut_adj_189.init = 16'ha0a8;
    LUT4 i1_4_lut_adj_190 (.A(n11923), .B(n10756), .C(idx[5]), .D(idx[0]), 
         .Z(n10732)) /* synthesis lut_function=(!((B+(C+!(D)))+!A)) */ ;
    defparam i1_4_lut_adj_190.init = 16'h0200;
    LUT4 n11784_bdd_4_lut (.A(n11784), .B(idx[0]), .C(t_data_7__N_304[3]), 
         .D(n2187), .Z(n11895)) /* synthesis lut_function=(A (B (C+(D))+!B !((D)+!C))+!A !((D)+!C)) */ ;
    defparam n11784_bdd_4_lut.init = 16'h88f0;
    LUT4 i1399_3_lut (.A(n5707), .B(\reg_fifo_data[5] ), .C(n2185), .Z(\udp_tdata[5] )) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1399_3_lut.init = 16'hcaca;
    LUT4 i1398_4_lut (.A(n3187[5]), .B(t_data_7__N_288[5]), .C(n2186), 
         .D(n11962), .Z(n5707)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1398_4_lut.init = 16'hcac0;
    LUT4 i1397_3_lut (.A(n5705), .B(\reg_fifo_data[4] ), .C(n2185), .Z(\udp_tdata[4] )) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1397_3_lut.init = 16'hcaca;
    LUT4 i1179_4_lut (.A(n10562), .B(\reg_fifo_data[0] ), .C(n2185), .D(n3187[0]), 
         .Z(\udp_tdata[0] )) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1179_4_lut.init = 16'hcac0;
    LUT4 n11718_bdd_3_lut (.A(n11718), .B(\reg_fifo_data[2] ), .C(n2185), 
         .Z(\udp_tdata[2] )) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam n11718_bdd_3_lut.init = 16'hcaca;
    LUT4 i1401_3_lut_rep_173 (.A(n5709), .B(\reg_fifo_data[6] ), .C(n2185), 
         .Z(n11919)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1401_3_lut_rep_173.init = 16'hcaca;
    FD1S3IX state_FSM_i2 (.D(n5464), .CK(clk_c), .CD(rst_c), .Q(n2181[1]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam state_FSM_i2.GSR = "DISABLED";
    FD1S3IX state_FSM_i3 (.D(n5462), .CK(clk_c), .CD(rst_c), .Q(n2187));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam state_FSM_i3.GSR = "DISABLED";
    FD1S3IX state_FSM_i4 (.D(n5460), .CK(clk_c), .CD(rst_c), .Q(n2186));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam state_FSM_i4.GSR = "DISABLED";
    FD1S3IX state_FSM_i5 (.D(n5458), .CK(clk_c), .CD(rst_c), .Q(n2185));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam state_FSM_i5.GSR = "DISABLED";
    FD1S3IX state_FSM_i6 (.D(n11968), .CK(clk_c), .CD(rst_c), .Q(n2184));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam state_FSM_i6.GSR = "DISABLED";
    PFUMX i7394 (.BLUT(n11717), .ALUT(n11716), .C0(n2186), .Z(n11718));
    FD1P3IX idx_703__i5 (.D(n37[5]), .SP(clk_c_enable_73), .CD(n6371), 
            .CK(clk_c), .Q(idx[5])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam idx_703__i5.GSR = "DISABLED";
    FD1P3IX idx_703__i4 (.D(n37[4]), .SP(clk_c_enable_73), .CD(n6371), 
            .CK(clk_c), .Q(idx[4])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam idx_703__i4.GSR = "DISABLED";
    FD1P3IX idx_703__i3 (.D(n37[3]), .SP(clk_c_enable_73), .CD(n6371), 
            .CK(clk_c), .Q(idx[3])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam idx_703__i3.GSR = "DISABLED";
    FD1P3IX idx_703__i2 (.D(n37[2]), .SP(clk_c_enable_73), .CD(n6371), 
            .CK(clk_c), .Q(idx[2])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam idx_703__i2.GSR = "DISABLED";
    FD1P3IX idx_703__i1 (.D(n37[1]), .SP(clk_c_enable_73), .CD(n6371), 
            .CK(clk_c), .Q(idx[1])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam idx_703__i1.GSR = "DISABLED";
    FD1P3IX idx_703__i0 (.D(n37[0]), .SP(clk_c_enable_73), .CD(n6371), 
            .CK(clk_c), .Q(idx[0])) /* synthesis syn_use_carry_chain=1 */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam idx_703__i0.GSR = "DISABLED";
    LUT4 i2872_2_lut_rep_166_4_lut (.A(n5709), .B(\reg_fifo_data[6] ), .C(n2185), 
         .D(n11945), .Z(n11912)) /* synthesis lut_function=(!(A (B (D)+!B (C+(D)))+!A (((D)+!C)+!B))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i2872_2_lut_rep_166_4_lut.init = 16'h00ca;
    LUT4 i1155_4_lut (.A(n2181[1]), .B(n2206), .C(n11923), .D(n15_adj_893), 
         .Z(n5464)) /* synthesis lut_function=(A (B+((D)+!C))+!A (B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1155_4_lut.init = 16'heece;
    LUT4 i186_2_lut (.A(reg_fifo_almostfull), .B(n2181[0]), .Z(n2206)) /* synthesis lut_function=(A (B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i186_2_lut.init = 16'h8888;
    LUT4 reduce_nor_714_i1_2_lut_rep_238 (.A(n2181[0]), .B(n2184), .Z(n11984)) /* synthesis lut_function=(A+(B)) */ ;
    defparam reduce_nor_714_i1_2_lut_rep_238.init = 16'heeee;
    LUT4 i1_4_lut_adj_191 (.A(n11960), .B(n9657), .C(idx[3]), .D(idx[5]), 
         .Z(n15_adj_893)) /* synthesis lut_function=(A+(B+((D)+!C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[24:51])
    defparam i1_4_lut_adj_191.init = 16'hffef;
    LUT4 i2873_2_lut_rep_167_3_lut_4_lut (.A(n2181[0]), .B(n2184), .C(\udp_tdata[4] ), 
         .D(n2296), .Z(n11913)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;
    defparam i2873_2_lut_rep_167_3_lut_4_lut.init = 16'h1000;
    LUT4 i258_2_lut_3_lut (.A(n2181[0]), .B(n2184), .C(n2298), .Z(n2315)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;
    defparam i258_2_lut_3_lut.init = 16'h1010;
    LUT4 i2853_2_lut_rep_169_3_lut_4_lut (.A(n2181[0]), .B(n2184), .C(\udp_tdata[0] ), 
         .D(n2296), .Z(n11915)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;
    defparam i2853_2_lut_rep_169_3_lut_4_lut.init = 16'h1000;
    LUT4 crc_reg_31__I_0_i3_3_lut_4_lut (.A(n2181[0]), .B(n2184), .C(\crc_next[2] ), 
         .D(\crc_reg[2] ), .Z(\next_crc_reg_31__N_594[2] )) /* synthesis lut_function=(A (D)+!A (B (D)+!B (C))) */ ;
    defparam crc_reg_31__I_0_i3_3_lut_4_lut.init = 16'hfe10;
    CCU2C idx_703_add_4_9 (.A0(idx[7]), .B0(GND_net), .C0(GND_net), .D0(VCC_net), 
          .A1(GND_net), .B1(GND_net), .C1(GND_net), .D1(GND_net), .CIN(n9010), 
          .S0(n37[7]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam idx_703_add_4_9.INIT0 = 16'haaa0;
    defparam idx_703_add_4_9.INIT1 = 16'h0000;
    defparam idx_703_add_4_9.INJECT1_0 = "NO";
    defparam idx_703_add_4_9.INJECT1_1 = "NO";
    PFUMX i213 (.BLUT(n9744), .ALUT(next_state_2__N_398), .C0(n2185), 
          .Z(fifo_rd_en_in));
    LUT4 i2874_2_lut_rep_170_3_lut_4_lut (.A(n2181[0]), .B(n2184), .C(\udp_tdata[2] ), 
         .D(n2296), .Z(n11916)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;
    defparam i2874_2_lut_rep_170_3_lut_4_lut.init = 16'h1000;
    LUT4 i1_2_lut_rep_172_3_lut_4_lut (.A(n2181[0]), .B(n2184), .C(\udp_tdata[1] ), 
         .D(n2296), .Z(n11918)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;
    defparam i1_2_lut_rep_172_3_lut_4_lut.init = 16'h1000;
    PFUMX i1396 (.BLUT(n3207[4]), .ALUT(t_data_7__N_288[4]), .C0(n2186), 
          .Z(n5705));
    LUT4 i1153_4_lut (.A(n5461), .B(n11923), .C(n15_adj_893), .D(n2181[1]), 
         .Z(n5462)) /* synthesis lut_function=(A+!((C+!(D))+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1153_4_lut.init = 16'haeaa;
    LUT4 i2623_3_lut_4_lut (.A(n2181[0]), .B(n2184), .C(n11911), .D(\crc_reg[9] ), 
         .Z(\next_crc_reg_31__N_594[9] )) /* synthesis lut_function=(A (D)+!A (B (D)+!B (C))) */ ;
    defparam i2623_3_lut_4_lut.init = 16'hfe10;
    LUT4 i1_4_lut_adj_192 (.A(n11959), .B(n11941), .C(idx[4]), .D(idx[2]), 
         .Z(n15)) /* synthesis lut_function=(A+(B+((D)+!C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[21] 156[28])
    defparam i1_4_lut_adj_192.init = 16'hffef;
    LUT4 crc_reg_31__I_0_i13_3_lut_4_lut (.A(n2181[0]), .B(n2184), .C(\crc_next[12] ), 
         .D(\crc_reg[12] ), .Z(\next_crc_reg_31__N_594[12] )) /* synthesis lut_function=(A (D)+!A (B (D)+!B (C))) */ ;
    defparam crc_reg_31__I_0_i13_3_lut_4_lut.init = 16'hfe10;
    LUT4 i1_2_lut_rep_196_3_lut (.A(n2181[0]), .B(n2184), .C(n2296), .Z(n11942)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;
    defparam i1_2_lut_rep_196_3_lut.init = 16'h1010;
    CCU2C idx_703_add_4_7 (.A0(idx[5]), .B0(GND_net), .C0(GND_net), .D0(VCC_net), 
          .A1(idx[6]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), .CIN(n9009), 
          .COUT(n9010), .S0(n37[5]), .S1(n37[6]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam idx_703_add_4_7.INIT0 = 16'haaa0;
    defparam idx_703_add_4_7.INIT1 = 16'haaa0;
    defparam idx_703_add_4_7.INJECT1_0 = "NO";
    defparam idx_703_add_4_7.INJECT1_1 = "NO";
    CCU2C idx_703_add_4_5 (.A0(idx[3]), .B0(GND_net), .C0(GND_net), .D0(VCC_net), 
          .A1(idx[4]), .B1(GND_net), .C1(GND_net), .D1(VCC_net), .CIN(n9008), 
          .COUT(n9009), .S0(n37[3]), .S1(n37[4]));   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(155[37:40])
    defparam idx_703_add_4_5.INIT0 = 16'haaa0;
    defparam idx_703_add_4_5.INIT1 = 16'haaa0;
    defparam idx_703_add_4_5.INJECT1_0 = "NO";
    defparam idx_703_add_4_5.INJECT1_1 = "NO";
    LUT4 i229_2_lut_3_lut_4_lut (.A(n2181[0]), .B(n2184), .C(n2185), .D(reg_fifo_empty), 
         .Z(n2268)) /* synthesis lut_function=(A+(B+!(C (D)))) */ ;
    defparam i229_2_lut_3_lut_4_lut.init = 16'hefff;
    LUT4 i1276_2_lut_rep_199_3_lut (.A(n2181[0]), .B(n2184), .C(n2296), 
         .Z(n11945)) /* synthesis lut_function=(A+(B+!(C))) */ ;
    defparam i1276_2_lut_rep_199_3_lut.init = 16'hefef;
    LUT4 i1151_4_lut (.A(n5459), .B(n11923), .C(n15), .D(n2187), .Z(n5460)) /* synthesis lut_function=(A+!((C+!(D))+!B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1151_4_lut.init = 16'haeaa;
    LUT4 idx_3__I_0_Mux_2_i15_4_lut_4_lut (.A(idx[2]), .B(idx[0]), .C(idx[1]), 
         .D(idx[3]), .Z(t_data_7__N_304[2])) /* synthesis lut_function=(!(A (B (D)+!B (C+(D)))+!A !(B (C+!(D))+!B !(C (D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(110[39:42])
    defparam idx_3__I_0_Mux_2_i15_4_lut_4_lut.init = 16'h41df;
    PFUMX mux_573_i6 (.BLUT(t_data_7__N_304[5]), .ALUT(t_data_7__N_296[5]), 
          .C0(n2187), .Z(n3187[5]));
    LUT4 i1149_4_lut (.A(n2185), .B(fifo_rd_en_N_404), .C(reg_fifo_empty), 
         .D(n9742), .Z(n5458)) /* synthesis lut_function=(A (B ((D)+!C)+!B !(C))+!A (B (D))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1149_4_lut.init = 16'hce0a;
    LUT4 i1_4_lut_then_4_lut (.A(idx[4]), .B(idx[2]), .C(idx[3]), .D(idx[0]), 
         .Z(n11994)) /* synthesis lut_function=(!(A+(B+(C+!(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(127[38:41])
    defparam i1_4_lut_then_4_lut.init = 16'h0100;
    PFUMX mux_573_i1 (.BLUT(n14), .ALUT(t_data_7__N_296[0]), .C0(n10955), 
          .Z(n3187[0]));
    LUT4 i1_4_lut_else_4_lut (.A(idx[4]), .B(idx[2]), .C(idx[3]), .D(idx[0]), 
         .Z(n11993)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(127[38:41])
    defparam i1_4_lut_else_4_lut.init = 16'h1000;
    LUT4 idx_4__I_0_Mux_2_i31_4_lut_4_lut_then_4_lut (.A(idx[2]), .B(idx[3]), 
         .C(idx[0]), .D(idx[1]), .Z(n11997)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[24:51])
    defparam idx_4__I_0_Mux_2_i31_4_lut_4_lut_then_4_lut.init = 16'h1000;
    LUT4 n7313_bdd_3_lut_3_lut (.A(n11949), .B(n2187), .C(n12001), .Z(n11897)) /* synthesis lut_function=(!(A ((C)+!B)+!A (B (C)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(110[39:42])
    defparam n7313_bdd_3_lut_3_lut.init = 16'h1d1d;
    PFUMX i7346 (.BLUT(n11631), .ALUT(n11630), .C0(n2186), .Z(n11632));
    LUT4 idx_4__I_0_Mux_2_i31_4_lut_4_lut_else_4_lut (.A(idx[2]), .B(idx[3]), 
         .C(idx[0]), .D(idx[1]), .Z(n11996)) /* synthesis lut_function=(!(A+(B+!(C (D)+!C !(D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(147[24:51])
    defparam idx_4__I_0_Mux_2_i31_4_lut_4_lut_else_4_lut.init = 16'h1001;
    LUT4 idx_4__I_0_Mux_6_i31_4_lut_then_4_lut (.A(idx[4]), .B(idx[3]), 
         .C(idx[2]), .D(idx[0]), .Z(n12000)) /* synthesis lut_function=((B+(C+!(D)))+!A) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(127[38:41])
    defparam idx_4__I_0_Mux_6_i31_4_lut_then_4_lut.init = 16'hfdff;
    LUT4 idx_4__I_0_Mux_6_i31_4_lut_else_4_lut (.A(idx[4]), .B(idx[3]), 
         .C(idx[2]), .D(idx[0]), .Z(n11999)) /* synthesis lut_function=(A (B+(C+(D)))+!A (B (D)+!B (C+(D)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(127[38:41])
    defparam idx_4__I_0_Mux_6_i31_4_lut_else_4_lut.init = 16'hffb8;
    PFUMX idx_4__I_0_Mux_0_i15 (.BLUT(n7), .ALUT(n9870), .C0(idx[4]), 
          .Z(n15_c)) /* synthesis LSE_LINE_FILE_ID=46, LSE_LCOL=16, LSE_RCOL=40, LSE_LLINE=414, LSE_RLINE=414 */ ;
    LUT4 n1_bdd_2_lut (.A(idx[4]), .B(idx[2]), .Z(n11782)) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam n1_bdd_2_lut.init = 16'h4444;
    LUT4 i1_4_lut_4_lut (.A(idx[4]), .B(idx[3]), .C(idx[0]), .D(n11963), 
         .Z(t_data_7__N_296[1])) /* synthesis lut_function=(!(A+!(B (C (D))))) */ ;
    defparam i1_4_lut_4_lut.init = 16'h4000;
    LUT4 n2187_bdd_4_lut_7451 (.A(idx[1]), .B(idx[3]), .C(idx[4]), .D(idx[2]), 
         .Z(n11798)) /* synthesis lut_function=(!(A+(B (C+!(D))+!B ((D)+!C)))) */ ;
    defparam n2187_bdd_4_lut_7451.init = 16'h0410;
    LUT4 crc_reg_9__bdd_3_lut_7469 (.A(\crc_reg[9] ), .B(crc_cnt[1]), .C(\crc_reg[25] ), 
         .Z(n11837)) /* synthesis lut_function=(!(A ((C)+!B)+!A (B (C)))) */ ;
    defparam crc_reg_9__bdd_3_lut_7469.init = 16'h1d1d;
    LUT4 crc_reg_9__bdd_3_lut_7642 (.A(\crc_reg[1] ), .B(\crc_reg[17] ), 
         .C(crc_cnt[1]), .Z(n11838)) /* synthesis lut_function=(!(A (B+!(C))+!A (B (C)))) */ ;
    defparam crc_reg_9__bdd_3_lut_7642.init = 16'h3535;
    LUT4 i1_2_lut_rep_212 (.A(idx[3]), .B(idx[5]), .Z(n11958)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_rep_212.init = 16'heeee;
    LUT4 i1_3_lut_4_lut (.A(idx[3]), .B(idx[5]), .C(idx[4]), .D(n10756), 
         .Z(n10760)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i1_3_lut_4_lut.init = 16'hfffe;
    LUT4 i3011_4_lut_4_lut (.A(idx[1]), .B(idx[0]), .C(idx[2]), .D(idx[3]), 
         .Z(t_data_7__N_304[1])) /* synthesis lut_function=(!(A (B (C+(D))+!B (C (D)))+!A (B (D)+!B (C (D))))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(110[39:42])
    defparam i3011_4_lut_4_lut.init = 16'h037f;
    LUT4 i1_3_lut_rep_195_4_lut (.A(idx[3]), .B(idx[5]), .C(idx[1]), .D(idx[0]), 
         .Z(n11941)) /* synthesis lut_function=(A+(B+!(C (D)))) */ ;
    defparam i1_3_lut_rep_195_4_lut.init = 16'hefff;
    LUT4 equal_12_i13_2_lut_rep_213 (.A(idx[6]), .B(idx[7]), .Z(n11959)) /* synthesis lut_function=(A+(B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(113[24:51])
    defparam equal_12_i13_2_lut_rep_213.init = 16'heeee;
    LUT4 i1_3_lut_4_lut_adj_193 (.A(idx[6]), .B(idx[7]), .C(idx[4]), .D(idx[2]), 
         .Z(n9657)) /* synthesis lut_function=(A+(B+(C+!(D)))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(113[24:51])
    defparam i1_3_lut_4_lut_adj_193.init = 16'hfeff;
    LUT4 equal_12_i9_2_lut_rep_214 (.A(idx[0]), .B(idx[1]), .Z(n11960)) /* synthesis lut_function=((B)+!A) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(113[24:51])
    defparam equal_12_i9_2_lut_rep_214.init = 16'hdddd;
    LUT4 i1157_3_lut (.A(n2181[0]), .B(n2184), .C(reg_fifo_almostfull), 
         .Z(n5466)) /* synthesis lut_function=(A (B+!(C))+!A (B)) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(90[13] 183[22])
    defparam i1157_3_lut.init = 16'hcece;
    LUT4 idx_4__I_0_Mux_0_i14_3_lut_4_lut_3_lut (.A(idx[1]), .B(idx[0]), 
         .C(idx[2]), .Z(n14)) /* synthesis lut_function=(!(A (B+!(C))+!A ((C)+!B))) */ ;
    defparam idx_4__I_0_Mux_0_i14_3_lut_4_lut_3_lut.init = 16'h2424;
    LUT4 i1_2_lut_3_lut_adj_194 (.A(idx[1]), .B(idx[0]), .C(idx[2]), .Z(t_data_7__N_288[6])) /* synthesis lut_function=(!(A+((C)+!B))) */ ;
    defparam i1_2_lut_3_lut_adj_194.init = 16'h0404;
    PFUMX i7523 (.BLUT(n11999), .ALUT(n12000), .C0(idx[1]), .Z(n12001));
    PFUMX i7521 (.BLUT(n11996), .ALUT(n11997), .C0(idx[4]), .Z(t_data_7__N_296[2]));
    PFUMX i7519 (.BLUT(n11993), .ALUT(n11994), .C0(idx[1]), .Z(t_data_7__N_296[4]));
    
endmodule
//
// Verilog Description of module \Controller(16,24,8,16) 
//

module \Controller(16,24,8,16)  (adc_fifo_rd_en, n1844, n1846, large_fifo_din, 
            rst_c, clk_c, clk_c_enable_38, adc_fifo_empty, fifo_sel, 
            fifo_dout_to_packer, enable_c, packer_frame_done_c, n2131, 
            n11978, clk_c_enable_64, n11977, n11386, n11393, n2185, 
            n10056, n2184, clk_c_enable_73, n11389, large_fifo_almost_full, 
            n11378, n11376, n11947, n11372, n11377, n11375, n11373, 
            n1847, n11394, n11391, n11385, n11387, n11384, n11374, 
            n11383, n11382, n11388, n11381, n11392, n11380, n11379, 
            n11390, n31);
    output [15:0]adc_fifo_rd_en;
    output n1844;
    output n1846;
    output [7:0]large_fifo_din;
    input rst_c;
    input clk_c;
    input clk_c_enable_38;
    input [15:0]adc_fifo_empty;
    output [3:0]fifo_sel;
    input [23:0]fifo_dout_to_packer;
    input enable_c;
    output packer_frame_done_c;
    output n2131;
    output n11978;
    input clk_c_enable_64;
    output n11977;
    output n11386;
    output n11393;
    input n2185;
    input n10056;
    input n2184;
    output clk_c_enable_73;
    output n11389;
    input large_fifo_almost_full;
    output n11378;
    output n11376;
    output n11947;
    output n11372;
    output n11377;
    output n11375;
    output n11373;
    output n1847;
    output n11394;
    output n11391;
    output n11385;
    output n11387;
    output n11384;
    output n11374;
    output n11383;
    output n11382;
    output n11388;
    output n11381;
    output n11392;
    output n11380;
    output n11379;
    output n11390;
    output n31;
    
    wire clk_c /* synthesis SET_AS_NETWORK=clk_c, is_clock=1 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(14[9:12])
    wire [1:0]r_byte;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(103[12:18])
    
    wire n9;
    wire [23:0]r_curr_sample;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(106[12:25])
    
    wire n11905, n9200, n11926, n10879, n11951;
    wire [7:0]n1841;
    
    wire n11901;
    wire [3:0]r_channel;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(100[12:21])
    
    wire n11899, n9_adj_886, n11906, clk_c_enable_61, n9_adj_887, 
        n9_adj_888, n9_adj_889, n11980, n11922, n3410, n9_adj_890, 
        n9_adj_891, n9_adj_892, n10792, n10804, n10802, n10786, 
        n557, n10800, n10794, n5471;
    wire [3:0]o_fifo_sel_3__N_2;
    
    wire n8101, n8128, clk_c_enable_72;
    wire [23:0]r_next_sample;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(109[12:25])
    
    wire n11976, n11948, n11924, n5482, n9663, n11988, n11935, 
        n11973, n11981;
    wire [3:0]o_fifo_sel_3__N_6;
    
    wire n5, n10077, n10919, n22, n7311;
    wire [1:0]n1;
    
    wire n11934, n6, n11952, n11982, n10778, n5494, n10770, n11975, 
        clk_c_enable_4, n5697, n5695, n11987, n5693, n11972, n11904, 
        n11900, n11902, n11903, n6125, n9175, n11936, n11979, 
        n11937, n3411, n3412, n3413, n3414, n3415, n3416, n3417, 
        n3418, n3419, n3420, n3421, n3422, n3423, n3424, n3425, 
        n3426, n3427, n3428, n3429, n3430, n3431, n3432, n3433;
    wire [3:0]n2114;
    
    wire n1868, n5480, n5476, n9515, n11992, n11989, n5718, n11938, 
        n5673, n10746, n5475, n11991, n11990, n10051, n10772, 
        n11927, n10926;
    
    LUT4 r_next_byte_1__N_260_0__bdd_4_lut_7514_4_lut (.A(r_byte[0]), .B(r_byte[1]), 
         .C(n9), .D(r_curr_sample[6]), .Z(n11905)) /* synthesis lut_function=(!(A (B+!(C))+!A !(B (D)+!B (C)))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(270[20:30])
    defparam r_next_byte_1__N_260_0__bdd_4_lut_7514_4_lut.init = 16'h7430;
    LUT4 i1_4_lut (.A(n9200), .B(n11926), .C(n10879), .D(n11951), .Z(adc_fifo_rd_en[9])) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i1_4_lut.init = 16'h0008;
    LUT4 i1_2_lut_3_lut_4_lut (.A(n1844), .B(n1841[6]), .C(n11901), .D(n1846), 
         .Z(large_fifo_din[1])) /* synthesis lut_function=(A (C)+!A (B (C)+!B (C (D)))) */ ;
    defparam i1_2_lut_3_lut_4_lut.init = 16'hf0e0;
    LUT4 i1_2_lut (.A(r_channel[2]), .B(r_channel[3]), .Z(n9200)) /* synthesis lut_function=(!(A+!(B))) */ ;
    defparam i1_2_lut.init = 16'h4444;
    LUT4 i1_2_lut_3_lut_4_lut_adj_127 (.A(n1844), .B(n1841[6]), .C(n11899), 
         .D(n1846), .Z(large_fifo_din[0])) /* synthesis lut_function=(A (C)+!A (B (C)+!B (C (D)))) */ ;
    defparam i1_2_lut_3_lut_4_lut_adj_127.init = 16'hf0e0;
    LUT4 i26_3_lut (.A(r_curr_sample[23]), .B(r_curr_sample[15]), .C(r_byte[0]), 
         .Z(n9_adj_886)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(110[39:42])
    defparam i26_3_lut.init = 16'hcaca;
    LUT4 i26_3_lut_adj_128 (.A(r_curr_sample[22]), .B(r_curr_sample[14]), 
         .C(r_byte[0]), .Z(n9)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(110[39:42])
    defparam i26_3_lut_adj_128.init = 16'hcaca;
    LUT4 i1_2_lut_3_lut_4_lut_adj_129 (.A(n1844), .B(n1841[6]), .C(n11906), 
         .D(n1846), .Z(large_fifo_din[7])) /* synthesis lut_function=(A (C)+!A (B (C)+!B (C (D)))) */ ;
    defparam i1_2_lut_3_lut_4_lut_adj_129.init = 16'hf0e0;
    LUT4 i7278_3_lut_4_lut (.A(rst_c), .B(n1846), .C(r_byte[1]), .D(r_byte[0]), 
         .Z(clk_c_enable_61)) /* synthesis lut_function=(!(A (C+!(D))+!A ((C+!(D))+!B))) */ ;
    defparam i7278_3_lut_4_lut.init = 16'h0e00;
    LUT4 i26_3_lut_adj_130 (.A(r_curr_sample[21]), .B(r_curr_sample[13]), 
         .C(r_byte[0]), .Z(n9_adj_887)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(110[39:42])
    defparam i26_3_lut_adj_130.init = 16'hcaca;
    LUT4 i26_3_lut_adj_131 (.A(r_curr_sample[19]), .B(r_curr_sample[11]), 
         .C(r_byte[0]), .Z(n9_adj_888)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(110[39:42])
    defparam i26_3_lut_adj_131.init = 16'hcaca;
    LUT4 i26_3_lut_adj_132 (.A(r_curr_sample[18]), .B(r_curr_sample[10]), 
         .C(r_byte[0]), .Z(n9_adj_889)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(110[39:42])
    defparam i26_3_lut_adj_132.init = 16'hcaca;
    LUT4 i1_4_lut_adj_133 (.A(n11980), .B(n11922), .C(r_channel[2]), .D(r_channel[3]), 
         .Z(adc_fifo_rd_en[12])) /* synthesis lut_function=(!(((C+!(D))+!B)+!A)) */ ;
    defparam i1_4_lut_adj_133.init = 16'h0800;
    FD1P3IX r_curr_sample__i0 (.D(n3410), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[0])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i0.GSR = "DISABLED";
    LUT4 i26_3_lut_adj_134 (.A(r_curr_sample[17]), .B(r_curr_sample[9]), 
         .C(r_byte[0]), .Z(n9_adj_890)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(110[39:42])
    defparam i26_3_lut_adj_134.init = 16'hcaca;
    LUT4 i26_3_lut_adj_135 (.A(r_curr_sample[20]), .B(r_curr_sample[12]), 
         .C(r_byte[0]), .Z(n9_adj_891)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/udp_rgmii_stack/src/udp_fifo_axi.vhd(110[39:42])
    defparam i26_3_lut_adj_135.init = 16'hcaca;
    LUT4 i26_3_lut_adj_136 (.A(r_curr_sample[16]), .B(r_curr_sample[8]), 
         .C(r_byte[0]), .Z(n9_adj_892)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i26_3_lut_adj_136.init = 16'hcaca;
    LUT4 i1_4_lut_adj_137 (.A(n10792), .B(n10804), .C(n10802), .D(n10786), 
         .Z(n557)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(136[13] 138[20])
    defparam i1_4_lut_adj_137.init = 16'hfffe;
    LUT4 i1_2_lut_adj_138 (.A(adc_fifo_empty[9]), .B(adc_fifo_empty[6]), 
         .Z(n10792)) /* synthesis lut_function=(A+(B)) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(136[13] 138[20])
    defparam i1_2_lut_adj_138.init = 16'heeee;
    LUT4 i1_4_lut_adj_139 (.A(adc_fifo_empty[10]), .B(n10800), .C(n10794), 
         .D(adc_fifo_empty[11]), .Z(n10804)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(136[13] 138[20])
    defparam i1_4_lut_adj_139.init = 16'hfffe;
    LUT4 i1_4_lut_adj_140 (.A(adc_fifo_empty[14]), .B(adc_fifo_empty[0]), 
         .C(adc_fifo_empty[3]), .D(adc_fifo_empty[7]), .Z(n10802)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(136[13] 138[20])
    defparam i1_4_lut_adj_140.init = 16'hfffe;
    LUT4 i1_2_lut_adj_141 (.A(adc_fifo_empty[2]), .B(adc_fifo_empty[1]), 
         .Z(n10786)) /* synthesis lut_function=(A+(B)) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(136[13] 138[20])
    defparam i1_2_lut_adj_141.init = 16'heeee;
    LUT4 i1_4_lut_adj_142 (.A(adc_fifo_empty[5]), .B(adc_fifo_empty[13]), 
         .C(adc_fifo_empty[15]), .D(adc_fifo_empty[12]), .Z(n10800)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(136[13] 138[20])
    defparam i1_4_lut_adj_142.init = 16'hfffe;
    LUT4 i1_2_lut_adj_143 (.A(adc_fifo_empty[8]), .B(adc_fifo_empty[4]), 
         .Z(n10794)) /* synthesis lut_function=(A+(B)) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(136[13] 138[20])
    defparam i1_2_lut_adj_143.init = 16'heeee;
    LUT4 i1163_3_lut (.A(n5471), .B(o_fifo_sel_3__N_2[0]), .C(n1841[6]), 
         .Z(fifo_sel[0])) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1163_3_lut.init = 16'hcaca;
    LUT4 i7273_3_lut_4_lut (.A(rst_c), .B(n1846), .C(n8101), .D(n8128), 
         .Z(clk_c_enable_72)) /* synthesis lut_function=(A+(B+!(C+(D)))) */ ;
    defparam i7273_3_lut_4_lut.init = 16'heeef;
    FD1P3IX r_next_sample__i0 (.D(fifo_dout_to_packer[0]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[0])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i0.GSR = "DISABLED";
    LUT4 i1_4_lut_adj_144 (.A(n11976), .B(n11926), .C(n11951), .D(n11948), 
         .Z(adc_fifo_rd_en[13])) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;
    defparam i1_4_lut_adj_144.init = 16'h0400;
    LUT4 i1_3_lut_4_lut (.A(enable_c), .B(n11924), .C(n1841[0]), .D(packer_frame_done_c), 
         .Z(n5482)) /* synthesis lut_function=(A (B (C+(D))+!B (D))+!A (C+(D))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(136[13] 138[20])
    defparam i1_3_lut_4_lut.init = 16'hffd0;
    LUT4 i2945_4_lut_then_4_lut (.A(n1841[0]), .B(n9663), .C(r_channel[1]), 
         .D(r_channel[2]), .Z(n11988)) /* synthesis lut_function=(!(A+!(B (D)+!B !(C+!(D))))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i2945_4_lut_then_4_lut.init = 16'h4500;
    LUT4 i3884_4_lut (.A(n1844), .B(n11935), .C(n1841[6]), .D(n2131), 
         .Z(n8128)) /* synthesis lut_function=(A (B (C))+!A (B (C+(D))+!B !(C+!(D)))) */ ;
    defparam i3884_4_lut.init = 16'hc5c0;
    LUT4 equal_48_i5_2_lut_rep_227 (.A(r_channel[0]), .B(r_channel[1]), 
         .Z(n11973)) /* synthesis lut_function=(A+!(B)) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(263[44:57])
    defparam equal_48_i5_2_lut_rep_227.init = 16'hbbbb;
    LUT4 i4856_4_lut (.A(r_channel[0]), .B(r_byte[0]), .C(n11981), .D(r_byte[1]), 
         .Z(o_fifo_sel_3__N_6[0])) /* synthesis lut_function=(A (B+(C+(D)))+!A !(B+(C+(D)))) */ ;
    defparam i4856_4_lut.init = 16'haaa9;
    LUT4 i1_4_lut_adj_145 (.A(r_byte[1]), .B(n5), .C(rst_c), .D(r_byte[0]), 
         .Z(n10077)) /* synthesis lut_function=(!(A ((C+(D))+!B)+!A ((C+!(D))+!B))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(15[9:12])
    defparam i1_4_lut_adj_145.init = 16'h0408;
    LUT4 i1_3_lut_4_lut_adj_146 (.A(r_channel[0]), .B(r_channel[1]), .C(n10919), 
         .D(n11926), .Z(adc_fifo_rd_en[3])) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(263[44:57])
    defparam i1_3_lut_4_lut_adj_146.init = 16'h0400;
    LUT4 i1_4_lut_adj_147 (.A(rst_c), .B(n22), .C(n7311), .D(n1846), 
         .Z(n1[0])) /* synthesis lut_function=(!(A+(B (C (D))+!B (C+!(D))))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(15[9:12])
    defparam i1_4_lut_adj_147.init = 16'h0544;
    LUT4 i1_2_lut_adj_148 (.A(packer_frame_done_c), .B(n1841[1]), .Z(n2131)) /* synthesis lut_function=(A+(B)) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1_2_lut_adj_148.init = 16'heeee;
    LUT4 i1_3_lut_4_lut_adj_149 (.A(n11934), .B(n11926), .C(n11980), .D(n6), 
         .Z(adc_fifo_rd_en[4])) /* synthesis lut_function=(!(A+(((D)+!C)+!B))) */ ;
    defparam i1_3_lut_4_lut_adj_149.init = 16'h0040;
    FD1S3JX r_state_FSM_i1 (.D(n5482), .CK(clk_c), .PD(rst_c), .Q(n1841[0]));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam r_state_FSM_i1.GSR = "DISABLED";
    LUT4 i1_3_lut_4_lut_adj_150 (.A(n11934), .B(n11926), .C(r_channel[3]), 
         .D(n11952), .Z(adc_fifo_rd_en[8])) /* synthesis lut_function=(!(A+((C+!(D))+!B))) */ ;
    defparam i1_3_lut_4_lut_adj_150.init = 16'h0400;
    LUT4 i1_2_lut_3_lut_4_lut_adj_151 (.A(r_byte[0]), .B(r_byte[1]), .C(n11980), 
         .D(n11982), .Z(n10778)) /* synthesis lut_function=(A+!(B (C (D)))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(306[55:86])
    defparam i1_2_lut_3_lut_4_lut_adj_151.init = 16'hbfff;
    LUT4 i2889_4_lut (.A(r_channel[0]), .B(n1841[0]), .C(o_fifo_sel_3__N_2[0]), 
         .D(n1841[6]), .Z(n5494)) /* synthesis lut_function=(!(A (B+!(C (D)))+!A (B+!(C+!(D))))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i2889_4_lut.init = 16'h3011;
    LUT4 i2789_4_lut (.A(r_channel[0]), .B(n10770), .C(n11978), .D(r_channel[2]), 
         .Z(o_fifo_sel_3__N_2[0])) /* synthesis lut_function=(A ((C+!(D))+!B)) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(306[17] 314[24])
    defparam i2789_4_lut.init = 16'ha2aa;
    LUT4 equal_45_i5_2_lut_rep_229 (.A(r_channel[0]), .B(r_channel[1]), 
         .Z(n11975)) /* synthesis lut_function=((B)+!A) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(263[44:57])
    defparam equal_45_i5_2_lut_rep_229.init = 16'hdddd;
    LUT4 i1_3_lut_4_lut_adj_152 (.A(r_channel[0]), .B(r_channel[1]), .C(n10919), 
         .D(n11926), .Z(adc_fifo_rd_en[2])) /* synthesis lut_function=(!((B+(C+!(D)))+!A)) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(263[44:57])
    defparam i1_3_lut_4_lut_adj_152.init = 16'h0200;
    LUT4 i1_2_lut_adj_153 (.A(r_channel[3]), .B(r_channel[1]), .Z(n10770)) /* synthesis lut_function=(A (B)) */ ;
    defparam i1_2_lut_adj_153.init = 16'h8888;
    LUT4 equal_42_i5_2_lut_rep_230 (.A(r_channel[0]), .B(r_channel[1]), 
         .Z(n11976)) /* synthesis lut_function=(A+(B)) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(263[44:57])
    defparam equal_42_i5_2_lut_rep_230.init = 16'heeee;
    FD1P3AX r_byte__i0 (.D(n1[0]), .SP(clk_c_enable_4), .CK(clk_c), .Q(r_byte[0])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_byte__i0.GSR = "DISABLED";
    FD1P3IX r_channel__i0 (.D(n5494), .SP(clk_c_enable_64), .CD(rst_c), 
            .CK(clk_c), .Q(r_channel[0])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_channel__i0.GSR = "DISABLED";
    LUT4 i6593_2_lut_3_lut (.A(r_channel[0]), .B(r_channel[1]), .C(n1841[6]), 
         .Z(n10879)) /* synthesis lut_function=(A+(B+(C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(263[44:57])
    defparam i6593_2_lut_3_lut.init = 16'hfefe;
    LUT4 i7285_2_lut_rep_231 (.A(n1841[0]), .B(packer_frame_done_c), .Z(n11977)) /* synthesis lut_function=(!(A+(B))) */ ;
    defparam i7285_2_lut_rep_231.init = 16'h1111;
    LUT4 i1_2_lut_rep_205_3_lut (.A(n1841[0]), .B(packer_frame_done_c), 
         .C(n1844), .Z(n11951)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_2_lut_rep_205_3_lut.init = 16'hfefe;
    LUT4 i6588_2_lut_rep_188_3_lut_4_lut (.A(n1841[0]), .B(packer_frame_done_c), 
         .C(n1841[6]), .D(n1844), .Z(n11934)) /* synthesis lut_function=(A+(B+(C+(D)))) */ ;
    defparam i6588_2_lut_rep_188_3_lut_4_lut.init = 16'hfffe;
    LUT4 i1389_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5697), .D(o_fifo_sel_3__N_6[3]), 
         .Z(fifo_sel[3])) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1389_3_lut_4_lut.init = 16'hf4b0;
    LUT4 i1387_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5695), .D(o_fifo_sel_3__N_6[2]), 
         .Z(fifo_sel[2])) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1387_3_lut_4_lut.init = 16'hf4b0;
    LUT4 i2945_4_lut_else_4_lut (.A(r_channel[0]), .B(n1841[0]), .C(r_channel[1]), 
         .D(r_channel[2]), .Z(n11987)) /* synthesis lut_function=(!(A (B+(C (D)+!C !(D)))+!A (B+!(D)))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i2945_4_lut_else_4_lut.init = 16'h1320;
    LUT4 i1385_rep_24_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), 
         .D(o_fifo_sel_3__N_6[1]), .Z(n11386)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_rep_24_3_lut_4_lut.init = 16'hf4b0;
    LUT4 i1385_rep_31_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), 
         .D(o_fifo_sel_3__N_6[1]), .Z(n11393)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_rep_31_3_lut_4_lut.init = 16'hf4b0;
    LUT4 i1_2_lut_rep_226 (.A(n1844), .B(n1841[6]), .Z(n11972)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i1_2_lut_rep_226.init = 16'heeee;
    LUT4 i1_2_lut_3_lut_4_lut_adj_154 (.A(n1844), .B(n1841[6]), .C(n11904), 
         .D(n1846), .Z(large_fifo_din[5])) /* synthesis lut_function=(A (C)+!A (B (C)+!B (C (D)))) */ ;
    defparam i1_2_lut_3_lut_4_lut_adj_154.init = 16'hf0e0;
    LUT4 i1_4_lut_adj_155 (.A(rst_c), .B(n2185), .C(n10056), .D(n2184), 
         .Z(clk_c_enable_73)) /* synthesis lut_function=(A+!(B+(C+(D)))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/top.vhd(15[9:12])
    defparam i1_4_lut_adj_155.init = 16'haaab;
    LUT4 i1385_rep_27_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), 
         .D(o_fifo_sel_3__N_6[1]), .Z(n11389)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_rep_27_3_lut_4_lut.init = 16'hf4b0;
    LUT4 i69_2_lut_rep_178 (.A(n557), .B(large_fifo_almost_full), .Z(n11924)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i69_2_lut_rep_178.init = 16'heeee;
    LUT4 i1_2_lut_3_lut_4_lut_adj_156 (.A(n1844), .B(n1841[6]), .C(n11900), 
         .D(n1846), .Z(large_fifo_din[4])) /* synthesis lut_function=(A (C)+!A (B (C)+!B (C (D)))) */ ;
    defparam i1_2_lut_3_lut_4_lut_adj_156.init = 16'hf0e0;
    LUT4 i1_2_lut_3_lut_4_lut_adj_157 (.A(n1844), .B(n1841[6]), .C(n11905), 
         .D(n1846), .Z(large_fifo_din[6])) /* synthesis lut_function=(A (C)+!A (B (C)+!B (C (D)))) */ ;
    defparam i1_2_lut_3_lut_4_lut_adj_157.init = 16'hf0e0;
    LUT4 i1_2_lut_3_lut_4_lut_adj_158 (.A(n1844), .B(n1841[6]), .C(n11902), 
         .D(n1846), .Z(large_fifo_din[2])) /* synthesis lut_function=(A (C)+!A (B (C)+!B (C (D)))) */ ;
    defparam i1_2_lut_3_lut_4_lut_adj_158.init = 16'hf0e0;
    LUT4 i1_2_lut_3_lut_4_lut_adj_159 (.A(n1844), .B(n1841[6]), .C(n11903), 
         .D(n1846), .Z(large_fifo_din[3])) /* synthesis lut_function=(A (C)+!A (B (C)+!B (C (D)))) */ ;
    defparam i1_2_lut_3_lut_4_lut_adj_159.init = 16'hf0e0;
    LUT4 i3867_3_lut_4_lut (.A(n1844), .B(n1841[6]), .C(n1846), .D(n11978), 
         .Z(n5)) /* synthesis lut_function=(A ((D)+!C)+!A (B ((D)+!C)+!B (C (D)))) */ ;
    defparam i3867_3_lut_4_lut.init = 16'hfe0e;
    LUT4 i1385_rep_16_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), 
         .D(o_fifo_sel_3__N_6[1]), .Z(n11378)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_rep_16_3_lut_4_lut.init = 16'hf4b0;
    LUT4 i1385_rep_14_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), 
         .D(o_fifo_sel_3__N_6[1]), .Z(n11376)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_rep_14_3_lut_4_lut.init = 16'hf4b0;
    LUT4 i1_2_lut_rep_201_3_lut (.A(n1844), .B(n1841[6]), .C(n1846), .Z(n11947)) /* synthesis lut_function=(A+(B+(C))) */ ;
    defparam i1_2_lut_rep_201_3_lut.init = 16'hfefe;
    LUT4 i1_2_lut_3_lut_4_lut_adj_160 (.A(n557), .B(large_fifo_almost_full), 
         .C(n1841[0]), .D(enable_c), .Z(n6125)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;
    defparam i1_2_lut_3_lut_4_lut_adj_160.init = 16'h1000;
    LUT4 i1385_rep_10_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), 
         .D(o_fifo_sel_3__N_6[1]), .Z(n11372)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_rep_10_3_lut_4_lut.init = 16'hf4b0;
    LUT4 i1_3_lut_4_lut_adj_161 (.A(n11934), .B(n9200), .C(n11926), .D(n11975), 
         .Z(adc_fifo_rd_en[10])) /* synthesis lut_function=(!(A+(((D)+!C)+!B))) */ ;
    defparam i1_3_lut_4_lut_adj_161.init = 16'h0040;
    LUT4 i1_3_lut_4_lut_adj_162 (.A(n11934), .B(n9200), .C(n11926), .D(n11973), 
         .Z(adc_fifo_rd_en[11])) /* synthesis lut_function=(!(A+(((D)+!C)+!B))) */ ;
    defparam i1_3_lut_4_lut_adj_162.init = 16'h0040;
    LUT4 i1_3_lut_4_lut_adj_163 (.A(n11934), .B(n9175), .C(n11926), .D(n11975), 
         .Z(adc_fifo_rd_en[6])) /* synthesis lut_function=(!(A+(((D)+!C)+!B))) */ ;
    defparam i1_3_lut_4_lut_adj_163.init = 16'h0040;
    LUT4 i1385_rep_15_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), 
         .D(o_fifo_sel_3__N_6[1]), .Z(n11377)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_rep_15_3_lut_4_lut.init = 16'hf4b0;
    LUT4 i1_3_lut_4_lut_adj_164 (.A(n11934), .B(n9175), .C(n11926), .D(n11973), 
         .Z(adc_fifo_rd_en[7])) /* synthesis lut_function=(!(A+(((D)+!C)+!B))) */ ;
    defparam i1_3_lut_4_lut_adj_164.init = 16'h0040;
    LUT4 i1385_rep_13_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), 
         .D(o_fifo_sel_3__N_6[1]), .Z(n11375)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_rep_13_3_lut_4_lut.init = 16'hf4b0;
    LUT4 i1386_4_lut_4_lut (.A(r_channel[2]), .B(n11936), .C(n1841[6]), 
         .D(n11979), .Z(n5695)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(306[17] 314[24])
    defparam i1386_4_lut_4_lut.init = 16'h8a80;
    LUT4 i1385_rep_11_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), 
         .D(o_fifo_sel_3__N_6[1]), .Z(n11373)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_rep_11_3_lut_4_lut.init = 16'hf4b0;
    LUT4 i1_2_lut_rep_176_4_lut (.A(n1847), .B(n11937), .C(n1846), .D(n11934), 
         .Z(n11922)) /* synthesis lut_function=(!(A (B (C+(D))+!B (D))+!A (B+((D)+!C)))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1_2_lut_rep_176_4_lut.init = 16'h003a;
    LUT4 i1388_4_lut_4_lut (.A(r_channel[3]), .B(n11936), .C(n1841[6]), 
         .D(n11979), .Z(n5697)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(306[17] 314[24])
    defparam i1388_4_lut_4_lut.init = 16'h8a80;
    LUT4 i1385_rep_32_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), 
         .D(o_fifo_sel_3__N_6[1]), .Z(n11394)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_rep_32_3_lut_4_lut.init = 16'hf4b0;
    LUT4 i1385_rep_29_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), 
         .D(o_fifo_sel_3__N_6[1]), .Z(n11391)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_rep_29_3_lut_4_lut.init = 16'hf4b0;
    FD1P3IX r_curr_sample__i1 (.D(n3411), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[1])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i1.GSR = "DISABLED";
    LUT4 i1385_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), .D(o_fifo_sel_3__N_6[1]), 
         .Z(fifo_sel[1])) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_3_lut_4_lut.init = 16'hf4b0;
    LUT4 i1385_rep_23_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), 
         .D(o_fifo_sel_3__N_6[1]), .Z(n11385)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_rep_23_3_lut_4_lut.init = 16'hf4b0;
    FD1P3IX r_curr_sample__i2 (.D(n3412), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[2])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i2.GSR = "DISABLED";
    FD1P3IX r_curr_sample__i3 (.D(n3413), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[3])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i3.GSR = "DISABLED";
    FD1P3IX r_curr_sample__i4 (.D(n3414), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[4])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i4.GSR = "DISABLED";
    FD1P3IX r_curr_sample__i5 (.D(n3415), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[5])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i5.GSR = "DISABLED";
    FD1P3IX r_curr_sample__i6 (.D(n3416), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[6])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i6.GSR = "DISABLED";
    FD1P3IX r_curr_sample__i7 (.D(n3417), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[7])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i7.GSR = "DISABLED";
    FD1P3IX r_curr_sample__i8 (.D(n3418), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[8])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i8.GSR = "DISABLED";
    FD1P3IX r_curr_sample__i9 (.D(n3419), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[9])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i9.GSR = "DISABLED";
    FD1P3IX r_curr_sample__i10 (.D(n3420), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[10])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i10.GSR = "DISABLED";
    FD1P3IX r_curr_sample__i11 (.D(n3421), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[11])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i11.GSR = "DISABLED";
    FD1P3IX r_curr_sample__i12 (.D(n3422), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[12])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i12.GSR = "DISABLED";
    FD1P3IX r_curr_sample__i13 (.D(n3423), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[13])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i13.GSR = "DISABLED";
    FD1P3IX r_curr_sample__i14 (.D(n3424), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[14])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i14.GSR = "DISABLED";
    FD1P3IX r_curr_sample__i15 (.D(n3425), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[15])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i15.GSR = "DISABLED";
    FD1P3IX r_curr_sample__i16 (.D(n3426), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[16])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i16.GSR = "DISABLED";
    FD1P3IX r_curr_sample__i17 (.D(n3427), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[17])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i17.GSR = "DISABLED";
    FD1P3IX r_curr_sample__i18 (.D(n3428), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[18])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i18.GSR = "DISABLED";
    FD1P3IX r_curr_sample__i19 (.D(n3429), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[19])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i19.GSR = "DISABLED";
    FD1P3IX r_curr_sample__i20 (.D(n3430), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[20])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i20.GSR = "DISABLED";
    FD1P3IX r_curr_sample__i21 (.D(n3431), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[21])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i21.GSR = "DISABLED";
    FD1P3IX r_curr_sample__i22 (.D(n3432), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[22])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i22.GSR = "DISABLED";
    FD1P3IX r_curr_sample__i23 (.D(n3433), .SP(clk_c_enable_38), .CD(rst_c), 
            .CK(clk_c), .Q(r_curr_sample[23])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_curr_sample__i23.GSR = "DISABLED";
    FD1P3IX r_next_sample__i1 (.D(fifo_dout_to_packer[1]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[1])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i1.GSR = "DISABLED";
    LUT4 i1385_rep_25_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), 
         .D(o_fifo_sel_3__N_6[1]), .Z(n11387)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_rep_25_3_lut_4_lut.init = 16'hf4b0;
    LUT4 i1385_rep_22_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), 
         .D(o_fifo_sel_3__N_6[1]), .Z(n11384)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_rep_22_3_lut_4_lut.init = 16'hf4b0;
    LUT4 i1385_rep_12_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), 
         .D(o_fifo_sel_3__N_6[1]), .Z(n11374)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_rep_12_3_lut_4_lut.init = 16'hf4b0;
    LUT4 i1385_rep_21_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), 
         .D(o_fifo_sel_3__N_6[1]), .Z(n11383)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_rep_21_3_lut_4_lut.init = 16'hf4b0;
    FD1P3IX r_next_sample__i2 (.D(fifo_dout_to_packer[2]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[2])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i2.GSR = "DISABLED";
    FD1P3IX r_next_sample__i3 (.D(fifo_dout_to_packer[3]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[3])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i3.GSR = "DISABLED";
    FD1P3IX r_next_sample__i4 (.D(fifo_dout_to_packer[4]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[4])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i4.GSR = "DISABLED";
    FD1P3IX r_next_sample__i5 (.D(fifo_dout_to_packer[5]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[5])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i5.GSR = "DISABLED";
    FD1P3IX r_next_sample__i6 (.D(fifo_dout_to_packer[6]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[6])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i6.GSR = "DISABLED";
    FD1P3IX r_next_sample__i7 (.D(fifo_dout_to_packer[7]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[7])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i7.GSR = "DISABLED";
    FD1P3IX r_next_sample__i8 (.D(fifo_dout_to_packer[8]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[8])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i8.GSR = "DISABLED";
    FD1P3IX r_next_sample__i9 (.D(fifo_dout_to_packer[9]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[9])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i9.GSR = "DISABLED";
    FD1P3IX r_next_sample__i10 (.D(fifo_dout_to_packer[10]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[10])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i10.GSR = "DISABLED";
    FD1P3IX r_next_sample__i11 (.D(fifo_dout_to_packer[11]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[11])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i11.GSR = "DISABLED";
    FD1P3IX r_next_sample__i12 (.D(fifo_dout_to_packer[12]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[12])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i12.GSR = "DISABLED";
    FD1P3IX r_next_sample__i13 (.D(fifo_dout_to_packer[13]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[13])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i13.GSR = "DISABLED";
    FD1P3IX r_next_sample__i14 (.D(fifo_dout_to_packer[14]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[14])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i14.GSR = "DISABLED";
    FD1P3IX r_next_sample__i15 (.D(fifo_dout_to_packer[15]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[15])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i15.GSR = "DISABLED";
    FD1P3IX r_next_sample__i16 (.D(fifo_dout_to_packer[16]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[16])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i16.GSR = "DISABLED";
    FD1P3IX r_next_sample__i17 (.D(fifo_dout_to_packer[17]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[17])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i17.GSR = "DISABLED";
    FD1P3IX r_next_sample__i18 (.D(fifo_dout_to_packer[18]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[18])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i18.GSR = "DISABLED";
    FD1P3IX r_next_sample__i19 (.D(fifo_dout_to_packer[19]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[19])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i19.GSR = "DISABLED";
    FD1P3IX r_next_sample__i20 (.D(fifo_dout_to_packer[20]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[20])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i20.GSR = "DISABLED";
    FD1P3IX r_next_sample__i21 (.D(fifo_dout_to_packer[21]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[21])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i21.GSR = "DISABLED";
    FD1P3IX r_next_sample__i22 (.D(fifo_dout_to_packer[22]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[22])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i22.GSR = "DISABLED";
    FD1P3IX r_next_sample__i23 (.D(fifo_dout_to_packer[23]), .SP(clk_c_enable_61), 
            .CD(rst_c), .CK(clk_c), .Q(r_next_sample[23])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_next_sample__i23.GSR = "DISABLED";
    LUT4 i1385_rep_20_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), 
         .D(o_fifo_sel_3__N_6[1]), .Z(n11382)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_rep_20_3_lut_4_lut.init = 16'hf4b0;
    LUT4 i1385_rep_26_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), 
         .D(o_fifo_sel_3__N_6[1]), .Z(n11388)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_rep_26_3_lut_4_lut.init = 16'hf4b0;
    LUT4 i1385_rep_19_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), 
         .D(o_fifo_sel_3__N_6[1]), .Z(n11381)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_rep_19_3_lut_4_lut.init = 16'hf4b0;
    LUT4 i1385_rep_30_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), 
         .D(o_fifo_sel_3__N_6[1]), .Z(n11392)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_rep_30_3_lut_4_lut.init = 16'hf4b0;
    LUT4 i1385_rep_18_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), 
         .D(o_fifo_sel_3__N_6[1]), .Z(n11380)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_rep_18_3_lut_4_lut.init = 16'hf4b0;
    LUT4 i1385_rep_17_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), 
         .D(o_fifo_sel_3__N_6[1]), .Z(n11379)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_rep_17_3_lut_4_lut.init = 16'hf4b0;
    LUT4 i1385_rep_28_3_lut_4_lut (.A(n1841[6]), .B(n1846), .C(n5693), 
         .D(o_fifo_sel_3__N_6[1]), .Z(n11390)) /* synthesis lut_function=(A (C)+!A (B (D)+!B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1385_rep_28_3_lut_4_lut.init = 16'hf4b0;
    LUT4 i1_2_lut_rep_232 (.A(r_byte[0]), .B(r_byte[1]), .Z(n11978)) /* synthesis lut_function=(A+!(B)) */ ;
    defparam i1_2_lut_rep_232.init = 16'hbbbb;
    LUT4 i1_2_lut_rep_189_3_lut_4_lut (.A(r_byte[0]), .B(r_byte[1]), .C(n11980), 
         .D(n11982), .Z(n11935)) /* synthesis lut_function=(!(A+!(B (C (D))))) */ ;
    defparam i1_2_lut_rep_189_3_lut_4_lut.init = 16'h4000;
    LUT4 i7281_2_lut_rep_233 (.A(n1847), .B(n1841[1]), .Z(n11979)) /* synthesis lut_function=(!(A+(B))) */ ;
    defparam i7281_2_lut_rep_233.init = 16'h1111;
    LUT4 i1_2_lut_3_lut (.A(n1847), .B(n1841[1]), .C(r_channel[0]), .Z(n2114[0])) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;
    defparam i1_2_lut_3_lut.init = 16'h1010;
    FD1S3IX r_state_FSM_i2 (.D(n6125), .CK(clk_c), .CD(rst_c), .Q(n1841[1]));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam r_state_FSM_i2.GSR = "DISABLED";
    FD1S3IX r_state_FSM_i3 (.D(n1868), .CK(clk_c), .CD(rst_c), .Q(n1847));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam r_state_FSM_i3.GSR = "DISABLED";
    FD1S3IX r_state_FSM_i4 (.D(n5480), .CK(clk_c), .CD(rst_c), .Q(n1846));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam r_state_FSM_i4.GSR = "DISABLED";
    FD1S3IX r_state_FSM_i5 (.D(n8101), .CK(clk_c), .CD(rst_c), .Q(packer_frame_done_c));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam r_state_FSM_i5.GSR = "DISABLED";
    FD1S3IX r_state_FSM_i6 (.D(n5476), .CK(clk_c), .CD(rst_c), .Q(n1844));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam r_state_FSM_i6.GSR = "DISABLED";
    FD1S3IX r_state_FSM_i7 (.D(n9515), .CK(clk_c), .CD(rst_c), .Q(n1841[6]));   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam r_state_FSM_i7.GSR = "DISABLED";
    LUT4 i1_2_lut_rep_234 (.A(r_channel[0]), .B(r_channel[1]), .Z(n11980)) /* synthesis lut_function=(A (B)) */ ;
    defparam i1_2_lut_rep_234.init = 16'h8888;
    LUT4 i1_2_lut_rep_206_3_lut (.A(r_channel[0]), .B(r_channel[1]), .C(r_channel[2]), 
         .Z(n11952)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i1_2_lut_rep_206_3_lut.init = 16'h8080;
    FD1P3IX r_channel__i1 (.D(n11992), .SP(clk_c_enable_64), .CD(rst_c), 
            .CK(clk_c), .Q(r_channel[1])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_channel__i1.GSR = "DISABLED";
    FD1P3IX r_channel__i2 (.D(n11989), .SP(clk_c_enable_64), .CD(rst_c), 
            .CK(clk_c), .Q(r_channel[2])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_channel__i2.GSR = "DISABLED";
    FD1P3IX r_channel__i3 (.D(n5718), .SP(clk_c_enable_64), .CD(rst_c), 
            .CK(clk_c), .Q(r_channel[3])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_channel__i3.GSR = "DISABLED";
    LUT4 i768_2_lut_rep_192_3_lut_4_lut (.A(r_channel[0]), .B(r_channel[1]), 
         .C(r_channel[3]), .D(r_channel[2]), .Z(n11938)) /* synthesis lut_function=(!(A (B (C (D)+!C !(D))+!B !(C))+!A !(C))) */ ;
    defparam i768_2_lut_rep_192_3_lut_4_lut.init = 16'h78f0;
    LUT4 i6623_2_lut_rep_191_3_lut_4_lut (.A(r_channel[0]), .B(r_channel[1]), 
         .C(n7311), .D(n11982), .Z(n11937)) /* synthesis lut_function=(A (B (C+(D))+!B (C))+!A (C)) */ ;
    defparam i6623_2_lut_rep_191_3_lut_4_lut.init = 16'hf8f0;
    LUT4 i1337_3_lut (.A(fifo_dout_to_packer[1]), .B(r_next_sample[1]), 
         .C(n5673), .Z(n3411)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1337_3_lut.init = 16'hcaca;
    LUT4 mux_104_i2_3_lut_4_lut_4_lut_4_lut (.A(r_channel[0]), .B(r_channel[1]), 
         .C(n11982), .D(n7311), .Z(o_fifo_sel_3__N_6[1])) /* synthesis lut_function=(A (B (C+(D))+!B !(D))+!A (B)) */ ;
    defparam mux_104_i2_3_lut_4_lut_4_lut_4_lut.init = 16'hcce6;
    LUT4 i1339_3_lut (.A(fifo_dout_to_packer[2]), .B(r_next_sample[2]), 
         .C(n5673), .Z(n3412)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1339_3_lut.init = 16'hcaca;
    LUT4 i1341_3_lut (.A(fifo_dout_to_packer[3]), .B(r_next_sample[3]), 
         .C(n5673), .Z(n3413)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1341_3_lut.init = 16'hcaca;
    LUT4 i1_2_lut_rep_236 (.A(r_channel[2]), .B(r_channel[3]), .Z(n11982)) /* synthesis lut_function=(A (B)) */ ;
    defparam i1_2_lut_rep_236.init = 16'h8888;
    LUT4 i1343_3_lut (.A(fifo_dout_to_packer[4]), .B(r_next_sample[4]), 
         .C(n5673), .Z(n3414)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1343_3_lut.init = 16'hcaca;
    LUT4 i1345_3_lut (.A(fifo_dout_to_packer[5]), .B(r_next_sample[5]), 
         .C(n5673), .Z(n3415)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1345_3_lut.init = 16'hcaca;
    LUT4 i1347_3_lut (.A(fifo_dout_to_packer[6]), .B(r_next_sample[6]), 
         .C(n5673), .Z(n3416)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1347_3_lut.init = 16'hcaca;
    LUT4 i1349_3_lut (.A(fifo_dout_to_packer[7]), .B(r_next_sample[7]), 
         .C(n5673), .Z(n3417)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1349_3_lut.init = 16'hcaca;
    LUT4 i1351_3_lut (.A(fifo_dout_to_packer[8]), .B(r_next_sample[8]), 
         .C(n5673), .Z(n3418)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1351_3_lut.init = 16'hcaca;
    LUT4 i1353_3_lut (.A(fifo_dout_to_packer[9]), .B(r_next_sample[9]), 
         .C(n5673), .Z(n3419)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1353_3_lut.init = 16'hcaca;
    LUT4 i1355_3_lut (.A(fifo_dout_to_packer[10]), .B(r_next_sample[10]), 
         .C(n5673), .Z(n3420)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1355_3_lut.init = 16'hcaca;
    LUT4 i1357_3_lut (.A(fifo_dout_to_packer[11]), .B(r_next_sample[11]), 
         .C(n5673), .Z(n3421)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1357_3_lut.init = 16'hcaca;
    LUT4 i1359_3_lut (.A(fifo_dout_to_packer[12]), .B(r_next_sample[12]), 
         .C(n5673), .Z(n3422)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1359_3_lut.init = 16'hcaca;
    LUT4 i1361_3_lut (.A(fifo_dout_to_packer[13]), .B(r_next_sample[13]), 
         .C(n5673), .Z(n3423)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1361_3_lut.init = 16'hcaca;
    LUT4 i1363_3_lut (.A(fifo_dout_to_packer[14]), .B(r_next_sample[14]), 
         .C(n5673), .Z(n3424)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1363_3_lut.init = 16'hcaca;
    LUT4 i1365_3_lut (.A(fifo_dout_to_packer[15]), .B(r_next_sample[15]), 
         .C(n5673), .Z(n3425)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1365_3_lut.init = 16'hcaca;
    LUT4 i1367_3_lut (.A(fifo_dout_to_packer[16]), .B(r_next_sample[16]), 
         .C(n5673), .Z(n3426)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1367_3_lut.init = 16'hcaca;
    LUT4 i1369_3_lut (.A(fifo_dout_to_packer[17]), .B(r_next_sample[17]), 
         .C(n5673), .Z(n3427)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1369_3_lut.init = 16'hcaca;
    LUT4 i1371_3_lut (.A(fifo_dout_to_packer[18]), .B(r_next_sample[18]), 
         .C(n5673), .Z(n3428)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1371_3_lut.init = 16'hcaca;
    LUT4 i1_2_lut_rep_235_4_lut (.A(r_channel[2]), .B(r_channel[3]), .C(r_channel[1]), 
         .D(r_channel[0]), .Z(n11981)) /* synthesis lut_function=(A (B (C (D)))) */ ;
    defparam i1_2_lut_rep_235_4_lut.init = 16'h8000;
    LUT4 i1373_3_lut (.A(fifo_dout_to_packer[19]), .B(r_next_sample[19]), 
         .C(n5673), .Z(n3429)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1373_3_lut.init = 16'hcaca;
    LUT4 i1375_3_lut (.A(fifo_dout_to_packer[20]), .B(r_next_sample[20]), 
         .C(n5673), .Z(n3430)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1375_3_lut.init = 16'hcaca;
    LUT4 i1377_3_lut (.A(fifo_dout_to_packer[21]), .B(r_next_sample[21]), 
         .C(n5673), .Z(n3431)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1377_3_lut.init = 16'hcaca;
    LUT4 i1_2_lut_rep_202_3_lut (.A(r_channel[2]), .B(r_channel[3]), .C(n1841[6]), 
         .Z(n11948)) /* synthesis lut_function=(!(((C)+!B)+!A)) */ ;
    defparam i1_2_lut_rep_202_3_lut.init = 16'h0808;
    LUT4 i1379_3_lut (.A(fifo_dout_to_packer[22]), .B(r_next_sample[22]), 
         .C(n5673), .Z(n3432)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1379_3_lut.init = 16'hcaca;
    LUT4 i1381_3_lut (.A(fifo_dout_to_packer[23]), .B(r_next_sample[23]), 
         .C(n5673), .Z(n3433)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1381_3_lut.init = 16'hcaca;
    FD1P3AX r_byte__i1 (.D(n10077), .SP(clk_c_enable_72), .CK(clk_c), 
            .Q(r_byte[1])) /* synthesis lse_init_val=0, LSE_LINE_FILE_ID=46, LSE_LCOL=31, LSE_RCOL=53, LSE_LLINE=98, LSE_RLINE=98 */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(191[13] 205[20])
    defparam r_byte__i1.GSR = "DISABLED";
    LUT4 mux_104_i3_3_lut_4_lut_4_lut_4_lut_4_lut (.A(r_channel[2]), .B(r_channel[3]), 
         .C(n7311), .D(n11980), .Z(o_fifo_sel_3__N_6[2])) /* synthesis lut_function=(A (B+(C+!(D)))+!A !(C+!(D))) */ ;
    defparam mux_104_i3_3_lut_4_lut_4_lut_4_lut_4_lut.init = 16'hadaa;
    LUT4 i1_4_lut_adj_165 (.A(n10746), .B(n11978), .C(n10770), .D(r_channel[2]), 
         .Z(n8101)) /* synthesis lut_function=(!((B+!(C (D)))+!A)) */ ;
    defparam i1_4_lut_adj_165.init = 16'h2000;
    LUT4 i1_2_lut_adj_166 (.A(r_channel[0]), .B(n1844), .Z(n10746)) /* synthesis lut_function=(A (B)) */ ;
    defparam i1_2_lut_adj_166.init = 16'h8888;
    LUT4 i1_4_lut_adj_167 (.A(n557), .B(n5475), .C(n11935), .D(n1846), 
         .Z(n5476)) /* synthesis lut_function=(A (B+(C (D)))+!A (B)) */ ;
    defparam i1_4_lut_adj_167.init = 16'heccc;
    LUT4 i12_4_lut (.A(n1846), .B(n1841[6]), .C(n11936), .D(n11924), 
         .Z(n9515)) /* synthesis lut_function=(A (B (C+!(D))+!B !(C+(D)))+!A (B (C))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i12_4_lut.init = 16'hc0ca;
    LUT4 i1_3_lut_4_lut_adj_168 (.A(n1846), .B(n11972), .C(rst_c), .D(n2131), 
         .Z(clk_c_enable_4)) /* synthesis lut_function=(A+(B+(C+!(D)))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1_3_lut_4_lut_adj_168.init = 16'hfeff;
    PFUMX i1162 (.BLUT(n2114[0]), .ALUT(o_fifo_sel_3__N_6[0]), .C0(n1846), 
          .Z(n5471));
    LUT4 i2944_4_lut_then_4_lut (.A(n1841[0]), .B(n9663), .C(n1841[6]), 
         .D(r_channel[0]), .Z(n11991)) /* synthesis lut_function=(!(A+!(B (C+!(D))+!B !(C+(D))))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i2944_4_lut_then_4_lut.init = 16'h4045;
    LUT4 i2944_4_lut_else_4_lut (.A(n1841[0]), .B(n1841[6]), .C(r_channel[0]), 
         .Z(n11990)) /* synthesis lut_function=(!(A+(B+!(C)))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i2944_4_lut_else_4_lut.init = 16'h1010;
    LUT4 i1171_4_lut (.A(n1846), .B(n1847), .C(n10778), .D(n10051), 
         .Z(n5480)) /* synthesis lut_function=(A (B+(C+(D)))+!A (B)) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1171_4_lut.init = 16'heeec;
    LUT4 i1_4_lut_adj_169 (.A(n557), .B(n11978), .C(n10772), .D(n10770), 
         .Z(n10051)) /* synthesis lut_function=(!(A+(B+!(C (D))))) */ ;
    defparam i1_4_lut_adj_169.init = 16'h1000;
    LUT4 i1_3_lut (.A(r_channel[0]), .B(r_channel[2]), .C(large_fifo_almost_full), 
         .Z(n10772)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i1_3_lut.init = 16'h8080;
    LUT4 i6631_3_lut_4_lut (.A(n11977), .B(n1844), .C(n1841[6]), .D(n6), 
         .Z(n10919)) /* synthesis lut_function=((B+(C+(D)))+!A) */ ;
    defparam i6631_3_lut_4_lut.init = 16'hfffd;
    LUT4 i1384_4_lut_4_lut (.A(r_channel[1]), .B(n9663), .C(n1841[6]), 
         .D(n11979), .Z(n5693)) /* synthesis lut_function=(A (B (C+(D))+!B !(C+!(D)))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(306[17] 314[24])
    defparam i1384_4_lut_4_lut.init = 16'h8a80;
    LUT4 r_next_byte_1__N_260_0__bdd_4_lut_7508_4_lut (.A(r_byte[0]), .B(r_byte[1]), 
         .C(n9_adj_892), .D(r_curr_sample[0]), .Z(n11899)) /* synthesis lut_function=(!(A (B+!(C))+!A !(B (D)+!B (C)))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(270[20:30])
    defparam r_next_byte_1__N_260_0__bdd_4_lut_7508_4_lut.init = 16'h7430;
    LUT4 i2946_4_lut (.A(n11938), .B(n1841[0]), .C(n11927), .D(n1841[6]), 
         .Z(n5718)) /* synthesis lut_function=(!(A (B+!(C+!(D)))+!A (B+!(C (D))))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i2946_4_lut.init = 16'h3022;
    LUT4 r_next_byte_1__N_260_0__bdd_4_lut_7509_4_lut (.A(r_byte[0]), .B(r_byte[1]), 
         .C(n9_adj_891), .D(r_curr_sample[4]), .Z(n11900)) /* synthesis lut_function=(!(A (B+!(C))+!A !(B (D)+!B (C)))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(270[20:30])
    defparam r_next_byte_1__N_260_0__bdd_4_lut_7509_4_lut.init = 16'h7430;
    LUT4 i3004_2_lut (.A(r_byte[0]), .B(r_byte[1]), .Z(n7311)) /* synthesis lut_function=(A+(B)) */ ;
    defparam i3004_2_lut.init = 16'heeee;
    LUT4 i1_4_lut_adj_170 (.A(r_channel[3]), .B(n11978), .C(r_channel[2]), 
         .D(r_channel[0]), .Z(n9663)) /* synthesis lut_function=((B+!(C (D)))+!A) */ ;
    defparam i1_4_lut_adj_170.init = 16'hdfff;
    LUT4 i6638_3_lut_4_lut (.A(n11982), .B(n11980), .C(n1847), .D(n1846), 
         .Z(n10926)) /* synthesis lut_function=(A (B (D)+!B (C+(D)))+!A (C+(D))) */ ;
    defparam i6638_3_lut_4_lut.init = 16'hff70;
    LUT4 i1_3_lut_4_lut_adj_171 (.A(n11982), .B(n11980), .C(n11978), .D(n1846), 
         .Z(n31)) /* synthesis lut_function=(A (B (D)+!B (C (D)))+!A (C (D))) */ ;
    defparam i1_3_lut_4_lut_adj_171.init = 16'hf800;
    LUT4 i1_4_lut_adj_172 (.A(n11951), .B(n10926), .C(n11935), .D(n1841[6]), 
         .Z(adc_fifo_rd_en[0])) /* synthesis lut_function=(!(A+!(B (C (D))+!B (C+!(D))))) */ ;
    defparam i1_4_lut_adj_172.init = 16'h5011;
    LUT4 i1_3_lut_4_lut_adj_173 (.A(n11951), .B(n11948), .C(n11926), .D(n11975), 
         .Z(adc_fifo_rd_en[14])) /* synthesis lut_function=(!(A+(((D)+!C)+!B))) */ ;
    defparam i1_3_lut_4_lut_adj_173.init = 16'h0040;
    LUT4 i1_4_lut_adj_174 (.A(n11951), .B(n11926), .C(n10879), .D(n6), 
         .Z(adc_fifo_rd_en[1])) /* synthesis lut_function=(!(A+((C+(D))+!B))) */ ;
    defparam i1_4_lut_adj_174.init = 16'h0004;
    LUT4 equal_49_i6_2_lut (.A(r_channel[2]), .B(r_channel[3]), .Z(n6)) /* synthesis lut_function=(A+(B)) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(263[44:57])
    defparam equal_49_i6_2_lut.init = 16'heeee;
    LUT4 i1_3_lut_4_lut_adj_175 (.A(n11951), .B(n11948), .C(n11926), .D(n11973), 
         .Z(adc_fifo_rd_en[15])) /* synthesis lut_function=(!(A+(((D)+!C)+!B))) */ ;
    defparam i1_3_lut_4_lut_adj_175.init = 16'h0040;
    LUT4 i1142_3_lut (.A(fifo_dout_to_packer[0]), .B(r_next_sample[0]), 
         .C(n5673), .Z(n3410)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i1142_3_lut.init = 16'hcaca;
    LUT4 i1_3_lut_adj_176 (.A(n1846), .B(r_byte[0]), .C(r_byte[1]), .Z(n5673)) /* synthesis lut_function=(!((B+!(C))+!A)) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(235[9] 319[18])
    defparam i1_3_lut_adj_176.init = 16'h2020;
    LUT4 i1_3_lut_4_lut_adj_177 (.A(n11981), .B(n11978), .C(n1841[6]), 
         .D(n1841[1]), .Z(n1868)) /* synthesis lut_function=(A (B (D)+!B (C+(D)))+!A (D)) */ ;
    defparam i1_3_lut_4_lut_adj_177.init = 16'hff20;
    LUT4 i1_2_lut_rep_190 (.A(r_channel[1]), .B(n9663), .Z(n11936)) /* synthesis lut_function=((B)+!A) */ ;
    defparam i1_2_lut_rep_190.init = 16'hdddd;
    LUT4 i1_3_lut_4_lut_adj_178 (.A(r_channel[1]), .B(n9663), .C(r_byte[0]), 
         .D(n11972), .Z(n22)) /* synthesis lut_function=(!(A (B (C+!(D))+!B !(C (D)))+!A (C+!(D)))) */ ;
    defparam i1_3_lut_4_lut_adj_178.init = 16'h2d00;
    LUT4 i1_4_lut_adj_179 (.A(n9175), .B(n11926), .C(n10879), .D(n11951), 
         .Z(adc_fifo_rd_en[5])) /* synthesis lut_function=(!(((C+(D))+!B)+!A)) */ ;
    defparam i1_4_lut_adj_179.init = 16'h0008;
    LUT4 i1_2_lut_adj_180 (.A(r_channel[2]), .B(r_channel[3]), .Z(n9175)) /* synthesis lut_function=(!((B)+!A)) */ ;
    defparam i1_2_lut_adj_180.init = 16'h2222;
    LUT4 i1_2_lut_3_lut_adj_181 (.A(r_channel[1]), .B(n9663), .C(n1844), 
         .Z(n5475)) /* synthesis lut_function=(A (B (C))+!A (C)) */ ;
    defparam i1_2_lut_3_lut_adj_181.init = 16'hd0d0;
    LUT4 i2895_2_lut_rep_181_3_lut (.A(r_channel[1]), .B(n9663), .C(r_channel[3]), 
         .Z(n11927)) /* synthesis lut_function=(A (B (C))+!A (C)) */ ;
    defparam i2895_2_lut_rep_181_3_lut.init = 16'hd0d0;
    LUT4 i1429_3_lut_rep_180_4_lut (.A(n11981), .B(n7311), .C(n1846), 
         .D(n1847), .Z(n11926)) /* synthesis lut_function=(!(A (C+!(D))+!A (B (C+!(D))+!B !(C+(D))))) */ ;
    defparam i1429_3_lut_rep_180_4_lut.init = 16'h1f10;
    LUT4 r_next_byte_1__N_260_0__bdd_4_lut_7511_4_lut (.A(r_byte[0]), .B(r_byte[1]), 
         .C(n9_adj_889), .D(r_curr_sample[2]), .Z(n11902)) /* synthesis lut_function=(!(A (B+!(C))+!A !(B (D)+!B (C)))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(270[20:30])
    defparam r_next_byte_1__N_260_0__bdd_4_lut_7511_4_lut.init = 16'h7430;
    LUT4 r_next_byte_1__N_260_0__bdd_4_lut_7512_4_lut (.A(r_byte[0]), .B(r_byte[1]), 
         .C(n9_adj_888), .D(r_curr_sample[3]), .Z(n11903)) /* synthesis lut_function=(!(A (B+!(C))+!A !(B (D)+!B (C)))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(270[20:30])
    defparam r_next_byte_1__N_260_0__bdd_4_lut_7512_4_lut.init = 16'h7430;
    LUT4 r_next_byte_1__N_260_0__bdd_4_lut_7513_4_lut (.A(r_byte[0]), .B(r_byte[1]), 
         .C(n9_adj_887), .D(r_curr_sample[5]), .Z(n11904)) /* synthesis lut_function=(!(A (B+!(C))+!A !(B (D)+!B (C)))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(270[20:30])
    defparam r_next_byte_1__N_260_0__bdd_4_lut_7513_4_lut.init = 16'h7430;
    LUT4 r_next_byte_1__N_260_0__bdd_4_lut_4_lut (.A(r_byte[0]), .B(r_byte[1]), 
         .C(n9_adj_886), .D(r_curr_sample[7]), .Z(n11906)) /* synthesis lut_function=(!(A (B+!(C))+!A !(B (D)+!B (C)))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(270[20:30])
    defparam r_next_byte_1__N_260_0__bdd_4_lut_4_lut.init = 16'h7430;
    PFUMX i7517 (.BLUT(n11990), .ALUT(n11991), .C0(r_channel[1]), .Z(n11992));
    LUT4 r_next_byte_1__N_260_0__bdd_4_lut_7510_4_lut (.A(r_byte[0]), .B(r_byte[1]), 
         .C(n9_adj_890), .D(r_curr_sample[1]), .Z(n11901)) /* synthesis lut_function=(!(A (B+!(C))+!A !(B (D)+!B (C)))) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(270[20:30])
    defparam r_next_byte_1__N_260_0__bdd_4_lut_7510_4_lut.init = 16'h7430;
    PFUMX i7515 (.BLUT(n11987), .ALUT(n11988), .C0(n1841[6]), .Z(n11989));
    LUT4 mux_104_i4_3_lut_4_lut_4_lut (.A(r_channel[3]), .B(n11952), .C(n7311), 
         .D(n11981), .Z(o_fifo_sel_3__N_6[3])) /* synthesis lut_function=(A ((C+(D))+!B)+!A !((C+(D))+!B)) */ ;   // d:/bap/lattice_projecten/top_level_design/adc/controllertest/controller.vhd(262[43:52])
    defparam mux_104_i4_3_lut_4_lut_4_lut.init = 16'haaa6;
    
endmodule
//
// Verilog Description of module \fifo_16ch_mux(24) 
//

module \fifo_16ch_mux(24)  (adc_fifo_6_dout, adc_fifo_7_dout, fifo_sel, 
            fifo_dout_to_packer, adc_fifo_4_dout, adc_fifo_5_dout, adc_fifo_14_dout, 
            adc_fifo_15_dout, adc_fifo_12_dout, adc_fifo_13_dout, adc_fifo_10_dout, 
            adc_fifo_11_dout, adc_fifo_8_dout, adc_fifo_9_dout, adc_fifo_2_dout, 
            adc_fifo_3_dout, adc_fifo_0_dout, adc_fifo_1_dout, n11386, 
            n11393, n11389, n11378, n11376, n11372, n11377, n11375, 
            n11373, n11394, n11391, n11385, n11387, n11384, n11374, 
            n11383, n11382, n11388, n11381, n11392, n11380, n11379, 
            n11390);
    input [23:0]adc_fifo_6_dout;
    input [23:0]adc_fifo_7_dout;
    input [3:0]fifo_sel;
    output [23:0]fifo_dout_to_packer;
    input [23:0]adc_fifo_4_dout;
    input [23:0]adc_fifo_5_dout;
    input [23:0]adc_fifo_14_dout;
    input [23:0]adc_fifo_15_dout;
    input [23:0]adc_fifo_12_dout;
    input [23:0]adc_fifo_13_dout;
    input [23:0]adc_fifo_10_dout;
    input [23:0]adc_fifo_11_dout;
    input [23:0]adc_fifo_8_dout;
    input [23:0]adc_fifo_9_dout;
    input [23:0]adc_fifo_2_dout;
    input [23:0]adc_fifo_3_dout;
    input [23:0]adc_fifo_0_dout;
    input [23:0]adc_fifo_1_dout;
    input n11386;
    input n11393;
    input n11389;
    input n11378;
    input n11376;
    input n11372;
    input n11377;
    input n11375;
    input n11373;
    input n11394;
    input n11391;
    input n11385;
    input n11387;
    input n11384;
    input n11374;
    input n11383;
    input n11382;
    input n11388;
    input n11381;
    input n11392;
    input n11380;
    input n11379;
    input n11390;
    
    
    wire n11221, n11275, n11276, n11035, n11036, n11290, n11291, 
        n11305, n11306, n11320, n11321, n11050, n11051, n11220, 
        n11065, n11066, n11080, n11081, n11095, n11096, n10990, 
        n10991, n11110, n11111, n11125, n11126, n11140, n11141, 
        n11155, n11156, n11170, n11171, n11185, n11186, n11200, 
        n11201, n11005, n11006, n11215, n11216, n11230, n11231, 
        n11020, n11021, n11245, n11246, n10975, n10976, n11015, 
        n11260, n11261, n11271, n11272, n11273, n11274, n11014, 
        n11031, n11032, n11033, n11034, n11013, n11286, n11287, 
        n11288, n11289, n11012, n11301, n11302, n11303, n11304, 
        n11316, n11317, n11318, n11319, n11046, n11047, n11048, 
        n11049, n11061, n11062, n11063, n11064, n11076, n11077, 
        n11078, n11079, n11091, n11092, n11093, n11094, n10986, 
        n10987, n10988, n10989, n11106, n11107, n11108, n11109, 
        n11121, n11122, n11123, n11124, n11136, n11137, n11138, 
        n11139, n11011, n11151, n11152, n11153, n11154, n11166, 
        n11167, n11255, n11168, n11169, n11181, n11182, n11183, 
        n11184, n11196, n11197, n11198, n11199, n11001, n11002, 
        n11003, n11004, n11254, n11211, n11212, n11010, n11213, 
        n11214, n11253, n11016, n11017, n11018, n11019, n11226, 
        n11227, n11228, n11229, n11252, n11251, n11250, n11241, 
        n11242, n11243, n11244, n10971, n10972, n10973, n10974, 
        n11009, n11249, n11256, n11257, n11258, n11259, n11248, 
        n11023, n11024, n10970, n11008, n11025, n11026, n11263, 
        n11264, n11265, n11266, n11267, n11268, n10969, n11269, 
        n11270, n10968, n10967, n11027, n11028, n11029, n11030, 
        n11278, n11279, n10966, n11219, n11280, n11281, n10965, 
        n11218, n11240, n11239, n11282, n11283, n11210, n11284, 
        n11285, n11238, n11209, n11237, n11293, n11294, n11208, 
        n11295, n11296, n10964, n10963, n11297, n11298, n11299, 
        n11300, n11207, n11206, n11236, n11308, n11309, n11205, 
        n11235, n11204, n11203, n11000, n10999, n11234, n11233, 
        n11310, n11311, n11195, n11194, n11225, n11224, n11312, 
        n11313, n10998, n11223, n11314, n11315, n11222, n11038, 
        n11039, n10997, n10978, n10979, n11042, n11040, n11041, 
        n11193, n11192, n11043, n11044, n11045, n11191, n10980, 
        n10981, n11053, n11054, n11190, n11189, n11055, n11056, 
        n11057, n11058, n11059, n11060, n11188, n11180, n11179, 
        n11068, n11069, n11070, n11071, n11072, n11073, n11074, 
        n11075, n10982, n10983, n11178, n11083, n11084, n11177, 
        n11085, n11086, n10996, n10995, n10994, n10993, n11087, 
        n11088, n11176, n11089, n11090, n10984, n10985, n11175, 
        n11098, n11099, n11174, n11100, n11101, n11102, n11103, 
        n11173, n11104, n11105, n11113, n11114, n11115, n11116, 
        n11165, n11117, n11118, n11164, n11119, n11120, n11128, 
        n11129, n11163, n11162, n11130, n11131, n11132, n11133, 
        n11161, n11160, n11134, n11135, n11143, n11144, n11159, 
        n11145, n11146, n11147, n11148, n11158, n11150, n11149;
    
    LUT4 i6933_3_lut (.A(adc_fifo_6_dout[3]), .B(adc_fifo_7_dout[3]), .C(fifo_sel[0]), 
         .Z(n11221)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6933_3_lut.init = 16'hcaca;
    L6MUX21 i6989 (.D0(n11275), .D1(n11276), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[13]));
    L6MUX21 i6749 (.D0(n11035), .D1(n11036), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[19]));
    L6MUX21 i7004 (.D0(n11290), .D1(n11291), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[6]));
    L6MUX21 i7019 (.D0(n11305), .D1(n11306), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[1]));
    L6MUX21 i7034 (.D0(n11320), .D1(n11321), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[0]));
    L6MUX21 i6764 (.D0(n11050), .D1(n11051), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[20]));
    LUT4 i6932_3_lut (.A(adc_fifo_4_dout[3]), .B(adc_fifo_5_dout[3]), .C(fifo_sel[0]), 
         .Z(n11220)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6932_3_lut.init = 16'hcaca;
    L6MUX21 i6779 (.D0(n11065), .D1(n11066), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[21]));
    L6MUX21 i6794 (.D0(n11080), .D1(n11081), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[22]));
    L6MUX21 i6809 (.D0(n11095), .D1(n11096), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[23]));
    L6MUX21 i6704 (.D0(n10990), .D1(n10991), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[14]));
    L6MUX21 i6824 (.D0(n11110), .D1(n11111), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[2]));
    L6MUX21 i6839 (.D0(n11125), .D1(n11126), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[8]));
    L6MUX21 i6854 (.D0(n11140), .D1(n11141), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[16]));
    L6MUX21 i6869 (.D0(n11155), .D1(n11156), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[9]));
    L6MUX21 i6884 (.D0(n11170), .D1(n11171), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[10]));
    L6MUX21 i6899 (.D0(n11185), .D1(n11186), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[5]));
    L6MUX21 i6914 (.D0(n11200), .D1(n11201), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[11]));
    L6MUX21 i6719 (.D0(n11005), .D1(n11006), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[15]));
    L6MUX21 i6929 (.D0(n11215), .D1(n11216), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[12]));
    L6MUX21 i6944 (.D0(n11230), .D1(n11231), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[3]));
    L6MUX21 i6734 (.D0(n11020), .D1(n11021), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[18]));
    L6MUX21 i6959 (.D0(n11245), .D1(n11246), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[17]));
    L6MUX21 i6689 (.D0(n10975), .D1(n10976), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[7]));
    LUT4 i6727_3_lut (.A(adc_fifo_14_dout[18]), .B(adc_fifo_15_dout[18]), 
         .C(fifo_sel[0]), .Z(n11015)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6727_3_lut.init = 16'hcaca;
    L6MUX21 i6974 (.D0(n11260), .D1(n11261), .SD(fifo_sel[3]), .Z(fifo_dout_to_packer[4]));
    L6MUX21 i6987 (.D0(n11271), .D1(n11272), .SD(fifo_sel[2]), .Z(n11275));
    L6MUX21 i6988 (.D0(n11273), .D1(n11274), .SD(fifo_sel[2]), .Z(n11276));
    LUT4 i6726_3_lut (.A(adc_fifo_12_dout[18]), .B(adc_fifo_13_dout[18]), 
         .C(fifo_sel[0]), .Z(n11014)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6726_3_lut.init = 16'hcaca;
    L6MUX21 i6747 (.D0(n11031), .D1(n11032), .SD(fifo_sel[2]), .Z(n11035));
    L6MUX21 i6748 (.D0(n11033), .D1(n11034), .SD(fifo_sel[2]), .Z(n11036));
    LUT4 i6725_3_lut (.A(adc_fifo_10_dout[18]), .B(adc_fifo_11_dout[18]), 
         .C(fifo_sel[0]), .Z(n11013)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6725_3_lut.init = 16'hcaca;
    L6MUX21 i7002 (.D0(n11286), .D1(n11287), .SD(fifo_sel[2]), .Z(n11290));
    L6MUX21 i7003 (.D0(n11288), .D1(n11289), .SD(fifo_sel[2]), .Z(n11291));
    LUT4 i6724_3_lut (.A(adc_fifo_8_dout[18]), .B(adc_fifo_9_dout[18]), 
         .C(fifo_sel[0]), .Z(n11012)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6724_3_lut.init = 16'hcaca;
    L6MUX21 i7017 (.D0(n11301), .D1(n11302), .SD(fifo_sel[2]), .Z(n11305));
    L6MUX21 i7018 (.D0(n11303), .D1(n11304), .SD(fifo_sel[2]), .Z(n11306));
    L6MUX21 i7032 (.D0(n11316), .D1(n11317), .SD(fifo_sel[2]), .Z(n11320));
    L6MUX21 i7033 (.D0(n11318), .D1(n11319), .SD(fifo_sel[2]), .Z(n11321));
    L6MUX21 i6762 (.D0(n11046), .D1(n11047), .SD(fifo_sel[2]), .Z(n11050));
    L6MUX21 i6763 (.D0(n11048), .D1(n11049), .SD(fifo_sel[2]), .Z(n11051));
    L6MUX21 i6777 (.D0(n11061), .D1(n11062), .SD(fifo_sel[2]), .Z(n11065));
    L6MUX21 i6778 (.D0(n11063), .D1(n11064), .SD(fifo_sel[2]), .Z(n11066));
    L6MUX21 i6792 (.D0(n11076), .D1(n11077), .SD(fifo_sel[2]), .Z(n11080));
    L6MUX21 i6793 (.D0(n11078), .D1(n11079), .SD(fifo_sel[2]), .Z(n11081));
    L6MUX21 i6807 (.D0(n11091), .D1(n11092), .SD(fifo_sel[2]), .Z(n11095));
    L6MUX21 i6808 (.D0(n11093), .D1(n11094), .SD(fifo_sel[2]), .Z(n11096));
    L6MUX21 i6702 (.D0(n10986), .D1(n10987), .SD(fifo_sel[2]), .Z(n10990));
    L6MUX21 i6703 (.D0(n10988), .D1(n10989), .SD(fifo_sel[2]), .Z(n10991));
    L6MUX21 i6822 (.D0(n11106), .D1(n11107), .SD(fifo_sel[2]), .Z(n11110));
    L6MUX21 i6823 (.D0(n11108), .D1(n11109), .SD(fifo_sel[2]), .Z(n11111));
    L6MUX21 i6837 (.D0(n11121), .D1(n11122), .SD(fifo_sel[2]), .Z(n11125));
    L6MUX21 i6838 (.D0(n11123), .D1(n11124), .SD(fifo_sel[2]), .Z(n11126));
    L6MUX21 i6852 (.D0(n11136), .D1(n11137), .SD(fifo_sel[2]), .Z(n11140));
    L6MUX21 i6853 (.D0(n11138), .D1(n11139), .SD(fifo_sel[2]), .Z(n11141));
    LUT4 i6723_3_lut (.A(adc_fifo_6_dout[18]), .B(adc_fifo_7_dout[18]), 
         .C(fifo_sel[0]), .Z(n11011)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6723_3_lut.init = 16'hcaca;
    L6MUX21 i6867 (.D0(n11151), .D1(n11152), .SD(fifo_sel[2]), .Z(n11155));
    L6MUX21 i6868 (.D0(n11153), .D1(n11154), .SD(fifo_sel[2]), .Z(n11156));
    L6MUX21 i6882 (.D0(n11166), .D1(n11167), .SD(fifo_sel[2]), .Z(n11170));
    LUT4 i6967_3_lut (.A(adc_fifo_14_dout[4]), .B(adc_fifo_15_dout[4]), 
         .C(fifo_sel[0]), .Z(n11255)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6967_3_lut.init = 16'hcaca;
    L6MUX21 i6883 (.D0(n11168), .D1(n11169), .SD(fifo_sel[2]), .Z(n11171));
    L6MUX21 i6897 (.D0(n11181), .D1(n11182), .SD(fifo_sel[2]), .Z(n11185));
    L6MUX21 i6898 (.D0(n11183), .D1(n11184), .SD(fifo_sel[2]), .Z(n11186));
    L6MUX21 i6912 (.D0(n11196), .D1(n11197), .SD(fifo_sel[2]), .Z(n11200));
    L6MUX21 i6913 (.D0(n11198), .D1(n11199), .SD(fifo_sel[2]), .Z(n11201));
    L6MUX21 i6717 (.D0(n11001), .D1(n11002), .SD(fifo_sel[2]), .Z(n11005));
    L6MUX21 i6718 (.D0(n11003), .D1(n11004), .SD(fifo_sel[2]), .Z(n11006));
    LUT4 i6966_3_lut (.A(adc_fifo_12_dout[4]), .B(adc_fifo_13_dout[4]), 
         .C(fifo_sel[0]), .Z(n11254)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6966_3_lut.init = 16'hcaca;
    L6MUX21 i6927 (.D0(n11211), .D1(n11212), .SD(fifo_sel[2]), .Z(n11215));
    LUT4 i6722_3_lut (.A(adc_fifo_4_dout[18]), .B(adc_fifo_5_dout[18]), 
         .C(fifo_sel[0]), .Z(n11010)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6722_3_lut.init = 16'hcaca;
    L6MUX21 i6928 (.D0(n11213), .D1(n11214), .SD(fifo_sel[2]), .Z(n11216));
    LUT4 i6965_3_lut (.A(adc_fifo_10_dout[4]), .B(adc_fifo_11_dout[4]), 
         .C(fifo_sel[0]), .Z(n11253)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6965_3_lut.init = 16'hcaca;
    L6MUX21 i6732 (.D0(n11016), .D1(n11017), .SD(fifo_sel[2]), .Z(n11020));
    L6MUX21 i6733 (.D0(n11018), .D1(n11019), .SD(fifo_sel[2]), .Z(n11021));
    L6MUX21 i6942 (.D0(n11226), .D1(n11227), .SD(fifo_sel[2]), .Z(n11230));
    L6MUX21 i6943 (.D0(n11228), .D1(n11229), .SD(fifo_sel[2]), .Z(n11231));
    LUT4 i6964_3_lut (.A(adc_fifo_8_dout[4]), .B(adc_fifo_9_dout[4]), .C(fifo_sel[0]), 
         .Z(n11252)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6964_3_lut.init = 16'hcaca;
    LUT4 i6963_3_lut (.A(adc_fifo_6_dout[4]), .B(adc_fifo_7_dout[4]), .C(fifo_sel[0]), 
         .Z(n11251)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6963_3_lut.init = 16'hcaca;
    LUT4 i6962_3_lut (.A(adc_fifo_4_dout[4]), .B(adc_fifo_5_dout[4]), .C(fifo_sel[0]), 
         .Z(n11250)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6962_3_lut.init = 16'hcaca;
    L6MUX21 i6957 (.D0(n11241), .D1(n11242), .SD(fifo_sel[2]), .Z(n11245));
    L6MUX21 i6958 (.D0(n11243), .D1(n11244), .SD(fifo_sel[2]), .Z(n11246));
    L6MUX21 i6687 (.D0(n10971), .D1(n10972), .SD(fifo_sel[2]), .Z(n10975));
    L6MUX21 i6688 (.D0(n10973), .D1(n10974), .SD(fifo_sel[2]), .Z(n10976));
    LUT4 i6721_3_lut (.A(adc_fifo_2_dout[18]), .B(adc_fifo_3_dout[18]), 
         .C(fifo_sel[0]), .Z(n11009)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6721_3_lut.init = 16'hcaca;
    LUT4 i6961_3_lut (.A(adc_fifo_2_dout[4]), .B(adc_fifo_3_dout[4]), .C(fifo_sel[0]), 
         .Z(n11249)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6961_3_lut.init = 16'hcaca;
    L6MUX21 i6972 (.D0(n11256), .D1(n11257), .SD(fifo_sel[2]), .Z(n11260));
    L6MUX21 i6973 (.D0(n11258), .D1(n11259), .SD(fifo_sel[2]), .Z(n11261));
    LUT4 i6960_3_lut (.A(adc_fifo_0_dout[4]), .B(adc_fifo_1_dout[4]), .C(fifo_sel[0]), 
         .Z(n11248)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6960_3_lut.init = 16'hcaca;
    PFUMX i6743 (.BLUT(n11023), .ALUT(n11024), .C0(n11386), .Z(n11031));
    LUT4 i6682_3_lut (.A(adc_fifo_14_dout[7]), .B(adc_fifo_15_dout[7]), 
         .C(fifo_sel[0]), .Z(n10970)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6682_3_lut.init = 16'hcaca;
    LUT4 i6720_3_lut (.A(adc_fifo_0_dout[18]), .B(adc_fifo_1_dout[18]), 
         .C(fifo_sel[0]), .Z(n11008)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6720_3_lut.init = 16'hcaca;
    PFUMX i6744 (.BLUT(n11025), .ALUT(n11026), .C0(n11393), .Z(n11032));
    PFUMX i6983 (.BLUT(n11263), .ALUT(n11264), .C0(n11389), .Z(n11271));
    PFUMX i6984 (.BLUT(n11265), .ALUT(n11266), .C0(n11378), .Z(n11272));
    PFUMX i6985 (.BLUT(n11267), .ALUT(n11268), .C0(n11378), .Z(n11273));
    LUT4 i6681_3_lut (.A(adc_fifo_12_dout[7]), .B(adc_fifo_13_dout[7]), 
         .C(fifo_sel[0]), .Z(n10969)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6681_3_lut.init = 16'hcaca;
    PFUMX i6986 (.BLUT(n11269), .ALUT(n11270), .C0(n11376), .Z(n11274));
    LUT4 i6680_3_lut (.A(adc_fifo_10_dout[7]), .B(adc_fifo_11_dout[7]), 
         .C(fifo_sel[0]), .Z(n10968)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6680_3_lut.init = 16'hcaca;
    LUT4 i6679_3_lut (.A(adc_fifo_8_dout[7]), .B(adc_fifo_9_dout[7]), .C(fifo_sel[0]), 
         .Z(n10967)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6679_3_lut.init = 16'hcaca;
    PFUMX i6745 (.BLUT(n11027), .ALUT(n11028), .C0(n11393), .Z(n11033));
    PFUMX i6746 (.BLUT(n11029), .ALUT(n11030), .C0(n11393), .Z(n11034));
    PFUMX i6998 (.BLUT(n11278), .ALUT(n11279), .C0(n11372), .Z(n11286));
    LUT4 i6678_3_lut (.A(adc_fifo_6_dout[7]), .B(adc_fifo_7_dout[7]), .C(fifo_sel[0]), 
         .Z(n10966)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6678_3_lut.init = 16'hcaca;
    LUT4 i6931_3_lut (.A(adc_fifo_2_dout[3]), .B(adc_fifo_3_dout[3]), .C(fifo_sel[0]), 
         .Z(n11219)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6931_3_lut.init = 16'hcaca;
    PFUMX i6999 (.BLUT(n11280), .ALUT(n11281), .C0(n11378), .Z(n11287));
    LUT4 i6677_3_lut (.A(adc_fifo_4_dout[7]), .B(adc_fifo_5_dout[7]), .C(fifo_sel[0]), 
         .Z(n10965)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6677_3_lut.init = 16'hcaca;
    LUT4 i6930_3_lut (.A(adc_fifo_0_dout[3]), .B(adc_fifo_1_dout[3]), .C(fifo_sel[0]), 
         .Z(n11218)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6930_3_lut.init = 16'hcaca;
    LUT4 i6952_3_lut (.A(adc_fifo_14_dout[17]), .B(adc_fifo_15_dout[17]), 
         .C(fifo_sel[0]), .Z(n11240)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6952_3_lut.init = 16'hcaca;
    LUT4 i6951_3_lut (.A(adc_fifo_12_dout[17]), .B(adc_fifo_13_dout[17]), 
         .C(fifo_sel[0]), .Z(n11239)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6951_3_lut.init = 16'hcaca;
    PFUMX i7000 (.BLUT(n11282), .ALUT(n11283), .C0(n11377), .Z(n11288));
    LUT4 i6922_3_lut (.A(adc_fifo_14_dout[12]), .B(adc_fifo_15_dout[12]), 
         .C(fifo_sel[0]), .Z(n11210)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6922_3_lut.init = 16'hcaca;
    PFUMX i7001 (.BLUT(n11284), .ALUT(n11285), .C0(n11377), .Z(n11289));
    LUT4 i6950_3_lut (.A(adc_fifo_10_dout[17]), .B(adc_fifo_11_dout[17]), 
         .C(fifo_sel[0]), .Z(n11238)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6950_3_lut.init = 16'hcaca;
    LUT4 i6921_3_lut (.A(adc_fifo_12_dout[12]), .B(adc_fifo_13_dout[12]), 
         .C(fifo_sel[0]), .Z(n11209)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6921_3_lut.init = 16'hcaca;
    LUT4 i6949_3_lut (.A(adc_fifo_8_dout[17]), .B(adc_fifo_9_dout[17]), 
         .C(fifo_sel[0]), .Z(n11237)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6949_3_lut.init = 16'hcaca;
    PFUMX i7013 (.BLUT(n11293), .ALUT(n11294), .C0(n11389), .Z(n11301));
    LUT4 i6920_3_lut (.A(adc_fifo_10_dout[12]), .B(adc_fifo_11_dout[12]), 
         .C(fifo_sel[0]), .Z(n11208)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6920_3_lut.init = 16'hcaca;
    PFUMX i7014 (.BLUT(n11295), .ALUT(n11296), .C0(n11376), .Z(n11302));
    LUT4 i6676_3_lut (.A(adc_fifo_2_dout[7]), .B(adc_fifo_3_dout[7]), .C(fifo_sel[0]), 
         .Z(n10964)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6676_3_lut.init = 16'hcaca;
    LUT4 i6675_3_lut (.A(adc_fifo_0_dout[7]), .B(adc_fifo_1_dout[7]), .C(fifo_sel[0]), 
         .Z(n10963)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6675_3_lut.init = 16'hcaca;
    PFUMX i7015 (.BLUT(n11297), .ALUT(n11298), .C0(n11377), .Z(n11303));
    PFUMX i7016 (.BLUT(n11299), .ALUT(n11300), .C0(n11377), .Z(n11304));
    LUT4 i6919_3_lut (.A(adc_fifo_8_dout[12]), .B(adc_fifo_9_dout[12]), 
         .C(fifo_sel[0]), .Z(n11207)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6919_3_lut.init = 16'hcaca;
    LUT4 i6918_3_lut (.A(adc_fifo_6_dout[12]), .B(adc_fifo_7_dout[12]), 
         .C(fifo_sel[0]), .Z(n11206)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6918_3_lut.init = 16'hcaca;
    LUT4 i6948_3_lut (.A(adc_fifo_6_dout[17]), .B(adc_fifo_7_dout[17]), 
         .C(fifo_sel[0]), .Z(n11236)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6948_3_lut.init = 16'hcaca;
    PFUMX i7028 (.BLUT(n11308), .ALUT(n11309), .C0(n11389), .Z(n11316));
    LUT4 i6917_3_lut (.A(adc_fifo_4_dout[12]), .B(adc_fifo_5_dout[12]), 
         .C(fifo_sel[0]), .Z(n11205)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6917_3_lut.init = 16'hcaca;
    LUT4 i6947_3_lut (.A(adc_fifo_4_dout[17]), .B(adc_fifo_5_dout[17]), 
         .C(fifo_sel[0]), .Z(n11235)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6947_3_lut.init = 16'hcaca;
    LUT4 i6916_3_lut (.A(adc_fifo_2_dout[12]), .B(adc_fifo_3_dout[12]), 
         .C(fifo_sel[0]), .Z(n11204)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6916_3_lut.init = 16'hcaca;
    LUT4 i6915_3_lut (.A(adc_fifo_0_dout[12]), .B(adc_fifo_1_dout[12]), 
         .C(fifo_sel[0]), .Z(n11203)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6915_3_lut.init = 16'hcaca;
    LUT4 i6712_3_lut (.A(adc_fifo_14_dout[15]), .B(adc_fifo_15_dout[15]), 
         .C(fifo_sel[0]), .Z(n11000)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6712_3_lut.init = 16'hcaca;
    LUT4 i6711_3_lut (.A(adc_fifo_12_dout[15]), .B(adc_fifo_13_dout[15]), 
         .C(fifo_sel[0]), .Z(n10999)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6711_3_lut.init = 16'hcaca;
    LUT4 i6946_3_lut (.A(adc_fifo_2_dout[17]), .B(adc_fifo_3_dout[17]), 
         .C(fifo_sel[0]), .Z(n11234)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6946_3_lut.init = 16'hcaca;
    LUT4 i6945_3_lut (.A(adc_fifo_0_dout[17]), .B(adc_fifo_1_dout[17]), 
         .C(fifo_sel[0]), .Z(n11233)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6945_3_lut.init = 16'hcaca;
    PFUMX i7029 (.BLUT(n11310), .ALUT(n11311), .C0(n11376), .Z(n11317));
    LUT4 i6907_3_lut (.A(adc_fifo_14_dout[11]), .B(adc_fifo_15_dout[11]), 
         .C(fifo_sel[0]), .Z(n11195)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6907_3_lut.init = 16'hcaca;
    LUT4 i6906_3_lut (.A(adc_fifo_12_dout[11]), .B(adc_fifo_13_dout[11]), 
         .C(fifo_sel[0]), .Z(n11194)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6906_3_lut.init = 16'hcaca;
    LUT4 i6937_3_lut (.A(adc_fifo_14_dout[3]), .B(adc_fifo_15_dout[3]), 
         .C(fifo_sel[0]), .Z(n11225)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6937_3_lut.init = 16'hcaca;
    LUT4 i6936_3_lut (.A(adc_fifo_12_dout[3]), .B(adc_fifo_13_dout[3]), 
         .C(fifo_sel[0]), .Z(n11224)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6936_3_lut.init = 16'hcaca;
    PFUMX i7030 (.BLUT(n11312), .ALUT(n11313), .C0(n11375), .Z(n11318));
    LUT4 i6710_3_lut (.A(adc_fifo_10_dout[15]), .B(adc_fifo_11_dout[15]), 
         .C(fifo_sel[0]), .Z(n10998)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6710_3_lut.init = 16'hcaca;
    LUT4 i6935_3_lut (.A(adc_fifo_10_dout[3]), .B(adc_fifo_11_dout[3]), 
         .C(fifo_sel[0]), .Z(n11223)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6935_3_lut.init = 16'hcaca;
    PFUMX i7031 (.BLUT(n11314), .ALUT(n11315), .C0(n11376), .Z(n11319));
    LUT4 i6934_3_lut (.A(adc_fifo_8_dout[3]), .B(adc_fifo_9_dout[3]), .C(fifo_sel[0]), 
         .Z(n11222)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6934_3_lut.init = 16'hcaca;
    PFUMX i6758 (.BLUT(n11038), .ALUT(n11039), .C0(n11373), .Z(n11046));
    LUT4 i6709_3_lut (.A(adc_fifo_8_dout[15]), .B(adc_fifo_9_dout[15]), 
         .C(fifo_sel[0]), .Z(n10997)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6709_3_lut.init = 16'hcaca;
    PFUMX i6698 (.BLUT(n10978), .ALUT(n10979), .C0(n11375), .Z(n10986));
    LUT4 i6754_3_lut (.A(adc_fifo_8_dout[20]), .B(adc_fifo_9_dout[20]), 
         .C(fifo_sel[0]), .Z(n11042)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6754_3_lut.init = 16'hcaca;
    PFUMX i6759 (.BLUT(n11040), .ALUT(n11041), .C0(n11394), .Z(n11047));
    LUT4 i6905_3_lut (.A(adc_fifo_10_dout[11]), .B(adc_fifo_11_dout[11]), 
         .C(fifo_sel[0]), .Z(n11193)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6905_3_lut.init = 16'hcaca;
    LUT4 i6904_3_lut (.A(adc_fifo_8_dout[11]), .B(adc_fifo_9_dout[11]), 
         .C(fifo_sel[0]), .Z(n11192)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6904_3_lut.init = 16'hcaca;
    PFUMX i6760 (.BLUT(n11042), .ALUT(n11043), .C0(n11394), .Z(n11048));
    PFUMX i6761 (.BLUT(n11044), .ALUT(n11045), .C0(n11394), .Z(n11049));
    LUT4 i6903_3_lut (.A(adc_fifo_6_dout[11]), .B(adc_fifo_7_dout[11]), 
         .C(fifo_sel[0]), .Z(n11191)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6903_3_lut.init = 16'hcaca;
    PFUMX i6699 (.BLUT(n10980), .ALUT(n10981), .C0(n11391), .Z(n10987));
    PFUMX i6773 (.BLUT(n11053), .ALUT(n11054), .C0(n11386), .Z(n11061));
    LUT4 i6902_3_lut (.A(adc_fifo_4_dout[11]), .B(adc_fifo_5_dout[11]), 
         .C(fifo_sel[0]), .Z(n11190)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6902_3_lut.init = 16'hcaca;
    LUT4 i6901_3_lut (.A(adc_fifo_2_dout[11]), .B(adc_fifo_3_dout[11]), 
         .C(fifo_sel[0]), .Z(n11189)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6901_3_lut.init = 16'hcaca;
    PFUMX i6774 (.BLUT(n11055), .ALUT(n11056), .C0(n11394), .Z(n11062));
    PFUMX i6775 (.BLUT(n11057), .ALUT(n11058), .C0(fifo_sel[1]), .Z(n11063));
    PFUMX i6776 (.BLUT(n11059), .ALUT(n11060), .C0(fifo_sel[1]), .Z(n11064));
    LUT4 i6900_3_lut (.A(adc_fifo_0_dout[11]), .B(adc_fifo_1_dout[11]), 
         .C(fifo_sel[0]), .Z(n11188)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6900_3_lut.init = 16'hcaca;
    LUT4 i6892_3_lut (.A(adc_fifo_14_dout[5]), .B(adc_fifo_15_dout[5]), 
         .C(fifo_sel[0]), .Z(n11180)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6892_3_lut.init = 16'hcaca;
    LUT4 i6891_3_lut (.A(adc_fifo_12_dout[5]), .B(adc_fifo_13_dout[5]), 
         .C(fifo_sel[0]), .Z(n11179)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6891_3_lut.init = 16'hcaca;
    PFUMX i6788 (.BLUT(n11068), .ALUT(n11069), .C0(n11386), .Z(n11076));
    PFUMX i6789 (.BLUT(n11070), .ALUT(n11071), .C0(fifo_sel[1]), .Z(n11077));
    PFUMX i6790 (.BLUT(n11072), .ALUT(n11073), .C0(fifo_sel[1]), .Z(n11078));
    PFUMX i6791 (.BLUT(n11074), .ALUT(n11075), .C0(n11385), .Z(n11079));
    PFUMX i6700 (.BLUT(n10982), .ALUT(n10983), .C0(n11391), .Z(n10988));
    LUT4 i6890_3_lut (.A(adc_fifo_10_dout[5]), .B(adc_fifo_11_dout[5]), 
         .C(fifo_sel[0]), .Z(n11178)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6890_3_lut.init = 16'hcaca;
    PFUMX i6803 (.BLUT(n11083), .ALUT(n11084), .C0(n11387), .Z(n11091));
    LUT4 i6889_3_lut (.A(adc_fifo_8_dout[5]), .B(adc_fifo_9_dout[5]), .C(fifo_sel[0]), 
         .Z(n11177)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6889_3_lut.init = 16'hcaca;
    PFUMX i6804 (.BLUT(n11085), .ALUT(n11086), .C0(n11385), .Z(n11092));
    LUT4 i6708_3_lut (.A(adc_fifo_6_dout[15]), .B(adc_fifo_7_dout[15]), 
         .C(fifo_sel[0]), .Z(n10996)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6708_3_lut.init = 16'hcaca;
    LUT4 i6707_3_lut (.A(adc_fifo_4_dout[15]), .B(adc_fifo_5_dout[15]), 
         .C(fifo_sel[0]), .Z(n10995)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6707_3_lut.init = 16'hcaca;
    LUT4 i6706_3_lut (.A(adc_fifo_2_dout[15]), .B(adc_fifo_3_dout[15]), 
         .C(fifo_sel[0]), .Z(n10994)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6706_3_lut.init = 16'hcaca;
    LUT4 i6705_3_lut (.A(adc_fifo_0_dout[15]), .B(adc_fifo_1_dout[15]), 
         .C(fifo_sel[0]), .Z(n10993)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6705_3_lut.init = 16'hcaca;
    PFUMX i6805 (.BLUT(n11087), .ALUT(n11088), .C0(n11385), .Z(n11093));
    LUT4 i6888_3_lut (.A(adc_fifo_6_dout[5]), .B(adc_fifo_7_dout[5]), .C(fifo_sel[0]), 
         .Z(n11176)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6888_3_lut.init = 16'hcaca;
    PFUMX i6806 (.BLUT(n11089), .ALUT(n11090), .C0(n11372), .Z(n11094));
    PFUMX i6701 (.BLUT(n10984), .ALUT(n10985), .C0(n11391), .Z(n10989));
    LUT4 i6887_3_lut (.A(adc_fifo_4_dout[5]), .B(adc_fifo_5_dout[5]), .C(fifo_sel[0]), 
         .Z(n11175)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6887_3_lut.init = 16'hcaca;
    PFUMX i6818 (.BLUT(n11098), .ALUT(n11099), .C0(n11375), .Z(n11106));
    LUT4 i6886_3_lut (.A(adc_fifo_2_dout[5]), .B(adc_fifo_3_dout[5]), .C(fifo_sel[0]), 
         .Z(n11174)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6886_3_lut.init = 16'hcaca;
    PFUMX i6819 (.BLUT(n11100), .ALUT(n11101), .C0(n11384), .Z(n11107));
    PFUMX i6820 (.BLUT(n11102), .ALUT(n11103), .C0(n11384), .Z(n11108));
    LUT4 i6885_3_lut (.A(adc_fifo_0_dout[5]), .B(adc_fifo_1_dout[5]), .C(fifo_sel[0]), 
         .Z(n11173)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6885_3_lut.init = 16'hcaca;
    PFUMX i6821 (.BLUT(n11104), .ALUT(n11105), .C0(n11384), .Z(n11109));
    PFUMX i6833 (.BLUT(n11113), .ALUT(n11114), .C0(n11387), .Z(n11121));
    PFUMX i6834 (.BLUT(n11115), .ALUT(n11116), .C0(n11374), .Z(n11122));
    LUT4 i6877_3_lut (.A(adc_fifo_14_dout[10]), .B(adc_fifo_15_dout[10]), 
         .C(fifo_sel[0]), .Z(n11165)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6877_3_lut.init = 16'hcaca;
    PFUMX i6835 (.BLUT(n11117), .ALUT(n11118), .C0(n11384), .Z(n11123));
    LUT4 i6876_3_lut (.A(adc_fifo_12_dout[10]), .B(adc_fifo_13_dout[10]), 
         .C(fifo_sel[0]), .Z(n11164)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6876_3_lut.init = 16'hcaca;
    PFUMX i6836 (.BLUT(n11119), .ALUT(n11120), .C0(n11383), .Z(n11124));
    PFUMX i6848 (.BLUT(n11128), .ALUT(n11129), .C0(n11387), .Z(n11136));
    LUT4 i6875_3_lut (.A(adc_fifo_10_dout[10]), .B(adc_fifo_11_dout[10]), 
         .C(fifo_sel[0]), .Z(n11163)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6875_3_lut.init = 16'hcaca;
    LUT4 i6874_3_lut (.A(adc_fifo_8_dout[10]), .B(adc_fifo_9_dout[10]), 
         .C(fifo_sel[0]), .Z(n11162)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6874_3_lut.init = 16'hcaca;
    PFUMX i6849 (.BLUT(n11130), .ALUT(n11131), .C0(n11383), .Z(n11137));
    PFUMX i6850 (.BLUT(n11132), .ALUT(n11133), .C0(n11374), .Z(n11138));
    LUT4 i6873_3_lut (.A(adc_fifo_6_dout[10]), .B(adc_fifo_7_dout[10]), 
         .C(fifo_sel[0]), .Z(n11161)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6873_3_lut.init = 16'hcaca;
    LUT4 i6872_3_lut (.A(adc_fifo_4_dout[10]), .B(adc_fifo_5_dout[10]), 
         .C(fifo_sel[0]), .Z(n11160)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6872_3_lut.init = 16'hcaca;
    LUT4 i6753_3_lut (.A(adc_fifo_6_dout[20]), .B(adc_fifo_7_dout[20]), 
         .C(fifo_sel[0]), .Z(n11041)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6753_3_lut.init = 16'hcaca;
    PFUMX i6851 (.BLUT(n11134), .ALUT(n11135), .C0(n11383), .Z(n11139));
    PFUMX i6863 (.BLUT(n11143), .ALUT(n11144), .C0(n11387), .Z(n11151));
    LUT4 i6871_3_lut (.A(adc_fifo_2_dout[10]), .B(adc_fifo_3_dout[10]), 
         .C(fifo_sel[0]), .Z(n11159)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6871_3_lut.init = 16'hcaca;
    PFUMX i6864 (.BLUT(n11145), .ALUT(n11146), .C0(n11383), .Z(n11152));
    PFUMX i6865 (.BLUT(n11147), .ALUT(n11148), .C0(n11382), .Z(n11153));
    LUT4 i6870_3_lut (.A(adc_fifo_0_dout[10]), .B(adc_fifo_1_dout[10]), 
         .C(fifo_sel[0]), .Z(n11158)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6870_3_lut.init = 16'hcaca;
    LUT4 i6862_3_lut (.A(adc_fifo_14_dout[9]), .B(adc_fifo_15_dout[9]), 
         .C(fifo_sel[0]), .Z(n11150)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6862_3_lut.init = 16'hcaca;
    PFUMX i6866 (.BLUT(n11149), .ALUT(n11150), .C0(n11373), .Z(n11154));
    LUT4 i6861_3_lut (.A(adc_fifo_12_dout[9]), .B(adc_fifo_13_dout[9]), 
         .C(fifo_sel[0]), .Z(n11149)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6861_3_lut.init = 16'hcaca;
    PFUMX i6878 (.BLUT(n11158), .ALUT(n11159), .C0(n11373), .Z(n11166));
    LUT4 i6860_3_lut (.A(adc_fifo_10_dout[9]), .B(adc_fifo_11_dout[9]), 
         .C(fifo_sel[0]), .Z(n11148)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6860_3_lut.init = 16'hcaca;
    LUT4 i6859_3_lut (.A(adc_fifo_8_dout[9]), .B(adc_fifo_9_dout[9]), .C(fifo_sel[0]), 
         .Z(n11147)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6859_3_lut.init = 16'hcaca;
    PFUMX i6879 (.BLUT(n11160), .ALUT(n11161), .C0(n11382), .Z(n11167));
    LUT4 i6858_3_lut (.A(adc_fifo_6_dout[9]), .B(adc_fifo_7_dout[9]), .C(fifo_sel[0]), 
         .Z(n11146)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6858_3_lut.init = 16'hcaca;
    LUT4 i6857_3_lut (.A(adc_fifo_4_dout[9]), .B(adc_fifo_5_dout[9]), .C(fifo_sel[0]), 
         .Z(n11145)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6857_3_lut.init = 16'hcaca;
    LUT4 i6856_3_lut (.A(adc_fifo_2_dout[9]), .B(adc_fifo_3_dout[9]), .C(fifo_sel[0]), 
         .Z(n11144)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6856_3_lut.init = 16'hcaca;
    PFUMX i6880 (.BLUT(n11162), .ALUT(n11163), .C0(n11382), .Z(n11168));
    PFUMX i6881 (.BLUT(n11164), .ALUT(n11165), .C0(n11382), .Z(n11169));
    LUT4 i6855_3_lut (.A(adc_fifo_0_dout[9]), .B(adc_fifo_1_dout[9]), .C(fifo_sel[0]), 
         .Z(n11143)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6855_3_lut.init = 16'hcaca;
    LUT4 i6847_3_lut (.A(adc_fifo_14_dout[16]), .B(adc_fifo_15_dout[16]), 
         .C(fifo_sel[0]), .Z(n11135)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6847_3_lut.init = 16'hcaca;
    PFUMX i6893 (.BLUT(n11173), .ALUT(n11174), .C0(n11388), .Z(n11181));
    PFUMX i6894 (.BLUT(n11175), .ALUT(n11176), .C0(n11374), .Z(n11182));
    PFUMX i6713 (.BLUT(n10993), .ALUT(n10994), .C0(n11385), .Z(n11001));
    PFUMX i6714 (.BLUT(n10995), .ALUT(n10996), .C0(n11391), .Z(n11002));
    PFUMX i6895 (.BLUT(n11177), .ALUT(n11178), .C0(n11381), .Z(n11183));
    LUT4 i6846_3_lut (.A(adc_fifo_12_dout[16]), .B(adc_fifo_13_dout[16]), 
         .C(fifo_sel[0]), .Z(n11134)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6846_3_lut.init = 16'hcaca;
    PFUMX i6896 (.BLUT(n11179), .ALUT(n11180), .C0(n11381), .Z(n11184));
    LUT4 i6845_3_lut (.A(adc_fifo_10_dout[16]), .B(adc_fifo_11_dout[16]), 
         .C(fifo_sel[0]), .Z(n11133)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6845_3_lut.init = 16'hcaca;
    LUT4 i6844_3_lut (.A(adc_fifo_8_dout[16]), .B(adc_fifo_9_dout[16]), 
         .C(fifo_sel[0]), .Z(n11132)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6844_3_lut.init = 16'hcaca;
    PFUMX i6908 (.BLUT(n11188), .ALUT(n11189), .C0(n11388), .Z(n11196));
    PFUMX i6909 (.BLUT(n11190), .ALUT(n11191), .C0(n11381), .Z(n11197));
    PFUMX i6910 (.BLUT(n11192), .ALUT(n11193), .C0(n11374), .Z(n11198));
    PFUMX i6715 (.BLUT(n10997), .ALUT(n10998), .C0(n11392), .Z(n11003));
    LUT4 i6843_3_lut (.A(adc_fifo_6_dout[16]), .B(adc_fifo_7_dout[16]), 
         .C(fifo_sel[0]), .Z(n11131)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6843_3_lut.init = 16'hcaca;
    PFUMX i6911 (.BLUT(n11194), .ALUT(n11195), .C0(n11381), .Z(n11199));
    LUT4 i6752_3_lut (.A(adc_fifo_4_dout[20]), .B(adc_fifo_5_dout[20]), 
         .C(fifo_sel[0]), .Z(n11040)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6752_3_lut.init = 16'hcaca;
    PFUMX i6716 (.BLUT(n10999), .ALUT(n11000), .C0(n11392), .Z(n11004));
    LUT4 i6842_3_lut (.A(adc_fifo_4_dout[16]), .B(adc_fifo_5_dout[16]), 
         .C(fifo_sel[0]), .Z(n11130)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6842_3_lut.init = 16'hcaca;
    LUT4 i6841_3_lut (.A(adc_fifo_2_dout[16]), .B(adc_fifo_3_dout[16]), 
         .C(fifo_sel[0]), .Z(n11129)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6841_3_lut.init = 16'hcaca;
    PFUMX i6923 (.BLUT(n11203), .ALUT(n11204), .C0(n11388), .Z(n11211));
    PFUMX i6924 (.BLUT(n11205), .ALUT(n11206), .C0(n11380), .Z(n11212));
    PFUMX i6925 (.BLUT(n11207), .ALUT(n11208), .C0(n11380), .Z(n11213));
    PFUMX i6926 (.BLUT(n11209), .ALUT(n11210), .C0(n11375), .Z(n11214));
    LUT4 i6840_3_lut (.A(adc_fifo_0_dout[16]), .B(adc_fifo_1_dout[16]), 
         .C(fifo_sel[0]), .Z(n11128)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6840_3_lut.init = 16'hcaca;
    LUT4 i6832_3_lut (.A(adc_fifo_14_dout[8]), .B(adc_fifo_15_dout[8]), 
         .C(fifo_sel[0]), .Z(n11120)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6832_3_lut.init = 16'hcaca;
    PFUMX i6938 (.BLUT(n11218), .ALUT(n11219), .C0(n11372), .Z(n11226));
    LUT4 i6831_3_lut (.A(adc_fifo_12_dout[8]), .B(adc_fifo_13_dout[8]), 
         .C(fifo_sel[0]), .Z(n11119)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6831_3_lut.init = 16'hcaca;
    PFUMX i6728 (.BLUT(n11008), .ALUT(n11009), .C0(n11386), .Z(n11016));
    LUT4 i6830_3_lut (.A(adc_fifo_10_dout[8]), .B(adc_fifo_11_dout[8]), 
         .C(fifo_sel[0]), .Z(n11118)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6830_3_lut.init = 16'hcaca;
    LUT4 i6829_3_lut (.A(adc_fifo_8_dout[8]), .B(adc_fifo_9_dout[8]), .C(fifo_sel[0]), 
         .Z(n11117)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6829_3_lut.init = 16'hcaca;
    PFUMX i6729 (.BLUT(n11010), .ALUT(n11011), .C0(n11392), .Z(n11017));
    LUT4 i6828_3_lut (.A(adc_fifo_6_dout[8]), .B(adc_fifo_7_dout[8]), .C(fifo_sel[0]), 
         .Z(n11116)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6828_3_lut.init = 16'hcaca;
    PFUMX i6730 (.BLUT(n11012), .ALUT(n11013), .C0(n11392), .Z(n11018));
    PFUMX i6731 (.BLUT(n11014), .ALUT(n11015), .C0(n11393), .Z(n11019));
    PFUMX i6939 (.BLUT(n11220), .ALUT(n11221), .C0(n11380), .Z(n11227));
    PFUMX i6940 (.BLUT(n11222), .ALUT(n11223), .C0(n11380), .Z(n11228));
    PFUMX i6941 (.BLUT(n11224), .ALUT(n11225), .C0(n11379), .Z(n11229));
    PFUMX i6953 (.BLUT(n11233), .ALUT(n11234), .C0(n11388), .Z(n11241));
    PFUMX i6954 (.BLUT(n11235), .ALUT(n11236), .C0(n11373), .Z(n11242));
    LUT4 i6827_3_lut (.A(adc_fifo_4_dout[8]), .B(adc_fifo_5_dout[8]), .C(fifo_sel[0]), 
         .Z(n11115)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6827_3_lut.init = 16'hcaca;
    PFUMX i6683 (.BLUT(n10963), .ALUT(n10964), .C0(n11390), .Z(n10971));
    LUT4 i6826_3_lut (.A(adc_fifo_2_dout[8]), .B(adc_fifo_3_dout[8]), .C(fifo_sel[0]), 
         .Z(n11114)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6826_3_lut.init = 16'hcaca;
    PFUMX i6955 (.BLUT(n11237), .ALUT(n11238), .C0(n11379), .Z(n11243));
    LUT4 i6825_3_lut (.A(adc_fifo_0_dout[8]), .B(adc_fifo_1_dout[8]), .C(fifo_sel[0]), 
         .Z(n11113)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6825_3_lut.init = 16'hcaca;
    LUT4 i6817_3_lut (.A(adc_fifo_14_dout[2]), .B(adc_fifo_15_dout[2]), 
         .C(fifo_sel[0]), .Z(n11105)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6817_3_lut.init = 16'hcaca;
    PFUMX i6956 (.BLUT(n11239), .ALUT(n11240), .C0(n11379), .Z(n11244));
    LUT4 i6816_3_lut (.A(adc_fifo_12_dout[2]), .B(adc_fifo_13_dout[2]), 
         .C(fifo_sel[0]), .Z(n11104)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6816_3_lut.init = 16'hcaca;
    LUT4 i6815_3_lut (.A(adc_fifo_10_dout[2]), .B(adc_fifo_11_dout[2]), 
         .C(fifo_sel[0]), .Z(n11103)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6815_3_lut.init = 16'hcaca;
    PFUMX i6684 (.BLUT(n10965), .ALUT(n10966), .C0(n11390), .Z(n10972));
    LUT4 i6814_3_lut (.A(adc_fifo_8_dout[2]), .B(adc_fifo_9_dout[2]), .C(fifo_sel[0]), 
         .Z(n11102)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6814_3_lut.init = 16'hcaca;
    PFUMX i6685 (.BLUT(n10967), .ALUT(n10968), .C0(n11390), .Z(n10973));
    LUT4 i6813_3_lut (.A(adc_fifo_6_dout[2]), .B(adc_fifo_7_dout[2]), .C(fifo_sel[0]), 
         .Z(n11101)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6813_3_lut.init = 16'hcaca;
    LUT4 i6812_3_lut (.A(adc_fifo_4_dout[2]), .B(adc_fifo_5_dout[2]), .C(fifo_sel[0]), 
         .Z(n11100)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6812_3_lut.init = 16'hcaca;
    PFUMX i6686 (.BLUT(n10969), .ALUT(n10970), .C0(n11390), .Z(n10974));
    LUT4 i6811_3_lut (.A(adc_fifo_2_dout[2]), .B(adc_fifo_3_dout[2]), .C(fifo_sel[0]), 
         .Z(n11099)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6811_3_lut.init = 16'hcaca;
    LUT4 i6810_3_lut (.A(adc_fifo_0_dout[2]), .B(adc_fifo_1_dout[2]), .C(fifo_sel[0]), 
         .Z(n11098)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6810_3_lut.init = 16'hcaca;
    LUT4 i6697_3_lut (.A(adc_fifo_14_dout[14]), .B(adc_fifo_15_dout[14]), 
         .C(fifo_sel[0]), .Z(n10985)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6697_3_lut.init = 16'hcaca;
    PFUMX i6968 (.BLUT(n11248), .ALUT(n11249), .C0(n11389), .Z(n11256));
    PFUMX i6969 (.BLUT(n11250), .ALUT(n11251), .C0(n11379), .Z(n11257));
    LUT4 i6696_3_lut (.A(adc_fifo_12_dout[14]), .B(adc_fifo_13_dout[14]), 
         .C(fifo_sel[0]), .Z(n10984)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6696_3_lut.init = 16'hcaca;
    LUT4 i6802_3_lut (.A(adc_fifo_14_dout[23]), .B(adc_fifo_15_dout[23]), 
         .C(fifo_sel[0]), .Z(n11090)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6802_3_lut.init = 16'hcaca;
    PFUMX i6970 (.BLUT(n11252), .ALUT(n11253), .C0(n11372), .Z(n11258));
    LUT4 i6801_3_lut (.A(adc_fifo_12_dout[23]), .B(adc_fifo_13_dout[23]), 
         .C(fifo_sel[0]), .Z(n11089)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6801_3_lut.init = 16'hcaca;
    LUT4 i6800_3_lut (.A(adc_fifo_10_dout[23]), .B(adc_fifo_11_dout[23]), 
         .C(fifo_sel[0]), .Z(n11088)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6800_3_lut.init = 16'hcaca;
    PFUMX i6971 (.BLUT(n11254), .ALUT(n11255), .C0(n11378), .Z(n11259));
    LUT4 i6799_3_lut (.A(adc_fifo_8_dout[23]), .B(adc_fifo_9_dout[23]), 
         .C(fifo_sel[0]), .Z(n11087)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6799_3_lut.init = 16'hcaca;
    LUT4 i6798_3_lut (.A(adc_fifo_6_dout[23]), .B(adc_fifo_7_dout[23]), 
         .C(fifo_sel[0]), .Z(n11086)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6798_3_lut.init = 16'hcaca;
    LUT4 i6797_3_lut (.A(adc_fifo_4_dout[23]), .B(adc_fifo_5_dout[23]), 
         .C(fifo_sel[0]), .Z(n11085)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6797_3_lut.init = 16'hcaca;
    LUT4 i6796_3_lut (.A(adc_fifo_2_dout[23]), .B(adc_fifo_3_dout[23]), 
         .C(fifo_sel[0]), .Z(n11084)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6796_3_lut.init = 16'hcaca;
    LUT4 i6795_3_lut (.A(adc_fifo_0_dout[23]), .B(adc_fifo_1_dout[23]), 
         .C(fifo_sel[0]), .Z(n11083)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6795_3_lut.init = 16'hcaca;
    LUT4 i6695_3_lut (.A(adc_fifo_10_dout[14]), .B(adc_fifo_11_dout[14]), 
         .C(fifo_sel[0]), .Z(n10983)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6695_3_lut.init = 16'hcaca;
    LUT4 i6694_3_lut (.A(adc_fifo_8_dout[14]), .B(adc_fifo_9_dout[14]), 
         .C(fifo_sel[0]), .Z(n10982)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6694_3_lut.init = 16'hcaca;
    LUT4 i6787_3_lut (.A(adc_fifo_14_dout[22]), .B(adc_fifo_15_dout[22]), 
         .C(fifo_sel[0]), .Z(n11075)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6787_3_lut.init = 16'hcaca;
    LUT4 i6786_3_lut (.A(adc_fifo_12_dout[22]), .B(adc_fifo_13_dout[22]), 
         .C(fifo_sel[0]), .Z(n11074)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6786_3_lut.init = 16'hcaca;
    LUT4 i6785_3_lut (.A(adc_fifo_10_dout[22]), .B(adc_fifo_11_dout[22]), 
         .C(fifo_sel[0]), .Z(n11073)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6785_3_lut.init = 16'hcaca;
    LUT4 i6784_3_lut (.A(adc_fifo_8_dout[22]), .B(adc_fifo_9_dout[22]), 
         .C(fifo_sel[0]), .Z(n11072)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6784_3_lut.init = 16'hcaca;
    LUT4 i6783_3_lut (.A(adc_fifo_6_dout[22]), .B(adc_fifo_7_dout[22]), 
         .C(fifo_sel[0]), .Z(n11071)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6783_3_lut.init = 16'hcaca;
    LUT4 i6782_3_lut (.A(adc_fifo_4_dout[22]), .B(adc_fifo_5_dout[22]), 
         .C(fifo_sel[0]), .Z(n11070)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6782_3_lut.init = 16'hcaca;
    LUT4 i6781_3_lut (.A(adc_fifo_2_dout[22]), .B(adc_fifo_3_dout[22]), 
         .C(fifo_sel[0]), .Z(n11069)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6781_3_lut.init = 16'hcaca;
    LUT4 i6780_3_lut (.A(adc_fifo_0_dout[22]), .B(adc_fifo_1_dout[22]), 
         .C(fifo_sel[0]), .Z(n11068)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6780_3_lut.init = 16'hcaca;
    LUT4 i6772_3_lut (.A(adc_fifo_14_dout[21]), .B(adc_fifo_15_dout[21]), 
         .C(fifo_sel[0]), .Z(n11060)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6772_3_lut.init = 16'hcaca;
    LUT4 i6771_3_lut (.A(adc_fifo_12_dout[21]), .B(adc_fifo_13_dout[21]), 
         .C(fifo_sel[0]), .Z(n11059)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6771_3_lut.init = 16'hcaca;
    LUT4 i6770_3_lut (.A(adc_fifo_10_dout[21]), .B(adc_fifo_11_dout[21]), 
         .C(fifo_sel[0]), .Z(n11058)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6770_3_lut.init = 16'hcaca;
    LUT4 i6769_3_lut (.A(adc_fifo_8_dout[21]), .B(adc_fifo_9_dout[21]), 
         .C(fifo_sel[0]), .Z(n11057)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6769_3_lut.init = 16'hcaca;
    LUT4 i6768_3_lut (.A(adc_fifo_6_dout[21]), .B(adc_fifo_7_dout[21]), 
         .C(fifo_sel[0]), .Z(n11056)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6768_3_lut.init = 16'hcaca;
    LUT4 i6767_3_lut (.A(adc_fifo_4_dout[21]), .B(adc_fifo_5_dout[21]), 
         .C(fifo_sel[0]), .Z(n11055)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6767_3_lut.init = 16'hcaca;
    LUT4 i6766_3_lut (.A(adc_fifo_2_dout[21]), .B(adc_fifo_3_dout[21]), 
         .C(fifo_sel[0]), .Z(n11054)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6766_3_lut.init = 16'hcaca;
    LUT4 i6765_3_lut (.A(adc_fifo_0_dout[21]), .B(adc_fifo_1_dout[21]), 
         .C(fifo_sel[0]), .Z(n11053)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6765_3_lut.init = 16'hcaca;
    LUT4 i6693_3_lut (.A(adc_fifo_6_dout[14]), .B(adc_fifo_7_dout[14]), 
         .C(fifo_sel[0]), .Z(n10981)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6693_3_lut.init = 16'hcaca;
    LUT4 i6692_3_lut (.A(adc_fifo_4_dout[14]), .B(adc_fifo_5_dout[14]), 
         .C(fifo_sel[0]), .Z(n10980)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6692_3_lut.init = 16'hcaca;
    LUT4 i6691_3_lut (.A(adc_fifo_2_dout[14]), .B(adc_fifo_3_dout[14]), 
         .C(fifo_sel[0]), .Z(n10979)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6691_3_lut.init = 16'hcaca;
    LUT4 i6690_3_lut (.A(adc_fifo_0_dout[14]), .B(adc_fifo_1_dout[14]), 
         .C(fifo_sel[0]), .Z(n10978)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6690_3_lut.init = 16'hcaca;
    LUT4 i6757_3_lut (.A(adc_fifo_14_dout[20]), .B(adc_fifo_15_dout[20]), 
         .C(fifo_sel[0]), .Z(n11045)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6757_3_lut.init = 16'hcaca;
    LUT4 i6755_3_lut (.A(adc_fifo_10_dout[20]), .B(adc_fifo_11_dout[20]), 
         .C(fifo_sel[0]), .Z(n11043)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6755_3_lut.init = 16'hcaca;
    LUT4 i6751_3_lut (.A(adc_fifo_2_dout[20]), .B(adc_fifo_3_dout[20]), 
         .C(fifo_sel[0]), .Z(n11039)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6751_3_lut.init = 16'hcaca;
    LUT4 i6750_3_lut (.A(adc_fifo_0_dout[20]), .B(adc_fifo_1_dout[20]), 
         .C(fifo_sel[0]), .Z(n11038)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6750_3_lut.init = 16'hcaca;
    LUT4 i7027_3_lut (.A(adc_fifo_14_dout[0]), .B(adc_fifo_15_dout[0]), 
         .C(fifo_sel[0]), .Z(n11315)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i7027_3_lut.init = 16'hcaca;
    LUT4 i7026_3_lut (.A(adc_fifo_12_dout[0]), .B(adc_fifo_13_dout[0]), 
         .C(fifo_sel[0]), .Z(n11314)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i7026_3_lut.init = 16'hcaca;
    LUT4 i7025_3_lut (.A(adc_fifo_10_dout[0]), .B(adc_fifo_11_dout[0]), 
         .C(fifo_sel[0]), .Z(n11313)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i7025_3_lut.init = 16'hcaca;
    LUT4 i7024_3_lut (.A(adc_fifo_8_dout[0]), .B(adc_fifo_9_dout[0]), .C(fifo_sel[0]), 
         .Z(n11312)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i7024_3_lut.init = 16'hcaca;
    LUT4 i7023_3_lut (.A(adc_fifo_6_dout[0]), .B(adc_fifo_7_dout[0]), .C(fifo_sel[0]), 
         .Z(n11311)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i7023_3_lut.init = 16'hcaca;
    LUT4 i7022_3_lut (.A(adc_fifo_4_dout[0]), .B(adc_fifo_5_dout[0]), .C(fifo_sel[0]), 
         .Z(n11310)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i7022_3_lut.init = 16'hcaca;
    LUT4 i7021_3_lut (.A(adc_fifo_2_dout[0]), .B(adc_fifo_3_dout[0]), .C(fifo_sel[0]), 
         .Z(n11309)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i7021_3_lut.init = 16'hcaca;
    LUT4 i7020_3_lut (.A(adc_fifo_0_dout[0]), .B(adc_fifo_1_dout[0]), .C(fifo_sel[0]), 
         .Z(n11308)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i7020_3_lut.init = 16'hcaca;
    LUT4 i7012_3_lut (.A(adc_fifo_14_dout[1]), .B(adc_fifo_15_dout[1]), 
         .C(fifo_sel[0]), .Z(n11300)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i7012_3_lut.init = 16'hcaca;
    LUT4 i6756_3_lut (.A(adc_fifo_12_dout[20]), .B(adc_fifo_13_dout[20]), 
         .C(fifo_sel[0]), .Z(n11044)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6756_3_lut.init = 16'hcaca;
    LUT4 i7011_3_lut (.A(adc_fifo_12_dout[1]), .B(adc_fifo_13_dout[1]), 
         .C(fifo_sel[0]), .Z(n11299)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i7011_3_lut.init = 16'hcaca;
    LUT4 i7010_3_lut (.A(adc_fifo_10_dout[1]), .B(adc_fifo_11_dout[1]), 
         .C(fifo_sel[0]), .Z(n11298)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i7010_3_lut.init = 16'hcaca;
    LUT4 i7009_3_lut (.A(adc_fifo_8_dout[1]), .B(adc_fifo_9_dout[1]), .C(fifo_sel[0]), 
         .Z(n11297)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i7009_3_lut.init = 16'hcaca;
    LUT4 i7008_3_lut (.A(adc_fifo_6_dout[1]), .B(adc_fifo_7_dout[1]), .C(fifo_sel[0]), 
         .Z(n11296)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i7008_3_lut.init = 16'hcaca;
    LUT4 i7007_3_lut (.A(adc_fifo_4_dout[1]), .B(adc_fifo_5_dout[1]), .C(fifo_sel[0]), 
         .Z(n11295)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i7007_3_lut.init = 16'hcaca;
    LUT4 i7006_3_lut (.A(adc_fifo_2_dout[1]), .B(adc_fifo_3_dout[1]), .C(fifo_sel[0]), 
         .Z(n11294)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i7006_3_lut.init = 16'hcaca;
    LUT4 i7005_3_lut (.A(adc_fifo_0_dout[1]), .B(adc_fifo_1_dout[1]), .C(fifo_sel[0]), 
         .Z(n11293)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i7005_3_lut.init = 16'hcaca;
    LUT4 i6997_3_lut (.A(adc_fifo_14_dout[6]), .B(adc_fifo_15_dout[6]), 
         .C(fifo_sel[0]), .Z(n11285)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6997_3_lut.init = 16'hcaca;
    LUT4 i6996_3_lut (.A(adc_fifo_12_dout[6]), .B(adc_fifo_13_dout[6]), 
         .C(fifo_sel[0]), .Z(n11284)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6996_3_lut.init = 16'hcaca;
    LUT4 i6995_3_lut (.A(adc_fifo_10_dout[6]), .B(adc_fifo_11_dout[6]), 
         .C(fifo_sel[0]), .Z(n11283)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6995_3_lut.init = 16'hcaca;
    LUT4 i6994_3_lut (.A(adc_fifo_8_dout[6]), .B(adc_fifo_9_dout[6]), .C(fifo_sel[0]), 
         .Z(n11282)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6994_3_lut.init = 16'hcaca;
    LUT4 i6993_3_lut (.A(adc_fifo_6_dout[6]), .B(adc_fifo_7_dout[6]), .C(fifo_sel[0]), 
         .Z(n11281)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6993_3_lut.init = 16'hcaca;
    LUT4 i6992_3_lut (.A(adc_fifo_4_dout[6]), .B(adc_fifo_5_dout[6]), .C(fifo_sel[0]), 
         .Z(n11280)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6992_3_lut.init = 16'hcaca;
    LUT4 i6991_3_lut (.A(adc_fifo_2_dout[6]), .B(adc_fifo_3_dout[6]), .C(fifo_sel[0]), 
         .Z(n11279)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6991_3_lut.init = 16'hcaca;
    LUT4 i6990_3_lut (.A(adc_fifo_0_dout[6]), .B(adc_fifo_1_dout[6]), .C(fifo_sel[0]), 
         .Z(n11278)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6990_3_lut.init = 16'hcaca;
    LUT4 i6742_3_lut (.A(adc_fifo_14_dout[19]), .B(adc_fifo_15_dout[19]), 
         .C(fifo_sel[0]), .Z(n11030)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6742_3_lut.init = 16'hcaca;
    LUT4 i6741_3_lut (.A(adc_fifo_12_dout[19]), .B(adc_fifo_13_dout[19]), 
         .C(fifo_sel[0]), .Z(n11029)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6741_3_lut.init = 16'hcaca;
    LUT4 i6740_3_lut (.A(adc_fifo_10_dout[19]), .B(adc_fifo_11_dout[19]), 
         .C(fifo_sel[0]), .Z(n11028)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6740_3_lut.init = 16'hcaca;
    LUT4 i6739_3_lut (.A(adc_fifo_8_dout[19]), .B(adc_fifo_9_dout[19]), 
         .C(fifo_sel[0]), .Z(n11027)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6739_3_lut.init = 16'hcaca;
    LUT4 i6982_3_lut (.A(adc_fifo_14_dout[13]), .B(adc_fifo_15_dout[13]), 
         .C(fifo_sel[0]), .Z(n11270)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6982_3_lut.init = 16'hcaca;
    LUT4 i6981_3_lut (.A(adc_fifo_12_dout[13]), .B(adc_fifo_13_dout[13]), 
         .C(fifo_sel[0]), .Z(n11269)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6981_3_lut.init = 16'hcaca;
    LUT4 i6980_3_lut (.A(adc_fifo_10_dout[13]), .B(adc_fifo_11_dout[13]), 
         .C(fifo_sel[0]), .Z(n11268)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6980_3_lut.init = 16'hcaca;
    LUT4 i6979_3_lut (.A(adc_fifo_8_dout[13]), .B(adc_fifo_9_dout[13]), 
         .C(fifo_sel[0]), .Z(n11267)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6979_3_lut.init = 16'hcaca;
    LUT4 i6978_3_lut (.A(adc_fifo_6_dout[13]), .B(adc_fifo_7_dout[13]), 
         .C(fifo_sel[0]), .Z(n11266)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6978_3_lut.init = 16'hcaca;
    LUT4 i6977_3_lut (.A(adc_fifo_4_dout[13]), .B(adc_fifo_5_dout[13]), 
         .C(fifo_sel[0]), .Z(n11265)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6977_3_lut.init = 16'hcaca;
    LUT4 i6976_3_lut (.A(adc_fifo_2_dout[13]), .B(adc_fifo_3_dout[13]), 
         .C(fifo_sel[0]), .Z(n11264)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6976_3_lut.init = 16'hcaca;
    LUT4 i6975_3_lut (.A(adc_fifo_0_dout[13]), .B(adc_fifo_1_dout[13]), 
         .C(fifo_sel[0]), .Z(n11263)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6975_3_lut.init = 16'hcaca;
    LUT4 i6738_3_lut (.A(adc_fifo_6_dout[19]), .B(adc_fifo_7_dout[19]), 
         .C(fifo_sel[0]), .Z(n11026)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6738_3_lut.init = 16'hcaca;
    LUT4 i6737_3_lut (.A(adc_fifo_4_dout[19]), .B(adc_fifo_5_dout[19]), 
         .C(fifo_sel[0]), .Z(n11025)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6737_3_lut.init = 16'hcaca;
    LUT4 i6736_3_lut (.A(adc_fifo_2_dout[19]), .B(adc_fifo_3_dout[19]), 
         .C(fifo_sel[0]), .Z(n11024)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6736_3_lut.init = 16'hcaca;
    LUT4 i6735_3_lut (.A(adc_fifo_0_dout[19]), .B(adc_fifo_1_dout[19]), 
         .C(fifo_sel[0]), .Z(n11023)) /* synthesis lut_function=(A (B+!(C))+!A (B (C))) */ ;
    defparam i6735_3_lut.init = 16'hcaca;
    
endmodule
