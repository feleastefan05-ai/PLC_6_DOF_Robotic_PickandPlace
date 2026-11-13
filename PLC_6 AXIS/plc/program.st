VAR
    stare   : INT := 0;
    n       : INT := 0;

    comand  : INT;
    execute : BOOL;
    done    : BOOL;
    enable  : BOOL;
    vaccum  : BOOL;
END_VAR

enable := TRUE;

CASE stare OF

    0: (* Pregatire Home: execute FALSE *)
        comand := 0;
        execute := FALSE;
        vaccum := FALSE;
        n := n + 1;
        IF n > 50 THEN
            n := 0;
            stare := 1;
        END_IF;

    1: (* Mergi la Home: execute TRUE *)
        comand := 0;
        execute := TRUE;
        n := n + 1;
        IF n > 50 AND done THEN
            n := 0;
            stare := 10;
        END_IF;

    10: (* Pregatire Pick *)
        comand := 1;
        execute := FALSE;
        n := n + 1;
        IF n > 50 THEN
            n := 0;
            stare := 11;
        END_IF;

    11: (* Mergi la Pick *)
        comand := 1;
        execute := TRUE;
        n := n + 1;
        IF n > 50 AND done THEN
            n := 0;
            stare := 20;
        END_IF;

    20: (* Vacuum ON *)
        execute := FALSE;
        vaccum := TRUE;
        n := n + 1;
        IF n > 100 THEN
            n := 0;
            stare := 30;
        END_IF;

    30: (* Pregatire Place *)
        comand := 2;
        execute := FALSE;
        n := n + 1;
        IF n > 50 THEN
            n := 0;
            stare := 31;
        END_IF;

    31: (* Mergi la Place *)
        comand := 2;
        execute := TRUE;
        n := n + 1;
        IF n > 50 AND done THEN
            n := 0;
            stare := 40;
        END_IF;

    40: (* Vacuum OFF *)
        execute := FALSE;
        vaccum := FALSE;
        n := n + 1;
        IF n > 100 THEN
            n := 0;
            stare := 50;
        END_IF;

    50: (* Pregatire Home *)
        comand := 0;
        execute := FALSE;
        n := n + 1;
        IF n > 50 THEN
            n := 0;
            stare := 51;
        END_IF;

    51: (* Mergi la Home *)
        comand := 0;
        execute := TRUE;
        n := n + 1;
        IF n > 50 AND done THEN
            n := 0;
            stare := 10;
        END_IF;

END_CASE;