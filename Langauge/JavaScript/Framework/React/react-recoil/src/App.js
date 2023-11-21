import styles from './scss/_bases/_reset.scss';
import {BrowserRouter, Route, Routes} from "react-router-dom";
import React from "react";
import Main from "./routes/Main";
import {RecoilRoot} from "recoil";
import Layout from "./layouts/Layout";
import Atom from "./routes/Atom";
import SelectorRecoil from "./routes/SelectorRecoil";
import SelectorRecoil2 from "./routes/SelectorRecoil2";
import NotFound from "./routes/NotFound";

function App() {
  return (
      <RecoilRoot>
          <BrowserRouter>
              <Routes>
                  <Route path="/" element={<Layout/>}>
                      <Route index element={<Main />} />
                      <Route path="atom" element={<Atom />} />
                      <Route path="selector" element={<SelectorRecoil />} />
                      <Route path="selector2" element={<SelectorRecoil2 />} />
                  </Route>
                  <Route path="*" element={<NotFound />} />
              </Routes>
          </BrowserRouter>
      </RecoilRoot>
  );
}

export default App;
