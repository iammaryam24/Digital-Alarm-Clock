#define __SFR_OFFSET 0
#include <avr/io.h>

.global startClock
.global tick
.global getHour
.global getMinute
.global setAlarmHour
.global setAlarmMinute
.global checkAlarm

.section .data
hour:          .byte 1
minute:        .byte 1
alarm_hour:    .byte 1
alarm_minute:  .byte 1

.section .text

startClock:
    ldi r16, 0
    sts hour, r16
    sts minute, r16
    sts alarm_hour, r16
    sts alarm_minute, r16
    ret

tick:
    lds r18, minute
    inc r18
    cpi r18, 60
    brlo .no_inc_hour
    ldi r18, 0
    lds r19, hour
    inc r19
    cpi r19, 24
    brlo .store_hour
    ldi r19, 0
.store_hour:
    sts hour, r19
.no_inc_hour:
    sts minute, r18
    ret

getHour:
    lds r24, hour
    ret

getMinute:
    lds r24, minute
    ret

setAlarmHour:
    sts alarm_hour, r24
    ret

setAlarmMinute:
    sts alarm_minute, r24
    ret

checkAlarm:
    lds r20, hour
    lds r21, minute
    lds r22, alarm_hour
    lds r23, alarm_minute

    cp r20, r22
    brne .no_match
    cp r21, r23
    brne .no_match

    ldi r24, 1
    ret

.no_match:
    ldi r24, 0
    ret
code.asm
Displaying code.asm.NextStudent Project Report & .acm code file
Student Project Report & .acm code file
Majid Shafique
•
Jun 2
10 points
Due Jun 10, 11:59 AM
Submit Cmplete Project Report
(word document )
Class comments
