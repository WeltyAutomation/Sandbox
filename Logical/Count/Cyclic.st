
PROGRAM _CYCLIC
	IF gAlarm.ResetCount THEN
		Count := 0;
	ELSE
		Count := Count + 1;
	END_IF;
		
	 
END_PROGRAM
