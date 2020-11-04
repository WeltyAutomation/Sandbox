
TYPE
	AlarmType : 	STRUCT 
		Inhibit : BOOL;
		TestAlarm : BOOL;
	END_STRUCT;
	CmdType : 	STRUCT 
		cmdAbort : BOOL;
		cmdClear : BOOL;
	END_STRUCT;
	StatusType : 	STRUCT 
		Idle : BOOL;
	END_STRUCT;
END_TYPE
