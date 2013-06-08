package hxparse;

/**
	Represents a state in the state machine generated by the `LexEngine`.
**/
class State {
	/**
		The transition vector, where the index corresponds to a char code.
	**/
	public var trans : haxe.ds.Vector<State>;
	
	/**
		The ids of the final states.
	**/
	public var finals : Array<Int>;
	
	/**
		Creates a new State.
	**/
	public function new() {
		finals = [];
		trans = new haxe.ds.Vector(256);
	}
}

/**
	A Ruleset wraps an input state and the semantic callback functions for the
	`Lexer`.
**/
class Ruleset<Token> {
	
	/**
		The initial state.
	**/
	public var state:State;
	
	/**
		The semantic functions.
	**/
	public var functions:Array<Lexer->Token>;
	
	/**
		The callback function for when end of file state is reached.
	**/
	public var eofFunction:Lexer->Token;
	
	/**
		Creates a new Ruleset.
	**/
	public function new(state,functions,eofFunction) {
		this.state = state;
		this.functions = functions;
		this.eofFunction = eofFunction;
	}
}