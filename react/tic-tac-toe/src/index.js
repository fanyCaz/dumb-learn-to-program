import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';

//REACT COMPONENT CLASS
//Its parameters are props (properties)
//Returns a view

//when the component only returns a view and has little functionality, 
//you can turn it into a function instead of a class
function Square(props){
	return(
		<button className="square" onClick={ props.onClick }>
			{props.value}
		</button>
	);
}

//This is a child Component, but not an extension from the Board Class
class Board extends React.Component{
		//all sub-classes should have a super in the constructor

	renderSquare(i){
		return ( 
			<Square value={this.props.squares[i]} onClick={()=> this.props.onClick(i)}/>
		);
	}

	render(){
		return(
			<div>
				<div className="board-row">
					{this.renderSquare(0)}
					{this.renderSquare(1)}
					{this.renderSquare(2)}
				</div>
				<div className="board-row">
					{this.renderSquare(3)}
					{this.renderSquare(4)}
					{this.renderSquare(5)}
				</div>
				<div className="board-row">
					{this.renderSquare(6)}
					{this.renderSquare(7)}
					{this.renderSquare(8)}
				</div>
			</div>
		);
	}
}

class Game extends React.Component{
	constructor(props){
		super(props);
		this.state = {
			history: [{
				squares: Array(9).fill(null),
				movement: Array(2).fill(null),
			}],
			xIsNext: true,
			stepNumber: 0,
		}
	}

	jumpTo(step){
		this.setState({
			stepNumber: step,
			xIsNext: (step % 2) === 0,
		});
	}

	handleClick(i){
		//console.log(this.state.history);
		const history = this.state.history.slice(0, this.state.stepNumber + 1);
		const current = history[history.length - 1];
		const squares = current.squares.slice();
		
		console.log(i);
		//if there's already a winner or the square is already full
		if(calculateWinner(squares) || squares[i]){
			return;
		}
		squares[i] = this.state.xIsNext ? 'X' : 'O';
		this.setState({
			//concat doesn't mutate the original state
			history: history.concat([{
				squares: squares,
			}]),
			stepNumber: history.length,
			xIsNext: !this.state.xIsNext
		});
	}

	render(){
		const history = this.state.history;
		const current = history[this.state.stepNumber];
		const winner = calculateWinner(current.squares);

		const moves = history.map((step,move) => {
			const desc = move ?
				'Go to move #' + move:
				'Go to game start';
			return (
				<li key={move}>
					<button onClick={()=> this.jumpTo(move)}>{desc}</button>
				</li>
			);
		});

		let status = winner ? `Winner: ${winner}` : `next player ${this.state.xIsNext ? 'X' : 'O'}`;
		return(
			<div className="game">
				<div className="game-board">
					<Board squares={current.squares} onClick={(i) => this.handleClick(i)}/>
				</div>
				<div className="game-info">
					<div>{status}</div>
					<ol>{moves}</ol>
				</div>
			</div>
		);
	}
}

ReactDOM.render(
	<Game/>,
	document.getElementById('root')
);


function calculateWinner(squares){
	const winningLines = [
		[0,1,2],
		[3,4,5],
		[6,7,8],
		[0,3,6],
		[1,4,7],
		[2,5,8],
		[0,4,8],
		[2,4,6],
	];

	for (var i = 0; i < winningLines.length; i++) {
		const [a,b,c] = winningLines[i];
		if(squares[a] && squares[a] === squares[b] && squares[a] === squares[c]){
			return squares[a];
		}
	}
	return null;
}