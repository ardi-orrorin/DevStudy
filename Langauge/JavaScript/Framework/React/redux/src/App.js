import { useSelector } from 'react-redux';
import { TEST_INPUT, TEST_POST, input } from './store/testRedocuer';
import { useEffect } from 'react';
import { useDispatch } from 'react-redux';

function App() {
  const inputData = useSelector(state => state.testReducer[TEST_INPUT]);
  const postData = useSelector(state => state.testReducer[TEST_POST]);
  const dispatch = useDispatch();

  useEffect(() => {
    dispatch(input({key: 'title', value: 'titleTest'}))
  }, []);
  
  
  function onChangeHandler(e) {
    dispatch(input({key: e.target.id, value: e.target.value}));
  }

  console.log(postData);

  return (
   <>
    <h1>Redux</h1>
    <p>test</p>

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
   </>
  );
}

export default App;
