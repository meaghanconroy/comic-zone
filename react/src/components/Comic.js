import React, { Component } from 'react';

class Comic extends Component {
  constructor(props) {
    super(props);
  }
  render() {
    return (
      <div id={this.props.id}>
        <a href={`/comics/${this.props.id}`}>
          <h4>{this.props.title}-{this.props.publisher}</h4>
        </a>
      </div>
    )
  }
}
export default Comic;
