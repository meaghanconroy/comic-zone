import React, { Component } from 'react';

class Comic extends Component {
  constructor(props) {
    super(props);
  }
  render() {
    return (
      <div>
        <a href={`/comics/${this.props.id}`}>
          <h3>{this.props.title}</h3>
        </a>
        <h3>{this.props.publisher}</h3>
      </div>
    )
  }
}
export default Comic;
