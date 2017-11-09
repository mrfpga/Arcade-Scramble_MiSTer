library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity ROM_SND_1 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of ROM_SND_1 is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"0C",X"80",X"77",X"C9",X"B7",X"C8",X"21",X"17",X"08",X"E5",X"87",X"5F",X"16",X"00",X"21",X"60",
		X"08",X"19",X"5E",X"23",X"56",X"EB",X"E9",X"B7",X"C8",X"3A",X"10",X"80",X"FE",X"01",X"28",X"18",
		X"FE",X"02",X"28",X"1C",X"FE",X"03",X"28",X"20",X"FE",X"04",X"28",X"24",X"FE",X"05",X"28",X"28",
		X"AF",X"32",X"0A",X"80",X"32",X"0B",X"80",X"C9",X"AF",X"32",X"00",X"80",X"32",X"01",X"80",X"C9",
		X"AF",X"32",X"02",X"80",X"32",X"03",X"80",X"C9",X"AF",X"32",X"04",X"80",X"32",X"05",X"80",X"C9",
		X"AF",X"32",X"06",X"80",X"32",X"07",X"80",X"C9",X"AF",X"32",X"08",X"80",X"32",X"09",X"80",X"C9",
		X"00",X"00",X"39",X"09",X"B5",X"09",X"31",X"0A",X"AD",X"0A",X"29",X"0B",X"1F",X"0D",X"4E",X"12",
		X"CE",X"13",X"CE",X"0D",X"D4",X"0D",X"4A",X"10",X"51",X"10",X"58",X"10",X"C7",X"10",X"CE",X"10",
		X"00",X"00",X"00",X"00",X"20",X"11",X"73",X"0B",X"12",X"0C",X"A3",X"0C",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"97",X"0D",X"B1",X"11",X"1A",X"12",X"DE",X"12",X"5B",X"13",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"CD",X"2C",X"0B",X"3E",X"03",X"32",X"1B",X"80",X"3E",X"0F",X"32",X"1C",X"80",X"3E",X"1F",X"32",
		X"1D",X"80",X"21",X"80",X"00",X"22",X"1E",X"80",X"22",X"20",X"80",X"3E",X"04",X"32",X"22",X"80",
		X"3E",X"40",X"32",X"23",X"80",X"32",X"24",X"80",X"3E",X"03",X"32",X"26",X"80",X"3E",X"0A",X"32",
		X"27",X"80",X"21",X"00",X"08",X"22",X"28",X"80",X"3E",X"08",X"32",X"2A",X"80",X"32",X"2B",X"80",
		X"21",X"40",X"00",X"22",X"2C",X"80",X"22",X"2E",X"80",X"3E",X"0C",X"32",X"30",X"80",X"3E",X"03",
		X"32",X"32",X"80",X"3E",X"0A",X"32",X"33",X"80",X"21",X"00",X"02",X"22",X"34",X"80",X"21",X"00",
		X"08",X"22",X"36",X"80",X"21",X"00",X"02",X"22",X"38",X"80",X"3E",X"08",X"32",X"3A",X"80",X"32",
		X"3B",X"80",X"21",X"20",X"00",X"22",X"3D",X"80",X"C9",X"3E",X"FF",X"C9",X"CD",X"2C",X"0B",X"3E",
		X"03",X"32",X"1B",X"80",X"3E",X"0F",X"32",X"1C",X"80",X"3E",X"1F",X"32",X"1D",X"80",X"21",X"80",
		X"00",X"22",X"1E",X"80",X"22",X"20",X"80",X"3E",X"01",X"32",X"22",X"80",X"3E",X"20",X"32",X"23",
		X"80",X"32",X"24",X"80",X"3E",X"03",X"32",X"26",X"80",X"3E",X"0D",X"32",X"27",X"80",X"21",X"00",
		X"08",X"22",X"28",X"80",X"3E",X"08",X"32",X"2A",X"80",X"32",X"2B",X"80",X"21",X"40",X"00",X"22",
		X"2C",X"80",X"22",X"2E",X"80",X"3E",X"02",X"32",X"30",X"80",X"3E",X"03",X"32",X"32",X"80",X"3E",
		X"0E",X"32",X"33",X"80",X"21",X"00",X"02",X"22",X"34",X"80",X"21",X"00",X"08",X"22",X"36",X"80",
		X"21",X"01",X"00",X"22",X"38",X"80",X"3E",X"18",X"32",X"3A",X"80",X"32",X"3B",X"80",X"21",X"00",
		X"01",X"22",X"3D",X"80",X"C9",X"3E",X"FF",X"C9",X"CD",X"2C",X"0B",X"3E",X"02",X"32",X"1B",X"80",
		X"3E",X"0F",X"32",X"1C",X"80",X"3E",X"08",X"32",X"1D",X"80",X"21",X"80",X"00",X"22",X"1E",X"80",
		X"22",X"20",X"80",X"3E",X"01",X"32",X"22",X"80",X"3E",X"20",X"32",X"23",X"80",X"32",X"24",X"80",
		X"3E",X"03",X"32",X"26",X"80",X"3E",X"0A",X"32",X"27",X"80",X"21",X"00",X"08",X"22",X"28",X"80",
		X"3E",X"08",X"32",X"2A",X"80",X"32",X"2B",X"80",X"21",X"40",X"00",X"22",X"2C",X"80",X"22",X"2E",
		X"80",X"3E",X"03",X"32",X"30",X"80",X"3E",X"03",X"32",X"32",X"80",X"3E",X"08",X"32",X"33",X"80",
		X"21",X"00",X"02",X"22",X"34",X"80",X"21",X"00",X"08",X"22",X"36",X"80",X"21",X"01",X"00",X"22",
		X"38",X"80",X"3E",X"20",X"32",X"3A",X"80",X"32",X"3B",X"80",X"21",X"20",X"00",X"22",X"3D",X"80",
		X"C9",X"3E",X"FF",X"C9",X"CD",X"2C",X"0B",X"3E",X"03",X"32",X"1B",X"80",X"3E",X"0E",X"32",X"1C",
		X"80",X"3E",X"1F",X"32",X"1D",X"80",X"21",X"80",X"00",X"22",X"1E",X"80",X"22",X"20",X"80",X"3E",
		X"01",X"32",X"22",X"80",X"3E",X"20",X"32",X"23",X"80",X"32",X"24",X"80",X"3E",X"03",X"32",X"26",
		X"80",X"3E",X"0C",X"32",X"27",X"80",X"21",X"00",X"08",X"22",X"28",X"80",X"3E",X"08",X"32",X"2A",
		X"80",X"32",X"2B",X"80",X"21",X"40",X"00",X"22",X"2C",X"80",X"22",X"2E",X"80",X"3E",X"03",X"32",
		X"30",X"80",X"3E",X"03",X"32",X"32",X"80",X"3E",X"0F",X"32",X"33",X"80",X"21",X"00",X"02",X"22",
		X"34",X"80",X"21",X"00",X"08",X"22",X"36",X"80",X"21",X"01",X"00",X"22",X"38",X"80",X"3E",X"20",
		X"32",X"3A",X"80",X"32",X"3B",X"80",X"21",X"20",X"00",X"22",X"3D",X"80",X"C9",X"3E",X"FF",X"C9",
		X"CD",X"2C",X"0B",X"3E",X"03",X"32",X"1B",X"80",X"3E",X"0F",X"32",X"1C",X"80",X"3E",X"1F",X"32",
		X"1D",X"80",X"21",X"80",X"00",X"22",X"1E",X"80",X"22",X"20",X"80",X"3E",X"04",X"32",X"22",X"80",
		X"3E",X"40",X"32",X"23",X"80",X"32",X"24",X"80",X"3E",X"03",X"32",X"26",X"80",X"3E",X"0C",X"32",
		X"27",X"80",X"21",X"00",X"08",X"22",X"28",X"80",X"3E",X"08",X"32",X"2A",X"80",X"32",X"2B",X"80",
		X"21",X"30",X"00",X"22",X"2C",X"80",X"22",X"2E",X"80",X"3E",X"08",X"32",X"30",X"80",X"3E",X"03",
		X"32",X"32",X"80",X"3E",X"09",X"32",X"33",X"80",X"21",X"00",X"02",X"22",X"34",X"80",X"21",X"00",
		X"08",X"22",X"36",X"80",X"21",X"00",X"01",X"22",X"38",X"80",X"3E",X"01",X"32",X"3A",X"80",X"32",
		X"3B",X"80",X"21",X"20",X"00",X"22",X"3D",X"80",X"C9",X"3E",X"FF",X"C9",X"3E",X"13",X"CD",X"6F",
		X"00",X"3E",X"14",X"CD",X"6F",X"00",X"3E",X"15",X"CD",X"6F",X"00",X"C9",X"3A",X"1B",X"80",X"FE",
		X"00",X"28",X"21",X"FE",X"01",X"28",X"22",X"FE",X"02",X"28",X"23",X"CD",X"BC",X"07",X"AF",X"32",
		X"25",X"80",X"16",X"06",X"21",X"1D",X"80",X"5E",X"CD",X"4C",X"05",X"CD",X"80",X"05",X"06",X"00",
		X"CD",X"FE",X"05",X"C9",X"CD",X"C7",X"06",X"18",X"E5",X"CD",X"48",X"07",X"18",X"E0",X"CD",X"82",
		X"07",X"18",X"DB",X"16",X"06",X"21",X"1D",X"80",X"5E",X"CD",X"4C",X"05",X"3A",X"25",X"80",X"FE",
		X"00",X"28",X"1E",X"FE",X"01",X"28",X"27",X"FE",X"02",X"28",X"3C",X"21",X"24",X"80",X"35",X"20",
		X"0E",X"3A",X"23",X"80",X"77",X"CD",X"4B",X"06",X"3D",X"28",X"3E",X"47",X"CD",X"FE",X"05",X"AF",
		X"C9",X"3A",X"1C",X"80",X"47",X"CD",X"FE",X"05",X"21",X"25",X"80",X"34",X"18",X"DD",X"2A",X"20",
		X"80",X"2B",X"7C",X"B5",X"20",X"0C",X"2A",X"1E",X"80",X"22",X"20",X"80",X"21",X"25",X"80",X"34",
		X"18",X"C9",X"22",X"20",X"80",X"18",X"C4",X"21",X"22",X"80",X"35",X"20",X"06",X"21",X"25",X"80",
		X"34",X"18",X"B8",X"AF",X"32",X"25",X"80",X"18",X"B2",X"16",X"06",X"1E",X"04",X"CD",X"4C",X"05",
		X"3E",X"FF",X"C9",X"3A",X"26",X"80",X"FE",X"00",X"28",X"19",X"FE",X"01",X"28",X"1A",X"FE",X"02",
		X"28",X"1B",X"CD",X"BC",X"07",X"AF",X"32",X"31",X"80",X"2A",X"28",X"80",X"CD",X"C6",X"04",X"CD",
		X"0D",X"05",X"C9",X"CD",X"C7",X"06",X"18",X"ED",X"CD",X"48",X"07",X"18",X"E8",X"CD",X"82",X"07",
		X"18",X"E3",X"3A",X"31",X"80",X"FE",X"00",X"28",X"1F",X"FE",X"01",X"28",X"2E",X"2A",X"2E",X"80",
		X"2B",X"7C",X"B5",X"20",X"40",X"2A",X"2C",X"80",X"22",X"2E",X"80",X"21",X"30",X"80",X"35",X"28",
		X"39",X"21",X"31",X"80",X"36",X"00",X"AF",X"C9",X"3A",X"27",X"80",X"47",X"CD",X"FE",X"05",X"3A",
		X"2A",X"80",X"32",X"2B",X"80",X"21",X"31",X"80",X"34",X"18",X"EB",X"21",X"2B",X"80",X"35",X"20",
		X"CC",X"3A",X"2A",X"80",X"77",X"CD",X"4B",X"06",X"3D",X"20",X"04",X"21",X"31",X"80",X"34",X"47",
		X"CD",X"FE",X"05",X"18",X"B8",X"22",X"2E",X"80",X"18",X"CC",X"3E",X"FF",X"C9",X"3A",X"32",X"80",
		X"FE",X"00",X"28",X"20",X"FE",X"01",X"28",X"21",X"FE",X"02",X"28",X"22",X"CD",X"BC",X"07",X"AF",
		X"32",X"3C",X"80",X"2A",X"36",X"80",X"CD",X"C6",X"04",X"CD",X"0D",X"05",X"3A",X"33",X"80",X"47",
		X"CD",X"FE",X"05",X"C9",X"CD",X"C7",X"06",X"18",X"E6",X"CD",X"48",X"07",X"18",X"E1",X"CD",X"82",
		X"07",X"18",X"DC",X"3A",X"3C",X"80",X"FE",X"00",X"28",X"22",X"FE",X"01",X"28",X"32",X"CD",X"80",
		X"06",X"B7",X"ED",X"5B",X"3D",X"80",X"ED",X"52",X"ED",X"5B",X"34",X"80",X"7C",X"BA",X"20",X"07",
		X"7D",X"BB",X"20",X"03",X"2A",X"36",X"80",X"CD",X"C6",X"04",X"AF",X"C9",X"2A",X"38",X"80",X"2B",
		X"7C",X"B5",X"20",X"07",X"3E",X"01",X"32",X"3C",X"80",X"18",X"D3",X"22",X"38",X"80",X"18",X"CE",
		X"21",X"3A",X"80",X"35",X"20",X"C8",X"3A",X"3B",X"80",X"77",X"CD",X"4B",X"06",X"3D",X"28",X"06",
		X"47",X"CD",X"FE",X"05",X"18",X"B8",X"3E",X"FF",X"C9",X"CD",X"48",X"07",X"AF",X"32",X"43",X"80",
		X"3E",X"02",X"32",X"42",X"80",X"CD",X"0D",X"05",X"3E",X"08",X"32",X"3F",X"80",X"21",X"20",X"00",
		X"22",X"40",X"80",X"21",X"40",X"00",X"CD",X"C6",X"04",X"06",X"08",X"CD",X"FE",X"05",X"C9",X"3A",
		X"43",X"80",X"B7",X"20",X"0B",X"2A",X"40",X"80",X"2B",X"7C",X"B5",X"28",X"37",X"22",X"40",X"80",
		X"21",X"3F",X"80",X"35",X"28",X"1A",X"CD",X"80",X"06",X"11",X"10",X"00",X"19",X"11",X"00",X"02",
		X"7C",X"BA",X"20",X"07",X"7D",X"BB",X"20",X"03",X"21",X"40",X"00",X"CD",X"C6",X"04",X"AF",X"C9",
		X"3E",X"08",X"32",X"3F",X"80",X"CD",X"4B",X"06",X"3D",X"28",X"06",X"47",X"CD",X"FE",X"05",X"18",
		X"D5",X"3E",X"FF",X"C9",X"21",X"20",X"00",X"22",X"40",X"80",X"21",X"42",X"80",X"35",X"20",X"05",
		X"3E",X"01",X"32",X"43",X"80",X"CD",X"08",X"0D",X"18",X"A5",X"CD",X"82",X"07",X"3E",X"08",X"32",
		X"44",X"80",X"21",X"00",X"0A",X"22",X"45",X"80",X"21",X"40",X"00",X"CD",X"C6",X"04",X"CD",X"0D",
		X"05",X"06",X"0B",X"CD",X"FE",X"05",X"C9",X"2A",X"45",X"80",X"2B",X"7C",X"B5",X"28",X"17",X"22",
		X"45",X"80",X"21",X"44",X"80",X"35",X"20",X"0C",X"36",X"08",X"CD",X"80",X"06",X"11",X"02",X"00",
		X"19",X"CD",X"C6",X"04",X"AF",X"C9",X"3E",X"FF",X"C9",X"CD",X"C7",X"06",X"3E",X"00",X"32",X"73",
		X"80",X"CD",X"0D",X"05",X"C3",X"8E",X"0F",X"CD",X"C7",X"06",X"CD",X"0D",X"05",X"C9",X"DD",X"21",
		X"50",X"80",X"18",X"06",X"DD",X"21",X"58",X"80",X"18",X"00",X"DD",X"7E",X"00",X"FE",X"FF",X"C8",
		X"CD",X"E5",X"0D",X"AF",X"C9",X"DD",X"35",X"01",X"C0",X"3A",X"72",X"80",X"DD",X"77",X"01",X"DD",
		X"CB",X"00",X"46",X"C2",X"05",X"0E",X"DD",X"7E",X"07",X"D6",X"01",X"FA",X"05",X"0E",X"DD",X"77",
		X"07",X"47",X"CD",X"FE",X"05",X"DD",X"35",X"00",X"C0",X"DD",X"6E",X"02",X"DD",X"66",X"03",X"7E",
		X"47",X"E6",X"1F",X"CA",X"9A",X"0E",X"FE",X"1F",X"C2",X"B6",X"0E",X"23",X"DD",X"75",X"02",X"DD",
		X"74",X"03",X"78",X"E6",X"E0",X"0F",X"0F",X"0F",X"0F",X"4F",X"06",X"00",X"21",X"35",X"0E",X"09",
		X"5E",X"23",X"56",X"D5",X"C9",X"45",X"0E",X"5D",X"0E",X"73",X"0E",X"90",X"0E",X"90",X"0E",X"90",
		X"0E",X"90",X"0E",X"90",X"0E",X"DD",X"6E",X"02",X"DD",X"66",X"03",X"4E",X"CB",X"21",X"06",X"00",
		X"21",X"E6",X"0E",X"09",X"5E",X"23",X"56",X"ED",X"53",X"70",X"80",X"18",X"23",X"DD",X"6E",X"02",
		X"DD",X"66",X"03",X"4E",X"06",X"00",X"21",X"7E",X"0F",X"09",X"7E",X"32",X"72",X"80",X"DD",X"77",
		X"01",X"18",X"0D",X"DD",X"6E",X"02",X"DD",X"66",X"03",X"7E",X"DD",X"77",X"06",X"DD",X"77",X"07",
		X"DD",X"6E",X"02",X"DD",X"66",X"03",X"23",X"DD",X"75",X"02",X"DD",X"74",X"03",X"C3",X"09",X"0E",
		X"06",X"00",X"CD",X"FE",X"05",X"DD",X"36",X"00",X"FF",X"C9",X"CD",X"A4",X"0E",X"06",X"00",X"CD",
		X"FE",X"05",X"18",X"34",X"78",X"E6",X"E0",X"07",X"07",X"07",X"47",X"3E",X"01",X"10",X"04",X"DD",
		X"77",X"00",X"C9",X"07",X"18",X"F7",X"C5",X"CD",X"A4",X"0E",X"C1",X"78",X"E6",X"1F",X"3D",X"07",
		X"4F",X"06",X"00",X"2A",X"70",X"80",X"09",X"5E",X"23",X"56",X"EB",X"CD",X"C6",X"04",X"DD",X"46",
		X"06",X"78",X"DD",X"77",X"07",X"CD",X"FE",X"05",X"DD",X"6E",X"02",X"DD",X"66",X"03",X"23",X"DD",
		X"75",X"02",X"DD",X"74",X"03",X"C9",X"06",X"0F",X"0A",X"0F",X"0E",X"0F",X"12",X"0F",X"16",X"0F",
		X"1A",X"0F",X"1E",X"0F",X"22",X"0F",X"26",X"0F",X"2A",X"0F",X"2E",X"0F",X"32",X"0F",X"36",X"0F",
		X"3A",X"0F",X"3E",X"0F",X"42",X"0F",X"6B",X"08",X"F2",X"07",X"80",X"07",X"14",X"07",X"AE",X"06",
		X"4E",X"06",X"F3",X"05",X"9E",X"05",X"4E",X"05",X"01",X"05",X"B9",X"04",X"76",X"04",X"36",X"04",
		X"F9",X"03",X"C0",X"03",X"8A",X"03",X"57",X"03",X"27",X"03",X"FA",X"02",X"CF",X"02",X"A7",X"02",
		X"81",X"02",X"5D",X"02",X"3B",X"02",X"1B",X"02",X"FD",X"01",X"E0",X"01",X"C5",X"01",X"AC",X"01",
		X"94",X"01",X"7D",X"01",X"68",X"01",X"53",X"01",X"40",X"01",X"2E",X"01",X"1D",X"01",X"0D",X"01",
		X"FE",X"00",X"F0",X"00",X"E3",X"00",X"D6",X"00",X"CA",X"00",X"BE",X"00",X"B4",X"00",X"AA",X"00",
		X"A0",X"00",X"97",X"00",X"8F",X"00",X"87",X"00",X"7F",X"00",X"78",X"00",X"71",X"00",X"6B",X"00",
		X"65",X"00",X"5F",X"00",X"5A",X"00",X"55",X"00",X"50",X"00",X"4C",X"00",X"47",X"00",X"57",X"42",
		X"34",X"2C",X"25",X"21",X"1D",X"1A",X"0C",X"0B",X"0A",X"09",X"08",X"07",X"06",X"05",X"21",X"C1",
		X"0F",X"11",X"50",X"80",X"01",X"18",X"00",X"ED",X"B0",X"3A",X"73",X"80",X"07",X"4F",X"07",X"07",
		X"91",X"4F",X"06",X"00",X"21",X"D9",X"0F",X"09",X"11",X"52",X"80",X"CD",X"B7",X"0F",X"11",X"5A",
		X"80",X"CD",X"B7",X"0F",X"11",X"62",X"80",X"7E",X"12",X"CD",X"BE",X"0F",X"7E",X"12",X"23",X"13",
		X"C9",X"01",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"01",X"00",X"00",X"00",X"00",X"00",
		X"00",X"01",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"EB",X"0F",X"0D",X"10",X"2D",X"10",X"5F",
		X"10",X"7C",X"10",X"97",X"10",X"D5",X"10",X"EB",X"10",X"FF",X"10",X"1F",X"0A",X"3F",X"0D",X"5F",
		X"09",X"AC",X"80",X"6C",X"6C",X"AC",X"80",X"6C",X"6C",X"8C",X"88",X"8C",X"8F",X"8C",X"88",X"8C");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
