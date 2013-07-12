awk '
    BEGIN {
		x["0"] = 0;	x["8"] = 8;
		x["1"] = 1;	x["9"] = 9;
		x["2"] = 2;	x["A"] = x["a"] = 10
		x["3"] = 3;	x["B"] = x["b"] = 11;
		x["4"] = 4;	x["C"] = x["c"] = 12;
		x["5"] = 5;	x["D"] = x["d"] = 13;
		x["6"] = 6;	x["E"] = x["e"] = 14;
		x["7"] = 7;	x["F"] = x["f"] = 15;
	}
    {
    	decoded = ""
		i = 1
		len = length ($0)
		while (i <= len) {
	    	c = substr($0, i, 1)
	    	if (c == "%") {
	    		if (i+2 <= len) {
		    		c1 = substr($0, i+1, 1)
		    		c2 = substr($0, i+2, 1)
	    			code = 0 + x[c1] * 16 + x[c2] + 0
	    			c = sprintf("%c", code)
					i = i + 2
				}
			} else if (c == "+") {
	    		c = " "
	    	}
	    decoded = decoded c
	    ++i
		}
    printf "%s", decoded
	}
' "$@"
