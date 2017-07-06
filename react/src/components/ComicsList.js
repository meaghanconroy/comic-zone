import React, { Component } from 'react';
import Comic from './Comic';

class ComicsList extends Component {
  constructor(props) {
    super(props)
    this.state = {
      comics: [],
      currentPage: 1,
      comicsPerPage: 30,
      search: ''
    };
    this.getData = this.getData.bind(this);
    this.previousPage = this.previousPage.bind(this);
    this.nextPage = this.nextPage.bind(this);
    this.handleClick = this.handleClick.bind(this);
    this.updateSearch = this.updateSearch.bind(this);
  }

  updateSearch(event) {
    this.setState({ search: event.target.value.substr(0,50) })
    console.log(this.state.search)
  }

  previousPage(event) {
    let newPage = this.state.currentPage - 1;
    this.setState({ currentPage: newPage });
  }

  nextPage(event) {
    let newPage = this.state.currentPage + 1;
    this.setState({ currentPage: newPage });
  }

  handleClick(event){
    this.setState({ currentPage: event.target.id });
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
    let currentComics;
    let filtered = this.state.comics.filter(
      (comic) => {
        return comic.title.toLowerCase().indexOf(this.state.search.toLowerCase()) !== -1
        }
      );

    if (indexOfFirstComic < 0) {
      currentComics = filtered.slice(0, 30);
    } else if (indexOfLastComic > filtered.length) {
      currentComics = filtered.slice(indexOfFirstComic, indexOfLastComic);
    } else {
      currentComics = this.state.comics.slice(indexOfFirstComic, indexOfLastComic);
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
        <input
           placeholder="Search"
           type="text"
           value={this.state.search}
           onChange={this.updateSearch}
           className="searchBar"
          />
        <div id="divider" className="row"></div>
        <div id="comics-menu row">
          {finalComics}
          <div className="pagination">
            {renderPageNumbers}
          </div>
          <div className="react-footer">
            <a href="http://marvel.com" className="attribution">Data provided by Marvel. © 2014 Marvel</a>
          </div>
        </div>
      </div>
    )
  }
}

export default ComicsList;
