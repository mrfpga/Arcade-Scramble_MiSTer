library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity ROM_OBJ_1 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of ROM_OBJ_1 is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"38",X"7C",X"C2",X"82",X"86",X"7C",X"38",X"00",X"02",X"02",X"FE",X"FE",X"42",X"02",X"00",X"00",
		X"62",X"F2",X"BA",X"9A",X"9E",X"CE",X"46",X"00",X"8C",X"DE",X"F2",X"B2",X"92",X"86",X"04",X"00",
		X"08",X"FE",X"FE",X"C8",X"68",X"38",X"18",X"00",X"1C",X"BE",X"A2",X"A2",X"A2",X"E6",X"E4",X"00",
		X"0C",X"9E",X"92",X"92",X"D2",X"7E",X"3C",X"00",X"C0",X"E0",X"B0",X"9E",X"8E",X"C0",X"C0",X"00",
		X"0C",X"6E",X"9A",X"9A",X"B2",X"F2",X"6C",X"00",X"78",X"FC",X"96",X"92",X"92",X"F2",X"60",X"00",
		X"14",X"00",X"00",X"49",X"49",X"5D",X"49",X"00",X"00",X"00",X"00",X"14",X"00",X"14",X"22",X"36",
		X"00",X"00",X"00",X"18",X"18",X"00",X"00",X"00",X"18",X"38",X"34",X"14",X"04",X"10",X"00",X"00",
		X"A8",X"A8",X"70",X"F8",X"70",X"A8",X"A8",X"00",X"80",X"90",X"90",X"90",X"90",X"FE",X"FE",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"3E",X"7E",X"C8",X"88",X"C8",X"7E",X"3E",X"00",
		X"6C",X"FE",X"92",X"92",X"92",X"FE",X"FE",X"00",X"44",X"C6",X"82",X"82",X"C6",X"7C",X"38",X"00",
		X"38",X"7C",X"C6",X"82",X"82",X"FE",X"FE",X"00",X"82",X"92",X"92",X"92",X"FE",X"FE",X"00",X"00",
		X"80",X"90",X"90",X"90",X"90",X"FE",X"FE",X"00",X"9E",X"9E",X"92",X"82",X"C6",X"7C",X"38",X"00",
		X"FE",X"FE",X"10",X"10",X"10",X"FE",X"FE",X"00",X"82",X"82",X"FE",X"FE",X"82",X"82",X"00",X"00",
		X"FC",X"FE",X"02",X"02",X"02",X"06",X"04",X"00",X"82",X"C6",X"6E",X"3C",X"18",X"FE",X"FE",X"00",
		X"02",X"02",X"02",X"02",X"FE",X"FE",X"00",X"00",X"FE",X"FE",X"70",X"38",X"70",X"FE",X"FE",X"00",
		X"FE",X"FE",X"1C",X"38",X"70",X"FE",X"FE",X"00",X"7C",X"FE",X"82",X"82",X"82",X"FE",X"7C",X"00",
		X"70",X"F8",X"88",X"88",X"88",X"FE",X"FE",X"00",X"7A",X"FC",X"8E",X"8A",X"82",X"FE",X"7C",X"00",
		X"72",X"F6",X"9E",X"8C",X"88",X"FE",X"FE",X"00",X"0C",X"5E",X"D2",X"92",X"92",X"F6",X"64",X"00",
		X"80",X"80",X"FE",X"FE",X"80",X"80",X"00",X"00",X"FC",X"FE",X"02",X"02",X"02",X"FE",X"FC",X"00",
		X"F0",X"F8",X"1C",X"0E",X"1C",X"F8",X"F0",X"00",X"F8",X"FE",X"1C",X"38",X"1C",X"FE",X"F8",X"00",
		X"C6",X"EE",X"7C",X"38",X"7C",X"EE",X"C6",X"00",X"C0",X"F0",X"1E",X"1E",X"F0",X"C0",X"00",X"00",
		X"C2",X"E2",X"F2",X"BA",X"9E",X"8E",X"86",X"00",X"10",X"10",X"10",X"10",X"10",X"10",X"10",X"00",
		X"01",X"03",X"03",X"07",X"3F",X"7F",X"FF",X"FF",X"01",X"01",X"01",X"01",X"07",X"1F",X"7F",X"FF",
		X"07",X"1F",X"3F",X"7F",X"7F",X"FF",X"FF",X"FF",X"01",X"0F",X"07",X"03",X"07",X"1F",X"3F",X"FF",
		X"FF",X"FF",X"7F",X"3F",X"07",X"03",X"03",X"01",X"FF",X"7F",X"1F",X"07",X"01",X"01",X"01",X"01",
		X"FF",X"FF",X"FF",X"7F",X"7F",X"3F",X"1F",X"07",X"FF",X"3F",X"1F",X"07",X"03",X"07",X"0F",X"01",
		X"03",X"07",X"FF",X"FF",X"FF",X"3F",X"0F",X"03",X"FF",X"1F",X"0F",X"01",X"07",X"1F",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"7F",X"FF",X"7F",X"FF",X"FF",X"03",X"07",X"07",X"03",X"01",X"01",X"03",X"01",
		X"FF",X"1F",X"3F",X"7F",X"FF",X"FF",X"7F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"18",X"DB",X"DB",X"C3",X"C3",X"DB",X"DB",X"18",
		X"3C",X"42",X"81",X"A5",X"A5",X"99",X"42",X"3C",X"FF",X"81",X"81",X"81",X"81",X"81",X"81",X"FF",
		X"1C",X"3E",X"7F",X"7F",X"FF",X"DD",X"D5",X"C1",X"00",X"00",X"00",X"00",X"80",X"80",X"80",X"80",
		X"FF",X"FF",X"FF",X"DF",X"57",X"41",X"3E",X"1C",X"80",X"80",X"80",X"80",X"00",X"00",X"00",X"00",
		X"07",X"08",X"08",X"08",X"07",X"00",X"07",X"08",X"C0",X"20",X"20",X"20",X"C0",X"00",X"C0",X"20",
		X"08",X"08",X"07",X"00",X"00",X"0F",X"04",X"00",X"20",X"20",X"C0",X"00",X"20",X"E0",X"20",X"00",
		X"07",X"08",X"08",X"07",X"00",X"07",X"08",X"08",X"C0",X"20",X"20",X"C0",X"00",X"C0",X"20",X"20",
		X"07",X"00",X"06",X"09",X"08",X"08",X"04",X"00",X"C0",X"00",X"20",X"20",X"A0",X"60",X"20",X"00",
		X"07",X"08",X"08",X"07",X"00",X"07",X"08",X"08",X"C0",X"20",X"20",X"C0",X"00",X"C0",X"20",X"20",
		X"07",X"00",X"07",X"09",X"09",X"08",X"04",X"00",X"C0",X"00",X"C0",X"20",X"20",X"20",X"40",X"00",
		X"01",X"01",X"7F",X"7F",X"41",X"01",X"00",X"00",X"06",X"2F",X"69",X"49",X"49",X"7B",X"32",X"06",
		X"00",X"40",X"40",X"7F",X"7F",X"40",X"40",X"00",X"00",X"71",X"59",X"4D",X"67",X"23",X"00",X"00",
		X"00",X"7F",X"7F",X"06",X"1C",X"7F",X"7F",X"00",X"00",X"3E",X"63",X"41",X"41",X"7F",X"7F",X"00",
		X"00",X"46",X"6F",X"79",X"59",X"4B",X"02",X"00",X"00",X"7B",X"4F",X"46",X"44",X"7F",X"7F",X"00",
		X"00",X"04",X"7F",X"67",X"34",X"1C",X"0C",X"00",X"00",X"40",X"40",X"7F",X"7F",X"40",X"40",X"00",
		X"00",X"7F",X"7F",X"08",X"08",X"7F",X"7F",X"00",X"00",X"4F",X"49",X"49",X"7B",X"7B",X"00",X"00",
		X"C0",X"E0",X"FF",X"FF",X"FF",X"FC",X"F0",X"C0",X"FF",X"F8",X"F0",X"80",X"E0",X"F8",X"FF",X"FF",
		X"FF",X"F8",X"FC",X"FE",X"FF",X"FF",X"FE",X"FF",X"C0",X"E0",X"E0",X"C0",X"80",X"80",X"C0",X"80",
		X"80",X"C0",X"C0",X"E0",X"FC",X"FE",X"FF",X"FF",X"80",X"F0",X"E0",X"C0",X"E0",X"F8",X"FC",X"FF",
		X"FF",X"FF",X"FE",X"FC",X"E0",X"C0",X"C0",X"80",X"FF",X"FC",X"F8",X"E0",X"C0",X"E0",X"F0",X"80",
		X"00",X"36",X"7F",X"49",X"49",X"7F",X"7F",X"00",X"00",X"1F",X"3F",X"64",X"64",X"3F",X"1F",X"00",
		X"00",X"00",X"00",X"49",X"49",X"49",X"7F",X"7F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"01",X"07",X"07",X"0F",X"0F",X"00",X"00",X"80",X"80",X"80",X"C0",X"C0",X"60",
		X"07",X"07",X"03",X"00",X"00",X"00",X"00",X"00",X"40",X"00",X"40",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"7E",X"7E",X"7E",X"7E",X"7E",X"7E",X"7E",X"00",X"7E",X"7E",X"7E",X"7E",X"7E",X"7E",X"7E",X"7E",
		X"00",X"00",X"00",X"00",X"01",X"03",X"00",X"40",X"00",X"00",X"00",X"00",X"FF",X"F0",X"00",X"00",
		X"38",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"F0",X"FF",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"01",X"03",X"00",X"40",X"00",X"00",X"00",X"00",X"FF",X"F0",X"01",X"08",
		X"38",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"02",X"F0",X"FF",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"01",X"03",X"00",X"40",X"00",X"00",X"00",X"00",X"FF",X"F0",X"14",X"0A",
		X"38",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"14",X"F0",X"FF",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"08",X"00",X"00",X"40",X"01",X"00",X"01",X"A3",X"38",X"00",X"B0",X"3A",X"02",X"80",
		X"80",X"C0",X"E2",X"F8",X"7F",X"3F",X"1F",X"0F",X"33",X"3B",X"B7",X"0F",X"7F",X"FE",X"7F",X"71",
		X"00",X"7E",X"7E",X"7E",X"7E",X"7E",X"7E",X"7E",X"7E",X"7E",X"7E",X"7E",X"7E",X"7E",X"7E",X"00",
		X"7E",X"7E",X"7E",X"7E",X"7E",X"7E",X"7E",X"7E",X"00",X"7E",X"7E",X"7E",X"7E",X"7E",X"7E",X"7E",
		X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"C0",X"80",
		X"00",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",X"00",X"80",X"00",X"80",X"00",X"80",
		X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"C0",X"80",
		X"00",X"00",X"00",X"01",X"02",X"01",X"02",X"01",X"00",X"40",X"80",X"40",X"A0",X"40",X"A0",X"40",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",X"C0",X"40",
		X"02",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"C0",
		X"02",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",
		X"00",X"02",X"00",X"00",X"00",X"00",X"00",X"00",X"F0",X"40",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"02",X"00",X"00",X"00",X"40",X"00",X"00",X"01",X"03",X"B0",X"38",X"00",X"80",X"32",X"3A",
		X"82",X"C0",X"E0",X"F8",X"7F",X"3F",X"1F",X"0F",X"B1",X"03",X"07",X"BF",X"7E",X"7E",X"FF",X"71",
		X"12",X"10",X"11",X"00",X"02",X"01",X"00",X"00",X"A4",X"84",X"C4",X"C0",X"00",X"90",X"00",X"00",
		X"00",X"00",X"01",X"00",X"00",X"00",X"00",X"02",X"40",X"00",X"00",X"00",X"00",X"80",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"03",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"20",X"00",X"20",
		X"03",X"07",X"07",X"03",X"02",X"10",X"10",X"10",X"20",X"30",X"70",X"60",X"20",X"84",X"84",X"84",
		X"12",X"10",X"10",X"01",X"00",X"02",X"04",X"01",X"A4",X"84",X"84",X"40",X"C0",X"20",X"80",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"40",X"10",X"00",X"00",X"00",X"20",X"00",
		X"00",X"00",X"00",X"00",X"00",X"03",X"00",X"03",X"00",X"00",X"00",X"00",X"00",X"20",X"20",X"00",
		X"03",X"04",X"07",X"03",X"02",X"00",X"00",X"00",X"20",X"30",X"70",X"60",X"20",X"00",X"00",X"00",
		X"12",X"10",X"10",X"00",X"01",X"00",X"00",X"00",X"A4",X"84",X"84",X"20",X"40",X"C0",X"00",X"80",
		X"00",X"00",X"00",X"04",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",X"10",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"20",X"20",
		X"00",X"07",X"07",X"03",X"03",X"00",X"00",X"00",X"00",X"20",X"60",X"60",X"20",X"00",X"00",X"00",
		X"12",X"10",X"11",X"00",X"02",X"03",X"00",X"00",X"A4",X"84",X"84",X"80",X"20",X"40",X"80",X"A0",
		X"00",X"00",X"01",X"00",X"00",X"04",X"00",X"00",X"00",X"80",X"20",X"00",X"80",X"00",X"00",X"10",
		X"00",X"00",X"00",X"00",X"00",X"03",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"20",X"00",X"20",
		X"03",X"07",X"07",X"03",X"02",X"10",X"10",X"10",X"20",X"30",X"70",X"60",X"20",X"84",X"84",X"84",
		X"00",X"00",X"00",X"02",X"00",X"00",X"10",X"00",X"81",X"23",X"38",X"80",X"60",X"3A",X"B0",X"02",
		X"80",X"C0",X"E2",X"F8",X"7F",X"3F",X"1F",X"0F",X"02",X"B3",X"3F",X"3F",X"FF",X"7E",X"7F",X"F1",
		X"00",X"04",X"00",X"01",X"00",X"01",X"04",X"01",X"00",X"00",X"00",X"10",X"40",X"00",X"A0",X"00",
		X"02",X"05",X"02",X"03",X"03",X"04",X"03",X"00",X"A0",X"50",X"E0",X"A0",X"40",X"A0",X"A0",X"40",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"FF",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"FF",X"00",
		X"FF",X"FF",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"FF",X"FF",X"00",X"FF",X"00",X"FF",X"00",
		X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",X"FF",X"00",
		X"00",X"00",X"01",X"00",X"00",X"01",X"13",X"07",X"00",X"00",X"81",X"0E",X"10",X"80",X"C0",X"E0",
		X"A7",X"7B",X"3D",X"26",X"02",X"05",X"02",X"01",X"E9",X"D6",X"90",X"30",X"48",X"A0",X"49",X"86",
		X"00",X"7E",X"7E",X"7E",X"7E",X"7E",X"7E",X"00",X"18",X"DB",X"DB",X"C3",X"C3",X"DB",X"DB",X"18",
		X"00",X"70",X"F8",X"8D",X"85",X"C0",X"60",X"00",X"00",X"2C",X"7E",X"3F",X"7F",X"7E",X"3C",X"0C",
		X"00",X"00",X"05",X"00",X"02",X"00",X"01",X"01",X"00",X"20",X"00",X"00",X"40",X"80",X"10",X"40",
		X"20",X"01",X"02",X"05",X"07",X"05",X"03",X"00",X"40",X"C0",X"90",X"60",X"50",X"D0",X"20",X"C0",
		X"00",X"00",X"00",X"01",X"00",X"00",X"00",X"01",X"00",X"00",X"10",X"00",X"00",X"40",X"10",X"00",
		X"04",X"01",X"02",X"05",X"05",X"06",X"01",X"00",X"80",X"50",X"E0",X"90",X"B0",X"40",X"A0",X"C0",
		X"00",X"00",X"01",X"04",X"00",X"00",X"01",X"00",X"40",X"00",X"00",X"00",X"00",X"00",X"20",X"40",
		X"00",X"03",X"03",X"06",X"01",X"07",X"00",X"01",X"80",X"A0",X"40",X"90",X"60",X"50",X"A0",X"40",
		X"00",X"00",X"00",X"00",X"11",X"0E",X"05",X"0E",X"00",X"00",X"00",X"00",X"80",X"70",X"C0",X"D0",
		X"2B",X"0D",X"03",X"02",X"00",X"00",X"00",X"00",X"F0",X"A0",X"60",X"80",X"00",X"00",X"80",X"00",
		X"00",X"00",X"00",X"01",X"02",X"07",X"0D",X"0A",X"00",X"00",X"00",X"00",X"E8",X"D0",X"B0",X"F8",
		X"1A",X"1F",X"39",X"06",X"03",X"00",X"00",X"00",X"BC",X"28",X"F0",X"60",X"C0",X"00",X"00",X"00",
		X"00",X"00",X"04",X"0E",X"0F",X"18",X"09",X"07",X"00",X"00",X"C0",X"30",X"C8",X"74",X"D0",X"64",
		X"37",X"33",X"1B",X"08",X"01",X"03",X"00",X"00",X"32",X"76",X"6C",X"08",X"E8",X"80",X"00",X"00",
		X"00",X"01",X"13",X"23",X"0C",X"1E",X"26",X"4D",X"00",X"02",X"B8",X"EC",X"12",X"DC",X"EC",X"58",
		X"35",X"18",X"0B",X"25",X"03",X"0F",X"21",X"00",X"16",X"BB",X"6C",X"B4",X"34",X"B0",X"44",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"80",
		X"01",X"03",X"07",X"07",X"07",X"07",X"0F",X"0F",X"80",X"C0",X"C0",X"C0",X"C0",X"E0",X"E0",X"E0",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",
		X"01",X"03",X"06",X"01",X"0F",X"0A",X"06",X"1D",X"80",X"A0",X"50",X"70",X"A8",X"64",X"B8",X"C8",
		X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"06",X"00",X"00",X"00",X"00",X"00",X"80",X"40",X"E0",
		X"09",X"0B",X"1E",X"15",X"15",X"0A",X"3D",X"0A",X"20",X"F0",X"78",X"D8",X"E8",X"A8",X"5C",X"E8",
		X"00",X"00",X"00",X"01",X"02",X"02",X"05",X"0D",X"00",X"00",X"00",X"A0",X"60",X"B0",X"18",X"68",
		X"0B",X"16",X"3C",X"37",X"6C",X"6B",X"1E",X"69",X"A8",X"54",X"98",X"54",X"60",X"DC",X"28",X"B4");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
