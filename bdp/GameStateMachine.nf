Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(GameStateMachine))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(GameStateMachine))==(Machine(GameStateMachine));
  Level(Machine(GameStateMachine))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(GameStateMachine)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(GameStateMachine))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(GameStateMachine))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(GameStateMachine))==(?);
  List_Includes(Machine(GameStateMachine))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(GameStateMachine))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(GameStateMachine))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(GameStateMachine))==(?);
  Context_List_Variables(Machine(GameStateMachine))==(?);
  Abstract_List_Variables(Machine(GameStateMachine))==(?);
  Local_List_Variables(Machine(GameStateMachine))==(current_turn,current_game_state);
  List_Variables(Machine(GameStateMachine))==(current_turn,current_game_state);
  External_List_Variables(Machine(GameStateMachine))==(current_turn,current_game_state)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(GameStateMachine))==(?);
  Abstract_List_VisibleVariables(Machine(GameStateMachine))==(?);
  External_List_VisibleVariables(Machine(GameStateMachine))==(?);
  Expanded_List_VisibleVariables(Machine(GameStateMachine))==(?);
  List_VisibleVariables(Machine(GameStateMachine))==(?);
  Internal_List_VisibleVariables(Machine(GameStateMachine))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(GameStateMachine))==(btrue);
  Gluing_List_Invariant(Machine(GameStateMachine))==(btrue);
  Expanded_List_Invariant(Machine(GameStateMachine))==(btrue);
  Abstract_List_Invariant(Machine(GameStateMachine))==(btrue);
  Context_List_Invariant(Machine(GameStateMachine))==(btrue);
  List_Invariant(Machine(GameStateMachine))==(current_game_state: GAME_STATE & current_turn: PLAYER)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(GameStateMachine))==(btrue);
  Abstract_List_Assertions(Machine(GameStateMachine))==(btrue);
  Context_List_Assertions(Machine(GameStateMachine))==(btrue);
  List_Assertions(Machine(GameStateMachine))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(GameStateMachine))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(GameStateMachine))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(GameStateMachine))==(current_game_state,current_turn:=Deploying_Fleets,Player_1);
  Context_List_Initialisation(Machine(GameStateMachine))==(skip);
  List_Initialisation(Machine(GameStateMachine))==(current_game_state:=Deploying_Fleets || current_turn:=Player_1)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(GameStateMachine))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(GameStateMachine))==(btrue);
  List_Constraints(Machine(GameStateMachine))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(GameStateMachine))==(setState,getState,setCurrentPlayer,getCurrentPlayer);
  List_Operations(Machine(GameStateMachine))==(setState,getState,setCurrentPlayer,getCurrentPlayer)
END
&
THEORY ListInputX IS
  List_Input(Machine(GameStateMachine),setState)==(state);
  List_Input(Machine(GameStateMachine),getState)==(?);
  List_Input(Machine(GameStateMachine),setCurrentPlayer)==(player);
  List_Input(Machine(GameStateMachine),getCurrentPlayer)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(GameStateMachine),setState)==(?);
  List_Output(Machine(GameStateMachine),getState)==(result);
  List_Output(Machine(GameStateMachine),setCurrentPlayer)==(?);
  List_Output(Machine(GameStateMachine),getCurrentPlayer)==(result)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(GameStateMachine),setState)==(setState(state));
  List_Header(Machine(GameStateMachine),getState)==(result <-- getState);
  List_Header(Machine(GameStateMachine),setCurrentPlayer)==(setCurrentPlayer(player));
  List_Header(Machine(GameStateMachine),getCurrentPlayer)==(result <-- getCurrentPlayer)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(GameStateMachine),setState)==(state: GAME_STATE);
  List_Precondition(Machine(GameStateMachine),getState)==(btrue);
  List_Precondition(Machine(GameStateMachine),setCurrentPlayer)==(player: PLAYER);
  List_Precondition(Machine(GameStateMachine),getCurrentPlayer)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(GameStateMachine),getCurrentPlayer)==(btrue | result:=current_turn);
  Expanded_List_Substitution(Machine(GameStateMachine),setCurrentPlayer)==(player: PLAYER | current_turn:=player);
  Expanded_List_Substitution(Machine(GameStateMachine),getState)==(btrue | result:=current_game_state);
  Expanded_List_Substitution(Machine(GameStateMachine),setState)==(state: GAME_STATE | current_game_state:=state);
  List_Substitution(Machine(GameStateMachine),setState)==(current_game_state:=state);
  List_Substitution(Machine(GameStateMachine),getState)==(result:=current_game_state);
  List_Substitution(Machine(GameStateMachine),setCurrentPlayer)==(current_turn:=player);
  List_Substitution(Machine(GameStateMachine),getCurrentPlayer)==(result:=current_turn)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(GameStateMachine))==(?);
  Inherited_List_Constants(Machine(GameStateMachine))==(?);
  List_Constants(Machine(GameStateMachine))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(GameStateMachine),PLAYER)==({Player_1,Player_2});
  Context_List_Enumerated(Machine(GameStateMachine))==(?);
  Context_List_Defered(Machine(GameStateMachine))==(?);
  Context_List_Sets(Machine(GameStateMachine))==(?);
  List_Valuable_Sets(Machine(GameStateMachine))==(?);
  Inherited_List_Enumerated(Machine(GameStateMachine))==(?);
  Inherited_List_Defered(Machine(GameStateMachine))==(?);
  Inherited_List_Sets(Machine(GameStateMachine))==(?);
  List_Enumerated(Machine(GameStateMachine))==(PLAYER,GAME_STATE);
  List_Defered(Machine(GameStateMachine))==(?);
  List_Sets(Machine(GameStateMachine))==(PLAYER,GAME_STATE);
  Set_Definition(Machine(GameStateMachine),GAME_STATE)==({Deploying_Fleets,Ongoing,Won_Player_1,Won_Player_2})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(GameStateMachine))==(?);
  Expanded_List_HiddenConstants(Machine(GameStateMachine))==(?);
  List_HiddenConstants(Machine(GameStateMachine))==(?);
  External_List_HiddenConstants(Machine(GameStateMachine))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(GameStateMachine))==(btrue);
  Context_List_Properties(Machine(GameStateMachine))==(btrue);
  Inherited_List_Properties(Machine(GameStateMachine))==(btrue);
  List_Properties(Machine(GameStateMachine))==(PLAYER: FIN(INTEGER) & not(PLAYER = {}) & GAME_STATE: FIN(INTEGER) & not(GAME_STATE = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(GameStateMachine),setState)==(?);
  List_ANY_Var(Machine(GameStateMachine),getState)==(?);
  List_ANY_Var(Machine(GameStateMachine),setCurrentPlayer)==(?);
  List_ANY_Var(Machine(GameStateMachine),getCurrentPlayer)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(GameStateMachine)) == (PLAYER,GAME_STATE,Player_1,Player_2,Deploying_Fleets,Ongoing,Won_Player_1,Won_Player_2 | ? | current_turn,current_game_state | ? | setState,getState,setCurrentPlayer,getCurrentPlayer | ? | ? | ? | GameStateMachine);
  List_Of_HiddenCst_Ids(Machine(GameStateMachine)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(GameStateMachine)) == (?);
  List_Of_VisibleVar_Ids(Machine(GameStateMachine)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(GameStateMachine)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(GameStateMachine)) == (Type(PLAYER) == Cst(SetOf(etype(PLAYER,0,1)));Type(GAME_STATE) == Cst(SetOf(etype(GAME_STATE,0,3))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(GameStateMachine)) == (Type(Player_1) == Cst(etype(PLAYER,0,1));Type(Player_2) == Cst(etype(PLAYER,0,1));Type(Deploying_Fleets) == Cst(etype(GAME_STATE,0,3));Type(Ongoing) == Cst(etype(GAME_STATE,0,3));Type(Won_Player_1) == Cst(etype(GAME_STATE,0,3));Type(Won_Player_2) == Cst(etype(GAME_STATE,0,3)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(GameStateMachine)) == (Type(current_turn) == Mvl(etype(PLAYER,?,?));Type(current_game_state) == Mvl(etype(GAME_STATE,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(GameStateMachine)) == (Type(getCurrentPlayer) == Cst(etype(PLAYER,?,?),No_type);Type(setCurrentPlayer) == Cst(No_type,etype(PLAYER,?,?));Type(getState) == Cst(etype(GAME_STATE,?,?),No_type);Type(setState) == Cst(No_type,etype(GAME_STATE,?,?)));
  Observers(Machine(GameStateMachine)) == (Type(getCurrentPlayer) == Cst(etype(PLAYER,?,?),No_type);Type(getState) == Cst(etype(GAME_STATE,?,?),No_type))
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
