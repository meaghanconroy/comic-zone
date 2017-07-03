import React, { Component } from 'react';
import Comic from './Comic';

class ComicsList extends Component {
  constructor(props) {
    super(props)
    this.state = {
      comics: [],
      currentPage: 1,
      comicsPerPage: 30
    };
    this.getData = this.getData.bind(this);
    this.previousPage = this.previousPage.bind(this);
    this.nextPage = this.nextPage.bind(this);
    this.handleClick = this.handleClick.bind(this);
  }

  previousPage(event) {
    let newPage = this.state.currentPage - 1;
    this.setState({ currentPage: newPage })
  }

  nextPage(event) {
    let newPage = this.state.currentPage + 1;
    this.setState({ currentPage: newPage })
  }

  handleClick(event){
    this.setState({ currentPage: event.target.id });
  };

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
      this.setState({ comics: body["comics"] })
    })
    .catch(error => console.error(`Error in fetch ${error.message}`));
  }

  componentDidMount(){
    this.getData();
  }

  render() {
    let indexOfLastComic = this.state.currentPage * this.state.comicsPerPage;
    let indexOfFirstComic = indexOfLastComic - this.state.comicsPerPage;
    let comics = this.state.comics
    let currentComics;

    if (indexOfFirstComic < 0) {
      currentComics = comics.slice(0, 30)
    } else if (indexOfLastComic > comics.length) {
      currentComics = comics.slice(indexOfFirstComic, indexOfLastComic)
    } else {
      currentComics = this.state.comics.slice(indexOfFirstComic, indexOfLastComic)
    }
    let finalComics = currentComics.map((comic, index) => {
      return (
        <Comic
          key={index}
          id={comic.id}
          publisher={comic.publisher}
          title={comic.title}
          photo={comic.photo}
        />
      )
    });
    let pageNumbers = [];

    for(let i = 1; i <= Math.ceil(this.state.comics.length / this.state.comicsPerPage); i++) {
    pageNumbers.push(i);
  }

  let renderPageNumbers = pageNumbers.map(number => {
    return(
      <li
        key={number}
        id={number}
        onClick={this.handleClick}
      >
        {number}
      </li>
    )
  })
    return (
      <div>
        {finalComics}
        <div className="pagination">
          {renderPageNumbers}
        </div>
      </div>
    )
  }
}

export default ComicsList
