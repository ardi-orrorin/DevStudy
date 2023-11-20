import styles from './scss/_bases/_reset.scss';
import {BrowserRouter, Route, Routes} from "react-router-dom";
import React from "react";
import Main from "./routes/Main";
import {RecoilRoot} from "recoil";

function App() {
  return (
      <RecoilRoot>
          <BrowserRouter>
              <Routes>
                  <Route path="/" element={<Main/>}/>
                  {/*<Routes path="/about" element={<h1>About</h1>}>*/}
                  {/*</Routes>*/}
              </Routes>
          </BrowserRouter>
      </RecoilRoot>
  );
}

export default App;
