import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';

//REACT COMPONENT CLASS
//Its parameters are props (properties)
//Returns a view

//This is a child Component, but not an extension from the Board Class
class Square extends React.Component{
	constructor(props){
		super(props);
		this.state={
			value:null,
		};
	}
	render(){
		return(
			<button className="square" onClick={ ()=> { console.log('click'); } }>
				{this.props.value}
			</button>
		);
	}
}

class Board extends React.Component{
	renderSquare(i){
		return <Square value={i}/>
	}
	render(){
		const status = 'next player x';
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
