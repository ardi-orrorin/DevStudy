import React, { Suspense } from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
import {BrowserRouter , Routes, Route} from 'react-router-dom'
import Home from './Home'

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
    <Suspense fallback={<div>Loading...</div>}>
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<App />} />
          <Route path="/home" element={<Home />} />
        </Routes>
      </BrowserRouter>
    </Suspense>
    
);