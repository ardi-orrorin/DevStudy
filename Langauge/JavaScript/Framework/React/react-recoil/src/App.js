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
import AsyncRecoil from "./routes/AsyncRecoil";
import Loading from "./routes/Loading";
import ErrorBoundary from "./routes/Errorboundary";
import ErrorPage from "./routes/Error";

function App() {
  return (
      <RecoilRoot>
          <ErrorBoundary fallback={<ErrorPage />} >
          <React.Suspense fallback={<Loading />}>
              <BrowserRouter>
                  <Routes>
                      <Route path="/" element={<Layout/>}>
                          <Route index element={<Main />} />
                          <Route path="atom" element={<Atom />} />
                          <Route path="selector" element={<SelectorRecoil />} />
                          <Route path="selector2" element={<SelectorRecoil2 />} />
                          <Route path="async" element={<AsyncRecoil />} />
                      </Route>
                      <Route path="*" element={<NotFound />} />
                  </Routes>
              </BrowserRouter>
          </React.Suspense>
          </ErrorBoundary>
      </RecoilRoot>
  );
}

export default App;
