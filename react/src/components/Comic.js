import React, { Component } from 'react';

class Comic extends Component {
  constructor(props) {
    super(props);
  }
  render() {
    return (
      <div id={this.props.id}>
        <a href={`/comics/${this.props.id}`}>
          <p className="crop">
            <img src={this.props.photo}/>
          </p>
          <h3>{this.props.title}</h3>
          <h3>{this.props.publisher}</h3>
        </a>
      </div>
    )
  }
}
export default Comic;
