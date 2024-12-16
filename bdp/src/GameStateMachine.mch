/* GameStateMachine
 * Author: lucif
 * Creation date: 12/8/2024
 */


MACHINE
    GameStateMachine
SETS
    PLAYER = { Player_1 , Player_2 } ;
    GAME_STATE = { Deploying_Fleets , Ongoing , Won_Player_1 , Won_Player_2 }
ABSTRACT_VARIABLES
    current_game_state , current_turn
INVARIANT
    current_game_state : GAME_STATE &
    current_turn : PLAYER
INITIALISATION
    current_game_state := Deploying_Fleets ||
    current_turn := Player_1
OPERATIONS
    setState ( state ) =
    PRE
        state : GAME_STATE
    THEN
        current_game_state := state
    END ;

    result <-- getState =
    BEGIN
        result := current_game_state
    END ;

    setCurrentPlayer ( player ) =
    PRE
        player : PLAYER
    THEN
        current_turn := player
    END ;

    result <-- getCurrentPlayer =
    BEGIN
        result := current_turn
    END
END
