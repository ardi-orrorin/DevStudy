import { useSelector } from 'react-redux';
import { TEST_INPUT, input } from './store/testRedocuer';
import { CALL_API, modify, getApi, init } from './store/apiReducer';
import { useEffect } from 'react';
import { useDispatch } from 'react-redux';
import Temp from './Components/Temp';

function App() {
  const inputData = useSelector(state => state.testReducer[TEST_INPUT]);
  const apiData = useSelector(state => state.apiReducer[CALL_API]);

  const dispatch = useDispatch();

  useEffect(() => {
    // dispatch(input({key: 'title', value: 'titleTest'}))

    dispatch(getApi())
  }, []);

  
  if(apiData?.length < 1) return <h1>Loading</h1>;

  
  function onChangeHandler(e) {

    dispatch(input({key: e.target.id, value: e.target.value}));
  }

  function onChangeApiHandler(e, index) {
    dispatch(modify({index: index, key: e.target.name, value: e.target.value}));
  }
  
  function onClickInitHandler() {
    dispatch(init());
  }

  return (
   <>
    <h1>Redux</h1>
    <p>test</p>
    
    <div>
      <button onClick={onClickInitHandler}>초기화</button>
    </div>

    <label htmlFor="body">title input: </label>
    <input id='title' type="text" value={inputData?.title} onChange={onChangeHandler} />
    
    <br />

    <label htmlFor="body">body input: </label>
    <input id='body' type="text" value={inputData?.body} onChange={onChangeHandler} />
    {
      inputData?.title && <p>{inputData.title}</p>
    }
    {
      inputData?.body && <p>{inputData.body}</p>
    }
    {
      apiData?.map((data, index) => {
        return (
          <Temp key={index} data={data} index={index} onChange={onChangeApiHandler} />
        )
      })
    }
    <div>

    </div>
   </>
  );
}

export default App;
