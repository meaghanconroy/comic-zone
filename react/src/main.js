import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import ComicsList from './components/ComicsList';

$(function() {
  ReactDOM.render(
    <ComicsList />,
    document.getElementById('app')
  );
});
