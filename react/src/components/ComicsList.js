import React, { Component } from 'react';
import Comic from './Comic';

class ComicsList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      comics: []
    };
    this.getData = this.getData.bind(this);
  }
  getData() {
    fetch('/api/v1/comics.json')
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} ($response.statusText)`,
        error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      this.setState({ comics: body["comics"] });
    });
    .catch(error => console.error(`Error in fetch ${error.message}`));
  }


  componentDidMount(){
    this.getData();
  }
  render() {
    let comics = this.state.comics;
    console.log(comics);
    let listComics = comics.map((comic, index) => {
      return (
        <Comic
          key={index}
          id={comic.id}
          publisher={comic.publisher}
          title={comic.title}
        />
      )
    })
    return (
      <div>
        {listComics}
      </div>
    )
  }
}

export default ComicsList
