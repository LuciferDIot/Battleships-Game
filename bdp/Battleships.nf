Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Battleships))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Battleships))==(Machine(Battleships));
  Level(Machine(Battleships))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Battleships)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Battleships))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Battleships))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Battleships))==(GameStateMachine);
  List_Includes(Machine(Battleships))==(GameStateMachine)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Battleships))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Battleships))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Battleships))==(?);
  Context_List_Variables(Machine(Battleships))==(?);
  Abstract_List_Variables(Machine(Battleships))==(?);
  Local_List_Variables(Machine(Battleships))==(non_change_fleet_2,non_change_fleet_1,attacks,fleet_2,fleet_1);
  List_Variables(Machine(Battleships))==(non_change_fleet_2,non_change_fleet_1,attacks,fleet_2,fleet_1,current_turn,current_game_state);
  External_List_Variables(Machine(Battleships))==(non_change_fleet_2,non_change_fleet_1,attacks,fleet_2,fleet_1,current_turn,current_game_state)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Battleships))==(?);
  Abstract_List_VisibleVariables(Machine(Battleships))==(?);
  External_List_VisibleVariables(Machine(Battleships))==(?);
  Expanded_List_VisibleVariables(Machine(Battleships))==(?);
  List_VisibleVariables(Machine(Battleships))==(?);
  Internal_List_VisibleVariables(Machine(Battleships))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Battleships))==(btrue);
  Gluing_List_Invariant(Machine(Battleships))==(btrue);
  Abstract_List_Invariant(Machine(Battleships))==(btrue);
  Expanded_List_Invariant(Machine(Battleships))==(current_game_state: GAME_STATE & current_turn: PLAYER);
  Context_List_Invariant(Machine(Battleships))==(btrue);
  List_Invariant(Machine(Battleships))==(fleet_1: POW(Grid) & card(fleet_1)<=Battleship_Count & fleet_2: POW(Grid) & card(fleet_2)<=Battleship_Count & non_change_fleet_1: POW(Grid) & card(non_change_fleet_1)<=Battleship_Count & non_change_fleet_2: POW(Grid) & card(non_change_fleet_2)<=Battleship_Count & attacks: PLAYER --> POW(Grid))
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Machine(Battleships))==(btrue);
  Expanded_List_Assertions(Machine(Battleships))==(btrue);
  Context_List_Assertions(Machine(Battleships))==(btrue);
  List_Assertions(Machine(Battleships))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Battleships))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Battleships))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Battleships))==(current_game_state,current_turn:=Deploying_Fleets,Player_1;fleet_1,fleet_2,non_change_fleet_1,non_change_fleet_2,attacks:={},{},{},{},{Player_1|->{},Player_2|->{}});
  Context_List_Initialisation(Machine(Battleships))==(skip);
  List_Initialisation(Machine(Battleships))==(fleet_1,fleet_2,non_change_fleet_1,non_change_fleet_2:={},{},{},{} || attacks:={Player_1|->{},Player_2|->{}})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Battleships))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Battleships),Machine(GameStateMachine))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Machine(Battleships),Machine(GameStateMachine))==(btrue);
  List_Context_Constraints(Machine(Battleships))==(btrue);
  List_Constraints(Machine(Battleships))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Battleships))==(deployFleet,playerShoots,shipLocations,shipsLeft,shotsTaken,gameStatus);
  List_Operations(Machine(Battleships))==(deployFleet,playerShoots,shipLocations,shipsLeft,shotsTaken,gameStatus)
END
&
THEORY ListInputX IS
  List_Input(Machine(Battleships),deployFleet)==(player,positions);
  List_Input(Machine(Battleships),playerShoots)==(target);
  List_Input(Machine(Battleships),shipLocations)==(player);
  List_Input(Machine(Battleships),shipsLeft)==(?);
  List_Input(Machine(Battleships),shotsTaken)==(player);
  List_Input(Machine(Battleships),gameStatus)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Battleships),deployFleet)==(report);
  List_Output(Machine(Battleships),playerShoots)==(report);
  List_Output(Machine(Battleships),shipLocations)==(shipsquares);
  List_Output(Machine(Battleships),shipsLeft)==(shipCounts);
  List_Output(Machine(Battleships),shotsTaken)==(shotCount);
  List_Output(Machine(Battleships),gameStatus)==(report)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Battleships),deployFleet)==(report <-- deployFleet(player,positions));
  List_Header(Machine(Battleships),playerShoots)==(report <-- playerShoots(target));
  List_Header(Machine(Battleships),shipLocations)==(shipsquares <-- shipLocations(player));
  List_Header(Machine(Battleships),shipsLeft)==(shipCounts <-- shipsLeft);
  List_Header(Machine(Battleships),shotsTaken)==(shotCount <-- shotsTaken(player));
  List_Header(Machine(Battleships),gameStatus)==(report <-- gameStatus)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Battleships),deployFleet)==(player: PLAYER & positions <: NATURAL*NATURAL & card(positions) = Battleship_Count & current_game_state = Deploying_Fleets & (player = Player_1 => fleet_1 = {}) & (player = Player_2 => fleet_2 = {}));
  List_Precondition(Machine(Battleships),playerShoots)==(target: NATURAL*NATURAL & current_game_state = Ongoing & (current_turn = Player_1 => fleet_1/={}) & (current_turn = Player_2 => fleet_2/={}) & target/:attacks(current_turn));
  List_Precondition(Machine(Battleships),shipLocations)==(player: PLAYER);
  List_Precondition(Machine(Battleships),shipsLeft)==(btrue);
  List_Precondition(Machine(Battleships),shotsTaken)==(player: PLAYER);
  List_Precondition(Machine(Battleships),gameStatus)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Battleships),gameStatus)==(btrue | report:=current_game_state);
  Expanded_List_Substitution(Machine(Battleships),shotsTaken)==(player: PLAYER | shotCount:=card(attacks(player)));
  Expanded_List_Substitution(Machine(Battleships),shipsLeft)==(btrue | shipCounts:={Player_1|->card(fleet_1),Player_2|->card(fleet_2)});
  Expanded_List_Substitution(Machine(Battleships),shipLocations)==(player: PLAYER | current_turn = Player_1 ==> shipsquares:=fleet_1 [] not(current_turn = Player_1) ==> shipsquares:=fleet_2);
  Expanded_List_Substitution(Machine(Battleships),playerShoots)==(target: NATURAL*NATURAL & current_game_state = Ongoing & (current_turn = Player_1 => fleet_1/={}) & (current_turn = Player_2 => fleet_2/={}) & target/:attacks(current_turn) | current_turn = Player_1 & target: Grid ==> (target: fleet_2 ==> (fleet_2,attacks:=fleet_2-{target},attacks<+{Player_1|->(attacks(Player_1)\/{target})} || (card(fleet_2) = 1 ==> (Won_Player_1: GAME_STATE | report:=Player_1_Hit || current_game_state:=Won_Player_1) [] not(card(fleet_2) = 1) ==> (Player_2: PLAYER | report:=Player_1_Hit || current_turn:=Player_2))) [] not(target: fleet_2) ==> (Player_2: PLAYER | attacks,report:=attacks<+{Player_1|->(attacks(Player_1)\/{target})},Player_1_Miss || current_turn:=Player_2)) [] not(current_turn = Player_1 & target: Grid) ==> (current_turn = Player_2 & target: Grid ==> (target: fleet_1 ==> (fleet_1,attacks:=fleet_1-{target},attacks<+{Player_2|->(attacks(Player_2)\/{target})} || (card(fleet_1) = 1 ==> (Won_Player_2: GAME_STATE | report:=Player_2_Hit || current_game_state:=Won_Player_2) [] not(card(fleet_1) = 1) ==> (Player_1: PLAYER | report:=Player_2_Hit || current_turn:=Player_1))) [] not(target: fleet_1) ==> (Player_1: PLAYER | attacks,report:=attacks<+{Player_2|->(attacks(Player_2)\/{target})},Player_2_Miss || current_turn:=Player_1)) [] not(current_turn = Player_2 & target: Grid) ==> report:=Position_Out_of_Grid));
  Expanded_List_Substitution(Machine(Battleships),deployFleet)==(player: PLAYER & positions <: NATURAL*NATURAL & card(positions) = Battleship_Count & current_game_state = Deploying_Fleets & (player = Player_1 => fleet_1 = {}) & (player = Player_2 => fleet_2 = {}) | player = Player_1 & positions: POW(Grid) ==> (fleet_1 = {} ==> (fleet_1,non_change_fleet_1,report:=positions,positions,Player_1_Deployed || (fleet_2/={} ==> (Ongoing: GAME_STATE | current_game_state:=Ongoing) [] not(fleet_2/={}) ==> skip)) [] not(fleet_1 = {}) ==> report:=Already_Deployed) [] not(player = Player_1 & positions: POW(Grid)) ==> (player = Player_2 & positions: POW(Grid) ==> (fleet_2 = {} ==> (fleet_2,non_change_fleet_2,report:=positions,positions,Player_2_Deployed || (fleet_1/={} ==> (Ongoing: GAME_STATE | current_game_state:=Ongoing) [] not(fleet_1/={}) ==> skip)) [] not(fleet_2 = {}) ==> report:=Already_Deployed) [] not(player = Player_2 & positions: POW(Grid)) ==> report:=Position_Out_of_Grid));
  List_Substitution(Machine(Battleships),deployFleet)==(IF player = Player_1 & positions: POW(Grid) THEN IF fleet_1 = {} THEN fleet_1:=positions || non_change_fleet_1:=positions || report:=Player_1_Deployed || IF fleet_2/={} THEN setState(Ongoing) END ELSE report:=Already_Deployed END ELSE IF player = Player_2 & positions: POW(Grid) THEN IF fleet_2 = {} THEN fleet_2:=positions || non_change_fleet_2:=positions || report:=Player_2_Deployed || IF fleet_1/={} THEN setState(Ongoing) END ELSE report:=Already_Deployed END ELSE report:=Position_Out_of_Grid END END);
  List_Substitution(Machine(Battleships),playerShoots)==(IF current_turn = Player_1 & target: Grid THEN IF target: fleet_2 THEN fleet_2:=fleet_2-{target} || attacks(Player_1):=attacks(Player_1)\/{target} || IF card(fleet_2) = 1 THEN report:=Player_1_Hit || setState(Won_Player_1) ELSE report:=Player_1_Hit || setCurrentPlayer(Player_2) END ELSE attacks(Player_1):=attacks(Player_1)\/{target} || report:=Player_1_Miss || setCurrentPlayer(Player_2) END ELSE IF current_turn = Player_2 & target: Grid THEN IF target: fleet_1 THEN fleet_1:=fleet_1-{target} || attacks(Player_2):=attacks(Player_2)\/{target} || IF card(fleet_1) = 1 THEN report:=Player_2_Hit || setState(Won_Player_2) ELSE report:=Player_2_Hit || setCurrentPlayer(Player_1) END ELSE attacks(Player_2):=attacks(Player_2)\/{target} || report:=Player_2_Miss || setCurrentPlayer(Player_1) END ELSE report:=Position_Out_of_Grid END END);
  List_Substitution(Machine(Battleships),shipLocations)==(IF current_turn = Player_1 THEN shipsquares:=fleet_1 ELSE shipsquares:=fleet_2 END);
  List_Substitution(Machine(Battleships),shipsLeft)==(shipCounts:={Player_1|->card(fleet_1),Player_2|->card(fleet_2)});
  List_Substitution(Machine(Battleships),shotsTaken)==(shotCount:=card(attacks(player)));
  List_Substitution(Machine(Battleships),gameStatus)==(report:=current_game_state)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Battleships))==(Grid,Grid_X,Grid_Y,Max_Row,Max_Col,Battleship_Count,Anim_Col);
  Inherited_List_Constants(Machine(Battleships))==(?);
  List_Constants(Machine(Battleships))==(Grid,Grid_X,Grid_Y,Max_Row,Max_Col,Battleship_Count,Anim_Col)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Battleships),GAME_STATE)==({Deploying_Fleets,Ongoing,Won_Player_1,Won_Player_2});
  Context_List_Enumerated(Machine(Battleships))==(?);
  Context_List_Defered(Machine(Battleships))==(?);
  Context_List_Sets(Machine(Battleships))==(?);
  List_Valuable_Sets(Machine(Battleships))==(?);
  Inherited_List_Enumerated(Machine(Battleships))==(PLAYER,GAME_STATE);
  Inherited_List_Defered(Machine(Battleships))==(?);
  Inherited_List_Sets(Machine(Battleships))==(PLAYER,GAME_STATE);
  List_Enumerated(Machine(Battleships))==(REPORT);
  List_Defered(Machine(Battleships))==(?);
  List_Sets(Machine(Battleships))==(REPORT);
  Set_Definition(Machine(Battleships),PLAYER)==({Player_1,Player_2});
  Set_Definition(Machine(Battleships),REPORT)==({Player_1_Hit,Player_2_Hit,Player_1_Miss,Player_2_Miss,Error_Not_Turn,Player_1_Deployed,Player_2_Deployed,Position_Out_of_Grid,Already_Deployed})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Battleships))==(?);
  Expanded_List_HiddenConstants(Machine(Battleships))==(?);
  List_HiddenConstants(Machine(Battleships))==(?);
  External_List_HiddenConstants(Machine(Battleships))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Battleships))==(btrue);
  Context_List_Properties(Machine(Battleships))==(btrue);
  Inherited_List_Properties(Machine(Battleships))==(PLAYER: FIN(INTEGER) & not(PLAYER = {}) & GAME_STATE: FIN(INTEGER) & not(GAME_STATE = {}));
  List_Properties(Machine(Battleships))==(Max_Row = 10 & Max_Col = 10 & Anim_Col = 2*Max_Col+1 & Grid_X = 1..Max_Row & Grid_Y = 1..Max_Col & Grid = {xx,yy | xx: Grid_X & yy: Grid_Y} & Battleship_Count: NAT1 & Battleship_Count = 3 & REPORT: FIN(INTEGER) & not(REPORT = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Battleships),deployFleet)==(?);
  List_ANY_Var(Machine(Battleships),playerShoots)==(?);
  List_ANY_Var(Machine(Battleships),shipLocations)==(?);
  List_ANY_Var(Machine(Battleships),shipsLeft)==(?);
  List_ANY_Var(Machine(Battleships),shotsTaken)==(?);
  List_ANY_Var(Machine(Battleships),gameStatus)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Battleships)) == (Grid,Grid_X,Grid_Y,Max_Row,Max_Col,Battleship_Count,Anim_Col,REPORT,Player_1_Hit,Player_2_Hit,Player_1_Miss,Player_2_Miss,Error_Not_Turn,Player_1_Deployed,Player_2_Deployed,Position_Out_of_Grid,Already_Deployed | PLAYER,GAME_STATE,Player_1,Player_2,Deploying_Fleets,Ongoing,Won_Player_1,Won_Player_2 | non_change_fleet_2,non_change_fleet_1,attacks,fleet_2,fleet_1 | current_turn,current_game_state | deployFleet,playerShoots,shipLocations,shipsLeft,shotsTaken,gameStatus | ? | included(Machine(GameStateMachine)) | ? | Battleships);
  List_Of_HiddenCst_Ids(Machine(Battleships)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Battleships)) == (Grid,Grid_X,Grid_Y,Max_Row,Max_Col,Battleship_Count,Anim_Col);
  List_Of_VisibleVar_Ids(Machine(Battleships)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Battleships)) == (?: ?);
  List_Of_Ids(Machine(GameStateMachine)) == (PLAYER,GAME_STATE,Player_1,Player_2,Deploying_Fleets,Ongoing,Won_Player_1,Won_Player_2 | ? | current_turn,current_game_state | ? | setState,getState,setCurrentPlayer,getCurrentPlayer | ? | ? | ? | GameStateMachine);
  List_Of_HiddenCst_Ids(Machine(GameStateMachine)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(GameStateMachine)) == (?);
  List_Of_VisibleVar_Ids(Machine(GameStateMachine)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(GameStateMachine)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Battleships)) == (Type(GAME_STATE) == Cst(SetOf(etype(GAME_STATE,0,3)));Type(PLAYER) == Cst(SetOf(etype(PLAYER,0,1)));Type(REPORT) == Cst(SetOf(etype(REPORT,0,8))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Battleships)) == (Type(Won_Player_2) == Cst(etype(GAME_STATE,0,3));Type(Won_Player_1) == Cst(etype(GAME_STATE,0,3));Type(Ongoing) == Cst(etype(GAME_STATE,0,3));Type(Deploying_Fleets) == Cst(etype(GAME_STATE,0,3));Type(Player_2) == Cst(etype(PLAYER,0,1));Type(Player_1) == Cst(etype(PLAYER,0,1));Type(Player_1_Hit) == Cst(etype(REPORT,0,8));Type(Player_2_Hit) == Cst(etype(REPORT,0,8));Type(Player_1_Miss) == Cst(etype(REPORT,0,8));Type(Player_2_Miss) == Cst(etype(REPORT,0,8));Type(Error_Not_Turn) == Cst(etype(REPORT,0,8));Type(Player_1_Deployed) == Cst(etype(REPORT,0,8));Type(Player_2_Deployed) == Cst(etype(REPORT,0,8));Type(Position_Out_of_Grid) == Cst(etype(REPORT,0,8));Type(Already_Deployed) == Cst(etype(REPORT,0,8));Type(Grid) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(Grid_X) == Cst(SetOf(btype(INTEGER,"[Grid_X","]Grid_X")));Type(Grid_Y) == Cst(SetOf(btype(INTEGER,"[Grid_Y","]Grid_Y")));Type(Max_Row) == Cst(btype(INTEGER,?,?));Type(Max_Col) == Cst(btype(INTEGER,?,?));Type(Battleship_Count) == Cst(btype(INTEGER,?,?));Type(Anim_Col) == Cst(btype(INTEGER,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Battleships)) == (Type(current_game_state) == Mvl(etype(GAME_STATE,?,?));Type(current_turn) == Mvl(etype(PLAYER,?,?));Type(non_change_fleet_2) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(non_change_fleet_1) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(attacks) == Mvl(SetOf(etype(PLAYER,0,1)*SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))));Type(fleet_2) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(fleet_1) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Battleships)) == (Type(gameStatus) == Cst(etype(GAME_STATE,?,?),No_type);Type(shotsTaken) == Cst(btype(INTEGER,?,?),etype(PLAYER,?,?));Type(shipsLeft) == Cst(SetOf(etype(PLAYER,?,?)*btype(INTEGER,?,?)),No_type);Type(shipLocations) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)),etype(PLAYER,?,?));Type(playerShoots) == Cst(etype(REPORT,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(deployFleet) == Cst(etype(REPORT,?,?),etype(PLAYER,?,?)*SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))));
  Observers(Machine(Battleships)) == (Type(gameStatus) == Cst(etype(GAME_STATE,?,?),No_type);Type(shotsTaken) == Cst(btype(INTEGER,?,?),etype(PLAYER,?,?));Type(shipsLeft) == Cst(SetOf(etype(PLAYER,?,?)*btype(INTEGER,?,?)),No_type);Type(shipLocations) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)),etype(PLAYER,?,?)))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
