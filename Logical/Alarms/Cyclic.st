(*********************************************************************************
 * Copyright:   
 * Author:    TylerWoodley 
 * Created:   November 4, 2020/10:37 AM 
 *********************************************************************************)

PROGRAM _CYCLIC
	//call the alarm FB
	MpAlarmXCore_0
	(
		Enable := TRUE, 
		MpLink := ADR(gAlarmXCore)
	);
	//call the UI Link
	MpAlarmXListUI_0
	(
		MpLink := ADR(gAlarmXCore), 
		Enable := TRUE, 
		UIConnect := ADR(MpAlarmXListUIConnect)
	);
	
	//if bad thing, sound the alarm!
	IF gAlarm.TestAlarm THEN	
		MpAlarmXSet(gAlarmXCore, 'TestAlarm');
	END_IF;
	
	//if operator is aware of bad thing, assume bad thing is handled, reset alarm.
	IF MpAlarmXCheckState(gAlarmXCore, 'TestAlarm', mpALARMX_STATE_ACKNOWLEDGED) THEN 
		gAlarm.TestAlarm := FALSE;
		MpAlarmXReset(gAlarmXCore, 'TestAlarm');			
	END_IF
	
END_PROGRAM

PROGRAM _EXIT
	
		//Disable FBs
	MpAlarmXCore_0(Enable := FALSE);
	MpAlarmXListUI_0(Enable := FALSE);
	 
END_PROGRAM
