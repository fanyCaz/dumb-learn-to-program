import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';

//REACT COMPONENT CLASS
//Its parameters are props (properties)
//Returns a view

//This is a child Component, but not an extension from the Board Class
function Square(props){
	return(
		<button className="square" onClick={ props.onClick }>
			{props.value}
		</button>
	);
}

class Board extends React.Component{
	constructor(props){
		//all sub-classes should have a super in the constructor
		super(props);
		this.state={
			squares: Array(9).fill(null),
			xIsNext: true
		}
	}

	handleClick(i){
		const squares = this.state.squares.slice();
		//if there's already a winner or the square is already full
		if(calculateWinner(squares) || squares[i]){
			return;
		}
		squares[i] = this.state.xIsNext ? 'X' : 'O';
		this.setState({
			squares: squares,
			xIsNext: !this.state.xIsNext
		});
		console.log( this.state.squares );
	}

	renderSquare(i){
		return ( 
			<Square value={this.state.squares[i]} onClick={()=> this.handleClick(i)}/>
		);
	}

	render(){
		const winner = calculateWinner(this.state.squares);
		let status = winner ? `Winner: ${winner}` : `next player ${this.state.xIsNext ? 'X' : 'O'}`;
		return(
			<div>
				<div className="status">{status}</div>
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
	render(){
		return(
			<div className="game">
				<div className="game-board">
					<Board/>
				</div>
				<div className="game-info">
					<div></div>
					<ol></ol>
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