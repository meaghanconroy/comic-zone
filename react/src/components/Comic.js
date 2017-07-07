import React, { Component } from 'react';

class Comic extends Component {
  constructor(props) {
    super(props);
  }
  render() {
    return (
      <div className="comic-link row" id={this.props.id}>
        <a href={`/comics/${this.props.id}`}>
          <div className="large-3 small-12 columns">
            <img src={this.props.photo} className="crop"/>
          </div>
          <div className="large-9 small-12 columns">
            <h5 className="comic-title">{this.props.title}</h5>
            <h5 className="comic-publisher">{this.props.publisher}</h5>
          </div>
        </a>
        <br/>
      </div>
    )
  }
}
export default Comic;
