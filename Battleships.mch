/* Battleships
 * Author: lucif
 * Creation date: 12/8/2024
 */
MACHINE
    Battleships
INCLUDES 
    GameStateMachine
SETS
    REPORT = {
        Player_1_Hit, 
        Player_2_Hit, 
        Player_1_Miss, 
        Player_2_Miss, 
        Error_Not_Turn, 
        Player_1_Deployed, 
        Player_2_Deployed,
        Position_Out_of_Grid,
        Already_Deployed
    }

CONSTANTS
    Grid, Grid_X, Grid_Y, Max_Row, Max_Col, Battleship_Count, Anim_Col

PROPERTIES
    Max_Row = 10 & Max_Col = 10 & Anim_Col = 2*Max_Col + 1 &
    Grid_X = 1..Max_Row & Grid_Y = 1..Max_Col &
    Grid = {xx, yy | xx : Grid_X & yy : Grid_Y} &
    Battleship_Count : NAT1 & Battleship_Count = 3
    
DEFINITIONS
    isGameOver(fleet) == (card(fleet) = 1);
    isPlayerTurn(player) == (current_turn = player);
    isValidPosition(position) == (position : NATURAL * NATURAL);
    isFleetDeployed(player) == (player = Player_1 => fleet_1 /= {}) & (player = Player_2 => fleet_2 /= {});
    ANIMATION_FUNCTION ==
    {row, column, i |
        row : 1..Max_Row & column : 1..Anim_Col &
        (current_turn = Player_1 => (
                (column < Max_Col + 1 => 
                    (
                        ((row, column):fleet_1 => i=1) &
                        ((row, column)/:fleet_1 => 
                            (
                                ((row, column):non_change_fleet_1 => i=3) &
                                ((row, column)/:non_change_fleet_1 => i=0)
                            )
                        )
                    )
                ) &
                (column = Max_Col+1 => i=4) &
                (column > Max_Col+1 => 
                    (
                        ((row, column-(1 + Max_Col)):attacks(Player_1) => 
                            (
                                ((row, column-(1 + Max_Col)):non_change_fleet_2 => i=3) &
                                ((row, column-(1 + Max_Col))/:non_change_fleet_2 => i=2) 
                            )
                        ) & 
                        ((row, column-(1 + Max_Col))/:attacks(Player_1) => i=0)
                    )
                )
            )
        )
        &
        (current_turn = Player_2 => (
                (column < Max_Col + 1 => 
                    (
                        ((row, column):fleet_2 => i=1) &
                        ((row, column)/:fleet_2 => 
                            (
                                ((row, column):non_change_fleet_2 => i=3) &
                                ((row, column)/:non_change_fleet_2 => i=0)
                            )
                        )
                    )
                ) &
                (column = Max_Col+1 => i=4) &
                (column > Max_Col+1 => 
                    (
                        ((row, column-(1 + Max_Col)):attacks(Player_2) => 
                            (
                                ((row, column-(1 + Max_Col)):non_change_fleet_1 => i=3) &
                                ((row, column-(1 + Max_Col))/:non_change_fleet_1 => i=2) 
                            )
                        ) & 
                        ((row, column-(1 + Max_Col))/:attacks(Player_2) => i=0)
                    )
                )
            )
        )
    };


    ANIMATION_IMG0 == "images/1.gif";
    ANIMATION_IMG1 == "images/2.gif";
    ANIMATION_IMG2 == "images/3.gif";
    ANIMATION_IMG3 == "images/4.gif";

VARIABLES
    fleet_1, fleet_2, attacks, non_change_fleet_1, non_change_fleet_2

INVARIANT
    fleet_1 : POW(Grid) & card(fleet_1) <= Battleship_Count &
    fleet_2 : POW(Grid) & card(fleet_2) <= Battleship_Count &
    non_change_fleet_1 : POW(Grid) & card(non_change_fleet_1) <= Battleship_Count &
    non_change_fleet_2 : POW(Grid) & card(non_change_fleet_2) <= Battleship_Count &
    attacks : PLAYER --> POW(Grid)

INITIALISATION
    fleet_1, fleet_2, non_change_fleet_1, non_change_fleet_2 := {}, {}, {}, {} || 
    attacks := {Player_1 |-> {}, Player_2 |-> {}}

OPERATIONS
    report <-- deployFleet(player, positions) =
    PRE
        player : PLAYER & 
        positions <: NATURAL * NATURAL &
        card(positions) = Battleship_Count &
        current_game_state = Deploying_Fleets &
        // cant have without these conditions because proB doesnt show options to deploy
        (player = Player_1 => fleet_1 = {}) &
        (player = Player_2 => fleet_2 = {})
    THEN
        IF player = Player_1 & positions : POW(Grid) THEN
            IF fleet_1 = {} THEN
                fleet_1 := positions  ||  
                non_change_fleet_1 := positions  ||  
                report := Player_1_Deployed  ||
                IF fleet_2 /= {} THEN
                    setState(Ongoing)
                END
            ELSE
                report := Already_Deployed
            END
        ELSE IF player = Player_2 & positions : POW(Grid)
            THEN
                IF fleet_2 = {} THEN
                    fleet_2 := positions || 
                    non_change_fleet_2 := positions  ||  
                    report := Player_2_Deployed || 
                    IF fleet_1 /= {} THEN
                        setState(Ongoing)
                    END
                ELSE
                    report := Already_Deployed
                END
            ELSE
                report := Position_Out_of_Grid
            END 
        END
    END;
    
    
    report <-- playerShoots(target) =
    PRE
        isValidPosition(target) &
        current_game_state = Ongoing &
        isFleetDeployed(current_turn) &
        target /: attacks(current_turn)
    THEN
        IF isPlayerTurn(Player_1) & target : Grid THEN
            IF target : fleet_2 THEN
                fleet_2 := fleet_2 - {target} || 
                attacks(Player_1) := attacks(Player_1) \/ {target} || 
                IF isGameOver(fleet_2) THEN
                    report := Player_1_Hit || 
                    setState(Won_Player_1)
                ELSE
                    report := Player_1_Hit || 
                    setCurrentPlayer(Player_2)
                END
            ELSE 
                attacks(Player_1) := attacks(Player_1) \/ {target} || 
                report := Player_1_Miss || 
                setCurrentPlayer(Player_2)
            END
            
        ELSE IF isPlayerTurn(Player_2) & target : Grid
            THEN
                IF target : fleet_1 THEN
                    fleet_1 := fleet_1 - {target} || 
                    attacks(Player_2) := attacks(Player_2) \/ {target} || 
                    IF isGameOver(fleet_1) THEN
                        report := Player_2_Hit || 
                        setState(Won_Player_2)
                    ELSE
                        report := Player_2_Hit || 
                        setCurrentPlayer(Player_1)
                    END
                ELSE 
                    attacks(Player_2) := attacks(Player_2) \/ {target} || 
                    report := Player_2_Miss ||
                    setCurrentPlayer(Player_1)
                END
            ELSE
                report := Position_Out_of_Grid
            END
        END
    END;

    shipsquares <-- shipLocations(player) =
    PRE
        player : PLAYER
    THEN
        IF isPlayerTurn(Player_1) THEN
            shipsquares := fleet_1
        ELSE
            shipsquares := fleet_2
        END
    END;
    
    shipCounts <-- shipsLeft =
    BEGIN
        shipCounts := {Player_1 |-> card(fleet_1),
                           Player_2 |-> card(fleet_2)}
    END;
    
    shotCount <-- shotsTaken(player) =
    PRE
        player : PLAYER
    THEN
        shotCount := card(attacks(player))
    END;
    
    report <-- gameStatus =
    BEGIN
        report := current_game_state
    END
    
END