import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import ComicsList from './components/ComicsList';

$(function() {
  let app = document.getElementById( 'app' );
  if (app) {
  ReactDOM.render(
      <ComicsList />,
      app
    );
  };
});
