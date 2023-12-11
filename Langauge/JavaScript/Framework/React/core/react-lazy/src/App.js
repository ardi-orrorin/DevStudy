import { useEffect, useState } from 'react';

function App() {
  const [data, setData] = useState(null);

  useEffect(() => {
    fetch('/api')
  }, []);

  return (
    <>

    </>
  );
}

export default App;
