all:
	hfst-lexc chv.lexc -o chv.lexc.hfst
	hfst-twolc chv.twol -o chv.twol.hfst
	hfst-compose-intersect -1 chv.lexc.hfst -2 chv.twol.hfst | hfst-minimise -o chv.gen.hfst
	hfst-fst2fst -O chv.gen.hfst -o chv.gen.hfstol
	hfst-invert chv.gen.hfst | hfst-fst2fst -O -o chv.mor.hfstol

clean:
	rm *.hfst
