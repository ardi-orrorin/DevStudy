import { useSelector } from 'react-redux';
import { TEST_INPUT, input } from './store/testRedocuer';
import { CALL_API, modify, getApi } from './store/apiReducer';
import { useEffect } from 'react';
import { useDispatch } from 'react-redux';

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
    {
      apiData?.map((data, index) => {
        return (
          <div key={index}>
            <span>{data.id}&nbsp;</span>
            <span>{data.userId}&nbsp;</span>
            <div>
              <div>
                <div>
                  {data.title}
                </div>
                <div>
                  <input type="text" name='title' value={data.title} style={{width:'100%'}} onChange={(e)=> onChangeApiHandler(e, index)} />
                </div>
              </div>
              <div>
                <div>
                  {data.title}
                </div>
                <div>
                  <input type="text" name='body' value={data.body} style={{width:'100%'}} onChange={(e)=> onChangeApiHandler(e, index)} />
                </div>
              </div>
            </div>
          </div>
        )
      })
    }
    <div>

    </div>
   </>
  );
}

export default App;
