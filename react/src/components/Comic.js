import React, { Component } from 'react';

class Comic extends Component {
  constructor(props) {
    super(props);
  }
  render() {
    return (
      <div className="comic-link" id={this.props.id}>
        <a href={`/comics/${this.props.id}`}>
          <h5>{this.props.title}-{this.props.publisher}</h5>
        </a>
      </div>
    )
  }
}
export default Comic;
